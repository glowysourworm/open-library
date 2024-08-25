using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

using OpenLibrary.ViewModel.Web;

using WpfCustomUtilities.Extensions.Collection;

namespace OpenLibrary.Converter.Web
{
    public class WebServiceResolvedUrlConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var viewModel = value as WebServiceViewModel;

            if (value == null)
                return Binding.DoNothing;

            var builder = new UriBuilder(viewModel.Endpoint);

            // See ToString()
            var paramStr = viewModel.MandatoryParameters.Join("&", x => x.ToString()) + "&" +
                           viewModel.OptionalParameters.Join("&", y => y.ToString());

            builder.Query = paramStr;

            return builder.ToString();
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
