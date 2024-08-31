using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using System.Xml.Serialization;

using OpenLibrary.Service.Web.WebReader.Interface;

namespace OpenLibrary.Service.Web.WebReader
{
    /// <summary>
    /// Uses system dynamic to read XML data into entity object
    /// </summary>
    /// <typeparam name="T">Flat entity type</typeparam>
    public class EntityWebReader<T> : IWebReader<T> where T : class
    {
        public IEnumerable<T> Read(string xmlData, string xPath)
        {
            var result = new List<T>();

            using (var reader = new StringReader(xmlData))
            {
                var serializer = new XmlSerializer(typeof(T));

                // Use LINQ to XML to load data from incoming string
                var document = XDocument.Load(reader);

                // Locate sub-elements with XPath
                var elements = document.Elements(xPath).ToList();

                foreach (var element in elements)
                {
                    using (var elementStream = new StringReader(element.Value))
                    {
                        // Use XmlSerializer on the sub-element
                        var entity = (T)serializer.Deserialize(elementStream);

                        result.Add(entity);
                    }
                }
            }

            return result;
        }
    }
}
