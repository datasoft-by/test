using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ArtumDesignLab.Data
{
    public static class DatabaseEngine
    {
        public static SiteDataContext SiteDataContext
        {
            get
            {
                return new SiteDataContext();
            }
        }
    }
}
