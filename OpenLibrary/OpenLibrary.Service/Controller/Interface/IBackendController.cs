using System;
using System.Collections.Generic;

using OpenLibrary.Data;
using OpenLibrary.Service.ControllerMessage;
using OpenLibrary.Service.Web.Common;

namespace OpenLibrary.Service.Controller.Interface
{
    /// <summary>
    /// Interface description for backend controller to handle asynchronous programming of data services.
    /// </summary>
    public interface IBackendController : IDisposable
    {
        WebService[] GetWebServices();

        /// <summary>
        /// Queues backend task, and returns an ID for the task.
        /// </summary>
        BackendTaskMessage[] SubmitEndpointRequest(int serviceId, int endpointId, IEnumerable<QueryParameter> parameters);

        BackendControllerStatus GetDomainControllerStatus(int serviceId, int endpointId);

        BackendDomainStatus GetDomainStatus(int serviceId, int endpointId);

        BackendTaskMessage GetTaskStatus(int serviceId, int endpointId, int taskId);

        BackendTaskMessage[] GetTaskStatuses(int serviceId, int endpointId);

        LogMessage[] GetLogMessages(int serviceId, int endpointId, int taskId);
    }
}
