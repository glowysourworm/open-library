using System;

using OpenLibrary.Web.Crawler.Event;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Web.Crawler.Interface
{
    /// <summary>
    /// Describes a component that executes web requests, over a period of time, as separate tasks
    /// </summary>
    public interface IWebCrawler<T>
    {
        event SimpleEventHandler<string> CrawlerMessageEvent;
        event SimpleEventHandler<string, Exception> CrawlerErrorEvent;
        event SimpleEventHandler<CrawlerResultEventData<T>> CrawlerResultEvent;

        /// <summary>
        /// Period of time to rest between IWebService HTTP requests. This is NOT the wait time 
        /// bewteen crawler cycles.
        /// </summary>
        int RestPeriodMilliseconds { get; }

        /// <summary>
        /// Period of time to wait between cycles of IWebService requests. The list will begin
        /// after it has fully counted down.
        /// </summary>
        int CycleWaitTimeSeconds { get; }

        /// <summary>
        /// Specifies the behavior of the IWebCrawler, Default should execute each service
        /// a single time - using its presets.
        /// </summary>
        CrawlerBehavior Behavior { get; }

        /// <summary>
        /// Starts execution of web crawler - where it left off.
        /// </summary>
        void Start();

        /// <summary>
        /// Stops execution of web crawler - with option to halt thread execution.
        /// </summary>
        void Stop(bool haltThreadExecution = false);
    }
}
