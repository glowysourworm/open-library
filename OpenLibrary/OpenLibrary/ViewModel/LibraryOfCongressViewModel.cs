using System.Collections.ObjectModel;

using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel
{
    public class LibraryOfCongressViewModel : ViewModelBase
    {
        public ObservableCollection<WebServiceViewModel> WebServices { get; set; }

        public LibraryOfCongressViewModel()
        {
            this.WebServices = new ObservableCollection<WebServiceViewModel>()
            {
                new WebServiceViewModel()
                {
                    Name = "Library of Congress (SRU v1.2) Online Catalog",
                    Description = "Online catalog of the library of congress (see https://www.loc.gov/standards/sru/sru-1-2.html)",
                    Endpoint = "http://z3950.loc.gov:7090/voyager",
                    /*
                     * NOTE:  LOC EXAMPLE
                     *
                     * http://z3950.loc.gov:7090/voyager?version=1.1&operation=searchRetrieve&query="marv Throneberry"&startRecord=1&maximumRecords=5&recordSchema=mods
                    */
                    MandatoryParameters = new ObservableCollection<WebServiceParameter>()
                    {
                        new WebServiceParameter()
                        {
                            Name = "version",
                            Value = "1.1"       // THIS MIGHT REFER TO SRW WRAPPER!
                        },
                        new WebServiceParameter()
                        {
                            Name = "operation",
                            Value = "searchRetrieve"
                        },
                        new WebServiceParameter()
                        {
                            Name = "query",
                            Value = "<user query>"
                        }
                    }
                }
            };
        }
    }
}
