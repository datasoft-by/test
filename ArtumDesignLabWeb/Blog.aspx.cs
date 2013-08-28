using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using ArtumDesignLab;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class Blog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mainH1.Visible = true;
            //BindCategories();
            
            LoadPost();

            if (Request["id"] == null)
            {
                BindItems();
                dpgPager.Visible = dpgPager.TotalRowCount > dpgPager.PageSize;
                //callOrder.Visible = false;

            }
            if (Session["CallOrderScript"] == null)
            {
                StringBuilder script = new StringBuilder();
                script.Append("<script type=\"text/javascript\"> $(document).ready(function () {");
                script.Append("setTimeout(function () { $(\"#call_order_link\").click(); }, 20000);  });");
                script.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "callOrderScript", script.ToString());
                Session["CallOrderScript"] = "Yes";
            }
        }
    }

    //private void LoadTeasers(int id)
    //{
    //    BlogTeaserEntity entity = new BlogTeaserEntity();
    //    var list = entity.GetListByBlogID(id).Take(4);

    //    if (list.Count() > 0)
    //    {
    //        divDefaultTeasers.Visible = false;
    //        divCustomTeasers.Visible = true;

    //        rptTeasers.DataSource = list;
    //        rptTeasers.DataBind();
    //    }
    //}

    //private void BindCategories()
    //{
    //    BlogCategoryEntity entity = new BlogCategoryEntity();
    //    rptCategories.DataSource = entity.GetList();
    //    rptCategories.DataBind();
    //}

    private void BindItems()
    {
        int catId = 0;
        if (Request["cat"] != null)
        {
            int.TryParse(Request["cat"], out catId);
        }

        BlogEntity entity = new BlogEntity();
        lvwItems.DataSource = (catId == 0) ? entity.GetList() : entity.GetByCategory(catId);
        lvwItems.DataBind();
    }

    private void LoadPost()
    {
        if (Request["id"] != null)
        {
            int id;
            if (int.TryParse(Request["id"], out id))
            {
                BlogEntity entity = new BlogEntity();
                entity.Read(id);

                if (entity.Entity.BlogID == 0)
                    throw new HttpException(404, "Страница не найдена");

                // Setup links for previous, next controls
                setupPrevNextControls(id);

                postHeader.Text = SiteHelper.ParseTextWithCustomTag(entity.Entity.Header);
                postImage.Src = SiteHelper.GetWebPath(Settings.BlogImagesFullSize) + entity.Entity.Image;
                postText.Text = SiteHelper.ParseTextWithCustomTag(entity.Entity.Text);

                
                    

                if (String.IsNullOrEmpty(entity.Entity.Placeholder))
                {
                    litPlaceholder.Text = entity.Entity.Header;
                    
                    //try
                    //{
                    //    if (entity.Entity.Header.Length > 30)
                    //        litPlaceholder.Text = entity.Entity.Header.Remove(30);

                    //}
                    //catch{ }

                }
                else
                    litPlaceholder.Text = entity.Entity.Placeholder;

                this.Page.Title = entity.Entity.MetaTitle;

                //HtmlMeta meta = new HtmlMeta();
                //meta.Name = "keywords";
                //if (!String.IsNullOrEmpty(entity.Entity.MetaKeywords))
                //{
                //    meta.Content = entity.Entity.MetaKeywords;
                //    this.Header.Controls.Add(meta);
                //}


                //System.Web.UI.HtmlControls.HtmlMeta meta1 = new HtmlMeta();
                //meta1.Name = "description";

                //if (!String.IsNullOrEmpty(entity.Entity.MetaDescription))
                //{
                //    meta1.Content = entity.Entity.MetaDescription;
                //    this.Header.Controls.Add(meta1);
                //}


                //LoadImages(id);

                //LoadQuickLinks(id);

                //LoadTeasers(id);

                pnlBlogList.Visible = false;
                pnlPost.Visible = true;
                mainH1.Visible = false;
            }
        }
        else 
        { 
        ////OurWorks.Visible = false;
       
        ////Portfolio1.Visible = false;
        //// сallOrderSidebar.Visible = false;
        //// contactInfo.Visible = false;

        }
    }

    private void setupPrevNextControls(int id) {
        ArtumDesignLab.Blog prev = null;
        ArtumDesignLab.Blog next = null;
        BlogEntity entity = new BlogEntity();
        var list = entity.GetList().ToList();


        for (int i = 0; i < list.Count; i++) {
            if (list[i].BlogID == id) {
                if (i > 0) {
                    prev = list[i - 1];
                }
                if (i < list.Count - 1) {
                    next = list[i + 1];
                }
                break;
            }
        }

        //lnkProjectsList.HRef = SiteHelper.GetWebPath("~/Portfolio.aspx/") + category.Url;
        lnkBlogsPrev.HRef = (prev == null) ? "#" : SiteHelper.GetWebPath(string.Format("~/BLog.aspx/{0}", prev.Url));
        lnkBlogsNext.HRef = (next == null) ? "#" : SiteHelper.GetWebPath(string.Format("~/BLog.aspx/{0}", next.Url));
        if (prev != null)
        {
            lnkBlogsPrev.Title = prev.Header;
            lnkBlogsPrev.InnerText = prev.Header;
        }
        else
            lnkBlogsPrev.Visible = false;
        
        lnkBlogsNext.Title = next.Header;
        lnkBlogsNext.InnerText = next.Header;
    }

    //private void LoadImages(int id)
    //{
    //    BlogPhotoEntity entity = new BlogPhotoEntity();
    //    IEnumerable<BlogPhoto> list = entity.GetListByBlogID(id);
    //    if (list.ToList().Count > 0)
    //    {
    //        rptImages.DataSource = list;
    //        rptImages.DataBind();
    //        blogPhotosHolder.Visible = true;
    //    }
    //}
    
    private void LoadQuickLinks(int id)
    {
        /* Structure of items
         * 
			<li><a href="#">Дизайн ванной комнаты</a></li>
			<li><a href="#">Дизайн гардеробной комнаты</a></li>
			<li><span>Дизайн гостиной</span>
				<ul class="second-level">
					<li><a href="#">Эклектика</a></li>
					<li><a href="#">Готика</a></li>
					<li><a href="#">Возрождение (Ренессанс)</a></li>
					<li><a href="#">Барокко</a></li>
					<li><a href="#">Рококо</a></li>
					<li><a href="#">Романтизм</a></li>
					<li><a href="#">Минимализм</a></li>
				</ul>
			</li>
         */

        BlogQuickLinkEntity entity = new BlogQuickLinkEntity();
        
        StringBuilder items = new StringBuilder();

        // All links for the post
        IEnumerable<BlogQuickLink> links = entity.GetByBlogPostID(id);

        //if (links.ToList().Count == 0)
        //{
        //    quickLinks.Visible = false;
        //    return;
        //}

        // Link without subitems
        IEnumerable<BlogQuickLink> menuLinks = links.Select(s => s).Where(s => s.SubmenuLinkID == null);

        // Submenu links
        IEnumerable<BlogQuickLink> subLinks = links.Select(s => s).Where(s => s.SubmenuLinkID != null);

        foreach (BlogQuickLink link in menuLinks)
        {
            IEnumerable<BlogQuickLink> subItems = subLinks.Select(s => s).Where(s => s.SubmenuLinkID == link.BlogQuickLinkID);
            if (subItems.ToList().Count < 1)
            {
                items.Append(string.Format("<li><a href=\"{0}\">{1}</a></li>",
                             SiteHelper.GetWebPath(link.URL), link.Title));
            }
            else
            {
                items.Append(string.Format("<li><span>{0}</span><ul class=\"second-level\">", link.Title));

                foreach (BlogQuickLink subLink in subItems)
                {
                    items.Append(string.Format("<li><a href=\"{0}\">{1}</a></li>",
                                 SiteHelper.GetWebPath(subLink.URL), subLink.Title));
                }

                items.Append("</ul></li>");
            }
        }

        //defaultLinks.Visible = false;
        //if (!string.IsNullOrEmpty(items.ToString()))
        //    ltrItems.Text = items.ToString();
    }

    protected void lvwItems_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpgPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        BindItems();
    }

    protected void lvwItems_DataBound(object sender, EventArgs e)
    {
        // this check is important to avoid touching the Hyperlinks if the Pager doesn't configured to use Query string Field
        if (string.IsNullOrEmpty(dpgPager.QueryStringField)) 
            return;

        foreach (DataPagerFieldItem item in dpgPager.Controls)
        {
            foreach (Control control in item.Controls)
            {
                HyperLink link = control as HyperLink;

                if (link != null)
                {
                    string pageNumber = Regex.Match(link.NavigateUrl, @"\d+$").Value;

                    link.NavigateUrl =
                        SiteHelper.GetWebPath(string.Format("blog/{0}-{1}", dpgPager.QueryStringField, pageNumber));
                }
            }
        }
    }
}