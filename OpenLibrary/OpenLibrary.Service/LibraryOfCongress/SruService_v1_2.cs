
using System.Collections.Generic;
using System.Collections.Specialized;

using OpenLibrary.Service.LibraryOfCongress.Interface;
using OpenLibrary.Web.Common;
using OpenLibrary.Web.Service;

namespace OpenLibrary.Service.LibraryOfCongress
{
    public class SruService_v1_2 : UrlWebService, ISruService
    {
        public string Name { get; }
        public string Description { get; }
        public string SruVersion { get; }
        public string BaseUrl { get; }

        public SruService_v1_2(string name, string description, string baseUrl, string endpoint)
            : base(endpoint)
        {
            this.Name = name;
            this.Description = description;
            this.SruVersion = "1.2";
            this.BaseUrl = baseUrl;
        }

        public string Run(IEnumerable<QueryParameter> parameters)
        {
            //var combinedCollection = new NameValueCollection();

            //// Mandatory Parameters
            //for (int index = 0; index < mandatoryParameters.Count; index++)
            //{
            //    combinedCollection.Add(mandatoryParameters.Keys[index], mandatoryParameters[index]);
            //}

            //// Optional Parameters
            //for (int index = 0; index < optionalParameters.Count; index++)
            //{
            //    combinedCollection.Add(optionalParameters.Keys[index], optionalParameters[index]);
            //}

            base.Run(parameters);

            return this.Payload;
        }
    }
}
