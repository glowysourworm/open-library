
using WpfCustomUtilities.Extensions;
using System.Web;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceParameter : ViewModelBase
    {
        string _name;
        string _value;

        public string Name
        {
            get { return _name; }
            set { this.RaiseAndSetIfChanged(ref _name, value); }
        }
        public string Value
        {
            get { return _value; }
            set { this.RaiseAndSetIfChanged(ref _value, value); }
        }

        public override string ToString()
        {
            return HttpUtility.UrlEncode((this.Name ?? "q") + "=" + (this.Value ?? ""));
        }
    }
}
