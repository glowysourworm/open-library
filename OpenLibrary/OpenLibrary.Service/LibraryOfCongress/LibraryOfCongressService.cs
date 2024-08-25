
using OpenLibrary.Service.LibraryOfCongress.Interface;

namespace OpenLibrary.Service.LibraryOfCongress
{
    /// <summary>
    /// Service front-end to most of LOC's SRU API functions
    /// </summary>
    public class LibraryOfCongressService : ILibraryOfCongressService
    {
        public ISruService OnlineCatalogService { get; }

        public LibraryOfCongressService()
        {
            this.OnlineCatalogService = new SruService_v1_2("Library of Congress (SRU) Online Catalog",
                                                            "A simple URL request / response service for SRU server at (see Base Url)",
                                                            "z3950.loc.gov:7090",
                                                            "http://z3950.loc.gov:7090/voyager");
        }
    }
}
