using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Windows.Data;

using OpenLibrary.ViewModel.ControlViewModel;
using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.ViewModel
{
    public class OpenLibraryViewModel : ViewModelBase
    {
        // UI
        public ObservableCollection<TabItemViewModel> TabItemViewModels { get; set; }

        // Data
        public ObservableCollection<LibraryViewModel> Libraries { get; set; }
        public ObservableCollection<SitemapCrawlerViewModel> Crawlers { get; set; }
        public ObservableCollection<LogMessageViewModel> LogMessages { get; set; }

        public event SimpleEventHandler<WebServiceViewModel, WebServiceEndpointViewModel> WebServiceExecuteRequest;

        public OpenLibraryViewModel()
        {
            // UI
            this.TabItemViewModels = new ObservableCollection<TabItemViewModel>();

            // Data
            this.Crawlers = new ObservableCollection<SitemapCrawlerViewModel>();
            this.LogMessages = new ObservableCollection<LogMessageViewModel>();
            this.Libraries = new ObservableCollection<LibraryViewModel>();

            this.Libraries.CollectionChanged += OnLibrariesCollectionChanged;
            this.TabItemViewModels.CollectionChanged += OnTabItemViewModelsCollectionChanged;
        }

        private void OnLibrariesCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.OldItems != null)
            {
                foreach (var endpoint in e.OldItems.Cast<LibraryViewModel>())
                {
                    endpoint.WebServiceExecuteRequest -= OnWebServiceExecuteRequest;
                    endpoint.WebServiceNavigateRequest -= OnWebServiceNavigateRequest;
                }
            }

            if (e.NewItems != null)
            {
                foreach (var endpoint in e.NewItems.Cast<LibraryViewModel>())
                {
                    endpoint.WebServiceExecuteRequest += OnWebServiceExecuteRequest;
                    endpoint.WebServiceNavigateRequest += OnWebServiceNavigateRequest;
                }
            }

            RefreshTabs();
        }

        private void OnTabItemViewModelsCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            HookTabEvents(false);
            HookTabEvents(true);
        }

        private void RefreshTabs()
        {
            HookTabEvents(false);

            this.TabItemViewModels.Clear();

            // Primary Libarary Web Service Tab
            this.TabItemViewModels.Add(new TabItemViewModel()
            {
                DisplayName = "Libraries",
                Data = this.Libraries,
                IsCloseable = false
            });

            // Primary Web Crawler Tab
            this.TabItemViewModels.Add(new TabItemViewModel()
            {
                DisplayName = "Web Crawlers",
                Data = this.Crawlers,
                IsCloseable = false
            });

            HookTabEvents(true);
        }

        private void OnWebServiceNavigateRequest(WebServiceViewModel service, WebServiceEndpointViewModel endpoint)
        {
            HookTabEvents(false);

            // Check for existing tab item
            var viewModel = this.TabItemViewModels.FirstOrDefault(x => x.Data == endpoint);

            // Navigate to tab
            if (viewModel != null)
            {
                viewModel.IsSelected = true;
            }

            // Create new tab
            else
            {
                // Add tab for the endpoint view
                this.TabItemViewModels.Add(new TabItemViewModel()
                {
                    Data = endpoint,
                    DisplayName = endpoint.Name,
                    IsCloseable = true,
                    IsSelected = true
                });
            }

            HookTabEvents(true);
        }

        private void HookTabEvents(bool hook)
        {
            foreach (var viewModel in this.TabItemViewModels)
            {
                if (!hook)
                    viewModel.CloseEvent -= OnTabCloseEvent;

                else
                    viewModel.CloseEvent += OnTabCloseEvent;
            }
        }

        private void OnTabCloseEvent(TabItemViewModel sender)
        {
            HookTabEvents(false);

            this.TabItemViewModels.Remove(sender);

            HookTabEvents(true);
        }

        private void OnWebServiceExecuteRequest(WebServiceViewModel service, WebServiceEndpointViewModel endpoint)
        {
            if (this.WebServiceExecuteRequest != null)
                this.WebServiceExecuteRequest(service, endpoint);
        }
    }
}
