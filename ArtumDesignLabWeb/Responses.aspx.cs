using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;

public partial class Responses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //BindItems();
            //dpgPager.Visible = dpgPager.TotalRowCount > dpgPager.PageSize;
        }
    }
    /*
    protected void lvwItems_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpgPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        BindItems();
    }

    private void BindItems()
    {
        ResponceEntity newsEntity = new ResponceEntity();
        lvwItems.DataSource = newsEntity.GetList();
        lvwItems.DataBind();
    }
     */
}