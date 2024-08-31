using System.Linq;

using OpenLibrary.Data;
using OpenLibrary.Service.ControllerMessage;
using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions.ObservableCollection;

namespace OpenLibrary.ViewModel
{
    public static class ViewModelMapper
    {
        public static LibraryViewModel MapLibrary(Library entity)
        {
            var result = new LibraryViewModel()
            {
                LibraryName = entity.Name
            };

            result.WebServices.AddRange(entity.WebServices.Select(x => MapWebService(x)));

            return result;
        }

        public static WebServiceViewModel MapWebService(WebService entity)
        {
            var result = new WebServiceViewModel()
            {
                Description = entity.Description,
                Id = entity.Id,
                Name = entity.Name,
                ReferenceUrl = entity.ReferenceUrl,
                SubSystem = entity.Subsystem,
                System = entity.System
            };

            result.Endpoints.AddRange(entity.WebServiceEndpoints.Select(x => MapWebServiceEndpoint(x)));

            return result;
        }

        public static WebServiceEndpointViewModel MapWebServiceEndpoint(WebServiceEndpoint entity)
        {
            var result = new WebServiceEndpointViewModel()
            {
                Description = entity.Description,
                Endpoint = entity.Endpoint,
                Id = entity.Id,
                Name = entity.Name,
                ReferenceUrl = entity.ReferenceUrl,
                SslRequired = entity.SSLRequired
            };

            result.MandatoryParameters.AddRange(entity.WebServiceParameters.Where(x => x.Required).Select(x => MapWebServiceParameter(x)));
            result.OptionalParameters.AddRange(entity.WebServiceParameters.Where(x => !x.Required).Select(x => MapWebServiceParameter(x)));
            result.Tasks.AddRange(entity.WebServiceEndpointUrlRequestTasks.Select(x => MapWebServiceEndpointTask(x)));

            return result;
        }

        public static WebServiceEndpointTaskViewModel MapWebServiceEndpointTask(WebServiceEndpointUrlRequestTask entity)
        {
            var result = new WebServiceEndpointTaskViewModel()
            {
                Description = entity.Description,
                EndpointId = entity.WebServiceEndpointId,
                Host = entity.Host,
                Id = entity.Id,
                Method = entity.Method,
                Name = entity.Name,
                RequestUrl = entity.RequestUrl,
                RequestUrlTokenized = entity.RequestUrlTokenized,
                TimeoutMilliseconds = entity.TimeoutMilliseconds
            };

            result.TaskEvents.AddRange(entity.WebServiceEndpointTaskEvents.Select(x => MapWebServiceEndpointTaskEvent(x)));

            return result;
        }

        public static WebServiceEndpointTaskEventViewModel MapWebServiceEndpointTaskEvent(WebServiceEndpointTaskEvent entity)
        {
            return new WebServiceEndpointTaskEventViewModel()
            {
                EndpointTaskId = entity.WebServiceEndpointUrlRequestTaskId,
                Id = entity.Id,
                IsError = entity.WebServiceEndpointUrlRequestTask.WebServiceEndpointTaskEvents.Any(x => x.IsError),
                Log = new LogMessageViewModel()
                {
                    ExceptionDetail = entity.LogExceptionDetail,
                    ExceptionMessage = entity.LogExceptionMessage,
                    InnerExceptionDetail = entity.LogInnerExceptionDetail,
                    InnerExceptionMessage = entity.LogInnerExceptionMessage,
                    Message = entity.LogMessage,
                    MessageType = (LogMessageType)entity.LogMessageType,
                    Severity = (LogMessageSeverity)entity.LogSeverity,
                    Timestamp = entity.Time
                },
                TaskStatus = (BackendTaskStatus)entity.TaskStatus,
                Time = entity.Time
            };
        }

        public static WebServiceParameterViewModel MapWebServiceParameter(WebServiceParameter entity)
        {
            var result = new WebServiceParameterViewModel()
            {
                ArrayParameter = entity.ArrayParameter,
                CommaDelimited = entity.CommaDelimited,
                DefaultValue = entity.DefaultValue,
                Description = entity.Description,
                Name = entity.Name,
                UseParameter = entity.Required,
                Value = entity.DefaultValue
            };

            result.ParameterSettings.AddRange(entity.WebServiceParameterSettings.Select(x => MapWebServiceParameterSetting(x)));

            return result;
        }

        public static WebServiceParameterSettingViewModel MapWebServiceParameterSetting(WebServiceParameterSetting entity)
        {
            return new WebServiceParameterSettingViewModel()
            {
                Explanation = entity.Explanation,
                PossibleValue = entity.PossibleValue
            };
        }
    }
}
