using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;

using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceViewModel : ViewModelBase
    {
        string _name;
        string _libraryName;
        string _description;
        string _system;
        string _subSystem;
        string _referenceUrl;

        public event SimpleEventHandler<WebServiceViewModel, WebServiceEndpointViewModel> ExecuteRequest;
        public event SimpleEventHandler<WebServiceViewModel, WebServiceEndpointViewModel> NavigateToRequest;

        public string Name
        {
            get { return _name; }
            set { this.RaiseAndSetIfChanged(ref _name, value); }
        }
        public string LibraryName
        {
            get { return _libraryName; }
            set { this.RaiseAndSetIfChanged(ref _libraryName, value); }
        }
        public string Description
        {
            get { return _description; }
            set { this.RaiseAndSetIfChanged(ref _description, value); }
        }
        public string System
        {
            get { return _system; }
            set { this.RaiseAndSetIfChanged(ref _system, value); }
        }
        public string SubSystem
        {
            get { return _subSystem; }
            set { this.RaiseAndSetIfChanged(ref _subSystem, value); }
        }
        public string ReferenceUrl
        {
            get { return _referenceUrl; }
            set { this.RaiseAndSetIfChanged(ref _referenceUrl, value); }
        }

        public ObservableCollection<WebServiceEndpointViewModel> Endpoints { get; set; }

        public WebServiceViewModel()
        {
            this.Endpoints = new ObservableCollection<WebServiceEndpointViewModel>();
            this.Name = "Default Web Service";
            this.Description = "A default seb service";
            this.LibraryName = "Default Library";
            this.ReferenceUrl = "www.google.com";

            this.Endpoints.CollectionChanged += OnEndpointsCollectionChanged;
        }

        private void OnEndpointsCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.OldItems != null)
            {
                foreach (var endpoint in e.OldItems.Cast<WebServiceEndpointViewModel>())
                {
                    endpoint.ExecuteEvent -= Endpoint_ExecuteEvent;
                    endpoint.NavigateToEvent -= Endpoint_NavigateToEvent;
                }
            }

            if (e.NewItems != null)
            {
                foreach (var endpoint in e.NewItems.Cast<WebServiceEndpointViewModel>())
                {
                    endpoint.ExecuteEvent += Endpoint_ExecuteEvent;
                    endpoint.NavigateToEvent += Endpoint_NavigateToEvent;
                }
            }
        }

        private void Endpoint_NavigateToEvent(WebServiceEndpointViewModel sender)
        {
            if (this.NavigateToRequest != null)
                this.NavigateToRequest(this, sender);
        }

        private void Endpoint_ExecuteEvent(WebServiceEndpointViewModel sender)
        {
            if (this.ExecuteRequest != null)
                this.ExecuteRequest(this, sender);
        }
    }
}
