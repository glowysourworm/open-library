namespace OpenLibrary.Service.ControllerMessage
{
    public enum BackendTaskType
    {
        UrlRequest = 0
    }

    public enum BackendControllerStatus
    {
        /// <summary>
        /// Backend dispatcher thread is currently running
        /// </summary>
        Running = 0,

        /// <summary>
        /// Backend dispatcher thread is currently stopped
        /// </summary>
        Stopped = 1,

        /// <summary>
        /// Backend dispatcher thread is stopped with a remote service error, waiting on user
        /// interaction.
        /// </summary>
        StoppedWithError = 2
    }

    public enum BackendDomainStatus
    {
        /// <summary>
        /// No error reports have been issued for this domain
        /// </summary>
        NoReport = 0,

        /// <summary>
        /// Error reports have been issued for this domain
        /// </summary>
        ErrorReport = 1
    }

    public enum BackendServiceErrorPolicy
    {
        /// <summary>
        /// Errors are ignored during task queue execution
        /// </summary>
        LogAndContinue = 0,

        /// <summary>
        /// Errors are reported and task execution delayed until user responds
        /// </summary>
        ReportAndWait = 1
    }

    public enum BackendTaskStatus
    {
        /// <summary>
        /// Task is waiting in the queue.
        /// </summary>
        Queued = 0,

        /// <summary>
        /// Task is currently running
        /// </summary>
        Running = 1,

        /// <summary>
        /// Task was interrupted - see error / message logs
        /// </summary>
        Interrupted = 2,

        /// <summary>
        /// Task has completed successfully
        /// </summary>
        Completed = 3,

        /// <summary>
        /// Task has completed with errors
        /// </summary>
        CompletedWithError = 4
    }

    public enum LogMessageType
    {
        /// <summary>
        /// Message about our (local) system:  Info, Warning, Error
        /// </summary>
        System = 0,

        /// <summary>
        /// Message about a remote request:  Info, Warning, Error
        /// </summary>
        UrlRequest = 1,

        /// <summary>
        /// Message about a remote system. This would indicate that there
        /// is an accompanying response Url with an Http coded message, typically
        /// for a domain issue.
        /// </summary>
        RemoteSystem = 2
    }

    public enum LogMessageSeverity
    {
        Info = 0,
        Warning = 1,

        /// <summary>
        /// Message is either a remote error, or has an accompanying Http error code.
        /// </summary>
        Error = 2
    }
}
