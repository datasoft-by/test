using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Admin
{
    public partial class Personnel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonGenerate_Click(object sender, EventArgs e)
        {
            PersonnelEntity entity = new PersonnelEntity();

            foreach (var position in entity.GetList())
            {
                position.Url = SiteHelper.ConvertNameToUrl(position.Name);
            }

            entity.Update();

            PersonnelGridView.DataBind();
        }

        protected void btnAddPersonnel_Click(object sender, EventArgs e)
        {

        }
}
}