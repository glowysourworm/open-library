using System;
using System.Collections.Generic;
using System.Linq;

using OpenLibrary.Service.ControllerMessage;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Service.Controller.ControllerTask
{
    internal abstract class BackendTask : IDisposable
    {
        /// <summary>
        /// Id for this backend task
        /// </summary>
        internal int Id { get; }

        /// <summary>
        /// Status for this backend task
        /// </summary>
        internal BackendTaskStatus Status { get; private set; }

        /// <summary>
        /// Error policy for this backend task
        /// </summary>
        internal BackendServiceErrorPolicy ErrorPolicy { get; private set; }

        /// <summary>
        /// List of events for this task - including log messages
        /// </summary>
        internal List<BackendTaskEvent> Events { get; private set; }

        /// <summary>
        /// Event to signal that the task has completed
        /// </summary>
        internal event SimpleEventHandler<BackendTask, BackendTaskStatus> TaskStatusEvent;

        internal BackendTask(int id, BackendServiceErrorPolicy errorPolicy)
        {
            this.Id = id;
            this.Status = BackendTaskStatus.Queued;
            this.ErrorPolicy = errorPolicy;
            this.Events = new List<BackendTaskEvent>();
        }

        internal BackendTask(BackendTask copy)
        {
            this.Id = copy.Id;
            this.Status = copy.Status;
            this.ErrorPolicy = copy.ErrorPolicy;
            this.Events = new List<BackendTaskEvent>();

            foreach (var taskEvent in copy.Events)
            {
                this.Events.Add(new BackendTaskEvent(taskEvent.TaskStatus, new LogMessage(taskEvent.Log), taskEvent.IsError));
            }
        }

        /// <summary>
        /// Primary execute method for the backend task
        /// </summary>
        internal abstract void Run();

        internal bool HasErrors()
        {
            return this.Events.Any(x => x.IsError);
        }

        protected void AddLog(LogMessage message, bool isError)
        {
            this.Events.Add(new BackendTaskEvent(this.Status, message, isError));
        }

        protected void SetBegin(LogMessage message)
        {
            if (this.Status != BackendTaskStatus.Queued)
                throw new Exception("Improper execution of BackendTask:  Status != Queued");

            this.Status = BackendTaskStatus.Running;

            this.Events.Add(new BackendTaskEvent(this.Status, message, false));

            RaiseStatusEvent();
        }

        protected void SetError(LogMessage message, bool isError)
        {
            if (this.Status != BackendTaskStatus.Running)
                throw new Exception("Improper execution of BackendTask:  Status != Running");

            this.Status = BackendTaskStatus.Interrupted;

            this.Events.Add(new BackendTaskEvent(this.Status, message, isError));

            RaiseStatusEvent();
        }

        protected void SetInterrupted(LogMessage message, bool isError = false)
        {
            if (this.Status != BackendTaskStatus.Running)
                throw new Exception("Improper execution of BackendTask:  Status != Running");

            this.Status = BackendTaskStatus.Interrupted;

            this.Events.Add(new BackendTaskEvent(this.Status, message, isError));

            RaiseStatusEvent();
        }

        protected void SetCompleted(LogMessage message)
        {
            if (this.Status != BackendTaskStatus.Running)
                throw new Exception("Improper execution of BackendTask:  Status != Running");

            var errors = this.Events.Any(x => x.IsError);

            this.Status = errors ? BackendTaskStatus.CompletedWithError : BackendTaskStatus.Completed;

            this.Events.Add(new BackendTaskEvent(this.Status, message, false));

            RaiseStatusEvent();
        }

        private void RaiseStatusEvent()
        {
            if (this.TaskStatusEvent != null)
                this.TaskStatusEvent(this, this.Status);
        }

        public override int GetHashCode()
        {
            return this.Id;
        }

        public virtual void Dispose()
        {
            // Nothing to do
        }
    }
}
