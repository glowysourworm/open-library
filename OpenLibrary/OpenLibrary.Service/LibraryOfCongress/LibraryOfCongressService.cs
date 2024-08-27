
using System.Collections.Generic;
using System.Linq;

using OpenLibrary.Data;
using OpenLibrary.Service.LibraryOfCongress.Interface;
using OpenLibrary.Web.Service;

using WpfCustomUtilities.Extensions.Collection;

namespace OpenLibrary.Service.LibraryOfCongress
{
    /// <summary>
    /// Service front-end to most of LOC's SRU API functions
    /// </summary>
    public class LibraryOfCongressService : ILibraryOfCongressService
    {
        public IDictionary<string, ISruService> SruServices { get; }

        public LibraryOfCongressService(IEnumerable<WebService> sruServices)
        {
            this.SruServices = new Dictionary<string, ISruService>();

            foreach (var service in sruServices)
            {
                var webServices = service.WebServiceEndpoints
                                         .Select(endpoint => new UrlWebService(endpoint.Endpoint))
                                         .Actualize();

                var sruService = new SruService_v1_2(service.Name, service.Description, service.System, service.Subsystem, webServices);

                this.SruServices.Add(service.Name, sruService);
            }
        }
    }
}
