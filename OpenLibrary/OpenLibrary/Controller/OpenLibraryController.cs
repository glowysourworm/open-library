using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Windows;
using System.Xml.Linq;

using OpenLibrary.Controller.Interface;
using OpenLibrary.Controller.LibraryOfCongress;
using OpenLibrary.Controller.LibraryOfCongress.Event;
using OpenLibrary.Data;
using OpenLibrary.Service.LibraryOfCongress;
using OpenLibrary.Service.LibraryOfCongress.Interface;
using OpenLibrary.ViewModel;
using OpenLibrary.ViewModel.Web;
using OpenLibrary.Web.Common;

namespace OpenLibrary.Controller
{
    public class OpenLibraryController : IDisposable
    {
        ILibraryOfCongressService _libraryOfCongressService;
        //IWebBotController<Sitemap> _webBotController;
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

            _viewModel.WebServiceEvent += OnWebServiceEvent;

            _libraryOfCongressService = new LibraryOfCongressService();

            // TODO: Configuration for sitemap crawlers
            //_webBotController = new SitemapController(crawlerName, "https://loc.gov/sitemap.xml");

            //_webBotController.WebMessageEvent += OnMessageEvent;
            //_webBotController.WebUpdateEvent += OnUpdateEvent;
        }

        private void OnUpdateEvent(WebBotEventData eventData)
        {
            var crawler = _viewModel.Crawlers.First(x => x.Name == eventData.Name);

            crawler.Running = eventData.Status == ControllerStatus.Running;
            crawler.SitemapQueueCount = eventData.QueueCount;
        }

        public void StartWebBots()
        {
            //_webBotController.Start();

            OnMessageEvent("Web crawlers started...", false);
        }

        private void OnMessageEvent(string message, bool error)
        {
            _viewModel.LogMessages.Insert(0, new LogMessageViewModel()
            {
                IsError = error,
                Message = DateTime.Now.ToLongTimeString() + "    " + message
            });

            if (_viewModel.LogMessages.Count > 10000)
                _viewModel.LogMessages.RemoveAt(_viewModel.LogMessages.Count - 1);
        }

        private void OnWebServiceEvent(string serviceName, IEnumerable<QueryParameter> parameters)
        {
            // TODO: Use Names to locate service

            // Execute (synchronously)
            var result = _libraryOfCongressService.OnlineCatalogService.Run(parameters);

            Clipboard.SetText(result);

            MessageBox.Show("Result copied to clipboard!", "Open Libarary Web Services");
        }

        public void Dispose()
        {
            //if (_webBotController != null)
            //{
            //    _webBotController.Stop(true);
            //    _webBotController = null;
            //}
            //else
            //    throw new Exception("OpenLibraryController has already been disposed");
        }
    }
}
