using System;
using System.IO;
using System.Net;

using OpenLibrary.Service.Web.Interface;

using WpfCustomUtilities.Extensions.Event;

namespace OpenLibrary.Service.Web
{
    public class UrlWebService : IWebService<string>
    {
        public string Url { get; }
        public int RetryMilliseconds { get; }
        public int RetryAttempts { get; private set; }
        public string Payload { get; private set; }
        public event SimpleEventHandler<string> MessageEvent;
        public event SimpleEventHandler<string, Exception> ErrorEvent;

        public UrlWebService(string url, int retryMilliseconds = 3000, int retryAttempts = 1)
        {
            this.Url = url;
            this.RetryMilliseconds = retryMilliseconds;
            this.RetryAttempts = retryAttempts;
        }

        public bool Run()
        {
            OnMessage("{0}:  Entering Web Request Loop:  {1}", DateTime.Now.ToLongTimeString(), this.Url);

            var error = false;

            while (true)
            {
                if (error)
                {
                    this.RetryAttempts--;

                    if (this.RetryAttempts == 0)
                    {
                        OnMessage("{0}:  Web Request:  Ending Loop {1}", DateTime.Now.ToLongTimeString(), "Failure");
                        break;
                    }
                    else
                        error = false;
                }

                try
                {
                    var request = HttpWebRequest.Create(this.Url);

                    using (var response = request.GetResponse())
                    {
                        using (var reader = new StreamReader(response.GetResponseStream()))
                        {
                            this.Payload = reader.ReadToEnd();
                        }

                        response.Close();
                    }

                    OnMessage("{0}:  Web Request:  Ending Loop {1}", DateTime.Now.ToLongTimeString(), "Success!");

                    return true;
                }
                catch (Exception ex)
                {
                    OnError("{0}:  Web Request ERROR:  {1}", ex, DateTime.Now.ToLongTimeString(), ex.Message);
                    OnMessage("{0}:  Web Request ERROR:  Attempts Left:  {1}", DateTime.Now.ToLongTimeString(), this.RetryAttempts);

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
