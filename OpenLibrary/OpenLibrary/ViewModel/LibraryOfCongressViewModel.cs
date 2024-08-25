using System.Collections.Generic;
using System.Collections.ObjectModel;

using OpenLibrary.ViewModel.Web;
using OpenLibrary.Web.Common;

using WpfCustomUtilities.Extensions;
using WpfCustomUtilities.Extensions.Event;
using WpfCustomUtilities.Extensions.ObservableCollection;

using static System.Net.WebRequestMethods;

namespace OpenLibrary.ViewModel
{
    public class LibraryOfCongressViewModel : ViewModelBase
    {
        public const string LOC_OnlineCatalog_Service_Name = "Library of Congress (SRU v1.2) Online Catalog";

        public ObservableCollection<WebServiceViewModel> WebServices { get; set; }

        /// <summary>
        /// Event to execute web service:  Name, Parameters
        /// </summary>
        public event SimpleEventHandler<string, IEnumerable<QueryParameter>> ExecuteWebServiceEvent;

        public LibraryOfCongressViewModel()
        {
            this.WebServices = new ObservableCollection<WebServiceViewModel>();

            var onlineCatalog = new WebServiceViewModel();

            /*
             * NOTE:  LOC EXAMPLE
             *
             * http://z3950.loc.gov:7090/voyager?version=1.1&operation=searchRetrieve&query="marv Throneberry"&startRecord=1&maximumRecords=5&recordSchema=mods
            */
            onlineCatalog.Name = LOC_OnlineCatalog_Service_Name;
            onlineCatalog.Description = "Online catalog of the Library of Congress";
            onlineCatalog.Endpoint = "http://z3950.loc.gov:7090/voyager";
            onlineCatalog.ReferenceUrl = "https://www.loc.gov/standards/sru/sru-1-2.html";
            onlineCatalog.MandatoryParameters.AddRange(new WebServiceParameter[]
            {
                new WebServiceParameter("version", "1.1", true),  // THIS MIGHT REFER TO SRW WRAPPER!
                new WebServiceParameter("operation", "searchRetrieve", true),
                new WebServiceParameter("query", "<user query>", true)
            });
            onlineCatalog.OptionalParameters.AddRange(new WebServiceParameter[]
            {
                new WebServiceParameter("startRecord", "", false),
                new WebServiceParameter("maximumRecords", "", false),
                new WebServiceParameter("recordPacking", "", false),
                new WebServiceParameter("recordSchema", "", false),
                new WebServiceParameter("recordXPath", "", false),
                new WebServiceParameter("resultSetTTL", "", false),
                new WebServiceParameter("stylesheet", "", false),
                new WebServiceParameter("extraRequestData", "", false)
            });

            onlineCatalog.ExecuteEvent += OnExecuteWebService;

            this.WebServices.Add(onlineCatalog);
        }

        private void OnExecuteWebService(WebServiceViewModel sender)
        {
            if (this.ExecuteWebServiceEvent != null)
                this.ExecuteWebServiceEvent(sender.Name, sender.GetParameters());
        }
    }
}
