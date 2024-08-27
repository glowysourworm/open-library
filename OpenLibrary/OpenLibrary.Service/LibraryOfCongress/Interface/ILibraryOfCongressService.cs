using System.Collections.Generic;

namespace OpenLibrary.Service.LibraryOfCongress.Interface
{
    public interface ILibraryOfCongressService
    {
        /// <summary>
        /// SRU services for LOC: Online Catalog, Name Authority File, Subject Authority File, HLAS, NLS BARD
        /// </summary>
        IDictionary<string, ISruService> SruServices { get; }
    }
}
