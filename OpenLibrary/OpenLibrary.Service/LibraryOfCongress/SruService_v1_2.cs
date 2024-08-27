
using System;
using System.Collections.Generic;
using System.Linq;

using OpenLibrary.Service.LibraryOfCongress.Interface;
using OpenLibrary.Web.Service;

namespace OpenLibrary.Service.LibraryOfCongress
{
    public class SruService_v1_2 : ISruService
    {
        public string Name { get; }
        public string System { get; }
        public string Subsystem { get; }
        public string Description { get; }
        public string SruVersion { get; }
        public IEnumerable<UrlWebService> Endpoints { get; }

        public SruService_v1_2(string name, string description, string system, string subsystem, IEnumerable<UrlWebService> endpoints)
        {
            this.Name = name;
            this.System = system;
            this.Subsystem = subsystem;
            this.Description = description;
            this.SruVersion = "1.2";
            this.Endpoints = endpoints;
        }

        public string Run(string endpointName, string resolvedUrl)
        {
            var endpoint = this.Endpoints.FirstOrDefault(x => x.Name == endpointName);

            if (endpoint == null)
                throw new ArgumentException("Endpoint not found:  " + endpointName);

            endpoint.Run(resolvedUrl);

            return endpoint.Payload;
        }
    }
}
