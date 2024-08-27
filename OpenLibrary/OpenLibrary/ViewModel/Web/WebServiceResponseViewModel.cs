using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceResponseViewModel : ViewModelBase
    {
        string _serviceName;
        string _endpoint;
        string _requestUrl;
        DateTime _created;
        string _mimeType;
        string _payload;

		public string ServiceName
		{
			get { return _serviceName; }
			set { this.RaiseAndSetIfChanged(ref _serviceName, value); }
		}
		public string Endpoint
		{
			get { return _endpoint; }
			set { this.RaiseAndSetIfChanged(ref _endpoint, value); }
		}
		public string RequestUrl
		{
			get { return _requestUrl; }
			set { this.RaiseAndSetIfChanged(ref _requestUrl, value); }
		}
		public DateTime Created
		{
			get { return _created; }
			set { this.RaiseAndSetIfChanged(ref _created, value); }
		}
		public string MimeType
		{
			get { return _mimeType; }
			set { this.RaiseAndSetIfChanged(ref _mimeType, value); }
		}
		public string Payload
		{
			get { return _payload; }
			set { this.RaiseAndSetIfChanged(ref _payload, value); }
		}

		public WebServiceResponseViewModel()
        {
			this.Created = DateTime.Now;
			this.MimeType = "";
			this.Payload = "";
			this.Endpoint = "";
			this.RequestUrl = "";
			this.ServiceName = "";
        }
	}
}
