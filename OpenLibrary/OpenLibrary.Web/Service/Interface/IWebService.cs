
using System;
using System.Collections.Specialized;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Web.Service.Interface
{
    /// <summary>
    /// Interface for simple web service component
    /// </summary>
    public interface IWebService<T>
    {
        /// <summary>
        /// Simple message event
        /// </summary>
        event SimpleEventHandler<string> MessageEvent;

        /// <summary>
        /// Web service has had an exception thrown, with an added message string for context.
        /// </summary>
        event SimpleEventHandler<string, Exception> ErrorEvent;

        /// <summary>
        /// Url of service endpoint - without query parameters
        /// </summary>
        string Endpoint { get; }

        /// <summary>
        /// Retry interval after failed attempt
        /// </summary>
        int RetryMilliseconds { get; }

        /// <summary>
        /// Number of attempts before retry is aborted
        /// </summary>
        int RetryAttempts { get; }

        /// <summary>
        /// Response data from the web service
        /// </summary>
        T Payload { get; }

        /// <summary>
        /// Executes web request synchronously
        /// </summary>
        bool Run(NameValueCollection queryParameters);
    }
}
