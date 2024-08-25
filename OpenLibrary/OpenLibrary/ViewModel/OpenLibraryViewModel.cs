using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

using OpenLibrary.ViewModel.Web;
using OpenLibrary.Web.Common;

using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.ViewModel
{
    public class OpenLibraryViewModel : ViewModelBase
    {
        public LibraryOfCongressViewModel LibraryOfCongress { get; set; }

        public ObservableCollection<SitemapCrawlerViewModel> Crawlers { get; set; }
        public ObservableCollection<LogMessageViewModel> LogMessages { get; set; }

        /// <summary>
        /// Execute web service call:  Name, Parameters
        /// </summary>
        public event SimpleEventHandler<string, IEnumerable<QueryParameter>> WebServiceEvent;

        public OpenLibraryViewModel()
        {
            this.Crawlers = new ObservableCollection<SitemapCrawlerViewModel>();
            this.LogMessages = new ObservableCollection<LogMessageViewModel>();
            this.LibraryOfCongress = new LibraryOfCongressViewModel();

            this.LibraryOfCongress.ExecuteWebServiceEvent += OnWebServiceEvent;
        }

        private void OnWebServiceEvent(string serviceName, IEnumerable<QueryParameter> parameters)
        {
            if (this.WebServiceEvent != null)
                this.WebServiceEvent(serviceName, parameters);
        }
    }
}
