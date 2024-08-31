
using OpenLibrary.Data.Interface;

namespace OpenLibrary.Data.Factory
{
    public static class OpenLibararyDataControllerFactory
    {
        public static IOpenLibraryDataController Create(bool autoSave)
        {
            var instance = new OpenLibararyDataController(autoSave);

            // TODO: Configuration

            return instance;
        }
    }
}
