using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenLibrary.Service.LibraryOfCongress.Interface
{
    public interface ILibraryOfCongressService
    {
        /// <summary>
        /// SRU service for LOC Online Catalog
        /// </summary>
        ISruService OnlineCatalogService { get; }
    }
}
