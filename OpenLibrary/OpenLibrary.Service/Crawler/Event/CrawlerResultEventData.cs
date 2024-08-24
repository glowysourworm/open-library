using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenLibrary.Service.Crawler.Event
{
    public class CrawlerResultEventData<T>
    {
        public T Result { get; set; }
        public object Tag { get; set; }
        public bool Error { get; set; }
    }
}
