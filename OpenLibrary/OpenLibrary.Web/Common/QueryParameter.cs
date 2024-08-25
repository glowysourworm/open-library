using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenLibrary.Web.Common
{
    public class QueryParameter
    {
        public string Name { get; set; }
        public string Value { get; set; }

        public QueryParameter(string name, string value)
        {
            this.Name = name;
            this.Value = value;
        }

        public override string ToString()
        {
            return (this.Name ?? "q") + "=" + (this.Value ?? "");
        }
    }
}
