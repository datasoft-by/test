using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using System.IO;
using System.Drawing.Imaging;

namespace ArtumDesignLab.Admin
{
    public partial class BlogTeasers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(DropDownList1.SelectedValue))
                return;

            int blogID = int.Parse(DropDownList1.SelectedValue);

            BlogTeaserEntity entity = new BlogTeaserEntity();
            var list = entity.GetListByBlogID(blogID);

            CheckBoxList1.ClearSelection();

            foreach (var blogTeaser in list)
            {
                CheckBoxList1.Items.FindByValue(blogTeaser.TeaserID.ToString()).Selected = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int blogID = int.Parse(DropDownList1.SelectedValue);

            BlogTeaserEntity entity = new BlogTeaserEntity();
            entity.DeleteByBlogID(blogID);

            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    BlogTeaserEntity teaser = new BlogTeaserEntity();
                    teaser.Entity.BlogID = blogID;
                    teaser.Entity.TeaserID = int.Parse(item.Value);
                    teaser.Create();
                }
            }
        }
    }
}
