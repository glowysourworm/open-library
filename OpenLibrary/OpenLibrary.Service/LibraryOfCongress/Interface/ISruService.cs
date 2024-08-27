using System.Collections.Generic;
using System.Collections.Specialized;

using OpenLibrary.Web.Common;
using OpenLibrary.Web.Service;

namespace OpenLibrary.Service.LibraryOfCongress.Interface
{
    /// <summary>
    /// LOC service that works with SRU Version 1.2 or greater
    /// </summary>
    public interface ISruService
    {
        string Name { get; }
        string Description { get; }
        string SruVersion { get; }
        string System { get; }
        string Subsystem { get; }

        /// <summary>
        /// Url endpoint of service - to be used to construct the final HTTP request
        /// </summary>
        IEnumerable<UrlWebService> Endpoints { get; }

        /// <summary>
        /// Runs SRU service endpoint (by name) with the proper Url
        /// </summary>
        string Run(string endpointName, string resolvedUrl);
    }
}
