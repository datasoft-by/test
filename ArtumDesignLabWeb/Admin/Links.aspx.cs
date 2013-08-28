using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using System.IO;
using System.Drawing;
using ArtumDesignLab.Utils;
using DevExpress.Web.ASPxUploadControl;
using System.Drawing.Imaging;
using ArtumDesignLab;
using HtmlAgilityPack;

public partial class Admin_Links : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ConvertLinks();
        }
    }

    private void ConvertLinks()
    {
        StringBuilder output = new StringBuilder();

        BlogEntity blogEntity = new BlogEntity();
        var blogs = blogEntity.GetList();

        foreach (var blog in blogs)
        {
            output.AppendFormat("<h2>{0}</h2>", blog.Header);

            string text = blog.Text;

            HtmlDocument doc = new HtmlDocument();
            doc.LoadHtml(text);

            var anchors = doc.DocumentNode.SelectNodes("//a");

            foreach (var anchor in anchors)
            {
                if (anchor.Attributes["href"] != null)
                {
                    string href = anchor.Attributes["href"].Value;

                    if (href.IndexOf("mailto") >= 0)
                        continue;

                    Uri uri = new Uri(href.Replace("&amp;", "&"), UriKind.RelativeOrAbsolute);
                    HttpRequest request = new HttpRequest("", uri.AbsoluteUri, uri.Query.Replace("?", ""));

                    if (request.FilePath.ToLower() == "/blog")
                    {
                        int id = int.Parse(request.Params["id"]);

                        Blog b = blogEntity.GetById(id);
                        if (b != null)
                        {
                            anchor.Attributes["href"].Value = "http://www.artumstudio.ru/blog/" + b.Url;

                            output.AppendFormat("{0} -> {1}<br />", href, anchor.Attributes["href"].Value);
                        }
                    }
                    else if (request.FilePath.ToLower() == "/portfolio")
                    {
                        int id, catId;

                        if (int.TryParse(request.Params["id"], out id) && int.TryParse(request.Params["cat"], out catId))
                        {
                            var prCat = new ProjectCategoryEntity().GetCategoryByID(catId);
                            var pr = new ProjectEntity().GetById(id);

                            if (prCat != null && pr != null)
                            {
                                anchor.Attributes["href"].Value = string.Format("http://www.artumstudio.ru/portfolio/{0}/{1}", prCat.Url, pr.Url);

                                output.AppendFormat("{0} -> {1}<br />", href, anchor.Attributes["href"].Value);
                            }
                        }
                        else if (int.TryParse(request.Params["cat"], out catId))
                        {
                            var prCat = new ProjectCategoryEntity().GetCategoryByID(catId);

                            if (prCat != null)
                            {
                                anchor.Attributes["href"].Value = string.Format("http://www.artumstudio.ru/portfolio/{0}", prCat.Url);

                                output.AppendFormat("{0} -> {1}<br />", href, anchor.Attributes["href"].Value);
                            }
                        }
                    }  
                }
            }

            ltrOutput.Text = output.ToString();
        }
    }
}