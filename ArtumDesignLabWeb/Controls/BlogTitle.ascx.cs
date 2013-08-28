﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;

namespace ArtumDesignLab.UI
{
    public partial class Controls_BlogTitle : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BlogEntity entity = new BlogEntity();
                rptItems.DataSource = entity.GetLatest(2);
                rptItems.DataBind();
            }
        }
    }
}