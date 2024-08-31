using System;
using System.Collections.Generic;

using AgileObjects.AgileMapper;

using OpenLibrary.Service.ControllerMessage;
using OpenLibrary.Service.Web;

using WpfCustomUtilities.Extensions.Collection;

namespace OpenLibrary.Service.Controller.ControllerTask
{
    internal class WebRequestBackendTask : BackendTask
    {
        internal UrlWebServiceRequest Request { get; }
        internal UrlWebServiceResponse Response { get; private set; }

        internal WebRequestBackendTask(int id, BackendServiceErrorPolicy errorPolicy, int endpointId, string requestUrl, string method, int timeoutMilliseconds) : base(id, errorPolicy)
        {
            this.Request = new UrlWebServiceRequest(endpointId, method, requestUrl, timeoutMilliseconds);

            this.Request.UpdateEvent += OnRequestUpdate;
        }

        internal WebRequestBackendTask(WebRequestBackendTask copy) : base(copy)
        {
            this.Request = new UrlWebServiceRequest(copy.Request.EndpointId, copy.Request.Method, copy.Request.Url, copy.Request.TimeoutMilliseconds);
            this.Response = new UrlWebServiceResponse()
            {
                ContentLength = copy?.Response?.ContentLength ?? 0,
                ContentType = copy?.Response?.ContentType ?? "",
                Headers = copy?.Response?.Headers?.ToSimpleDictionary(x => x.Key, x => x.Value),
                Payload = copy?.Response?.Payload ?? "",
                RequestUri = copy?.Response?.RequestUri != null ? Mapper.Map<Uri>(copy.Response.RequestUri).ToANew<Uri>() : null,
                ResponseUri = copy?.Response?.ResponseUri != null ? Mapper.Map<Uri>(copy.Response.ResponseUri).ToANew<Uri>() : null
            };
        }

        internal override void Run()
        {
            try
            {
                SetBegin(new LogMessage(this.Id, "Beginning Web Request Task:  " + this.Id));

                this.Response = this.Request.Run();

                SetCompleted(new LogMessage(this.Id, "Web Request Task Complete:  " + this.Id));
            }
            catch (Exception exception)
            {
                SetError(new LogMessage(this.Id, exception.Message, exception), true);
            }
        }

        private void OnRequestUpdate(WebRequestProcessState state, LogMessageType logType, LogMessageSeverity logSeverity, Exception exception)
        {
            if (logSeverity == LogMessageSeverity.Error || exception != null)
                SetError(new LogMessage(this.Id, CreateMessage(state, logType), exception, logType), true);

            switch (state)
            {
                case WebRequestProcessState.BeforeRequest:
                case WebRequestProcessState.DuringRequest:
                case WebRequestProcessState.ParsingResponse:
                case WebRequestProcessState.FormattingResponse:
                case WebRequestProcessState.ClosingConnection:
                    AddLog(new LogMessage(this.Id, CreateMessage(state, logType)), false);
                    break;
                default:
                    throw new Exception("Unhandled WebRequestProcessState:  WebRequestBackendTask.OnRequestUpdate");
            }
        }

        private string CreateMessage(WebRequestProcessState state, LogMessageType logType)
        {
            switch (state)
            {
                case WebRequestProcessState.BeforeRequest:
                    switch (logType)
                    {
                        case LogMessageType.System:
                            return "System message before web request";
                        case LogMessageType.UrlRequest:
                            return "Web service message before web request";
                        case LogMessageType.RemoteSystem:
                        default:
                            throw new Exception("Unhandled WebRequestProcessState:  WebRequestBackendTask.CreateMessage");
                    }
                case WebRequestProcessState.DuringRequest:
                    switch (logType)
                    {
                        case LogMessageType.System:
                            return "System message during web request";
                        case LogMessageType.UrlRequest:
                            return "Web service message during web request";
                        case LogMessageType.RemoteSystem:
                        default:
                            throw new Exception("Unhandled WebRequestProcessState:  WebRequestBackendTask.CreateMessage");
                    }
                case WebRequestProcessState.ParsingResponse:
                    switch (logType)
                    {
                        case LogMessageType.System:
                            return "System message pasring web response";
                        case LogMessageType.UrlRequest:
                            return "Web service message parsing web response";
                        case LogMessageType.RemoteSystem:
                        default:
                            throw new Exception("Unhandled WebRequestProcessState:  WebRequestBackendTask.CreateMessage");
                    }
                case WebRequestProcessState.FormattingResponse:
                    switch (logType)
                    {
                        case LogMessageType.System:
                            return "System message formatting web response";
                        case LogMessageType.UrlRequest:
                            return "Web service message formatting web response";
                        case LogMessageType.RemoteSystem:
                        default:
                            throw new Exception("Unhandled WebRequestProcessState:  WebRequestBackendTask.CreateMessage");
                    }
                case WebRequestProcessState.ClosingConnection:
                    switch (logType)
                    {
                        case LogMessageType.System:
                            return "System message closing web connection";
                        case LogMessageType.UrlRequest:
                            return "Web service message closing web connection";
                        case LogMessageType.RemoteSystem:
                        default:
                            throw new Exception("Unhandled WebRequestProcessState:  WebRequestBackendTask.CreateMessage");
                    }
                default:
                    throw new Exception("Unhandled WebRequestProcessState:  WebRequestBackendTask.CreateMessage");
            }
        }

        public override void Dispose()
        {
            if (this.Request != null)
            {
                this.Request.UpdateEvent -= OnRequestUpdate;
            }

            base.Dispose();
        }
    }
}
