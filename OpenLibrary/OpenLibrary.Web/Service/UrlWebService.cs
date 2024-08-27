using System;
using System.IO;
using System.Net;
using System.Text;
using System.Web.UI;
using System.Xml;
using System.Xml.Linq;

using Newtonsoft.Json;

using OpenLibrary.Web.Service.Interface;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Web.Service
{
    public class UrlWebService : IWebService<string>
    {
        public string Endpoint { get; }
        public int RetryMilliseconds { get; }
        public int RetryAttempts { get; private set; }
        public string Payload { get; private set; }
        public event SimpleEventHandler<string> MessageEvent;
        public event SimpleEventHandler<string, Exception> ErrorEvent;

        public UrlWebService(string endpoint, int retryMilliseconds = 3000, int retryAttempts = 1)
        {
            this.Endpoint = endpoint;
            this.RetryMilliseconds = retryMilliseconds;
            this.RetryAttempts = retryAttempts;
        }

        public bool Run(string resolvedUrl)
        {
            OnMessage("Entering Web Request Loop:  {0}", resolvedUrl);

            var error = false;

            while (true)
            {
                if (error)
                {
                    this.RetryAttempts--;

                    if (this.RetryAttempts == 0)
                    {
                        OnMessage("Web Request ERROR:  Retry attempts exhausted");
                        break;
                    }
                    else
                        error = false;
                }

                try
                {
                    var request = HttpWebRequest.Create(resolvedUrl);

                    using (var response = request.GetResponse())
                    {
                        using (var reader = new StreamReader(response.GetResponseStream()))
                        {
                            // Pretty Print
                            switch (response.ContentType)
                            {
                                case ServiceConstants.JsonMimeType:
                                {
                                    this.Payload = JsonPrettify(reader.ReadToEnd());
                                }
                                break;
                                case ServiceConstants.XmlMimeType:
                                {
                                    this.Payload = XmlPrettify(reader.ReadToEnd());
                                }
                                break;
                                case ServiceConstants.HtmlMimeType:
                                {
                                    this.Payload = HtmlPrettify(reader.ReadToEnd());   
                                }
                                break;
                                default:
                                    throw new Exception("Unhandled Web Service Response mime/type:  " + response.ContentType);
                            }
                        }

                        response.Close();
                    }

                    OnMessage("Web Request:  Ending Loop Success!");

                    return true;
                }
                catch (Exception ex)
                {
                    OnError("Web Request ERROR:  {0}", ex, ex.Message);
                    OnMessage("Web Request ERROR:  Attempts Left:  {0}", this.RetryAttempts);

                    error = true;
                }
            }

            return false;
        }

        private string JsonPrettify(string json)
        {
            using (var stringReader = new StringReader(json))
            {
                using (var stringWriter = new StringWriter())
                {
                    var jsonReader = new JsonTextReader(stringReader);
                    var jsonWriter = new JsonTextWriter(stringWriter) { Formatting = Newtonsoft.Json.Formatting.Indented };
                    jsonWriter.WriteToken(jsonReader);
                    return stringWriter.ToString();
                }
            }
        }

        private string XmlPrettify(string xml)
        {
            var document = XDocument.Parse(xml);
            var builder = new StringBuilder();
            var settings = new XmlWriterSettings()
            {
                Indent = true
            };
            settings.Indent = true;

            using (var writer = XmlTextWriter.Create(builder, settings))
            {
                document.WriteTo(writer);
                writer.Flush();
            }

            return builder.ToString();
        }

        private string HtmlPrettify(string html)
        {
            using (var writer = new StringWriter())
            {
                var htmlWriter = new HtmlTextWriter(writer);

                htmlWriter.Write(html);

                return htmlWriter.ToString();
            }
        }

        private void OnMessage(string formatMessage, params object[] parameters)
        {
            if (this.MessageEvent != null)
                this.MessageEvent(string.Format(formatMessage, parameters));
        }

        private void OnError(string formatMessage, Exception ex, params object[] parameters)
        {
            if (this.ErrorEvent != null)
                this.ErrorEvent(string.Format(formatMessage, parameters), ex);
        }
    }
}
