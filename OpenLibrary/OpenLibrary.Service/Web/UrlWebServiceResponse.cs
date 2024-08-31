using System;
using System.Collections.Generic;
using System.Net;

namespace OpenLibrary.Service.Web
{
    public class UrlWebServiceResponse
    {
        public Uri RequestUri { get; set; }
        public Uri ResponseUri { get; set; }
        public string Payload { get; set; }
        public string ContentType { get; set; }
        public long ContentLength { get; set; }

        public IDictionary<string, string> Headers { get; set; }

        public UrlWebServiceResponse()
        {
            this.ResponseUri = null;
            this.RequestUri = null;
            this.Payload = "";
            this.ContentType = "";
            this.ContentLength = 0;
            this.Headers = new Dictionary<string, string>();
        }

        public UrlWebServiceResponse(string requestUrl, WebResponse response, string prettyPrintPayload)
        {
            this.RequestUri = new Uri(requestUrl, UriKind.Absolute);
            this.ResponseUri = response.ResponseUri;

            // Copy response data
            this.ContentType = response.ContentType;
            this.ContentLength = response.ContentLength;
            this.Payload = prettyPrintPayload;

            for (int index = 0; index < response.Headers.Count; index++)
            {
                this.Headers.Add(response.Headers.Keys[index], response.Headers[index]);
            }
        }
    }
}
