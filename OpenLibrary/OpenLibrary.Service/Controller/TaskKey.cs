using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using static OpenLibrary.Service.Controller.BackendController;
using WpfCustomUtilities.RecursiveSerializer.Shared;

namespace OpenLibrary.Service.Controller
{
    internal struct TaskKey
    {
        internal int ServiceId;
        internal int EndpointId;

        internal TaskKey(int serviceId, int endpointId)
        {
            this.ServiceId = serviceId;
            this.EndpointId = endpointId;
        }

        public static TaskKey Create(int serviceId, int endpointId)
        {
            return new TaskKey(serviceId, endpointId);
        }

        public override bool Equals(object obj)
        {
            var domainKey = (TaskKey)obj;

            return this.ServiceId == domainKey.ServiceId &&
                   this.EndpointId == domainKey.EndpointId;
        }
        public override int GetHashCode()
        {
            return RecursiveSerializerHashGenerator.CreateSimpleHash(this.ServiceId, this.EndpointId);
        }
    }
}
