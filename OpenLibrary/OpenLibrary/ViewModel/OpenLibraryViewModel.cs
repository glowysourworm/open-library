using System.Collections.ObjectModel;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel
{
    public class OpenLibraryViewModel : ViewModelBase
    {
        public ObservableCollection<SitemapCrawlerViewModel> Crawlers { get; set; }
        public ObservableCollection<LogMessageViewModel> LogMessages { get; set; }

        public OpenLibraryViewModel()
        {
            this.Crawlers = new ObservableCollection<SitemapCrawlerViewModel>();
            this.LogMessages = new ObservableCollection<LogMessageViewModel>();
        }
    }
}
