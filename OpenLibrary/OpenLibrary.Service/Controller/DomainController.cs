using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

using OpenLibrary.Data;
using OpenLibrary.Service.Controller.ControllerTask;
using OpenLibrary.Service.Controller.Interface;
using OpenLibrary.Service.ControllerMessage;
using OpenLibrary.Service.DomainService.Interface;

using WpfCustomUtilities.Extensions.Collection;

namespace OpenLibrary.Service.Controller
{
    internal class DomainController : IDomainController
    {
        public string DomainName { get { return _service.Domain; } }

        public BackendControllerStatus Status { get; }

        // Task Queue
        Queue<RunningTask> _waitQueue;
        List<RunningTask> _runningTasks;
        List<RunningTask> _completedTasks;

        // Task Status
        Dictionary<int, BackendTaskMessage> _taskStatuses;

        readonly IDomainWebService _service;
        readonly int _maxConcurrentTasks;
        readonly int _taskTimeoutMilliseconds;
        readonly BackendServiceErrorPolicy _errorPolicy;

        public DomainController(IDomainWebService domainWebService,
                                int maxConcurrentTasks = 1,
                                int taskTimeoutMilliseconds = 3000,
                                BackendServiceErrorPolicy errorPolicy = BackendServiceErrorPolicy.LogAndContinue)
        {
            _service = domainWebService;

            this.Status = BackendControllerStatus.Running;

            _maxConcurrentTasks = maxConcurrentTasks;
            _taskTimeoutMilliseconds = taskTimeoutMilliseconds;
            _errorPolicy = errorPolicy;

            _waitQueue = new Queue<RunningTask>();
            _runningTasks = new List<RunningTask>();
            _completedTasks = new List<RunningTask>();
            _taskStatuses = new Dictionary<int, BackendTaskMessage>();
        }

        public void QueueWebRequestTask(WebServiceEndpointUrlRequestTask requestTask)
        {
            // --------------------
            //     Dispatcher
            // --------------------

            CheckStatus(true);

            // New data will be used on the existing task (or new task)
            var token = new CancellationToken();
            var backendTask = new WebRequestBackendTask(requestTask.Id,
                                            BackendServiceErrorPolicy.LogAndContinue,
                                            requestTask.WebServiceEndpointId,
                                            requestTask.RequestUrl,
                                            requestTask.Method,
                                            requestTask.TimeoutMilliseconds);

            var task = new Task(RunTask, backendTask, token, TaskCreationOptions.None);

            var taskMessage = new WebRequestBackendTaskMessage(requestTask.WebServiceEndpoint.WebServiceId,
                                                                          requestTask.WebServiceEndpoint.Id,
                                                                          requestTask.Id,
                                                                          requestTask.RequestUrl,
                                                                          BackendTaskType.UrlRequest,
                                                                          BackendTaskStatus.Queued);

            // Hook
            backendTask.TaskStatusEvent += OnTaskStatusEvent;

            // New (Status)
            if (!_taskStatuses.ContainsKey(requestTask.Id))
            {
                _taskStatuses.Add(requestTask.Id, taskMessage);
            }

            // Existing (Status)
            else
            {
                _taskStatuses[requestTask.Id] = taskMessage;
            }

            // Queue
            _waitQueue.Enqueue(new RunningTask()
            {
                Task = task,
                BackendTask = backendTask
            });

            // Execute next task(s)
            ExecuteNextTasks();
        }

        private void ExecuteNextTasks()
        {
            // --------------------
            //     Dispatcher
            // --------------------

            CheckStatus(true);

            // Run the next tasks in the queue
            if (_waitQueue.Count > 0)
            {
                var tasksToRunCount = _maxConcurrentTasks - _runningTasks.Count;

                for (int counter = 1; counter <= tasksToRunCount; counter++)
                {
                    // Dequeue
                    var runningTask = _waitQueue.Dequeue();

                    // Start Task
                    _runningTasks.Add(runningTask);

                    // Start
                    runningTask.Task.Start();
                }
            }
        }

