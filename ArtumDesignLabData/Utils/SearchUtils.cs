using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Collections.Specialized;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Xml;

namespace ArtumDesignLab.Utils {
    public class SearchUtils {

        public static string PhoneBySearchType(SearchType searchType, string city)
        {
            string phone;
            string settigsKey = "Phone" + searchType.ToString();
            string engCity;
            switch (city)
            {
                case "Санкт-Петербург":
                    engCity = "SanktPetersburg";
                   break;
                case "Москва":
                   engCity = "Moscow";
                    break;
                default:
                    engCity = "";
                  break;
            }

            settigsKey += engCity;
            phone = ConfigurationManager.AppSettings.Get(settigsKey);
            
            if (string.IsNullOrEmpty(phone))
            {
                settigsKey = "PhoneDefault" + engCity;
                phone = ConfigurationManager.AppSettings.Get(settigsKey);
            }

            if (string.IsNullOrEmpty(phone))
            {
                   phone = ConfigurationManager.AppSettings.Get("PhoneRussia8800");
            }

            return phone;
        }

        public static string GetStatisticsInfo(SearchType? searchType, Uri referer, Uri searchUrl, string currentUrl)
        {
            string body = "";

            switch (searchType)
            {
                case SearchType.YandexDirect:
                    {
                        if (referer == null)
                            return body;

                        NameValueCollection searchQueryString = HttpUtility.ParseQueryString(searchUrl.Query);
                        string position;
                        switch (searchQueryString.Get("position_type"))
                        {
                            case "premium":
                                position = "спецразмещение";
                                break;
                            case "other":
                                position = "гарантия";
                                break;
                            default:
                                position = "не на поиске";
                                break;
                        }
                        body = string.Format(adverticementMail,
                            "3 - Яндекс - директ",
                            DateTime.Now.ToString(),
                            position,
                            searchQueryString.Get("position"),
                            searchQueryString.Get("keyword"),
                            currentUrl);
                    }
                    break;
                case SearchType.GoogleAdwords:
                    {
                        if (referer == null)
                            return body;

                        NameValueCollection searchQueryString = HttpUtility.ParseQueryString(searchUrl.Query);
                        string adposition = searchQueryString.Get("adposition");
                        string position = "";
                        if (adposition.Contains("t"))
                            position = "спецразмещение";
                        else if (adposition.Contains("s"))
                            position = "гарантия";
                        else
                            position = "не на поиске";

                        body = string.Format(adverticementMail,
                            "4 - Google Adwords",
                            DateTime.Now.ToString(),
                            position,
                            adposition.Length > 2 ? adposition[3].ToString() : "",
                            searchQueryString.Get("keyword"),
                            currentUrl);
                    }
                    break;
                case SearchType.YandexSearch:
                    if (referer == null)
                        return body;

                    body = string.Format(searchMail,
                            "2 - Яндекс - Поиск",
                            DateTime.Now.ToString(),
                            HttpUtility.ParseQueryString(referer.Query).Get("text"),
                            currentUrl);
                    break;
                case SearchType.GoogleSearch:
                    if (referer == null)
                        return body;
                    body = string.Format(searchMail,
                            "1 - Google Поиск",
                            DateTime.Now.ToString(),
                            HttpUtility.ParseQueryString(referer.Query).Get("q"),
                            currentUrl);
                    break;
                case SearchType.Referer:
                    if (referer == null)
                        return body;
                    body = string.Format(refererMail,
                            "5 - Заход с другого сайта",
                            DateTime.Now.ToString(),
                            referer.ToString(),
                            currentUrl);
                    break;
                case SearchType.Direct:
                    body = string.Format(directMail,
                            "0 - Прямой заход",
                            DateTime.Now.ToString(),
                            currentUrl);
                    break;
            }
             
            return body;
        }

