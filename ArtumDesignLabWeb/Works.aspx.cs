using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using System.Text;

namespace ArtumDesignLab.UI
{
    public partial class Works : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["cat"]) && !string.IsNullOrEmpty(Request["id"]))
                    LoadWorks();
                else if (!string.IsNullOrEmpty(Request["cat"]))
                    BindWorks();
                else
                {
                    throw new HttpException(404, "Страница не найдена");
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
        private void LoadWorks()
        {
            int categoryID = 0;
            int workID = 0;

            int.TryParse(Request["cat"], out categoryID);
            int.TryParse(Request["id"], out workID);

            if (categoryID == 0 || workID == 0)
                throw new HttpException(404, "Страница не найдена");

            // Hide project list, show one selected project
            pnlProjectsList.Visible = false;

            WorkEntity workEntity = new WorkEntity();
            workEntity.Read(workID);

            if (workEntity.Entity.WorkID == 0)
                throw new HttpException(404, "Работа по указанному ID не существует");

            LoadQuickLinks(workID);

            // Text
            litHeader.Text = workEntity.Entity.Header;
            litText.Text = workEntity.Entity.Text;

            // Title, meta
            Title = workEntity.Entity.MetaTitle;
            dynHead.Description = workEntity.Entity.MetaDescription;
            dynHead.KeyWords = workEntity.Entity.MetaKeywords;

            // Photos
            LoadImages(workID);
        }

        private void LoadImages(int id)
        {
            WorkPhotoEntity entity = new WorkPhotoEntity();
            IEnumerable<WorkPhoto> list = entity.GetListByWorkID(id);
            if (list.ToList().Count > 0)
            {
                rptImages.DataSource = list;
                rptImages.DataBind();
                worksPhotosHolder.Visible = true;
            }
        }
        
        private void BindWorks()
        {
            int categoryID = 0;

            if (!string.IsNullOrEmpty(Request["cat"]))
            {
                // Load category
                int.TryParse(Request["cat"], out categoryID);

                if (categoryID == 0)
                    throw new HttpException(404, "Страница не найдена");

                WorkCategoryEntity workCategoryEntity = new WorkCategoryEntity();
                WorkCategory category = workCategoryEntity.GetCategoryByID(categoryID);

                if (category == null)
                    throw new HttpException(404, "Категория не найдена");

                ltrTitle.Text = category.Name;
                ltrText.Text = category.Text;
                this.Page.Title = category.Title;

                WorkEntity workEntity = new WorkEntity();
                lvwProjects.DataSource = workEntity.GetListByCategoryID(categoryID);
                lvwProjects.DataBind();

                dpgPager.Visible = dpgPager.TotalRowCount > dpgPager.PageSize;

                pnlProject.Visible = false;
            }
        }

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
            /*
            WorkQuickLinkEntity entity = new WorkQuickLinkEntity();

            StringBuilder items = new StringBuilder();

            // All links for the post
            IEnumerable<WorkQuickLink> links = entity.GetByWorkID(id);

            //if (links.ToList().Count == 0)
            //{
            //    quickLinks.Visible = false;
            //    return;
            //}

            // Link without subitems
            IEnumerable<WorkQuickLink> menuLinks = links.Select(s => s).Where(s => s.SubmenuLinkID == null);

            // Submenu links
            IEnumerable<WorkQuickLink> subLinks = links.Select(s => s).Where(s => s.SubmenuLinkID != null);

            foreach (WorkQuickLink link in menuLinks)
            {
                IEnumerable<WorkQuickLink> subItems = subLinks.Select(s => s).Where(s => s.SubmenuLinkID == link.WorkQuickLinkID);
                if (subItems.ToList().Count < 1)
                {
                    items.Append(string.Format("<li><a href=\"{0}\">{1}</a></li>",
                                 SiteHelper.GetWebPath(link.URL), link.Title));
                }
                else
                {
                    items.Append(string.Format("<li><span>{0}</span><ul class=\"second-level\">", link.Title));

                    foreach (WorkQuickLink subLink in subItems)
                    {
                        items.Append(string.Format("<li><a href=\"{0}\">{1}</a></li>",
                                     SiteHelper.GetWebPath(subLink.URL), subLink.Title));
                    }

                    items.Append("</ul></li>");
                }
            }

            //defaultLinks.Visible = false;
            if (!string.IsNullOrEmpty(items.ToString()))
                ltrItems.Text = items.ToString();
             * */
        }

        protected void lvwProjects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpgPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindWorks();
        }
    }
}
