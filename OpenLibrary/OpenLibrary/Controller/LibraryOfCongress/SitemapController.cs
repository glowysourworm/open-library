using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;

using OpenLibrary.Controller.Interface;
using OpenLibrary.Controller.LibraryOfCongress.Event;
using OpenLibrary.Data;
using OpenLibrary.Service.Crawler;
using OpenLibrary.Service.Crawler.Event;
using OpenLibrary.Service.WebReader;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Controller.LibraryOfCongress
{
    public class SitemapController : IWebBotController<Sitemap>
    {
        SitemapCrawler _crawler;

        public string Name { get; private set; }
        public ControllerStatus Status { get; private set; }

        public event SimpleEventHandler<string, bool> WebMessageEvent;
        public event SimpleEventHandler<WebBotEventData> WebUpdateEvent;

        readonly Dictionary<Sitemap, Sitemap> _childParentTodoDict;

        readonly string _xPath = "/*/*";    // sitemapindex -> sitemap -> loc

        public SitemapController(string name, string sitemapUrl)
        {
            this.Name = name;
            this.Status = ControllerStatus.Stopped;

            _childParentTodoDict = new Dictionary<Sitemap, Sitemap>();
            _crawler = null;

            using (var entities = new OpenLibraryEntities())
            {
                var parent = entities.Sitemaps
                                     .FirstOrDefault(sitemap => sitemap.Url == sitemapUrl);
                if (parent == null)
                {
                    parent = entities.Sitemaps.Create();
                    parent.Url = sitemapUrl;
                    parent.LastUpdate = DateTime.Now;
                    parent.Name = "Root";

                    entities.Sitemaps.Add(parent);
                    entities.SaveChanges();
                }

                _childParentTodoDict.Add(parent, null);
            }
        }

        public void Start()
        {
            if (_crawler != null)
            {
                Stop(true);
            }

            // Take child nodes ready to crawl
            var urls = _childParentTodoDict.Keys.Select(x => x.Url).ToList();

            _crawler = new SitemapCrawler(urls, _xPath);

            _crawler.CrawlerResultEvent += OnCrawlerResultEvent;
            _crawler.CrawlerErrorEvent += OnCrawlerErrorEvent;
            _crawler.CrawlerMessageEvent += OnCrawlerMessageEvent;
            _crawler.CrawlerCompleteEvent += OnCrawlerCompleteEvent;

            _crawler.Start();

            this.Status = ControllerStatus.Running;

            RaiseUpdateEvent();
        }

        public void Stop(bool haltThreadExecution)
        {
            _crawler.CrawlerResultEvent -= OnCrawlerResultEvent;
            _crawler.CrawlerErrorEvent -= OnCrawlerErrorEvent;
            _crawler.CrawlerMessageEvent -= OnCrawlerMessageEvent;
            _crawler.CrawlerCompleteEvent -= OnCrawlerCompleteEvent;

            _crawler.Stop(haltThreadExecution);
            _crawler = null;

            this.Status = ControllerStatus.Stopped;

            RaiseUpdateEvent();
        }

        private void OnCrawlerResultEvent(CrawlerResultEventData<Sitemap> eventData)
        {
            InvokeDispatcher(ResultEventHandler, eventData.Result, (string)eventData.Tag, eventData.Error);
        }

        private void OnCrawlerMessageEvent(string message)
        {
            InvokeDispatcher(MessageEventHandler, message, true);
        }

        private void OnCrawlerErrorEvent(string message, Exception exception)
        {
            InvokeDispatcher(MessageEventHandler, message, exception != null);
        }

        private void OnCrawlerCompleteEvent(bool success)
        {
            InvokeDispatcher(CompleteEventHandler, success);
        }

        private void RaiseUpdateEvent()
        {
            if (this.WebUpdateEvent != null)
                this.WebUpdateEvent(new WebBotEventData()
                {
                    Name = this.Name,
                    QueueCount = _childParentTodoDict.Keys.Count,
                    Status = this.Status
                });
        }

        private void MessageEventHandler(string message, bool success)
        {
            if (this.WebMessageEvent != null)
                this.WebMessageEvent(message, false);
        }

        private void ResultEventHandler(Sitemap payload, string parentUrl, bool error)
        {
            try
            {
                if (error)
                    MessageEventHandler("Cannot add / update sitemap data due to service error:  " + payload.Url, true);

                // Procedure
                //
                // 0) Locate parent node
                // 1) Open Entity Connection -> Query Parent -> Query Existing Node
                // 2) Apply result data
                // 3) Save / Close Entity Connection
                //

                var reader = new SitemapWebReader();

                var parentSitemap = _childParentTodoDict.Keys.FirstOrDefault(x => x.Url == parentUrl);
                if (parentSitemap == null)
                    throw new Exception("Unable to locate sitemap returned from SitemapWebService:  " + payload.Url);

                using (var entities = new OpenLibraryEntities())
                {
                    // Locate parent if not the root
                    var parent = parentSitemap != null ? entities.Sitemaps.FirstOrDefault(x => x.Id == parentSitemap.Id) : null;

                    // CAREFUL OF NULL PARENT (ROOT)

                    // Existing
                    var child = entities.Sitemaps.FirstOrDefault(x => x.Url == payload.Url);

                    // New
                    if (child == null)
                    {
                        child = entities.Sitemaps.Create();
                        entities.Sitemaps.Add(child);
                    }

                    child.LastUpdate = payload.LastUpdate;
                    child.Name = (parent?.Name ?? "Root") + " / " + payload.Name;
                    child.ParentSitemap = parent;
                    child.Url = payload.Url;

                    // Queue if child is sitemap
                    if (child.Url.EndsWith("sitemap.xml"))
                        _childParentTodoDict.Add(child, parent);

                    entities.SaveChanges();

                    MessageEventHandler("Sitemap added:  " + payload.Url, true);

                    RaiseUpdateEvent();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void CompleteEventHandler(bool allSuccess)
        {
            // Halt Service
            Stop(true);

            if (allSuccess)
                MessageEventHandler("Sitemap Controller completed successfully!", true);
            else
                MessageEventHandler("Sitemap Controller completed with errors!", false);

            // TODO: Deal with error situations
            if (_childParentTodoDict.Count > 0)
            {
                Start();
            }
        }

        private void InvokeDispatcher(SimpleEventHandler<bool> handler, params object[] parameters)
        {
            Application.Current.Dispatcher.Invoke(handler, parameters);
        }

        private void InvokeDispatcher(SimpleEventHandler<string, bool> handler, params object[] parameters)
        {
            Application.Current.Dispatcher.Invoke(handler, parameters);
        }

        private void InvokeDispatcher(SimpleEventHandler<Sitemap, string, bool> handler, params object[] parameters)
        {
            Application.Current.Dispatcher.Invoke(handler, parameters);
        }
    }
}
