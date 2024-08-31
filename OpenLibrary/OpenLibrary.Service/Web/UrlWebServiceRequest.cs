using System;
using System.IO;
using System.Net;
using System.Text;
using System.Web.UI;
using System.Xml;
using System.Xml.Linq;

using Newtonsoft.Json;

using OpenLibrary.Service.ControllerMessage;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Service.Web
{
    public class UrlWebServiceRequest
    {
        public int EndpointId { get; }
        public string Method { get; }
        public string Url { get; }
        public int TimeoutMilliseconds { get; }

        public event SimpleEventHandler<WebRequestProcessState, LogMessageType, LogMessageSeverity, Exception> UpdateEvent;

        public UrlWebServiceRequest(int endpointId, string method, string url, int timeoutMilliseconds)
        {
            this.EndpointId = endpointId;
            this.Method = method;
            this.Url = url;
            this.TimeoutMilliseconds = timeoutMilliseconds;
        }

        public UrlWebServiceResponse Run()
        {
            var state = WebRequestProcessState.BeforeRequest;

            try
            {
                // Log - Before Request
                RaiseUpdateEvent(state, LogMessageType.UrlRequest, LogMessageSeverity.Info, null);

                // Create Request
                var request = HttpWebRequest.Create(this.Url);

                // Request parameters
                request.Timeout = this.TimeoutMilliseconds;
                request.Method = this.Method;

                var prettyPrintPayload = "";

                // Log - During Request
                state = WebRequestProcessState.DuringRequest;
                RaiseUpdateEvent(state, LogMessageType.UrlRequest, LogMessageSeverity.Info, null);

                using (var response = (HttpWebResponse)request.GetResponse())
                {
                    // Check status code
                    if (IsRemoteError(response.StatusCode))
                    {
                        RaiseUpdateEvent(state, LogMessageType.RemoteSystem, LogMessageSeverity.Error, null);
                    }

                    // Log - During Request
                    state = WebRequestProcessState.ParsingResponse;
                    RaiseUpdateEvent(state, LogMessageType.UrlRequest, LogMessageSeverity.Info, null);

                    using (var reader = new StreamReader(response.GetResponseStream()))
                    {
                        // Log - During Request
                        state = WebRequestProcessState.FormattingResponse;
                        RaiseUpdateEvent(state, LogMessageType.UrlRequest, LogMessageSeverity.Info, null);

                        // Pretty Print
                        switch (response.ContentType)
                        {
                            case ServiceConstants.JsonMimeType:
                            {
                                prettyPrintPayload = JsonPrettify(reader.ReadToEnd());
                            }
                            break;
                            case ServiceConstants.XmlMimeType:
                            {
                                prettyPrintPayload = XmlPrettify(reader.ReadToEnd());
                            }
                            break;
                            case ServiceConstants.HtmlMimeType:
                            {
                                prettyPrintPayload = HtmlPrettify(reader.ReadToEnd());
                            }
                            break;
                            default:
                                throw new Exception("Unhandled Web Service Response mime/type:  " + response.ContentType);
                        }
                    }

                    // Log - During Request
                    state = WebRequestProcessState.ClosingConnection;
                    RaiseUpdateEvent(state, LogMessageType.UrlRequest, LogMessageSeverity.Info, null);

                    response.Close();

                    return new UrlWebServiceResponse(this.Url, response, prettyPrintPayload);
                }
            }
            catch (Exception exception)
            {
                RaiseUpdateEvent(state, LogMessageType.System, LogMessageSeverity.Error, exception);
                throw exception;
            }
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

        private void RaiseUpdateEvent(WebRequestProcessState state, LogMessageType logType, LogMessageSeverity logSeverity, Exception exception)
        {
            if (this.UpdateEvent != null)
                this.UpdateEvent(state, logType, logSeverity, exception);
        }

        private bool IsRemoteError(HttpStatusCode httpStatusCode)
        {
            switch (httpStatusCode)
            {
                case HttpStatusCode.Continue:
                case HttpStatusCode.SwitchingProtocols:
                case HttpStatusCode.OK:
                case HttpStatusCode.Created:
                case HttpStatusCode.Accepted:
                case HttpStatusCode.NonAuthoritativeInformation:
                case HttpStatusCode.NoContent:
                case HttpStatusCode.ResetContent:
                case HttpStatusCode.PartialContent:
                case HttpStatusCode.MultipleChoices:
                //case HttpStatusCode.Ambiguous:  (300)
                case HttpStatusCode.MovedPermanently:
                //case HttpStatusCode.Moved: (301)
                case HttpStatusCode.Found:
                //case HttpStatusCode.Redirect: (302)
                case HttpStatusCode.SeeOther:
                //case HttpStatusCode.RedirectMethod: (303)
                case HttpStatusCode.NotModified:
                case HttpStatusCode.UseProxy:
                case HttpStatusCode.Unused:
                case HttpStatusCode.TemporaryRedirect:
                //case HttpStatusCode.RedirectKeepVerb: (307)
                    return false;
                case HttpStatusCode.BadRequest:
                case HttpStatusCode.Unauthorized:
                case HttpStatusCode.PaymentRequired:
                case HttpStatusCode.Forbidden:
                case HttpStatusCode.NotFound:
                case HttpStatusCode.MethodNotAllowed:
                case HttpStatusCode.NotAcceptable:
                case HttpStatusCode.ProxyAuthenticationRequired:
                case HttpStatusCode.RequestTimeout:
                case HttpStatusCode.Conflict:
                case HttpStatusCode.Gone:
                case HttpStatusCode.LengthRequired:
                case HttpStatusCode.PreconditionFailed:
                case HttpStatusCode.RequestEntityTooLarge:
                case HttpStatusCode.RequestUriTooLong:
                case HttpStatusCode.UnsupportedMediaType:
                case HttpStatusCode.RequestedRangeNotSatisfiable:
                case HttpStatusCode.ExpectationFailed:
                case HttpStatusCode.UpgradeRequired:
                case HttpStatusCode.InternalServerError:
                case HttpStatusCode.NotImplemented:
                case HttpStatusCode.BadGateway:
                case HttpStatusCode.ServiceUnavailable:
                case HttpStatusCode.GatewayTimeout:
                case HttpStatusCode.HttpVersionNotSupported:
                    return true;
                default:
                    throw new Exception("Unhandled Http Status Code:  UrlWebServiceRequest.IsRemoteError");
            }
        }
    }
}
