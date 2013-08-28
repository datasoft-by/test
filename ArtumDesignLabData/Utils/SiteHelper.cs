using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Configuration;
using HtmlAgilityPack;
using System.Text.RegularExpressions;
using ArtumDesignLab.Biz;

namespace ArtumDesignLab.Utils
{
    public static class SiteHelper
    {
        public static string GenerateMontnNameBasedDateTimeString(object objDateTime)
        {
            DateTime dt = new DateTime();
            DateTime.TryParse(objDateTime.ToString(), out dt);
            return DateTimeHelper.GetMonthName(dt.Month) + " " + dt.Year.ToString();
        }

        public static Bitmap CreateThumbnail(HttpPostedFile upFile, int width)
        {
            Bitmap postedFile = new Bitmap(upFile.InputStream, true);

            System.Drawing.Bitmap bmpOut;
            ImageFormat Format = postedFile.RawFormat;
            decimal Ratio;
            int NewWidth;
            int NewHeight;
            //*** If the image is smaller than a thumbnail just return it

            if ((postedFile.Width > postedFile.Height))
            {
                if (width == 500)
                    width = 700;
                Ratio = Convert.ToDecimal(Convert.ToDecimal(width) / Convert.ToDecimal(postedFile.Width));

                NewWidth = width;
                decimal Temp = postedFile.Height * Ratio;
                NewHeight = Convert.ToInt32(Temp);
            }
            else
            {
                Ratio = Convert.ToDecimal(Convert.ToDecimal(width) / Convert.ToDecimal(postedFile.Width));
                NewWidth = width;
                decimal Temp = postedFile.Height * Ratio;
                NewHeight = Convert.ToInt32(Temp);
            }
            bmpOut = new Bitmap(NewWidth, NewHeight);
            Graphics g = Graphics.FromImage(bmpOut);
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
            g.FillRectangle(Brushes.White, 0, 0, NewWidth, NewHeight);
            g.DrawImage(postedFile, 0, 0, NewWidth, NewHeight);
            postedFile.Dispose();
            return bmpOut;
        }
        public static string GetPrm(string sName)
        {
            string sValue;
            sValue = HttpContext.Current.Request.Form[sName] as string;
            if (string.IsNullOrEmpty(sValue))
                sValue = HttpContext.Current.Request.QueryString[sName] as string;
            if (string.IsNullOrEmpty(sValue))
                sValue = String.Empty;
            return sValue;
        }
        public static string CutString(string sName, int iSymbolsCount)
        {
            if (!String.IsNullOrEmpty(sName))
            {
                if (sName.Length > iSymbolsCount - 1)
                    return sName.Substring(0, iSymbolsCount) + "...";
                else
                    return sName;
            }
            else
                return string.Empty;
        }


        /// <summary>
        /// Редиректит на страницу в новом окне
        /// </summary>
        /// <param name="address">Сообщение, которые требуется отобразить</param>
        /// <param name="page">Страница, на которой надо показать сообщение</param>
        public static void RegisterRedirect(string address, System.Web.UI.Page page)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), Guid.NewGuid().ToString(),
                "<script>window.open('" + address + "');</script>");
        }

        public static string GetSiteAddress()
        {
            string address =  ConfigurationManager.AppSettings["SiteAddress"];

            if (string.IsNullOrEmpty(address))
                return string.Empty;

            if (address.EndsWith("/"))
                return address.TrimEnd('/');

            return address;
        }

        public static string GetWebPath(string path)
        {
            string siteAddress = GetSiteAddress();

            if (path.StartsWith("~/"))
                path = VirtualPathUtility.ToAbsolute(path);

            // Enable path rewriting
            if (Settings.EnableUrlRewrite)
                path = path.ToLower().Replace(".aspx", "");

            if (string.IsNullOrEmpty(siteAddress))
                return path;

            if (string.IsNullOrEmpty(path))
                return siteAddress;

            return (siteAddress + "/" + path.TrimStart('/').ToLower());
        }

        public static string StripHTML(string str)
        {
            string strippedString;
            try
            {
                string pattern = "<.*?>";
                strippedString = Regex.Replace(str, pattern, string.Empty);
            }
            catch
            {
                strippedString = string.Empty;
            }
            return strippedString;
        }

        public static string GetPreviewText(string text, int length)
        {
            const string strEnd = "...";

            text = StripHTML(text.TrimEnd(' '));

            if (text.Length > length)
            {
                text = text.Substring(0, length);
                int lastSpacePos = text.LastIndexOf(" ");
                if (lastSpacePos > 0)
                    text = text.Substring(0, lastSpacePos);
            }

            return (text + strEnd);
        }

        public static string GetSentences(string text, int count)
        {
            text = StripHTML(text.TrimEnd(' '));

            int dotPos = 0, nextDotPos = -1;

            for (int i = 0; i < count; i++)
            {
                if (dotPos + 1 < text.Length)
                    nextDotPos = text.IndexOf(".", dotPos + 1);
                else
                    break;

                if (nextDotPos > -1)
                    dotPos = nextDotPos;
                else
                    break;
            }

            if (dotPos > 0)
                return text.Substring(0, dotPos + 1);

            return string.Empty;
        }

        private class Comparer : IEqualityComparer<HtmlNode>
        {
            public bool Equals(HtmlNode x, HtmlNode y)
            {
                return x.Attributes["name"].Value == y.Attributes["name"].Value;
            }
            public int GetHashCode(HtmlNode obj)
            {
                return obj.Attributes["name"].Value.GetHashCode();
            }
        }

        public static string ParseTextWithCustomTag(string text)
        {
            HtmlDocument doc = new HtmlDocument();
            doc.LoadHtml(text);

            CustomDataEntity entity = new CustomDataEntity();

            var tags = doc.DocumentNode.SelectNodes("//" + Settings.CustomDataTagName);

            if (tags != null)
            {
                foreach (HtmlNode tag in tags.Distinct(new Comparer()))
                {                
                    HtmlAttribute name = tag.Attributes["name"];

                    string value = entity.GetValueByName(name.Value);

                    if (!string.IsNullOrEmpty(value))
                    {
                        string singleTag = string.Format("<{0} name=\"{1}\"/>", Settings.CustomDataTagName, name.Value);
                        string singleTagWithSpace = string.Format("<{0} name=\"{1}\" />", Settings.CustomDataTagName, name.Value);

                        text = text.Replace(singleTag, value).Replace(singleTagWithSpace, value);
                    }
                }
            }

            return text;
        }

        public static string GetTeaserClass(int index)
        {
            string cl = "";

            switch (index)
            {
                case 0:
                    cl = "first-teaser";
                    break;
                case 1:
                    cl = "second-teaser";
                    break;
                case 2:
                    cl = "third-teaser";
                    break;
                case 3:
                    cl = "fourth-teaser";
                    break;
            }

            return cl;
        }

        public static string ConvertNameToUrl(string name)
        {
            name = Transliteration.Front(name);

            // Remove non alpha-numeric symbols
            name = Regex.Replace(name, @"[^a-zA-Z0-9\s]", "");

            name = name.Trim().ToLower();

            // Replace spaces with "_"
            return Regex.Replace(name, @"\s+", "_");
        }
        public static string nl2br(string str)
        {
            string ret = str.Replace("\n", "<br />");
            return ret;
        }

        public static string br2nl(string str)
        {
            string ret = str.Replace("<br />", "\n").Replace("<br/>", "\n");
            return ret;
        }
    }
}
