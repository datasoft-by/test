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

            int categoryID = int.Parse(DropDownList1.SelectedValue);

            PortfolioTeaserEntity entity = new PortfolioTeaserEntity();
            var list = entity.GetListByCategoryID(categoryID);

            CheckBoxList1.ClearSelection();

            foreach (var teaser in list)
            {
                CheckBoxList1.Items.FindByValue(teaser.TeaserID.ToString()).Selected = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int categoryID = int.Parse(DropDownList1.SelectedValue);

            PortfolioTeaserEntity entity = new PortfolioTeaserEntity();
            entity.DeleteByCategoryID(categoryID);

            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    PortfolioTeaserEntity teaser = new PortfolioTeaserEntity();
                    teaser.Entity.CategoryID = categoryID;
                    teaser.Entity.TeaserID = int.Parse(item.Value);
                    teaser.Create();
                }
            }
        }
    }
}
