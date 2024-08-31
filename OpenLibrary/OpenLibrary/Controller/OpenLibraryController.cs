using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Windows;
using System.Windows.Threading;

using OpenLibrary.Controller.LibraryOfCongress.Event;
using OpenLibrary.Service;
using OpenLibrary.Service.Controller.Interface;
using OpenLibrary.Service.ControllerMessage;
using OpenLibrary.ViewModel;
using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions.Collection;
using WpfCustomUtilities.Extensions.ObservableCollection;

namespace OpenLibrary.Controller
{
    public class OpenLibraryController : IDisposable
    {
        IBackendController _backendController;

        //IWebBotController<Sitemap> _webBotController;

        OpenLibraryViewModel _viewModel;

        Timer _pollingTimer;

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
            _backendController = null;

            // Polling:  Refreshes client side view of backend
            _pollingTimer = new Timer(new TimerCallback(OnPoll), null, 1000, 3000);

            // TODO: Configuration for sitemap crawlers
            //_webBotController = new SitemapController(crawlerName, "https://loc.gov/sitemap.xml");

            //_webBotController.WebMessageEvent += OnMessageEvent;
            //_webBotController.WebUpdateEvent += OnUpdateEvent;
        }

        public void Initialize()
        {

            // Initialize Service Backend
            _backendController = BackendFactory.Create();

            // Query for entities
            var webServices = _backendController.GetWebServices();

            // Initialize View Model -> Web Services
            var webServiceViewModels = webServices.Select(service =>
            {
                var serviceViewModel = new WebServiceViewModel()
                {
                    Id = service.Id,
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
                        Id = endpoint.Id,
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
                            UseParameter = false,
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

        private void OnUpdateEvent(WebBotEventData eventData)
        {
            var crawler = _viewModel.Crawlers.First(x => x.Name == eventData.Name);

            crawler.Running = eventData.Status == ControllerStatus.Running;
            crawler.SitemapQueueCount = eventData.QueueCount;
        }

        public void StartWebBots()
        {
            //_webBotController.Start();

            OnMessage("Web crawlers started...", LogMessageType.System, LogMessageSeverity.Info);
        }

        private void OnMessage(string message, LogMessageType type, LogMessageSeverity severity, Exception exception = null)
        {
            OnMessage(new LogMessageViewModel()
            {
                Message = message,
                Timestamp = DateTime.Now,
                MessageType = type,
                Severity = severity,
                ExceptionDetail = exception?.StackTrace.ToString() ?? "",
                ExceptionMessage = exception?.Message ?? "",
                InnerExceptionDetail = exception?.InnerException?.StackTrace.ToString() ?? "",
                InnerExceptionMessage = exception?.InnerException?.Message ?? "",
            });
        }

        private void OnMessage(LogMessage log)
        {
            OnMessage(new LogMessageViewModel()
            {
                Message = log.Message,
                Timestamp = log.Timestamp,
                MessageType = log.MessageType,
                Severity = log.Severity,
                ExceptionDetail = log.ExceptionDetail,
                ExceptionMessage = log.ExceptionMessage,
                InnerExceptionDetail = log.InnerExceptionDetail,
                InnerExceptionMessage = log.InnerExceptionMessage
            });
        }

        private void OnMessage(LogMessageViewModel viewModel)
        {
            _viewModel.LogMessages.Insert(0, viewModel);

            if (_viewModel.LogMessages.Count > 10000)
                _viewModel.LogMessages.RemoveAt(_viewModel.LogMessages.Count - 1);
        }

        private void OnServiceViewModelExecuteRequest(WebServiceViewModel sender, WebServiceEndpointViewModel endpoint)
        {
            var taskMessages = _backendController.SubmitEndpointRequest(sender.Id, endpoint.Id, endpoint.GetParameters());

            RefreshTaskLogMessages(sender, endpoint, taskMessages);

            //// Get Service Backend
            //var service = _viewModel.WebServices.

            //// Log Execute Message
            //OnMessageEvent(-1, "Executing Web Service:  " + endpoint.Endpoint, false);

            //// Execute (synchronously) - using Resolved Url
            //var result = service.Run(endpoint.Endpoint, endpoint.ResolvedUrl);

            //// Log Execute Message
            //OnMessageEvent(-1, "Web Service Response:  " + endpoint.Endpoint, false);

            //if (result != null)
            //{
            //    _viewModel.TabItemViewModels.Add(new TabItemViewModel()
            //    {
            //        Data = new WebServiceResponseViewModel()
            //        {
            //            Created = DateTime.Now,
            //            Endpoint = endpoint.Endpoint,
            //            MimeType = "???",
            //            Payload = result,
            //            RequestUrl = endpoint.ResolvedUrl,
            //            ServiceName = sender.Name
            //        },
            //        DisplayName = service.Name + " (" + DateTime.Now.ToLongTimeString() + ")",
            //        IsCloseable = true,
            //        IsSelected = true
            //    });
            //}
        }

        private void RefreshFromBackend()
        {
            foreach (var service in _viewModel.WebServices)
            {
                foreach (var endpoint in service.Endpoints)
                {
                    // TODO: FIX CLASS HIERARCHY
                    var taskMessages = _backendController.GetTaskStatuses(service.Id, endpoint.Id).Cast<WebRequestBackendTaskMessage>();

                    RefreshTaskLogMessages(service, endpoint, taskMessages);
                }
            }
        }

        private void RefreshTaskLogMessages(WebServiceViewModel service,
                                            WebServiceEndpointViewModel endpoint,
                                            IEnumerable<BackendTaskMessage> messages)
        {
            // Loop through task messages to update tasks on the client
            //
            foreach (var taskMessage in messages.Cast<WebRequestBackendTaskMessage>())
            {
                // New
                if (!endpoint.Tasks.Any(x => x.Id == taskMessage.TaskId))
                {
                    endpoint.Tasks.Add(new WebServiceEndpointTaskViewModel()
                    {
                        Id = service.Id,
                        RequestUrl = taskMessage.RequestUri.AbsoluteUri
                    });
                }

                // Log messages
                var logMessages = _backendController.GetLogMessages(service.Id, endpoint.Id, taskMessage.TaskId);

                // () -> Log
                foreach (var message in logMessages)
                    OnMessage(message);
            }
        }

        private void OnPoll(object state)
        {
            Application.Current
                       .Dispatcher
                       .BeginInvoke(new Action(RefreshFromBackend), DispatcherPriority.ApplicationIdle);
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
