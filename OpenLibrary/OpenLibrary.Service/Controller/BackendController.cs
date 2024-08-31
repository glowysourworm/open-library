using System;
using System.Collections.Generic;
using System.Linq;

using OpenLibrary.Data;
using OpenLibrary.Data.Factory;
using OpenLibrary.Service.Controller.ControllerTask;
using OpenLibrary.Service.Controller.Interface;
using OpenLibrary.Service.ControllerMessage;
using OpenLibrary.Service.DomainService;
using OpenLibrary.Service.DomainService.Interface;
using OpenLibrary.Service.Web.Common;

using WpfCustomUtilities.Extensions.Collection;
using WpfCustomUtilities.RecursiveSerializer.Shared;
using WpfCustomUtilities.SimpleCollections.Collection;

namespace OpenLibrary.Service.Controller
{
    internal class BackendController : IBackendController
    {
        SimpleDictionary<TaskKey, IDomainWebService> _domainServices;
        SimpleDictionary<TaskKey, IDomainController> _domainControllers;

        internal BackendController()
        {
            using (var entityController = OpenLibararyDataControllerFactory.Create(true))
            {
                _domainServices = new SimpleDictionary<TaskKey, IDomainWebService>();
                _domainControllers = new SimpleDictionary<TaskKey, IDomainController>();

                // Create Domain Services
                foreach (var service in entityController.GetWebServices())
                {
                    foreach (var endpoint in service.WebServiceEndpoints)
                    {
                        var uri = new Uri(endpoint.Endpoint);
                        var domainKey = TaskKey.Create(service.Id, endpoint.Id);

                        if (!_domainServices.ContainsKey(domainKey))
                            _domainServices.Add(domainKey, new DomainWebService(service.Name, uri.Host));

                        _domainServices[domainKey].AddEndpoint(endpoint);
                        _domainControllers.Add(domainKey, new DomainController(new DomainWebService(endpoint.Name, uri.Host)));
                    }
                }
            }
        }

        public Library[] GetLibaries()
        {
            using (var entityController = OpenLibararyDataControllerFactory.Create(true))
            {
                return entityController.GetLibraries().ToArray();
            }
        }

        public BackendTaskMessage[] SubmitEndpointRequest(int serviceId, int endpointId, IEnumerable<QueryParameter> parameters)
        {
            var domainKey = TaskKey.Create(serviceId, endpointId);
            var service = _domainServices[domainKey];
            var endpoint = service.Endpoints.FirstOrDefault(x => x.Id == endpointId);

            if (endpoint == null)
                throw new ArgumentException("Invalid endpoint:  " + endpointId);

            var uriBuilder = new UriBuilder(endpoint.Endpoint);
            uriBuilder.Query = parameters.Join("&", x => x.ToString());

            var requestUrl = uriBuilder.ToString();
            
            using (var entityController = OpenLibararyDataControllerFactory.Create(true))
            {
                // New (or) Existing
                var requestTask = entityController.GetUrlRequestTask(serviceId, endpointId, requestUrl, true);

                // Queue
                _domainControllers[domainKey].QueueWebRequestTask(requestTask);
            }

            return GetTaskStatuses(serviceId, endpointId);
        }

        public BackendControllerStatus GetDomainControllerStatus(int serviceId, int endpointId)
        {
            var domainKey = TaskKey.Create(serviceId, endpointId);

            return _domainControllers[domainKey].Status;
        }

        public BackendDomainStatus GetDomainStatus(int serviceId, int endpointId)
        {
            var domainKey = TaskKey.Create(serviceId, endpointId);

            return _domainControllers[domainKey].GetErroredTasks().Any() ? BackendDomainStatus.ErrorReport :
                                                                           BackendDomainStatus.NoReport;
        }

        public LogMessage[] GetLogMessages(int serviceId, int endpointId, int taskId)
        {
            var domainKey = TaskKey.Create(serviceId, endpointId);

            return _domainControllers[domainKey].GetTask(taskId)
                                                .TaskEvents
                                                .Select(x => x.Log)
                                                .ToArray();
        }

        public BackendTaskMessage GetTaskStatus(int serviceId, int endpointId, int taskId)
        {
            var domainKey = TaskKey.Create(serviceId, endpointId);

            return _domainControllers[domainKey].GetTask(taskId);
        }

        public BackendTaskMessage[] GetTaskStatuses(int serviceId, int endpointId)
        {
            var domainKey = TaskKey.Create(serviceId, endpointId);
            var domainName = _domainControllers[domainKey].DomainName;

            return _domainControllers[domainKey].GetAllTasks()
                                                .Cast<WebRequestBackendTaskMessage>()
                                                .ToArray();
        }

        public void Dispose()
        {

        }
    }
}
