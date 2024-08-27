using System;
using System.IO;
using System.Net;

using OpenLibrary.Web.Service.Interface;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Web.Service
{
    public class UrlWebService : IWebService<string>
    {
        public string Name { get; }
        public int RetryMilliseconds { get; }
        public int RetryAttempts { get; private set; }
        public string Payload { get; private set; }
        public event SimpleEventHandler<string> MessageEvent;
        public event SimpleEventHandler<string, Exception> ErrorEvent;

        public UrlWebService(string name, int retryMilliseconds = 3000, int retryAttempts = 1)
        {
            this.Name = name;
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
                            this.Payload = reader.ReadToEnd();
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
