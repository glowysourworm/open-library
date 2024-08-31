using System;
using System.Collections.Generic;

using OpenLibrary.Data;
using OpenLibrary.Service.Controller.ControllerTask;
using OpenLibrary.Service.ControllerMessage;

namespace OpenLibrary.Service.Controller.Interface
{
    internal interface IDomainController : IDisposable
    {
        /// <summary>
        /// Unique domain name for the controller - should correspond to web domain name.
        /// </summary>
        string DomainName { get; }
        BackendControllerStatus Status { get; }
        
        void QueueWebRequestTask(WebServiceEndpointUrlRequestTask requestTask);

        IEnumerable<BackendTaskMessage> GetCompletedTasks();
        IEnumerable<BackendTaskMessage> GetErroredTasks();
        IEnumerable<BackendTaskMessage> GetQueuedTasks();
        IEnumerable<BackendTaskMessage> GetAllTasks();
        BackendTaskMessage GetTask(int taskId);

        /// <summary>
        /// Requests cancellation of task
        /// </summary>
        void CancelTask(int taskId);

        /// <summary>
        /// Disposes all tasks, and clears all list collections (starts over, with nothing queued or stored)
        /// </summary>
        void DisposeAll();
    }
}