        public static void SendStatisticsEmail(SearchType? searchType, Uri referer, Uri searchUrl, string currentUrl) {
            string body = null;

            switch (searchType) {
                case SearchType.YandexDirect: {
                        if (referer == null)
                            return;

                        NameValueCollection searchQueryString = HttpUtility.ParseQueryString(searchUrl.Query);
                        string position;
                        switch (searchQueryString.Get("position_type")) {
                            case "premium":
                                position = "спецразмещение";
                                break;
                            case "other":
                                position = "гарантия";
                                break;
                            default:
                                position = "не на поиске";
                                break;
                        }
                        body = string.Format(adverticementMail,
                            "3 - Яндекс - директ",
                            DateTime.Now.ToString(),
                            position,
                            searchQueryString.Get("position"),
                            searchQueryString.Get("keyword"),
                            currentUrl);
                    }
                    break;
                case SearchType.GoogleAdwords: {
                        if (referer == null)
                            return;

                        NameValueCollection searchQueryString = HttpUtility.ParseQueryString(searchUrl.Query);
                        string adposition = searchQueryString.Get("adposition");
                        string position = "";
                        if (adposition.Contains("t"))
                            position = "спецразмещение";
                        else if (adposition.Contains("s"))
                            position = "гарантия";
                        else
                            position = "не на поиске";

                        body = string.Format(adverticementMail,
                            "4 - Google Adwords",
                            DateTime.Now.ToString(),
                            position,
                            adposition.Length > 2 ? adposition[3].ToString() : "",
                            searchQueryString.Get("keyword"),
                            currentUrl);
                    }
                    break;
                case SearchType.YandexSearch:
                    if (referer == null)
                        return;

                    body = string.Format(searchMail,
                            "2 - Яндекс - Поиск",
                            DateTime.Now.ToString(),
                            HttpUtility.ParseQueryString(referer.Query).Get("text"),
                            currentUrl);
                    break;
                case SearchType.GoogleSearch:
                    if (referer == null)
                        return;
                    body = string.Format(searchMail,
                            "1 - Google Поиск",
                            DateTime.Now.ToString(),
                            HttpUtility.ParseQueryString(referer.Query).Get("q"),
                            currentUrl);
                    break;
                case SearchType.Referer:
                    if (referer == null)
                        return;
                    body = string.Format(refererMail,
                            "5 - Заход с другого сайта",
                            DateTime.Now.ToString(),
                            referer.ToString(),
                            currentUrl);
                    break;
                case SearchType.Direct:
                    body = string.Format(directMail,
                            "0 - Прямой заход",
                            DateTime.Now.ToString(),
                            currentUrl);
                    break;
            }

            if (string.IsNullOrEmpty(body))
                return;

            try {
                MailSender mail = new MailSender();
                mail.Message.To.Add(new MailAddress(ConfigurationManager.AppSettings.Get("StatisticsEmail")));
                mail.Message.From = new MailAddress(MailConfig.GetFromAddress());
                mail.Message.Subject = "artumstudio.ru: статистика";
                mail.Message.Body = body;
                mail.Message.IsBodyHtml = true;

                mail.SendMail();
            } catch (Exception /*ex*/) { }
        }

        public static string GetSearchTypeAsString(SearchType? searchType)
        {
            string ret = String.Empty;
            switch (searchType)
            {
                case SearchType.YandexDirect:
                    ret = "Яндекс.Директ";
                    break;
                default:
                    ret = searchType != null ? searchType.ToString() : String.Empty; 

                    break;
            }
            return ret;
        }  

        const string adverticementMail = @"<h1>{0}</h1>
<b>Канал</b>: заказ звонка<br />
<b>Дата</b>: {1}<br />
<b>Расположение</b>: {2}<br />
<b>Позиция</b>: {3}<br />
<b>Ключевое слово</b>: {4}<br />
<b>Страница</b>: {5}
";

        const string searchMail = @"<h1>{0}</h1>
<b>Канал</b>: Заказ звонка<br />
<b>Дата</b>: {1}<br />
<b>Ключевое слово</b>: {2}<br />
<b>Страница</b>: {3}
";

        const string directMail = @"<h1>{0}</h1>
<b>Канал</b>: Заказ звонка<br />
<b>Дата</b>: {1}<br />
<b>Страница</b>: {2}
";

        const string refererMail = @"<h1>{0}</h1>
<b>Канал</b>: Заказ звонка<br />
<b>Дата</b>: {1}<br />
<b>Адрес страницы</b>: {2}<br />
<b>Страница</b>: {3}
";

    }

    
    public enum SearchType {
        Direct = 0,
        GoogleSearch = 1,
        YandexSearch = 2,
        YandexDirect = 3,
        GoogleAdwords = 4,
        Referer = 5
    }

}