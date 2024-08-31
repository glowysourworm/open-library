using System.Collections.Generic;

using OpenLibrary.Data;
using OpenLibrary.Service.DomainService.Interface;

namespace OpenLibrary.Service.DomainService
{
    public class DomainWebService : IDomainWebService
    {
        public string Name { get; }
        public string Domain { get; }
        public IEnumerable<WebServiceEndpoint> Endpoints { get { return _endpoints; } }

        List<WebServiceEndpoint> _endpoints;

        public DomainWebService(string name, string domain)
        {
            this.Name = name;
            this.Domain = domain;

            _endpoints = new List<WebServiceEndpoint>();
        }

        public void AddEndpoint(WebServiceEndpoint endpoint)
        {
            _endpoints.Add(endpoint);
        }
    }
}
