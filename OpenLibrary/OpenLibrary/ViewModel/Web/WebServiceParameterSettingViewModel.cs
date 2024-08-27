using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel.Web
{
    public class WebServiceParameterSettingViewModel : ViewModelBase
    {
        string _explanation;
        string _possibleValue;

        public string Explanation
        {
            get { return _explanation; }
            set { this.RaiseAndSetIfChanged(ref _explanation, value); }
        }
        public string PossibleValue
        {
            get { return _possibleValue; }
            set { this.RaiseAndSetIfChanged(ref _possibleValue, value); }
        }
    }
}
