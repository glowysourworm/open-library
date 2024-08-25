
using System.Collections.ObjectModel;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceViewModel : ViewModelBase
    {
        string _name;
        string _description;
        string _endpoint;
        string _referenceUrl;

        public string Name
        {
            get { return _name; }
            set { this.RaiseAndSetIfChanged(ref _name, value); }
        }
        public string Description
        {
            get { return _description; }
            set { this.RaiseAndSetIfChanged(ref _description, value); }
        }
        public string Endpoint
        {
            get { return _endpoint; }
            set { this.RaiseAndSetIfChanged(ref _endpoint, value); }
        }
        public string ReferenceUrl
        {
            get { return _referenceUrl; }
            set { this.RaiseAndSetIfChanged(ref _referenceUrl, value); }
        }

        public ObservableCollection<WebServiceParameter> MandatoryParameters { get; set; }
        public ObservableCollection<WebServiceParameter> OptionalParameters { get; set; }

        public WebServiceViewModel()
        {
            this.MandatoryParameters = new ObservableCollection<WebServiceParameter>();
            this.OptionalParameters = new ObservableCollection<WebServiceParameter>();
            this.Name = "Default Web Service";
            this.Description = "A default seb service";
            this.Endpoint = "www.google.com";
            this.ReferenceUrl = "www.google.com";
        }
    }
}
