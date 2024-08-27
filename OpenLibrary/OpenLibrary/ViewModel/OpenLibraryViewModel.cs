using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Windows.Data;

using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.ViewModel
{
    public class OpenLibraryViewModel : ViewModelBase
    {
        public ObservableCollection<WebServiceViewModel> WebServices { get; set; }
        public ObservableCollection<SitemapCrawlerViewModel> Crawlers { get; set; }
        public ObservableCollection<LogMessageViewModel> LogMessages { get; set; }

        public event SimpleEventHandler<WebServiceViewModel, WebServiceEndpointViewModel> WebServiceExecuteRequest;

        public OpenLibraryViewModel()
        {
            this.Crawlers = new ObservableCollection<SitemapCrawlerViewModel>();
            this.LogMessages = new ObservableCollection<LogMessageViewModel>();
            this.WebServices = new ObservableCollection<WebServiceViewModel>();

            // Create grouping for the web services
            var webServicesDefaultView = (CollectionView)CollectionViewSource.GetDefaultView(this.WebServices);

            // Add property name for a grouping
            webServicesDefaultView.GroupDescriptions.Add(new PropertyGroupDescription("LibraryName"));

            this.WebServices.CollectionChanged += OnWebServicesCollectionChanged;
        }

        private void OnWebServicesCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.OldItems != null)
            {
                foreach (var endpoint in e.OldItems.Cast<WebServiceViewModel>())
                    endpoint.ExecuteRequest -= OnWebServiceExecuteRequest;
            }

            if (e.NewItems != null)
            {
                foreach (var endpoint in e.NewItems.Cast<WebServiceViewModel>())
                    endpoint.ExecuteRequest += OnWebServiceExecuteRequest;
            }
        }

        private void OnWebServiceExecuteRequest(WebServiceViewModel service, WebServiceEndpointViewModel endpoint)
        {
            if (this.WebServiceExecuteRequest != null)
                this.WebServiceExecuteRequest(service, endpoint);
        }
    }
}