        private void RunTask(object taskObject)
        {
            // --------------------
            //     TASK THREAD
            // --------------------

            var task = taskObject as BackendTask;

            if (task == null)
                throw new ArgumentException("BackendTask not supplied properly to Task runner:  DomainController.RunTask");

            if (task is WebRequestBackendTask)
            {
                var webRequestBackendTask = (WebRequestBackendTask)task;

                try
                {
                    // Run
                    webRequestBackendTask.Run();
                }
                catch (Exception)
                {
                    // Nothing to do:  wait until we're reporting separate log for the domain
                }
            }
            else
                throw new Exception("Unhandled BackendTask type:  DomainController.RunTask");
        }

        private void OnTaskStatusEvent(BackendTask sender, BackendTaskStatus status)
        {
            // --------------------
            //     TASK THREAD
            // --------------------

            // Copy data to invoke the dispatcher

            BackendTask senderCopy;

            if (sender is WebRequestBackendTask)
                senderCopy = new WebRequestBackendTask(sender as WebRequestBackendTask);

            else
                throw new Exception("Unhandled backend task type:  DomainController.OnTaskStatusEvent");

            Application.Current.Dispatcher.BeginInvoke(new Action(() =>
            {
                // --------------------
                //     Dispatcher
                // --------------------

                var runningTask = _runningTasks.First(x => x.BackendTask.Id == sender.Id);

                var taskCompleted = runningTask.Task.IsCompleted || 
                                    runningTask.Task.IsCanceled || 
                                    runningTask.Task.Status == TaskStatus.RanToCompletion;

                // Update Statuses
                _taskStatuses[senderCopy.Id].Update(senderCopy.Status,
                                                    senderCopy.Events
                                                              .Select(x => new BackendTaskEventMessage(x.TaskStatus, x.Time, new LogMessage(x.Log), x.IsError))
                                                              .Actualize());

                // Prune the task lists -> ExecuteNextTasks()
                if (taskCompleted)
                {
                    _runningTasks.Remove(runningTask);
                    _completedTasks.Add(runningTask);

                    ExecuteNextTasks();
                }
            }));
        }

        public void CancelTask(int taskId)
        {
            throw new NotImplementedException();
        }

        private void CheckStatus(bool runningStateRequest)
        {
            switch (this.Status)
            {
                case BackendControllerStatus.Stopped:
                case BackendControllerStatus.StoppedWithError:
                    if (runningStateRequest)
                        throw new Exception("Trying to make running-state request while stopped:  DomainController.CheckStatus");

                    break;
                case BackendControllerStatus.Running:
                    if (!runningStateRequest)
                        throw new Exception("Trying to make stopped-state request while running:  DomainController.CheckStatus");

                    break;
                default:
                    throw new Exception("Unknown BackendControllerStatus:  DomainController.CheckStatus");
            }
        }

        public IEnumerable<BackendTaskMessage> GetCompletedTasks()
        {
            return _taskStatuses.Values.Where(x => x.TaskStatus == BackendTaskStatus.Completed ||
                                                   x.TaskStatus == BackendTaskStatus.CompletedWithError);
        }

        public IEnumerable<BackendTaskMessage> GetErroredTasks()
        {
            return _taskStatuses.Values.Where(x => x.TaskEvents.Any(z => z.IsError));
        }

        public IEnumerable<BackendTaskMessage> GetQueuedTasks()
        {
            return _taskStatuses.Values.Where(x => x.TaskStatus == BackendTaskStatus.Queued);
        }

        public IEnumerable<BackendTaskMessage> GetAllTasks()
        {
            return _taskStatuses.Values;
        }

        public BackendTaskMessage GetTask(int taskId)
        {
            return _taskStatuses[taskId];
        }

        public void Dispose()
        {
            DisposeAll();
        }

        public void DisposeAll()
        {
            // Halt Tasks
            foreach (var task in _runningTasks)
            {
                task.Task.Dispose();
            }

            _runningTasks.Clear();
            _taskStatuses.Clear();
            _waitQueue.Clear();
            _taskStatuses.Clear();
        }
    }
}
