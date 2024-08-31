namespace OpenLibrary.Service.Web.Crawler
{
    public enum CrawlerBehavior
    {
        /// <summary>
        /// Crawler executes service list a single time, and provides results, using
        /// IWebService single behaviors, for individual requests.
        /// </summary>
        Default = 0,

        /// <summary>
        /// Crawler executes service list periodically, regardless of results, provides
        /// results, using IWebService single behaviors, for individual requests.
        /// </summary>
        PeriodicRetry = 1,

        /// <summary>
        /// Crawler executes service list periodically, pruning services that result in 
        /// success, provides results, using IWebService single behaviors, for individual
        /// requests.
        /// </summary>
        PeriodicRetryToPrune = 2
    }
}
