using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

using OpenLibrary.ViewModel;
using OpenLibrary.ViewModel.ControlViewModel;
using OpenLibrary.ViewModel.Web;

namespace OpenLibrary.View.ItemTemplateSelector
{
    public class TabControlItemTemplateSelector : DataTemplateSelector
    {
        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            var tabItemViewModel = item as TabItemViewModel;

            if (tabItemViewModel == null)
                throw new ArgumentException("Invalid data context for TabItem:  TabControlItemTemplateSelector");

            // Libraries -> Web Services
            if (tabItemViewModel.Data is IEnumerable<LibraryViewModel>)
                return Application.Current.Resources["WebServiceViewTabControlItemTemplate"] as DataTemplate;

            // Web Crawlers
            else if (tabItemViewModel.Data is IEnumerable<SitemapCrawlerViewModel>)
                return Application.Current.Resources["WebCrawlerViewTabControlItemTemplate"] as DataTemplate;

            // Web Endpoint
            else if (tabItemViewModel.Data is WebServiceEndpointViewModel)
                return Application.Current.Resources["WebServiceEndpointViewTabControlItemTemplate"] as DataTemplate;

            else if (tabItemViewModel.Data is WebServiceResponseViewModel)
                return Application.Current.Resources["WebServiceResponseViewTabControlItemTemplate"] as DataTemplate;

            else
                throw new Exception("Unhandled TabItemViewModel.Data type:  " + tabItemViewModel.Data.GetType().ToString());
        }
    }
}
