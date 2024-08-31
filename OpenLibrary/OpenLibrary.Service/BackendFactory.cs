using System.Collections.Generic;

using OpenLibrary.Data;
using OpenLibrary.Service.Controller;
using OpenLibrary.Service.Controller.Interface;

namespace OpenLibrary.Service
{
    public static class BackendFactory
    {
        public static IBackendController Create()
        {
            return new BackendController();
        }
    }
}
