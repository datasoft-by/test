using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using ArtumDesignLab;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Xml;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Net.Mail;


namespace ArtumDesignLab.UI
{
    public partial class TemplateBase : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadPopularLinks();

            if (Session["IsShowSpecial"] == null)
            {
                if (specialOffer != null) specialOffer.Visible = true;
                if (specialOfferSide != null) specialOfferSide.Visible = false;
                Session["IsShowSpecial"] = 1;
            }
            else 
            {
                if (specialOffer != null) specialOffer.Visible = false;
                if (specialOfferSide != null) specialOfferSide.Visible = true;

            }

            string[] urls = {"http://vekodesign.ru/default.aspx",
                              "http://www.vekodesign.ru/default.aspx",
                              "http://vekodesign.ru/",
                              "http://www.vekodesign.ru",
                              "http://artumstudio.ru/default.aspx",
                              "http://artumstudio.ru/",
                              "http://artumstudio.ru"
                             };

            string requestUrl = Request.Url.ToString().ToLower();

            foreach (string url in urls)
            {
                if (url == requestUrl)
                {
                    Response.StatusCode = 301;
                    Response.AddHeader("Location", SiteHelper.GetSiteAddress());
                    Response.End();
                }
            }

            if (requestUrl.Contains("vekodesign.ru"))
            {
                Response.StatusCode = 301;
                Response.AddHeader("Location", requestUrl.Replace("www.", "").Replace("vekodesign", "www.artumstudio"));
                Response.End();
            }

            // Redirect to www
            if (!Request.Url.Host.StartsWith("www", StringComparison.InvariantCultureIgnoreCase) &&
                !Request.Url.IsLoopback)
            {
                Response.StatusCode = 301;
                Response.AddHeader("Location", requestUrl.Replace("http://", "http://www."));
                Response.End();
            }

                SearchType? searchType = Session["SearchType"] as SearchType?;
                if (searchType == null)
                {
                        string keyword = null;
                        Uri referrer = Request.UrlReferrer;
                        var context = Request.QueryString.Get("leadsource") != null
                            ? Request.QueryString.Get("leadsource") : String.Empty;
                        try
                        {
                            if (String.IsNullOrEmpty(context))
                            {
                                if (referrer != null)
                                {
                                    var queryString = HttpUtility.ParseQueryString(referrer.Query);
                                    var host = referrer.Host.ToLower();
                                    if (host.Contains("yandex"))
                                    {
                                        keyword = queryString["text"];
                                        searchType = SearchType.YandexSearch;
                                    }
                                    else if (host.Contains("google"))
                                    {
                                        keyword = queryString["q"];
                                        searchType = SearchType.GoogleSearch;
                                    }
                                }
                            }
                            else
                            {
                                if (context.Equals("yandex-direct"))
                                    searchType = SearchType.YandexDirect;
                                else if (context.Equals("google-adwords"))
                                    searchType = SearchType.GoogleAdwords;
                            }

                            if (keyword != null && Session["SearchKeyword"] == null)
                            {
                                Session["SearchKeyword"] = HttpUtility.UrlDecode(keyword);
                                if (keyword.Contains("artum") || HttpUtility.UrlDecode(keyword).Contains("артум"))
                                    Session["SearchType"] = SearchType.Direct;
                                else
                                    Session["SearchType"] = searchType;
                            }
                            else if (Session["SearchKeyword"] == null)
                            {
                                Session["SearchKeyword"] = "";
                                if (Request.QueryString.Get("keyword") != null)
                                    Session["SearchKeyword"] = Request.QueryString.Get("keyword");
                                if (referrer != null && !referrer.Host.ToLower().Contains("artumstudio.ru"))
                                {
                                    Session["SearchType"] = searchType != null ? searchType : SearchType.Referer;
                                }
                                else
                                    Session["SearchType"] = searchType != null ? searchType : SearchType.Direct;
                            }

                            Session["Referer"] = referrer;
                            Session["SearchUrl"] = Request.Url;
                        }
                        catch (Exception ex)
                        {
                            try
                            {
                                MailSender mail = new MailSender();
                                mail.Message.To.Add(new MailAddress("datasoft.by@gmail.com"));
                                mail.Message.From = new MailAddress(MailConfig.GetFromAddress());
                                mail.Message.Subject = "Error";
                                mail.Message.IsBodyHtml = true;

                                mail.Message.Body = "referrer = " + (referrer != null ? referrer.ToString() : "null") + "<br />" + ex.Message + "<br />" + ex.InnerException + "<br />" + ex.StackTrace;
                                mail.SendMail();
                            }
                            catch (Exception /*ex*/) { }
                        }

                }

            

            string city = GetCityByIp(Request.UserHostAddress);
         
            Session["ContactPhone"] = SearchUtils.PhoneBySearchType((Session["SearchType"] as SearchType?).Value, city);

            Session["CityToEmail"] = city;

