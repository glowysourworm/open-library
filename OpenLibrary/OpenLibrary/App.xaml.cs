using System;
using System.Windows;
using System.Windows.Media;

namespace OpenLibrary
{
    public partial class App : Application
    {
        public App()
        {
            var fontAwesome = new FontFamily(new Uri("pack://application:,,,/OpenLibrary;component/Resource/Font/Font Awesome 6 Free-Solid-900.otf#Font Awesome 6 Free Solid"), "Font Awesome 6 Free Solid");

            this.Resources.Add("FontAwesome", fontAwesome);
        }
    }
}
