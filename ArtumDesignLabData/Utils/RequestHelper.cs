using System;
//using System.Collections.Generic;
using System.IO;
//using System.Linq;
using System.Net;
using System.Text;
using System.Xml;
using System.Web;
using System.Net.Mail;

namespace ArtumDesignLab.Utils
{
    public class RequestHelper
    {
        public static string SendLead(string type, string source, string keyword, string phone, string name, string info)
        {
            System.Text.StringBuilder postData = new System.Text.StringBuilder();
            postData.AppendFormat("key={0}", HttpUtility.UrlEncode(Settings.XmlLeadsProjectCode));
            postData.AppendFormat("&type={0}", HttpUtility.UrlEncode(type));
            postData.AppendFormat("&source={0}", HttpUtility.UrlEncode(source));
            postData.AppendFormat("&term={0}", HttpUtility.UrlEncode(keyword));
            postData.AppendFormat("&phone={0}", HttpUtility.UrlEncode(phone));
            postData.AppendFormat("&contact={0}", HttpUtility.UrlEncode(name));
            postData.AppendFormat("&info={0}", HttpUtility.UrlEncode(info));
            postData.Append("&options=");
            return RequestHelper.SendPostRequest(Settings.XmlLeadsServerUrl,  postData.ToString());
        }

        public static string SendPostRequest(string url, string postData)
        {
            string response = null;
            try
            {
                HttpWebRequest httpWebRequest = (HttpWebRequest)System.Net.WebRequest.Create(url);
                httpWebRequest.Method = "POST";
                httpWebRequest.ContentType = "application/x-www-form-urlencoded";
                httpWebRequest.ServicePoint.Expect100Continue = false;
                byte[] bytes = Encoding.ASCII.GetBytes(postData);
                httpWebRequest.ContentLength = bytes.Length;
                Stream stream = httpWebRequest.GetRequestStream();
                stream.Write(bytes, 0, bytes.Length);
                stream.Close();
                response = GetWebResponse(httpWebRequest);
            }
            catch (Exception ex)
            {
                try
                {
                    MailSender mail = new MailSender();
                    mail.Message.To.Add(new MailAddress("datasoft.by@gmail.com"));
                    mail.Message.From = new MailAddress(MailConfig.GetFromAddress());
                    mail.Message.Subject = "Lead response error";
                    mail.Message.IsBodyHtml = true;

                    mail.Message.Body = ex.Message + "<br />" + ex.StackTrace;
                    mail.SendMail();
                }
                catch (Exception /*ex*/) { }
            }


            return response;
        }

        private static string GetWebResponse(HttpWebRequest webRequest)
        {
            using (WebResponse webResponse = webRequest.GetResponse())
            {
                Stream responseStream = webResponse.GetResponseStream();
                if (responseStream == null)
                    return null;

                using (var responseReader = new StreamReader(responseStream, Encoding.GetEncoding("windows-1251")))
                {
                    return responseReader.ReadToEnd();
                }
            }
        }

    }
}