            switch (city)
            {
                 case "Санкт-Петербург":
                    {
                        Session["InCurrentCity"] = "в Санкт-Петербурге";
                        Session["Script"] = "<script type=\"text/javascript\">if(!window.jQuery) {document.write(unescape('<script type=\"text/javascript\" src=\"http://mod.calltouch.ru/js/jquery-1.5.1.min.js\">%3C/script%3E'));}var gaJsHost = ((\"https:\" == document.location.protocol) ? \"https://\" : \"http://\");document.write(unescape(\"%3Cscript src='\" + gaJsHost + \"mod.calltouch.ru/d_client.js?param;ref\")+escape(document.referrer)+\";url\"+escape(document.URL)+\";cook\"+escape(document.cookie)+unescape(\"'type='text/javascript'%3E%3C/script%3E\"));</script><script type=\"text/javascript\">var _gaq = _gaq || [];_gaq.push(['_setAccount', 'UA-39915816-8']);_gaq.push(['_setCustomVar', 1, 'call_value', call_value, 2]);_gaq.push(['_trackPageview']);(function () {var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);})();</script>";
                        

                    } break;
                case "Москва":
                    {
                        Session["InCurrentCity"] = "в Москве и Санкт-Петербурге";
                        Session["Script"] = "<script type=\"text/javascript\">var _gaq = _gaq || [];_gaq.push(['_setAccount', 'UA-39915816-8']);_gaq.push(['_trackPageview']);(function () {var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);})();</script>";

                    } break;
                default:
                    {
                        Session["InCurrentCity"] = "по всей России";
                        Session["Script"] = "<script type=\"text/javascript\">var _gaq = _gaq || [];_gaq.push(['_setAccount', 'UA-39915816-8']);_gaq.push(['_trackPageview']);(function () {var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);})();</script>";

                    } break;
            }
        }
        private void LoadPopularLinks()
        {
            if (hlPopular1 != null && hlPopular2 != null && hlPopular3 != null && hlPopular4 != null)
            {
                var popularUrls = new List<KeyValuePair<string, string>>();
                popularUrls.Add(new KeyValuePair<string, string>("3D дизайн интерьера", "http://www.artumstudio.ru/blog/3d_dizajn_interera"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн дачного дома", "http://www.artumstudio.ru/blog/dizajn_doma_vnutri_ot_studii_artum"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн частного интерьера", "http://www.artumstudio.ru/blog/dizajn_interera_doma"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн деревянного дома", "http://www.artumstudio.ru/blog/dizajn_interera_domov_iz_brusa"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн квартир в петербурге", "http://www.artumstudio.ru/blog/dizajn_krasivyx_kvartir_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн 1 комнатной квартиры", "http://www.artumstudio.ru/blog/dizajn_odnokomnatnoj_kvartiry_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн коттеджа", "http://www.artumstudio.ru/blog/dizajn_proekt_kottedzhej_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн однокомнатной квартиры", "http://www.artumstudio.ru/blog/dizajn_proekt_odnokomnatnoj_kvartiry_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн бара", "http://www.artumstudio.ru/blog/dizajn_proekty_interera_barov_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн интерьера магазина", "http://www.artumstudio.ru/blog/dizajn_proekty_intererov_produktovyx_magazinov_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("внутренний дизайн дома", "http://www.artumstudio.ru/blog/dizajn_zagorodnogo_doma_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн жилых интерьеров", "http://www.artumstudio.ru/blog/dizajn_zhilyx_pomeshhenij_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн интерьера в санкт петербурге", "http://www.artumstudio.ru/blog/luchshie_interery_kvartir_i_domov_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн офисных помещений", "http://www.artumstudio.ru/blog/obustrojstvo_ofisnyx_pomeshhenij"));
                popularUrls.Add(new KeyValuePair<string, string>("услуги дизайн интерьера", "http://www.artumstudio.ru/blog/razrabotka_dizajna_interera_v_sanktpeterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("современный дизайн интерьера", "http://www.artumstudio.ru/blog/sovremennyj_dizajn_interera_v_peterburge"));
                popularUrls.Add(new KeyValuePair<string, string>("создание дизайн проекта", "http://www.artumstudio.ru/blog/sozdanie_dizajn_proekta"));
                popularUrls.Add(new KeyValuePair<string, string>("эскизный дизайн проект", "http://www.artumstudio.ru/blog/tipovoj_dizajn_proekt"));
                popularUrls.Add(new KeyValuePair<string, string>("дизайн фасада загородного дома", "http://www.artumstudio.rublog/dizajn_fasada_doma"));

                int[] numbers = new int[4];
                Random rd = new Random();
                numbers[0] = rd.Next(1, popularUrls.Count);
                for (int i = 1; i < numbers.Length; i++)
                {
                    int number = rd.Next(1, popularUrls.Count);
                    while (numbers.Contains(number))
                    {
                        number = rd.Next(1, popularUrls.Count);
                    }
                    numbers[i] = number;
                }

                hlPopular1.NavigateUrl = popularUrls.ElementAt(numbers[0]).Value;
                hlPopular1.Text = popularUrls.ElementAt(numbers[0]).Key;
                hlPopular2.NavigateUrl = popularUrls.ElementAt(numbers[1]).Value;
                hlPopular2.Text = popularUrls.ElementAt(numbers[1]).Key;
                hlPopular3.NavigateUrl = popularUrls.ElementAt(numbers[2]).Value;
                hlPopular3.Text = popularUrls.ElementAt(numbers[2]).Key;
                hlPopular4.NavigateUrl = popularUrls.ElementAt(numbers[3]).Value;
                hlPopular4.Text = popularUrls.ElementAt(numbers[3]).Key;
            }
        }

        private static string GetCityByIp(string ip)
        {
            string cityName = null;
            try
            {
                HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("http://ipgeobase.ru:7020/geo?ip=" + ip);
                webRequest.Method = "GET";

                string xml = WebResponseGet(webRequest);

                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                cityName = doc.SelectSingleNode("//city").InnerText.Trim();
            }
            catch
            {
                cityName = "";
            }
            return cityName;
        }

        protected static string WebResponseGet(HttpWebRequest webRequest)
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
