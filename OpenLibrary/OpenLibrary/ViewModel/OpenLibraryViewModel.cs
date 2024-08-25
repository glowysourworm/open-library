using System.Collections.ObjectModel;

using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions;

namespace OpenLibrary.ViewModel
{
    public class OpenLibraryViewModel : ViewModelBase
    {
        public LibraryOfCongressViewModel LibraryOfCongress { get; set; }

        public ObservableCollection<SitemapCrawlerViewModel> Crawlers { get; set; }
        public ObservableCollection<LogMessageViewModel> LogMessages { get; set; }

        public OpenLibraryViewModel()
        {
            this.Crawlers = new ObservableCollection<SitemapCrawlerViewModel>();
            this.LogMessages = new ObservableCollection<LogMessageViewModel>();
            this.LibraryOfCongress = new LibraryOfCongressViewModel();
        }
    }
}
