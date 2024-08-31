
using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceEndpointTaskViewModel : ViewModelBase
    {
        int _id;
        string _requestUrl;

        public int Id
        {
            get { return _id; }
            set { this.RaiseAndSetIfChanged(ref _id, value); }
        }
        public string RequestUrl
        {
            get { return _requestUrl; }
            set { this.RaiseAndSetIfChanged(ref _requestUrl, value); }
        }
    }
}
