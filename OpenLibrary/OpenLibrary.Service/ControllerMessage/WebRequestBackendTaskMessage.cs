using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenLibrary.Service.ControllerMessage
{
    public class WebRequestBackendTaskMessage : BackendTaskMessage
    {
        public int ServiceId { get; }
        public int EndpointId { get; }
        public Uri RequestUri { get; }

        public WebRequestBackendTaskMessage(int serviceId, int endpointId, int taskId, string requestUrl, BackendTaskType taskType, BackendTaskStatus status) 
            : base(taskId, taskType, status, Array.Empty<BackendTaskEventMessage>())
        {
            this.ServiceId = serviceId;
            this.EndpointId = endpointId;
            this.RequestUri = new Uri(requestUrl);
        }
    }
}
