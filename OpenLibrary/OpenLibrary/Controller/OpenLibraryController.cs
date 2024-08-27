using System;
using System.Linq;
using System.Net;
using System.Windows;

using OpenLibrary.Controller.LibraryOfCongress.Event;
using OpenLibrary.Data;
using OpenLibrary.Service.LibraryOfCongress;
using OpenLibrary.Service.LibraryOfCongress.Interface;
using OpenLibrary.ViewModel;
using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions.Collection;
using WpfCustomUtilities.Extensions.ObservableCollection;

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

            // () -> Initialize() (after loaded)
            _libraryOfCongressService = null;

            // TODO: Configuration for sitemap crawlers
            //_webBotController = new SitemapController(crawlerName, "https://loc.gov/sitemap.xml");

            //_webBotController.WebMessageEvent += OnMessageEvent;
            //_webBotController.WebUpdateEvent += OnUpdateEvent;
        }

        public void Initialize()
        {
            using (var entities = new OpenLibraryEntities())
            {
                var webServices = entities.WebServices.Actualize();

                // Initialize Service Backend
                _libraryOfCongressService = new LibraryOfCongressService(webServices);

                // Initialize View Model -> Web Services
                var webServiceViewModels = webServices.Select(service =>
                {
                    var serviceViewModel = new WebServiceViewModel()
                    {
                        Description = service.Description,
                        LibraryName = service.LibraryName,
                        Name = service.Name,
                        ReferenceUrl = service.ReferenceUrl,
                        SubSystem = service.Subsystem,
                        System = service.System,
                    };

                    // Endpoints
                    serviceViewModel.Endpoints.AddRange(service.WebServiceEndpoints.Select(endpoint =>
                    {
                        var endpointViewModel = new WebServiceEndpointViewModel()
                        {
                            Description = endpoint.Description,
                            Endpoint = endpoint.Endpoint,
                            Name = endpoint.Name,
                            ReferenceUrl = endpoint.ReferenceUrl,
                            SslRequired = endpoint.SSLRequired
                        };

                        var mandatoryParameters = endpoint.WebService.WebServiceParameters.Where(x => x.Required).Actualize();
                        var optionalParameters = endpoint.WebService.WebServiceParameters.Where(x => !x.Required).Actualize();

                        // Mandatory Parameters
                        endpointViewModel.MandatoryParameters.AddRange(mandatoryParameters.Select(parameter =>
                        {

                            var viewModel = new WebServiceParameterViewModel()
                            {
                                ArrayParameter = parameter.ArrayParameter,
                                CommaDelimited = parameter.CommaDelimited,
                                DefaultValue = parameter.DefaultValue,
                                Description = parameter.Description,
                                Name = parameter.Name,
                                UseParameter = true,
                                Value = parameter.DefaultValue
                            };

                            foreach (var setting in parameter.WebServiceParameterSettings)
                            {
                                viewModel.ParameterSettings.Add(new WebServiceParameterSettingViewModel()
                                {
                                    Explanation = setting.Explanation,
                                    PossibleValue = setting.PossibleValue
                                });
                            }

                            return viewModel;

                        }).Actualize());

                        // Optional Parameters
                        endpointViewModel.OptionalParameters.AddRange(optionalParameters.Select(parameter =>
                        {

                            var viewModel = new WebServiceParameterViewModel()
                            {
                                ArrayParameter = parameter.ArrayParameter,
                                CommaDelimited = parameter.CommaDelimited,
                                DefaultValue = parameter.DefaultValue,
                                Description = parameter.Description,
                                Name = parameter.Name,
                                UseParameter = parameter.Required,
                                Value = parameter.DefaultValue
                            };

                            foreach (var setting in parameter.WebServiceParameterSettings)
                            {
                                viewModel.ParameterSettings.Add(new WebServiceParameterSettingViewModel()
                                {
                                    Explanation = setting.Explanation,
                                    PossibleValue = setting.PossibleValue
                                });
                            }

                            return viewModel;

                        }).Actualize());

                        return endpointViewModel;

                    }).Actualize());

                    return serviceViewModel;

                }).Actualize();

                // Setup collection and hook web request event
                foreach (var viewModel in webServiceViewModels)
                {
                    // Hook event for web requests
                    viewModel.ExecuteRequest += OnServiceViewModelExecuteRequest;

                    // Add to primary web service collection
                    _viewModel.WebServices.Add(viewModel);
                }    
            }
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

        private void OnServiceViewModelExecuteRequest(WebServiceViewModel sender, WebServiceEndpointViewModel endpoint)
        {
            // Get Service Backend
            var service = _libraryOfCongressService.SruServices[sender.Name];

            // Log Execute Message
            OnMessageEvent("Executing Web Service:  " + endpoint.Endpoint, false);

            // Execute (synchronously) - using Resolved Url
            var result = service.Run(endpoint.Endpoint, endpoint.ResolvedUrl);

            // Log Execute Message
            OnMessageEvent("Web Service Response:  " + endpoint.Endpoint, false);

            if (result != null)
            {
                _viewModel.WebServiceResponses.Add(new WebServiceResponseViewModel()
                {
                    Created = DateTime.Now,
                    Endpoint = endpoint.Endpoint,
                    MimeType = "???",
                    Payload = result,
                    RequestUrl = endpoint.ResolvedUrl,
                    ServiceName = sender.Name
                });
            }
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
