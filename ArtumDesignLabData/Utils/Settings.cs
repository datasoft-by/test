using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Text.RegularExpressions;

namespace ArtumDesignLab.Utils
{
    public static class Settings
    {
        public static bool EnableUrlRewrite
        {
            get { return bool.Parse(ConfigurationManager.AppSettings["EnableUrlRewrite"]); }
        }

        public static string CustomDataTagName
        {
            get { return ConfigurationManager.AppSettings["CustomDataTagName"]; }
        }

        public static bool CustomErrorPages
        {
            get { return bool.Parse(ConfigurationManager.AppSettings["CustomErrorPages"]); }
        }

        public static string ImagesTemp
        {
            get { return ConfigurationManager.AppSettings["ImagesTemp"]; }
        }

        public static string BlogImagesFullSize
        {
            get { return ConfigurationManager.AppSettings["BlogImagesFullSize"]; }
        }

        public static string BlogImagesThumbsSmall
        {
            get { return ConfigurationManager.AppSettings["BlogImagesThumbsSmall"]; }
        }

        public static string BlogImagesThumbsMedium
        {
            get { return ConfigurationManager.AppSettings["BlogImagesThumbsMedium"]; }
        }

        public static string NewsImagesThumbs
        {
            get { return ConfigurationManager.AppSettings["NewsImagesThumbs"]; }
        }
        public static string NewsImagesFull
        {
            get { return ConfigurationManager.AppSettings["NewsImagesFull"]; }
        }

        public static string PortfolioImagesFullSize
        {
            get { return ConfigurationManager.AppSettings["PortfolioImagesThumbsFullSize"]; }
        }

        public static string PortfolioImagesThumbsMedium
        {
            get { return ConfigurationManager.AppSettings["PortfolioImagesThumbsMedium"]; }
        }

        public static string PortfolioImagesThumbsSmall
        {
            get { return ConfigurationManager.AppSettings["PortfolioImagesThumbsSmall"]; }
        }

        public static string WorksImagesFullSize
        {
            get { return ConfigurationManager.AppSettings["WorksImagesFullSize"]; }
        }

        public static string WorksImagesThumbsMedium
        {
            get { return ConfigurationManager.AppSettings["WorksImagesThumbsMedium"]; }
        }

        public static string WorksImagesThumbsSmall
        {
            get { return ConfigurationManager.AppSettings["WorksImagesThumbsSmall"]; }
        }

        public static string PersonalImages
        {
            get { return ConfigurationManager.AppSettings["PersonalImages"]; }
        }

        public static string WatermarkPath
        {
            get { return ConfigurationManager.AppSettings["WatermarkPath"]; }
        }

        public static string ResponcesImagesThumbs
        {
            get { return ConfigurationManager.AppSettings["ResponcesImagesSmall"]; }
        }

        public static string XmlLeadsServerUrl
        {
            get { return ConfigurationManager.AppSettings["XmlLeadsServerUrl"]; }
        }

        public static string XmlLeadsProjectCode
        {
            get { return ConfigurationManager.AppSettings["XmlLeadsProjectCode"]; }
        }

        public static string RobokassaUrl
        {
            get { return ConfigurationManager.AppSettings["RobokassaUrl"]; }
        }

        public static string RobokassaLogin
        {
            get { return ConfigurationManager.AppSettings["RobokassaLogin"]; }
        }

        public static string RobokassaPassword1
        {
            get { return ConfigurationManager.AppSettings["RobokassaPassword1"]; }
        }

        public static string RobokassaPassword2
        {
            get { return ConfigurationManager.AppSettings["RobokassaPassword2"]; }
        }
    }
}
