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
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtText.Text))
            {
                ProjectCategoryEntity category = new ProjectCategoryEntity();
                category.Entity.Name = txtText.Text;
                category.Entity.Url = SiteHelper.ConvertNameToUrl(txtText.Text);
                category.Entity.Title = txtProjectsTitle.Text;
                category.Entity.Text = htmlProjectDescription.Html;
                category.Create();

                txtText.Text = "";
                txtProjectsTitle.Text = "";
                htmlProjectDescription.Html = "";

                gridViewCategories.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ProjectCategoryEntity entity = new ProjectCategoryEntity();

            foreach (var category in entity.GetList())
            {
                category.Url = SiteHelper.ConvertNameToUrl(category.Name);
            }

            entity.Update();

            gridViewCategories.DataBind();
        }

        private void BindCategories()
        {
            //cmbCategories.Items.Clear();
            //ProjectCategoryEntity ProjectCategoryEntity = new ProjectCategoryEntity();
            //cmbCategories.DataSource = ProjectCategoryEntity.GetList();
            //cmbCategories.DataBind();
            //if (cmbCategories.Items.Count > 0)
            //    cmbCategories.SelectedIndex = 0;

            //cmbPhotoCategories.Items.Clear();
            //ProjectPhotoCategoryEntity photoProjectCategoryEntity = new ProjectPhotoCategoryEntity();
            //cmbPhotoCategories.DataSource = photoProjectCategoryEntity.GetList();
            //cmbPhotoCategories.DataBind();
            //if (cmbPhotoCategories.Items.Count > 0)
            //    cmbPhotoCategories.SelectedIndex = 0;
        }

        protected void btnAddPhotoCategory_Click(object sender, EventArgs e)
        {
            //if (!String.IsNullOrEmpty(txtPhotoCategoryName.Text))
            //{
            //    ProjectPhotoCategoryEntity photoProjectCategoryEntity = new ProjectPhotoCategoryEntity();
            //    photoProjectCategoryEntity.Entity.CategoryName = txtPhotoCategoryName.Text;
            //    photoProjectCategoryEntity.Create();
            //    BindCategories();
            //    txtPhotoCategoryName.Text = "";
            //}
        }

        protected void btnChangePhotoCategory_Click(object sender, EventArgs e)
        {
            //if (cmbPhotoCategories.SelectedIndex != -1 && !String.IsNullOrEmpty(txtPhotoCategoryName.Text))
            //{
            //    int iCategoryId;
            //    int.TryParse(cmbPhotoCategories.SelectedItem.Value.ToString(), out iCategoryId);
            //    if (iCategoryId != 0)
            //    {
            //        ProjectPhotoCategoryEntity photoProjectCategoryEntity = new ProjectPhotoCategoryEntity();
            //        photoProjectCategoryEntity.Read(iCategoryId);
            //        photoProjectCategoryEntity.Entity.CategoryName = txtPhotoCategoryName.Text;
            //        photoProjectCategoryEntity.Update();
            //        BindCategories();
            //    }
            //}
        }
    }
}
