using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;

using OpenLibrary.Data;
using OpenLibrary.Web.Crawler.Event;
using OpenLibrary.Web.Crawler.Interface;
using OpenLibrary.Web.Service;
using OpenLibrary.Web.Service.Interface;
using OpenLibrary.Web.WebReader;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Web.Crawler
{
    /// <summary>
    /// Crawls url's and provides results
    /// </summary>
    public class SitemapCrawler : IWebCrawler<Sitemap>
    {
        public int RestPeriodMilliseconds { get; }
        public int CycleWaitTimeSeconds { get; }
        public CrawlerBehavior Behavior { get; }

        /// <summary>
        /// Not Thread Safe! Inherited classes should have stopped the thread before
        /// accessing the service collection.
        /// </summary>
        protected List<UrlWebService> Services { get; private set; }

        readonly string _xPath;

        Thread _thread;
        object _lockObject;

        /// <summary>
        /// Message from the sitemap crawler, with additional flag to indicate an error
        /// </summary>
        public event SimpleEventHandler<string> CrawlerMessageEvent;
        public event SimpleEventHandler<string, Exception> CrawlerErrorEvent;
        public event SimpleEventHandler<CrawlerResultEventData<Sitemap>> CrawlerResultEvent;
        public event SimpleEventHandler<bool> CrawlerCompleteEvent;

        public SitemapCrawler(IEnumerable<string> urls,
                              string xPath,
                              int restPeriodMilliseconds = 30000,
                              int cycleWaitTimeSeconds = 60,
                              CrawlerBehavior behavior = CrawlerBehavior.PeriodicRetryToPrune)
        {
            _xPath = xPath;

            this.Services = urls.Select(url =>
            {
                return new UrlWebService(url, 3000, 0);

            }).ToList();

            this.RestPeriodMilliseconds = restPeriodMilliseconds;
            this.CycleWaitTimeSeconds = cycleWaitTimeSeconds;
            this.Behavior = behavior;

            _lockObject = new object();
            _thread = null;

            foreach (var service in this.Services)
            {
                service.MessageEvent += OnServiceMessage;
                service.ErrorEvent += OnServiceError;
            }
        }

        public void Start()
        {
            if (_thread == null)
                RenewThread();

            if (_thread.ThreadState != ThreadState.Running)
                _thread.Start();
        }
        public void Stop(bool haltThreadExecution = false)
        {
            if (!haltThreadExecution)
                _thread.Suspend();

            else
                StopThread();
        }

        #region (private) Thread Methods
        private void StopThread()
        {
            if (_thread != null)
            {
                _thread.Abort();
                _thread = null;
            }
        }
        private void RenewThread()
        {
            StopThread();

            _thread = new Thread(new ThreadStart(RunThread));
        }
        private void RunThread()
        {
            var attempts = new Dictionary<IWebService<string>, bool>();

            while (this.Services.Count > 0)
            {
                // Run
                foreach (var service in this.Services)
                {
                    // Try the service, record results
                    var result = service.Run();

                    if (!attempts.ContainsKey(service))
                        attempts.Add(service, result);

                    else
                        attempts[service] = result;

                    // Report
                    RunThread_Report(service, attempts[service]);

                    // Rest Period
                    Thread.Sleep(this.RestPeriodMilliseconds);
                }

                // Prune
                for (int index = this.Services.Count - 1; index >= 0; index--)
                {
                    switch (this.Behavior)
                    {
                        case CrawlerBehavior.PeriodicRetry:
                            break;
                        case CrawlerBehavior.PeriodicRetryToPrune:
                        {
                            // Prune any successful attempts
                            if (attempts[this.Services[index]])
                            {
                                this.Services[index].MessageEvent -= OnServiceMessage;
                                this.Services[index].ErrorEvent -= OnServiceError;
                                this.Services.RemoveAt(index);
                            }
                        }
                        break;
                        case CrawlerBehavior.Default:
                        default:
                        {
                            // Single cycle has executed, so clear results
                            this.Services[index].MessageEvent -= OnServiceMessage;
                            this.Services[index].ErrorEvent -= OnServiceError;
                            this.Services.RemoveAt(index);
                            break;
                        }
                    }
                }

                OnServiceMessage(String.Format("End of cycle reached. Entering cycle wait period of {0} seconds", this.CycleWaitTimeSeconds));

                // End Cycle
                Thread.Sleep(this.CycleWaitTimeSeconds * 1000);
            }

            // Signal that crawler has completed, and if there were any failures
            if (this.CrawlerCompleteEvent != null)
                this.CrawlerCompleteEvent(attempts.Values.All(result => result));
        }
        private void RunThread_Report(UrlWebService service, bool success)
        {
            if (success)
            {
                OnServiceMessage(String.Format("Web service succeess:  {0}", service.Endpoint));

                // Transform Result -> Create Sitemap
                RunThread_TransformResult(service);
            }
            else
            {
                OnServiceMessage(String.Format("Web service failed:  {0}", service.Endpoint));
                OnServiceMessage(String.Format("Web service attempts left:  {0}", service.RetryAttempts));
            }
        }
        private IEnumerable<Sitemap> RunThread_TransformResult(IWebService<string> service)
        {
            try
            {
                var reader = new SitemapWebReader();
                var sitemaps = reader.Read(service.Payload, _xPath);

                // Set parent parameters
                foreach (var sitemap in sitemaps)
                {
                    if (this.CrawlerResultEvent != null)
                        this.CrawlerResultEvent(new CrawlerResultEventData<Sitemap>()
                        {
                            Result = sitemap,
                            Error = false,
                            Tag = service.Endpoint
                        });
                }

                return sitemaps;
            }
            catch (Exception ex)
            {
                OnServiceError("Error reading sitemap:  " + service.Endpoint, ex);

                return null;
            }
        }
        #endregion

        private void OnServiceMessage(string message)
        {
            if (this.CrawlerMessageEvent != null)
                this.CrawlerMessageEvent(message);
        }
        private void OnServiceError(string message, Exception exception)
        {
            if (this.CrawlerErrorEvent != null)
                this.CrawlerErrorEvent(message, exception);
        }
    }
}
