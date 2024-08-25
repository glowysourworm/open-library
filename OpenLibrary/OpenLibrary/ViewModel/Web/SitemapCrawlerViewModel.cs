
using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel.Web
{
    public class SitemapCrawlerViewModel : ViewModelBase
    {
        string _name;
        int _sitemapQueueCount;
        bool _running;

        public string Name
        {
            get { return _name; }
            set { this.RaiseAndSetIfChanged(ref _name, value); }
        }
        public int SitemapQueueCount
        {
            get { return _sitemapQueueCount; }
            set { this.RaiseAndSetIfChanged(ref _sitemapQueueCount, value); }
        }
        public bool Running
        {
            get { return _running; }
            set { this.RaiseAndSetIfChanged(ref _running, value); }
        }

        public SitemapCrawlerViewModel()
        {
            this.Name = "Sitemap Crawler";
            this.SitemapQueueCount = 0;
            this.Running = false;
        }
    }
}
