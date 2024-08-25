using System.Collections.Generic;
using System.Collections.Specialized;

using OpenLibrary.Web.Common;

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

        /// <summary>
        /// Url address of the server where the SRU endpoint sits
        /// </summary>
        string BaseUrl { get; }

        /// <summary>
        /// Url endpoint of service - to be used to construct the final HTTP request
        /// </summary>
        string Endpoint { get; }

        /// <summary>
        /// Runs SRU service with the proper query paramaters
        /// </summary>
        /// <param name="mandatoryParameters">See SRU v1.2:  version, operation, query</param>
        /// <param name="optionalParameters">See SRU v1.2:  https://www.loc.gov/standards/sru/sru-1-2.html</param>
        /// <returns></returns>
        string Run(IEnumerable<QueryParameter> parameters);
    }
}
