using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_OurWorks : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //if (String.IsNullOrEmpty(strHeader))
            if (Session["IsShowSpecial"] != null && Session["IsShowSpecial"].ToString() == "1")
            {
                this.Visible = false;

            } 
      
           
        }
    }
}