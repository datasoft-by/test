using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using System.Text;

namespace ArtumDesignLab.UI
{
    public partial class Portfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["cat"]) && !string.IsNullOrEmpty(Request["id"]))
                    LoadProject();
                else if (!string.IsNullOrEmpty(Request["cat"]))
                    BindProjects();
                else
                {
                    throw new HttpException(404, "Страница не найдена");
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

        // Template:
        //
        // <div class="oject-list-holder">
        //    <ul class="object-list">
        //        <li>
        //            <h3><span class="arrow"></span>Визуализации помещения:</h3>
        //            <div class="object-photos-holder">
        //                <p>Сначала интенсивно и функционально выстраивается виртуальное пространство, делаются все чертежи, начиная от исходного плана и заканчивая расположением розеток, а потом можно приступать к визуализациям.</p>
        //                <ul class="object-photos">
        //                    <li> <img src="images/Temp/obj01.png" alt="Фото с объекта" width="155" height="141"> Ванная комната</li>
        //                    <li> <img src="images/Temp/obj02.png" alt="Фото с объекта" width="155" height="141"> Вид на диван в гостиной </li>
        //                    <li> <img src="images/Temp/obj03.png" alt="Фото с объекта" width="154" height="141"> Вид на диван в гостиной</li>
        //                </ul>
        //            </div>
        //        </li>
        //    </ul>
        //    <div class="pager clearfix">
        //      <a href="#" class="prev">Предыдущий проект</a>
        //      <a href="#" class="next">Следующий проект</a>
        //      <a href="#" class="all">Список проектов</a>
        //    </div>
        // </div>
        private void LoadProject()
        {
            int categoryID = 0;
            int projectID = 0;

            int.TryParse(Request["cat"], out categoryID);
            int.TryParse(Request["id"], out projectID);

            if (categoryID == 0 || projectID == 0)
                throw new HttpException(404, "Страница не найдена");

            // Hide project list, show one selected project
            pnlProjectsList.Visible = false;

            ProjectCategoryEntity projectCategoryEntity = new ProjectCategoryEntity();
            ProjectCategory projectCategory = projectCategoryEntity.GetCategoryByID(categoryID);

            // Setup links for previous, next controls
            setupPrevNextControls(projectID, projectCategory);

            ProjectEntity projectEntity = new ProjectEntity();
            var pr = projectEntity.GetByDesignerID(5);
            projectEntity.Read(projectID);

            if (projectEntity.Entity.ProjectID == 0)
                throw new HttpException(404, "Проект по указанному ID не существует");

            //LoadQuickLinks(projectID);
            
            // Text
            litHeader.Text = projectEntity.Entity.ProjectName;
            litText.Text = projectEntity.Entity.ProjectText;

            // Title, meta
            Title = projectEntity.Entity.ProjectTitle;
            dynHead.Description = projectEntity.Entity.ProjectDescription;
            dynHead.KeyWords = projectEntity.Entity.ProjectKeyWords;

            // Photos
            ProjectPhotoEntity photoEntity = new ProjectPhotoEntity();
            IEnumerable<ProjectPhoto> photosList = photoEntity.GetPhotosByProjectID(projectID);

            ProjectPhotoCategoryEntity photoCategoryEntity = new ProjectPhotoCategoryEntity();
            StringBuilder photosHtml = new StringBuilder();
            bool firstItem = true;
            foreach (ProjectPhotoCategory photoCategory in photoCategoryEntity.GetList())
            {
                IEnumerable<ProjectPhoto> photos = 
                    photosList.Select(s => s).Where(s => s.ProjectPhotoCategoryID == photoCategory.ProjectPhotoCategoryID);
                if (photos.ToList().Count > 0)
                {
                    photosHtml.Append("<li>");
                    if (firstItem)
                    {
                        photosHtml.AppendFormat(
                            @"<div class=""h1_style"" style=""margin-bottom:15px;font-size:22px;padding-top:9px;color:#c93e00;"">{0}&darr;</div>", 
                            photoCategory.Name);
                        photosHtml.Append(
                            @"<ul class=""ourwork-list project-photos object-photos-holder"" style=""display: block"">");

                        firstItem = false; 
                    }
                    else
                    {
                        photosHtml.AppendFormat(
                            @"<h3 style=""color:#c93e00;""><span class=""arrow""></span>{0}&darr;</h3>", 
                            photoCategory.Name);
                        photosHtml.Append(@"<ul class=""ourwork-list project-photos object-photos-holder"">");
                    }

                    foreach (ProjectPhoto photo in photos)
                    {
                        photosHtml.AppendFormat(
                            @"<li><div class=""ourwork-img""><a href=""{0}""><img src=""{1}"" alt=""{2}"" width=""305"" height=""165""></a><div class=""img-overlay""></div></div><div class=""ourwork-txt""><h4 style='color:Black;' >{3}</h4></div></li>",
                            SiteHelper.GetWebPath(Settings.PortfolioImagesFullSize) + photo.ProjectPhotoPath.Replace("png", "jpg"),
                            SiteHelper.GetWebPath(Settings.PortfolioImagesThumbsMedium) + photo.ProjectPhotoPath.Replace("png", "jpg"),
                            //SiteHelper.GetWebPath(Settings.PortfolioImagesThumbsMedium) + "22.jpg", 
                            HttpUtility.HtmlEncode( photo.ProjectPhotoName),
                            photo.ProjectPhotoName);
                    }

                    photosHtml.Append("</ul>");
                    photosHtml.Append("</li>");
                }
            }
            litProjectPhotos.Text = photosHtml.ToString();

            //FB meta tags
            lFbMetaTag.Text = String.Format("<meta property=\"og:title\" content=\"{0}\" /><meta property=\"og:description\" content=\"{1}\" /><meta property=\"og:type\" content=\"{2}\" /><meta property=\"og:image\" content=\"{3}\" />",
                projectEntity.Entity.ProjectName,
                projectEntity.Entity.ProjectText,
                "article",
                photosList.Count() > 0 ? SiteHelper.GetWebPath(Settings.PortfolioImagesThumbsMedium) + photosList.ToArray()[0].ProjectPhotoPath.Replace("png", "jpg") : "");

            if (projectEntity.Entity.DesignerID != null)
            {
                PersonnelEntity personnel = new PersonnelEntity();

                Personnel designer = personnel.GetByID(projectEntity.Entity.DesignerID.Value);
                ltrDesignerName.Text = "Автор работы - " + designer.Name;
                lDesignerImage.Text = String.Format("<img width=\"235\" alt=\"{0}\" src=\"{1}\"/>",
                    designer.Name,
                    SiteHelper.GetWebPath(Settings.PersonalImages + designer.ThumbImage));
                if (!String.IsNullOrEmpty(designer.Experience))
                    lExperience.Text = "Опыт работы: " + designer.Experience;
                if (!String.IsNullOrEmpty(designer.Styles))
                    lStyles.Text = "Любимые стили:<br />" + designer.Styles;
                phDesigner.Visible = true;
            }

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

        //private void setupPrevNextControls(int projectID, int categoryID)
        //{
        //    int prevID = 0, nextID = 0;
        //    ProjectEntity entity = new ProjectEntity();
        //    IList<Project> list = entity.GetListByCategoryID(categoryID).ToList();

        //    for (int i = 0; i < list.Count; i++)
        //    {
        //        if (list[i].ProjectID == projectID)
        //        {
        //            if (i > 0)
        //            {
        //                prevID = list[i - 1].ProjectID;
        //            }
        //            if (i < list.Count - 1)
        //            {
        //                nextID = list[i + 1].ProjectID;
        //            }
        //            break;
        //        }
        //    }

        //    lnkProjectsList.HRef = SiteHelper.GetWebPath("~/Portfolio.aspx") + "?cat=" + categoryID;
        //    lnkProjectsPrev.HRef = (prevID == 0) ? "#" : SiteHelper.GetWebPath("~/Portfolio.aspx") + "?id=" + prevID + "&cat=" + categoryID;
        //    lnkProjectsNext.HRef = (nextID == 0) ? "#" : SiteHelper.GetWebPath("~/Portfolio.aspx") + "?id=" + nextID + "&cat=" + categoryID;
        //}

        private void setupPrevNextControls(int projectID, ProjectCategory category)
        {
            Project prev = null;
            Project next = null;
            ProjectEntity entity = new ProjectEntity();
            IList<Project> list = entity.GetListByCategoryID(category.ProjectCategoryID).ToList();

            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].ProjectID == projectID)
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

            lnkProjectsList.HRef = SiteHelper.GetWebPath("~/Portfolio.aspx/") + category.Url;
            lnkProjectsPrev.HRef = (prev == null) ? "#" : SiteHelper.GetWebPath(string.Format("~/Portfolio.aspx/{0}/{1}", category.Url, prev.Url));
            lnkProjectsNext.HRef = (next == null) ? "#" : SiteHelper.GetWebPath(string.Format("~/Portfolio.aspx/{0}/{1}", category.Url, next.Url));
            if (prev != null)
            {
                lnkProjectsPrev.Title = prev.ProjectName;
                lnkProjectsPrev.InnerText = prev.ProjectName;
                //lnkProjectsPrev.Visible = false;
            }
            if (next != null)
            {
                lnkProjectsNext.Title = next.ProjectName;
                lnkProjectsNext.InnerText = next.ProjectName;
            }
            
        }

        private void BindProjects()
        {
            int categoryID = 0;

            if (!string.IsNullOrEmpty(Request["cat"]))
            {
                // Load category
                int.TryParse(Request["cat"], out categoryID);

                if (categoryID == 0)
                    throw new HttpException(404, "Страница не найдена");

                ProjectCategoryEntity projectCategoryEntity = new ProjectCategoryEntity();
                ProjectCategory category = projectCategoryEntity.GetCategoryByID(categoryID);
                ltrTitle.Text = category.Name;
                ltrText.Text = category.Text;
                this.Page.Title = category.Title;

                ProjectEntity projectEntity = new ProjectEntity();
                lvwProjects.DataSource = projectEntity.GetByCategoryID(categoryID);
                lvwProjects.DataBind();

                //LoadTeasers(categoryID);

                dpgPager.Visible = dpgPager.TotalRowCount > dpgPager.PageSize;

                pnlProject.Visible = false;
            }
        }

        //private void LoadTeasers(int categoryID)
        //{
        //    PortfolioTeaserEntity entity = new PortfolioTeaserEntity();
        //    var list = entity.GetListByCategoryID(categoryID).Take(4);

        //    if (list.Count() > 0)
        //    {
        //        divDefaultTeasers.Visible = false;
        //        divCustomTeasers.Visible = true;

        //        rptTeasers.DataSource = list;
        //        rptTeasers.DataBind();
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

            ProjectQuickLinkEntity entity = new ProjectQuickLinkEntity();

            StringBuilder items = new StringBuilder();

            // All links for the post
            IEnumerable<ProjectQuickLink> links = entity.GetByProjectID(id);

            //if (links.ToList().Count == 0)
            //{
            //    quickLinks.Visible = false;
            //    return;
            //}

            // Link without subitems
            IEnumerable<ProjectQuickLink> menuLinks = links.Select(s => s).Where(s => s.SubmenuLinkID == null);

            // Submenu links
            IEnumerable<ProjectQuickLink> subLinks = links.Select(s => s).Where(s => s.SubmenuLinkID != null);

            foreach (ProjectQuickLink link in menuLinks)
            {
                IEnumerable<ProjectQuickLink> subItems = subLinks.Select(s => s).Where(s => s.SubmenuLinkID == link.ProjectQuickLinkID);
                if (subItems.ToList().Count < 1)
                {
                    items.Append(string.Format("<li><a href=\"{0}\">{1}</a></li>",
                                 SiteHelper.GetWebPath(link.URL), link.Title));
                }
                else
                {
                    items.Append(string.Format("<li><span>{0}</span><ul class=\"second-level\">", link.Title));

                    foreach (ProjectQuickLink subLink in subItems)
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

        protected void lvwProjects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpgPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindProjects();
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
    }
}
