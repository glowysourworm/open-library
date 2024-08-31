using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Windows.Data;

using OpenLibrary.ViewModel.ControlViewModel;
using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.ViewModel
{
    public class LibraryViewModel : ViewModelBase
    {
        string _libraryName;

        public event SimpleEventHandler<WebServiceViewModel, WebServiceEndpointViewModel> WebServiceExecuteRequest;
        public event SimpleEventHandler<WebServiceViewModel, WebServiceEndpointViewModel> WebServiceNavigateRequest;

        public string LibraryName
        {
            get { return _libraryName; }
            set { this.RaiseAndSetIfChanged(ref _libraryName, value); }
        }

        public ObservableCollection<WebServiceViewModel> WebServices { get; set; }

        public LibraryViewModel()
        {
            this.LibraryName = "New Library";
            this.WebServices = new ObservableCollection<WebServiceViewModel>();

            this.WebServices.CollectionChanged += OnWebServicesCollectionChanged;
        }

        private void OnWebServicesCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.OldItems != null)
            {
                foreach (var service in e.OldItems.Cast<WebServiceViewModel>())
                {
                    service.ExecuteRequest -= OnWebServiceExecuteRequest;
                    service.NavigateToRequest -= OnWebServiceNavigateRequest;
                }
            }

            if (e.NewItems != null)
            {
                foreach (var service in e.NewItems.Cast<WebServiceViewModel>())
                {
                    service.ExecuteRequest += OnWebServiceExecuteRequest;
                    service.NavigateToRequest += OnWebServiceNavigateRequest;
                }
            }
        }
        private void OnWebServiceNavigateRequest(WebServiceViewModel service, WebServiceEndpointViewModel endpoint)
        {
            if (this.WebServiceNavigateRequest != null)
                this.WebServiceNavigateRequest(service, endpoint);
        }

        private void OnWebServiceExecuteRequest(WebServiceViewModel service, WebServiceEndpointViewModel endpoint)
        {
            if (this.WebServiceExecuteRequest != null)
                this.WebServiceExecuteRequest(service, endpoint);
        }

    }
}
