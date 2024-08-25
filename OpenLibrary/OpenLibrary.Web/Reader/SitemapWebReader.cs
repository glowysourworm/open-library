using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;

using OpenLibrary.Data;
using OpenLibrary.Web.Reader.Interface;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.Web.WebReader
{
    public class SitemapWebReader : IWebReader<Sitemap>
    {
        public SitemapWebReader()
        {
        }

        public IEnumerable<Sitemap> Read(string xmlData, string xPath)
        {
            var document = new XmlDocument();
            document.LoadXml(xmlData);

            var nodes = document.SelectNodes(xPath);

            var result = new List<Sitemap>();

            foreach (var node in nodes.Cast<XmlElement>())
            {
                // Get name for the sitemap
                var uriPieces = node.InnerText.Before('?').Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);

                // http://.../.../{name}/sitemap.xml
                var name = node.InnerText.EndsWith("sitemap.xml") ? uriPieces[uriPieces.Length - 2] : uriPieces[uriPieces.Length - 1];

                result.Add(new Sitemap()
                {
                    Name = name.ToCapitalCase(),
                    Url = node.InnerText,
                    LastUpdate = DateTime.Now
                });
            }

            return result;
        }
    }
}
