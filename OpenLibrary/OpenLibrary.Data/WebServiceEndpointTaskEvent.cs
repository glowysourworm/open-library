//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OpenLibrary.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class WebServiceEndpointTaskEvent
    {
        public int Id { get; set; }
        public int WebServiceEndpointUrlRequestTaskId { get; set; }
        public int TaskStatus { get; set; }
        public System.DateTime Time { get; set; }
        public bool IsError { get; set; }
        public string LogMessage { get; set; }
        public string LogExceptionMessage { get; set; }
        public string LogExceptionDetail { get; set; }
        public string LogInnerExceptionMessage { get; set; }
        public string LogInnerExceptionDetail { get; set; }
        public int LogMessageType { get; set; }
        public int LogSeverity { get; set; }
    
        public virtual WebServiceEndpointUrlRequestTask WebServiceEndpointUrlRequestTask { get; set; }
    }
}
