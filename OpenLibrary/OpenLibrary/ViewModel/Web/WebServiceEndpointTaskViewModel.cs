
using System.Collections.ObjectModel;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceEndpointTaskViewModel : ViewModelBase
    {
        int _id;
        int _endpointId;
        string _name;
        string _description;
        string _host;
        string _method;
        int _timeoutMilliseconds;
        string _requestUrl;
        bool _requestUrlTokenized;

		public int Id
		{
			get { return _id; }
			set { this.RaiseAndSetIfChanged(ref _id, value); }
		}
		public int EndpointId
		{
			get { return _endpointId; }
			set { this.RaiseAndSetIfChanged(ref _endpointId, value); }
		}
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
		public string Host
		{
			get { return _host; }
			set { this.RaiseAndSetIfChanged(ref _host, value); }
		}
		public string Method
		{
			get { return _method; }
			set { this.RaiseAndSetIfChanged(ref _method, value); }
		}
		public int TimeoutMilliseconds
		{
			get { return _timeoutMilliseconds; }
			set { this.RaiseAndSetIfChanged(ref _timeoutMilliseconds, value); }
		}
		public string RequestUrl
		{
			get { return _requestUrl; }
			set { this.RaiseAndSetIfChanged(ref _requestUrl, value); }
		}
		public bool RequestUrlTokenized
		{
			get { return _requestUrlTokenized; }
			set { this.RaiseAndSetIfChanged(ref _requestUrlTokenized, value); }
		}

		public ObservableCollection<WebServiceEndpointTaskEventViewModel> TaskEvents { get; set; }

		public WebServiceEndpointTaskViewModel()
        {
			this.TaskEvents = new ObservableCollection<WebServiceEndpointTaskEventViewModel>();
        }
	}
}
