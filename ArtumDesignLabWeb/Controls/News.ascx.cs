using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;

namespace ArtumDesignLab.UI
{
    public partial class Controls_News : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NewEntity newsEntity = new NewEntity();
                rptItems.DataSource = newsEntity.GetLatestNews(2);
                rptItems.DataBind();
            }
        }
    }
}