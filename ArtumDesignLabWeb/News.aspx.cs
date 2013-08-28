using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.UI
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindItems();
                //BindCategories();
                dpgPager.Visible = dpgPager.TotalRowCount > dpgPager.PageSize;
            }
        }

        //private void BindCategories()
        //{
        //    BlogCategoryEntity entity = new BlogCategoryEntity();
        //    rptCategories.DataSource = entity.GetList();
        //    rptCategories.DataBind();
        //}

        protected void lvwItems_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpgPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindItems();
        }

        private void BindItems()
        {
            int id = 0;
            if (Request["id"] != null)
            {
                if (int.TryParse(Request["id"], out id))
                {
                    setupPrevNextControls(id);
                    NewEntity entity = new NewEntity();
                    entity.Read(id);
                    postHeader.Text = SiteHelper.ParseTextWithCustomTag(entity.Entity.Header);
                    postImage.Src = SiteHelper.GetWebPath(Settings.NewsImagesFull) + entity.Entity.Image;
                    postText.Text = SiteHelper.ParseTextWithCustomTag(entity.Entity.Text);

                    pnlPost.Visible = true;
                    pnlNews.Visible = false;
                }
            }

            NewEntity newsEntity = new NewEntity();
            lvwItems.DataSource = (id == 0) ? newsEntity.GetList() : newsEntity.GetListExceptOne(id);
            lvwItems.DataBind();
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

                        link.NavigateUrl = SiteHelper.GetWebPath(string.Format("news/{0}-{1}", dpgPager.QueryStringField, pageNumber));
                    }
                }
            }
        }
      
        private void setupPrevNextControls(int id)
        {
            ArtumDesignLab.New prev = null;
            ArtumDesignLab.New next = null;
            NewEntity entity = new NewEntity();
            var list = entity.GetList().ToList();


            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].NewID == id)
                {
                    if (i > 0)
                    {
                        prev = list[i - 1];
                    }
                    if (i < list.Count - 1)
                    {
                        next = list[i + 1];
                    }
                    break;
                }
            }

            lnkNewsPrev.HRef = (prev == null) ? "#" : SiteHelper.GetWebPath(string.Format("~/News.aspx/{0}", prev.Url));
            lnkNewsNext.HRef = (next == null) ? "#" : SiteHelper.GetWebPath(string.Format("~/News.aspx/{0}", next.Url));
            if (prev != null)
            {
                lnkNewsPrev.Title = prev.Header;
                lnkNewsPrev.InnerText = prev.Header;
            }
            else
                lnkNewsPrev.Visible = false;

            lnkNewsNext.Title = next.Header;
            lnkNewsNext.InnerText = next.Header;
        }
    }
}