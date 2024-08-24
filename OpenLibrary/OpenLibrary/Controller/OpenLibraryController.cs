using System;
using System.Linq;

using OpenLibrary.Controller.Interface;
using OpenLibrary.Controller.LibraryOfCongress;
using OpenLibrary.Controller.LibraryOfCongress.Event;
using OpenLibrary.Data;
using OpenLibrary.ViewModel;

namespace OpenLibrary.Controller
{
    public class OpenLibraryController : IDisposable
    {
        IWebBotController<Sitemap> _webBotController;
        OpenLibraryViewModel _viewModel;

        public OpenLibraryController(OpenLibraryViewModel viewModel)
        {
            _viewModel = viewModel;

            var crawlerName = "Library of Congress -> Sitemap Bot";

            // Add web crawler view models
            _viewModel.Crawlers.Add(new SitemapCrawlerViewModel()
            {
                Name = crawlerName,
                Running = true,
                SitemapQueueCount = 1
            });

            // TODO: Configuration for sitemap crawlers
            _webBotController = new SitemapController(crawlerName, "https://loc.gov/sitemap.xml");

            _webBotController.WebMessageEvent += OnMessageEvent;
            _webBotController.WebUpdateEvent += OnUpdateEvent;
        }

        private void OnUpdateEvent(WebBotEventData eventData)
        {
            var crawler = _viewModel.Crawlers.First(x => x.Name == eventData.Name);

            crawler.Running = eventData.Status == ControllerStatus.Running;
            crawler.SitemapQueueCount = eventData.QueueCount;
        }

        public void StartWebBots()
        {
            _webBotController.Start();

            OnMessageEvent("Web crawlers started...", false);
        }

        private void OnMessageEvent(string message, bool error)
        {
            _viewModel.LogMessages.Insert(0, new LogMessageViewModel()
            {
                IsError = error,
                Message = DateTime.Now.ToLongTimeString() + "    " + message
            });
        }

        public void Dispose()
        {
            if (_webBotController != null)
            {
                _webBotController.Stop(true);
                _webBotController = null;
            }
            else
                throw new Exception("OpenLibraryController has already been disposed");
        }
    }
}
