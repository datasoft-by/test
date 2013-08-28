using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;

namespace ArtumDesignLab.Utils
{
    public static class MailConfig
    {
        public static string GetSiteAddress()
        {
            return ConfigurationManager.AppSettings["SiteAddress"].ToString();
        }
        public static string GetSMTP()
        {
            return ConfigurationManager.AppSettings["SmtpServer"].ToString();
        }
        public static string GetUserLogin()
        {
            return ConfigurationManager.AppSettings["MailLogin"].ToString();
        }
        public static string GetUserPassword()
        {
            return ConfigurationManager.AppSettings["MailPassword"].ToString();
        }
        public static string GetFromAddress()
        {
            return ConfigurationManager.AppSettings["FromAddress"].ToString();
        }
        public static string[] GetMailListForSend()
        {
            return ConfigurationManager.AppSettings["MailList"].ToString().Split(',');
        }
    }
}
