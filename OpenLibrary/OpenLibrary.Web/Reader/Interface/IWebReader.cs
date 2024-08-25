using System.Collections.Generic;

namespace OpenLibrary.Web.Reader.Interface
{
    /// <summary>
    /// Web reader to read entity object from xml data using an xpath.
    /// </summary>
    /// <typeparam name="T">Marker for EntityObject type. The generic was not inherited for EF6.</typeparam>
    public interface IWebReader<T> where T : class
    {
        IEnumerable<T> Read(string xmlData, string xPath);
    }
}
