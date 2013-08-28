using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestLeadsPhone : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["SearchType"] = null;
            Session["CityForTest"] = null;
        }

        string siteUrl = "http://localhost:37777";//ArtumDesignLab.Utils.SiteHelper.GetSiteAddress();
        ddlRequests.Items.Clear();
        ddlRequests.Items.Add(new ListItem("Yandex.Direct", siteUrl + "?leadsource=yandex-direct"));
        ddlRequests.Items.Add(new ListItem("Google.Adwords", siteUrl + "?leadsource=google-adwords"));
        ddlRequests.Items.Add(new ListItem("SEO Google", siteUrl + ""));
        ddlRequests.Items.Add(new ListItem("Seo Yandex", siteUrl + ""));
        ddlRequests.Items.Add(new ListItem("Referer", siteUrl + ""));
        ddlRequests.Items.Add(new ListItem("N/A", siteUrl + ""));


    }
    protected void btnSend_clck(object sender, EventArgs e)
    {
        string city = ddlCities.SelectedValue;
        string searchType = ddlSource.SelectedValue;
        int type = Int32.Parse(searchType);
        string phone = ArtumDesignLab.Utils.SearchUtils.PhoneBySearchType((ArtumDesignLab.Utils.SearchType)type, city);
        lResult.Text = phone;
    }
    protected void btnRequestSend_clck(object sender, EventArgs e)
    {
        string url = ddlRequests.SelectedValue;
        HttpRequest req = new HttpRequest("", url, "");
        string referrer = ddlReferrers.SelectedValue;
        
        if (referrer == "")
            referrer = null;
        string keyword = null;
        SearchType? searchType = null;//Session["SearchType"] as SearchType?;
        if (searchType == null)
        {
            var context = req.QueryString.Get("leadsource") != null
                ? req.QueryString.Get("leadsource") : String.Empty;
            if (String.IsNullOrEmpty(context))
            {
                if (referrer != null)
                {
                    var host = referrer.ToLower();
                    if (host.Contains("yandex"))
                    {
                        keyword = req.QueryString.Get("text");
                        searchType = SearchType.YandexSearch;
                    }
                    else if (host.Contains("google"))
                    {
                        keyword = req.QueryString.Get("q");
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
                lSearchKeyword.Text = HttpUtility.UrlDecode(keyword);
                lSearchType.Text = searchType.ToString();
            }
            else if (lSearchKeyword.Text == "")
            {
                lSearchKeyword.Text = "";
                if (req.QueryString.Get("keyword") != null)
                    lSearchKeyword.Text = req.QueryString.Get("keyword");
                if (referrer != null)
                {
                    lSearchType.Text = searchType != null ? searchType.ToString() : SearchType.Referer.ToString();
                }
                else
                    lSearchType.Text = searchType != null ? searchType.ToString() : SearchType.Direct.ToString();
            }

            lReferer.Text = referrer != null ? referrer.ToString() : String.Empty;
            lSearchUrl.Text = url;
        }

    }
    private enum SearchType
    {
        Direct = 0,
        GoogleSearch = 1,
        YandexSearch = 2,
        YandexDirect = 3,
        GoogleAdwords = 4,
        Referer = 5
    }
}