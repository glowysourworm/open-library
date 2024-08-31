using System;
using System.Collections.Generic;

namespace OpenLibrary.Data.Interface
{
    public interface IOpenLibraryDataController : IDisposable
    {
        IEnumerable<WebService> GetWebServices();

        /// <summary>
        /// Returns existing url request task entity (with option to create new); or throws an exception.
        /// </summary>
        /// <param name="serviceId">Web service id</param>
        /// <param name="endpointId">Web service endpoint id</param>
        /// <param name="requestUrl">Request Url string</param>
        /// <returns>The new / existing entity</returns>
        WebServiceEndpointUrlRequestTask GetUrlRequestTask(int serviceId, int endpointId, string requestUrl, bool createNew = false);
    }
}
