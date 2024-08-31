using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenLibrary.Service.Web
{
    public static class ServiceConstants
    {
        public const string XmlMimeType = "text/xml";
        public const string JsonMimeType = "application/json";
        public const string HtmlMimeType = "text/html";
    }

    public enum WebRequestProcessState
    {
        BeforeRequest = 0,
        DuringRequest = 1,
        ParsingResponse = 2,
        FormattingResponse = 3,
        ClosingConnection = 4
    }
}
