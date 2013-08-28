using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using System.Text.RegularExpressions;

namespace ArtumDesignLab.UI
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString.Get("id")))
                    BindProjects();
                else
                {
                    PersonnelEntity entity = new PersonnelEntity();
                    rPersonal.DataSource = entity.GetListSortedByPlace();
                    rPersonal.DataBind();
                }
            }
        }

        private void BindProjects()
        {
            int designerID = 0;
            if (int.TryParse(Request.QueryString.Get("id"), out designerID))
            {
                PersonnelEntity personnel = new PersonnelEntity();
                Personnel designer = personnel.GetByID(designerID);
                ltrDesignerName.Text = designer.Name;
                lDesignerImage.Text = String.Format("<img width=\"235\" alt=\"{0}\" src=\"{1}\"/>",
                    designer.Name,
                    SiteHelper.GetWebPath(Settings.PersonalImages + designer.ThumbImage));
                if (!String.IsNullOrEmpty(designer.Experience))
                    lExperience.Text = "Опыт работы: " + designer.Experience;
                if (!String.IsNullOrEmpty(designer.Styles))
                    lStyles.Text = "Любимые стили:<br />" + designer.Styles;

                ProjectEntity projectEntity = new ProjectEntity();
                lvwProjects.DataSource = projectEntity.GetByDesignerID(designerID);
                lvwProjects.DataBind();
                pnlDesigner.Visible = true;

                CallDesignerConsultation.DesignerName = designer.Name;
                dpgPager.Visible = dpgPager.TotalRowCount > dpgPager.PageSize;
            }
            else
                throw new HttpException(404, "Страница не найдена");
        }

        protected string GetPhoneAndEmail(object phone, object email)
        {
            string info = String.Empty;
            if (phone != null && !String.IsNullOrEmpty(phone.ToString()))
                info += String.Format("<div><b>Телефон:</b> {0}</div>", phone);
            if (email != null && !String.IsNullOrEmpty(email.ToString()))
                info += String.Format("<div><b>Email:</b> {0}</div>", email);
            return info;
        }
        protected string GetPortfolioButton(object url, object categoryID)
        {
            if ((Int32)categoryID == 5)
                return String.Format("<div style=\"padding:10px 0 20px 20px;\"><a style class=\"button-var\" href=\"{0}\" title=\"Cмотреть портфолио\">Cмотреть портфолио</a></div>",
                            url);
            else
                return String.Empty;

        }
        protected string GetTitle(object url, object categoryID, object name)
        {
            if ((Int32)categoryID == 5)
                return String.Format("<a href=\"{0}\" title=\"Cмотреть портфолио\"><h3 style=\"margin-bottom:7px;\">{1}</h3></a>",
                            url, name);
            else
                return String.Format("<h3 style=\"margin-bottom:7px;\">{0}</h3>",
                            name);

        }
        protected string GetProjectPhotoLinks(int projectID)
        {

            ProjectPhotoEntity photoEntity = new ProjectPhotoEntity();
            var photos = photoEntity.GetPhotosByProjectID(projectID).ToArray();
            string ret = String.Empty;
            for (int i = 1; i < photos.Length; i++)
            {
                ret += String.Format("<a href='{0}' rel='lightbox[{1}]'><a>",
                    SiteHelper.GetWebPath(Settings.PortfolioImagesFullSize + photos[i].ProjectPhotoPath.Replace("png", "jpg")),
                    projectID);
            }
            return ret;
        }

        protected void lvwProjects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpgPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            //BindProjects();
        }

        protected void lvwItems_DataBound(object sender, EventArgs e)
        {
            // this check is important to avoid touching the Hyperlinks if the Pager doesn't configured to use Query string Field
            if (string.IsNullOrEmpty(dpgPager.QueryStringField) || Request["cat"] == null)
                return;

            foreach (DataPagerFieldItem item in dpgPager.Controls)
            {
                foreach (Control control in item.Controls)
                {
                    HyperLink link = control as HyperLink;

                    if (link == null) continue;

                    string pageNumber = Regex.Match(link.NavigateUrl, @"\d+$").Value;
                    int catId = int.Parse(Request["cat"]);
                    var category = new ProjectCategoryEntity().GetCategoryByID(catId);

                    if (category != null)
                        link.NavigateUrl = SiteHelper.GetWebPath(string.Format("portfolio/{0}/{1}-{2}",
                                                                               category.Url, dpgPager.QueryStringField, pageNumber));
                }
            }
        }
        
        protected string EscapeAll(string input)
        {
            var hexString = "";
            for (int j = 0; j < input.Length; j++)
            {
                char symbol = input.ElementAt(j);
                for (int i = 0; i < 256; ++i)
                {
                    // convert i into a 2-digit hex string
                    var h = i.ToString("X");
                    if (h.Length == 1)
                        h = "0" + h;
                    // insert a % character into the string
                    h = "%" + h;
                    // determine the character represented by the escape code
                    // if the characters match, we've found the ASCII value
                    var b = Server.UrlDecode(h);
                    if (b == symbol.ToString())
                    {
                        hexString += h;
                        break;
                    }
                }
            }
        return hexString;
        }
    }
}