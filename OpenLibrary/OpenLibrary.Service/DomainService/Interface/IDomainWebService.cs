using System.Collections.Generic;

using OpenLibrary.Data;

namespace OpenLibrary.Service.DomainService.Interface
{
    /// <summary>
    /// LOC service that works with SRU Version 1.2 or greater
    /// </summary>
    public interface IDomainWebService
    {
        string Name { get; }
        string Domain { get; }

        /// <summary>
        /// Url endpoint of service - to be used to construct the final HTTP request
        /// </summary>
        IEnumerable<WebServiceEndpoint> Endpoints { get; }

        void AddEndpoint(WebServiceEndpoint endpoint);
    }
}
