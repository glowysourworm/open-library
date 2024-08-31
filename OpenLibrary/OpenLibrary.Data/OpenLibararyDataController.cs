using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;

using OpenLibrary.Data.Interface;

using WpfCustomUtilities.Extensions.Collection;

namespace OpenLibrary.Data
{
    internal class OpenLibararyDataController : IOpenLibraryDataController
    {
        readonly OpenLibraryEntities _instance;
        readonly bool _autoSave;

        public OpenLibararyDataController(bool autoSave)
        {
            _instance = new OpenLibraryEntities();
            _instance.Configuration.LazyLoadingEnabled = false;
            _instance.Configuration.ProxyCreationEnabled = false;
            _autoSave = autoSave;
        }

        public IEnumerable<Library> GetLibraries()
        {
            return _instance.Libraries
                            .Include(x => x.WebServices)
                            .Include(x => x.WebServices.Select(y => y.WebServiceEndpoints))
                            .Include(x => x.WebServices.Select(y => y.WebServiceEndpoints.Select(z => z.WebServiceParameters)))
                            .Include(x => x.WebServices.Select(y => y.WebServiceEndpoints.Select(z => z.WebServiceParameters.Select(w => w.WebServiceParameterSettings))))
                            .Include(x => x.WebServices.Select(y => y.WebServiceEndpoints.Select(z => z.WebServiceEndpointUrlRequestTasks)))
                            .Include(x => x.WebServices.Select(y => y.WebServiceEndpoints.Select(z => z.WebServiceEndpointUrlRequestTasks.Select(w => w.WebServiceEndpointTaskEvents))))
                            .Actualize();
        }

        public IEnumerable<WebService> GetWebServices()
        {
            return _instance.WebServices
                            .Include(y => y.WebServiceEndpoints)
                            .Include(y => y.WebServiceEndpoints.Select(z => z.WebServiceParameters))
                            .Include(y => y.WebServiceEndpoints.Select(z => z.WebServiceParameters.Select(w => w.WebServiceParameterSettings)))
                            .Include(y => y.WebServiceEndpoints.Select(z => z.WebServiceEndpointUrlRequestTasks))
                            .Include(y => y.WebServiceEndpoints.Select(z => z.WebServiceEndpointUrlRequestTasks.Select(w => w.WebServiceEndpointTaskEvents)))
                            .Actualize();
        }

        public WebServiceEndpointUrlRequestTask GetUrlRequestTask(int serviceId, int endpointId, string requestUrl, bool createNew = false)
        {
            var entity = _instance.WebServiceEndpointUrlRequestTasks
                                  .Include(x => x.WebServiceEndpoint)
                                  .Where(x => x.WebServiceEndpointId == endpointId &&
                                              x.WebServiceEndpoint.WebServiceId == serviceId &&
                                              x.RequestUrl == requestUrl)
                                  .FirstOrDefault();

            if (entity == null)
            {
                entity = _instance.WebServiceEndpointUrlRequestTasks.Create();

                var endpoint = _instance.WebServiceEndpoints.Find(endpointId);

                var uri = new Uri(requestUrl);

                entity.RequestUrl = requestUrl;

                // TODO: Figure out better data flow
                entity.Description = "";
                entity.Method = "GET";
                entity.RequestUrlTokenized = false;
                entity.TimeoutMilliseconds = 1000;
                entity.Host = "NOT SET";
                entity.Name = "NOT SET";

                entity.WebServiceEndpoint = endpoint;

                _instance.WebServiceEndpointUrlRequestTasks.Add(entity);
                _instance.SaveChanges();
            }

            return entity;
        }

        public void Dispose()
        {
            if (_autoSave && _instance.Database.Connection.State == ConnectionState.Open)
            {
                //_instance.SaveChanges();
            }

            _instance.Database.Connection.Close();
            _instance.Dispose();
        }
    }
}
