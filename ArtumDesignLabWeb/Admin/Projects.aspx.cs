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
using System.IO;
using System.Drawing.Imaging;

namespace ArtumDesignLab.Admin
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDesigners();
            }
        }

        private void BindDesigners()
        {
            PersonnelEntity personnelEntity = new PersonnelEntity();
            var personnels = personnelEntity.GetByPersonnelCategoryID(5).ToArray();
            ddlDesigners.DataSource = personnels;
            ddlDesigners.DataTextField = "Name";
            ddlDesigners.DataValueField = "PersonnelID";
            ddlDesigners.DataBind();
            ddlDesigners.Items.Insert(0, new ListItem("---Выбрать дизайнера---", ""));
        }

        protected string GetProjectPhotoCount(int projectID)
        {
            ProjectPhotoEntity projectPhotos = new ProjectPhotoEntity();
            return projectPhotos.GetPhotosByProjectID(projectID).Count().ToString();
        }

        private void ClearInput()
        {
            lblUpdateProjectId.Text = "";
            txtProjectName.Text = "";
            txtDescription.Text = "";
            txtKeyWords.Text = "";
            txtTitle.Text = "";
            htmlEditor.Html = "";
            txtPlace.Text = "";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int iCategotyId;
            int.TryParse(ddlCategoriesPopUp.SelectedValue, out iCategotyId);

            int iProjectId;
            int.TryParse(lblUpdateProjectId.Text, out iProjectId);
            ProjectEntity projectEntity = new ProjectEntity();

            if (iProjectId != 0)
                projectEntity.Read(iProjectId);

            projectEntity.Entity.ProjectCategoryID = iCategotyId;
            projectEntity.Entity.ProjectDescription = txtDescription.Text;
            projectEntity.Entity.ProjectKeyWords = txtKeyWords.Text;
            projectEntity.Entity.ProjectTitle = txtTitle.Text;
            projectEntity.Entity.Url = SiteHelper.ConvertNameToUrl(txtTitle.Text);
            projectEntity.Entity.ProjectText = htmlEditor.Html;
            projectEntity.Entity.ProjectCategoryID = iCategotyId;
            projectEntity.Entity.ProjectName = txtProjectName.Text;
            int place = 0;
            if (Int32.TryParse(txtPlace.Text.Trim(), out place))
                projectEntity.Entity.Place = place;
            int designerId = 0;
            if (Int32.TryParse(ddlDesigners.SelectedValue, out designerId))
                projectEntity.Entity.DesignerID = designerId;
            if (iProjectId == 0)
                projectEntity.Entity.CreateDate = DateTime.Now;

            string name = Guid.NewGuid() + ".jpg";
            if (fluImage.HasFile)
            {

                using (System.Drawing.Image img = System.Drawing.Image.FromStream(fluImage.FileContent))
                {
                    using (Bitmap cutted = ImageUtils.CutImage(img, 195, 100))
                    {
                        //using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 0))
                        //{
                        cutted.Save(MapPath(Settings.PortfolioImagesThumbsSmall) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                        //}
                    }

                    //using (Bitmap cutted = ImageUtils.CutImage(img, 305, 165)) Макаренко С. 27/05/2013
                    using (Bitmap cutted = ImageUtils.CutImage(img, 616, (img.Height / (img.Width / 616))))
                    {
                        //using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 0))
                        //{
                        cutted.Save(MapPath(Settings.PortfolioImagesThumbsMedium) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                        //}
                    }
                    
                    using (Bitmap cutted = ImageUtils.CreateThumbnail(img, 900, 800))
                    {
                        // TODO: Add watermark
                        cutted.Save(MapPath(Settings.PortfolioImagesFullSize) + name,
                            ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(100L));
                    }
                }

                projectEntity.Entity.ProjectThumb = name;


            }

            if (iProjectId == 0)
                iProjectId = projectEntity.Insert();
            else
                projectEntity.Update();

            ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();
            projectPhotoEntity.Entity.ProjectID = iProjectId;
            projectPhotoEntity.Entity.ProjectPhotoPath = name;
            projectPhotoEntity.Entity.ProjectPhotoName = txtProjectName.Text;
            projectPhotoEntity.Entity.ProjectPhotoCategoryID = 1;
            projectPhotoEntity.Create();

            popUpAddWork.ShowOnPageLoad = false;
            lblUpdateProjectId.Text = "";
            ClearInput();
            grdProjects.DataBind();
        }

        protected void grdProjects_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName.ToString() == "AddPhoto")
            {
                int iProjectId;
                int.TryParse(e.CommandArgs.CommandArgument.ToString(), out iProjectId);
                if (iProjectId > 0)
                {
                    lblProjectId.Text = iProjectId.ToString();
                    ProjectPhotoCategoryEntity projectPhotoProjectCategoryEntity = new ProjectPhotoCategoryEntity();
                    cmbFirst.DataSource = projectPhotoProjectCategoryEntity.GetList();
                    cmbFirst.DataBind();
                    if (cmbFirst.Items.Count > 0)
                        cmbFirst.SelectedIndex = 0;
                    cmbSecond.DataSource = projectPhotoProjectCategoryEntity.GetList();
                    cmbSecond.DataBind();
                    if (cmbSecond.Items.Count > 0)
                        cmbSecond.SelectedIndex = 0;
                    cmbThird.DataSource = projectPhotoProjectCategoryEntity.GetList();
                    cmbThird.DataBind();
                    if (cmbThird.Items.Count > 0)
                        cmbThird.SelectedIndex = 0;
                    cmbFourth.DataSource = projectPhotoProjectCategoryEntity.GetList();
                    cmbFourth.DataBind();
                    if (cmbFourth.Items.Count > 0)
                        cmbFourth.SelectedIndex = 0;
                    cmbFifth.DataSource = projectPhotoProjectCategoryEntity.GetList();
                    cmbFifth.DataBind();
                    if (cmbFifth.Items.Count > 0)
                        cmbFifth.SelectedIndex = 0;
                    cmbSix.DataSource = projectPhotoProjectCategoryEntity.GetList();
                    cmbSix.DataBind();
                    if (cmbSix.Items.Count > 0)
                        cmbSix.SelectedIndex = 0;
                    cmbSeven.DataSource = projectPhotoProjectCategoryEntity.GetList();
                    cmbSeven.DataBind();
                    if (cmbSeven.Items.Count > 0)
                        cmbSeven.SelectedIndex = 0;
                    popupAddPictures.ShowOnPageLoad = true;

                }
            }

            if (e.CommandArgs.CommandName.ToString() == "Delete")
            {
                int iProjectId;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out iProjectId))
                {
                    ProjectEntity projectEntity = new ProjectEntity();
                    projectEntity.Read(iProjectId);

                    if (projectEntity.Entity.ProjectID > 0)
                    {
                        // Deleting project thumbnail
                        try
                        {
                            File.Delete(MapPath(Settings.PortfolioImagesThumbsSmall) + projectEntity.Entity.ProjectThumb);
                            File.Delete(MapPath(Settings.PortfolioImagesThumbsMedium) + projectEntity.Entity.ProjectThumb);
                        }
                        catch { }

                        // Deleting project photos
                        ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();

                        foreach (ProjectPhoto photo in projectPhotoEntity.GetListByProjectID(iProjectId))
                        {
                            try
                            {
                                File.Delete(MapPath(Settings.PortfolioImagesThumbsMedium) + photo.ProjectPhotoPath);
                                File.Delete(MapPath(Settings.PortfolioImagesFullSize) + photo.ProjectPhotoPath);
                            }
                            catch { }
                        }

                        projectPhotoEntity.DeleteByProjectID(iProjectId);

                        projectEntity.DeleteByID(iProjectId);
                    }
                }
            }

            if (e.CommandArgs.CommandName.ToString() == "Change")
            {
                int iProjectId;
                int.TryParse(e.CommandArgs.CommandArgument.ToString(), out iProjectId);
                ProjectEntity projectEntity = new ProjectEntity();
                projectEntity.Read(iProjectId);
                if (iProjectId > 0)
                {
                    lblUpdateProjectId.Text = iProjectId.ToString();
                    popUpAddWork.ShowOnPageLoad = true;
                    popUpAddWork.HeaderText = "Изменить работу";
                    txtProjectName.Text = projectEntity.Entity.ProjectName;
                    if (projectEntity.Entity.DesignerID != null)
                        ddlDesigners.SelectedValue = projectEntity.Entity.DesignerID.ToString();
                    else
                        ddlDesigners.SelectedIndex = 0;
                    txtDescription.Text = projectEntity.Entity.ProjectDescription;
                    txtKeyWords.Text = projectEntity.Entity.ProjectKeyWords;
                    txtTitle.Text = projectEntity.Entity.ProjectTitle;
                    htmlEditor.Html = projectEntity.Entity.ProjectText;
                    ddlCategoriesPopUp.SelectedValue = projectEntity.Entity.ProjectCategoryID.ToString();
                    txtPlace.Text = projectEntity.Entity.Place != null ? projectEntity.Entity.Place.ToString() : "";
                }
            }

            else if (e.CommandArgs.CommandName == "AddQuickLinks")
            {
                Session["ProjectID"] = e.CommandArgs.CommandArgument;
                QuickLinksPopup.Windows[0].ShowOnPageLoad = true;
            }

        }

        protected void ASPxTreeList1_InitNewNode(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["ProjectID"] = Session["ProjectID"];
        }

        private void saveProjectPhoto(string name, Stream content)
        {
            using (System.Drawing.Image img = System.Drawing.Image.FromStream(content))
            {
                using (Bitmap cutted = ImageUtils.CutImage(img, 305, 165)) //Макаренко С. 27/05/2013
                //using (Bitmap cutted = ImageUtils.CutImage(img, 616, (img.Height/(img.Width/616))))
                {
                    using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 7))
                    {
                        rounded.Save(MapPath(Settings.PortfolioImagesThumbsMedium) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                    }
                }

                using (Bitmap cutted = ImageUtils.CreateThumbnail(img, 900, 800))
                {
                    // TODO: Add watermark
                    cutted.Save(MapPath(Settings.PortfolioImagesFullSize) + name,
                        ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(100L));
                }
            }
        }

        protected void btnAddPicture_Click(object sender, EventArgs e)
        {
            int iProjectId;
            int.TryParse(lblProjectId.Text, out iProjectId);
            if (iProjectId > 0)
            {
                if (fluPicture1.HasFile)
                {
                    string name = Guid.NewGuid() + ".jpg";
                    saveProjectPhoto(name, fluPicture1.FileContent);

                    ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();
                    projectPhotoEntity.Entity.ProjectID = iProjectId;
                    projectPhotoEntity.Entity.ProjectPhotoPath = name;
                    projectPhotoEntity.Entity.ProjectPhotoName = txtFirst.Text;

                    int iPhotoCategory = int.Parse(cmbFirst.SelectedItem.Value.ToString());
                    projectPhotoEntity.Entity.ProjectPhotoCategoryID = iPhotoCategory;
                    projectPhotoEntity.Create();
                }
                if (fluPicture2.HasFile)
                {
                    string name = Guid.NewGuid() + ".jpg";
                    saveProjectPhoto(name, fluPicture2.FileContent);

                    ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();
                    projectPhotoEntity.Entity.ProjectID = iProjectId;
                    projectPhotoEntity.Entity.ProjectPhotoPath = name;
                    projectPhotoEntity.Entity.ProjectPhotoName = txtSecond.Text;

                    int iPhotoCategory = int.Parse(cmbSecond.SelectedItem.Value.ToString());
                    projectPhotoEntity.Entity.ProjectPhotoCategoryID = iPhotoCategory;
                    projectPhotoEntity.Create();
                }
                if (fluPicture3.HasFile)
                {
                    string name = Guid.NewGuid() + ".jpg";
                    saveProjectPhoto(name, fluPicture3.FileContent);

                    ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();
                    projectPhotoEntity.Entity.ProjectID = iProjectId;
                    projectPhotoEntity.Entity.ProjectPhotoPath = name;
                    projectPhotoEntity.Entity.ProjectPhotoName = txtThird.Text;

                    int iPhotoCategory = int.Parse(cmbThird.SelectedItem.Value.ToString());
                    projectPhotoEntity.Entity.ProjectPhotoCategoryID = iPhotoCategory;
                    projectPhotoEntity.Create();
                }
                if (fluPicture4.HasFile)
                {
                    string name = Guid.NewGuid() + ".jpg";
                    saveProjectPhoto(name, fluPicture4.FileContent);

                    ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();
                    projectPhotoEntity.Entity.ProjectID = iProjectId;
                    projectPhotoEntity.Entity.ProjectPhotoPath = name;
                    projectPhotoEntity.Entity.ProjectPhotoName = txtFourth.Text;

                    int iPhotoCategory = int.Parse(cmbFourth.SelectedItem.Value.ToString());
                    projectPhotoEntity.Entity.ProjectPhotoCategoryID = iPhotoCategory;
                    projectPhotoEntity.Create();
                }
                if (fluPicture5.HasFile)
                {
                    string name = Guid.NewGuid() + ".jpg";
                    saveProjectPhoto(name, fluPicture5.FileContent);

                    ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();
                    projectPhotoEntity.Entity.ProjectID = iProjectId;
                    projectPhotoEntity.Entity.ProjectPhotoPath = name;
                    projectPhotoEntity.Entity.ProjectPhotoName = txtFifth.Text;

                    int iPhotoCategory = int.Parse(cmbFifth.SelectedItem.Value.ToString());
                    projectPhotoEntity.Entity.ProjectPhotoCategoryID = iPhotoCategory;
                    projectPhotoEntity.Create();
                }
                if (fluPicture6.HasFile)
                {
                    string name = Guid.NewGuid() + ".jpg";
                    saveProjectPhoto(name, fluPicture6.FileContent);

                    ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();
                    projectPhotoEntity.Entity.ProjectID = iProjectId;
                    projectPhotoEntity.Entity.ProjectPhotoPath = name;
                    projectPhotoEntity.Entity.ProjectPhotoName = txtSix.Text;

                    int iPhotoCategory = int.Parse(cmbSix.SelectedItem.Value.ToString());
                    projectPhotoEntity.Entity.ProjectPhotoCategoryID = iPhotoCategory;
                    projectPhotoEntity.Create();
                }
                if (fluPicture7.HasFile)
                {
                    string name = Guid.NewGuid() + ".jpg";
                    saveProjectPhoto(name, fluPicture7.FileContent);

                    ProjectPhotoEntity projectPhotoEntity = new ProjectPhotoEntity();
                    projectPhotoEntity.Entity.ProjectID = iProjectId;
                    projectPhotoEntity.Entity.ProjectPhotoPath = name;
                    projectPhotoEntity.Entity.ProjectPhotoName = txtSeven.Text;

                    int iPhotoCategory = int.Parse(cmbSeven.SelectedItem.Value.ToString());
                    projectPhotoEntity.Entity.ProjectPhotoCategoryID = iPhotoCategory;
                    projectPhotoEntity.Create();
                }
                popupAddPictures.ShowOnPageLoad = false;
            }
        }

        protected void btnAddProject_Click(object sender, EventArgs e)
        {
            ClearInput();
            popUpAddWork.ShowOnPageLoad = true;
            popUpAddWork.HeaderText = "Добавить работу";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ProjectEntity projectEntity = new ProjectEntity();

            foreach (var project in projectEntity.GetList())
            {
                project.Url = SiteHelper.ConvertNameToUrl(project.ProjectName);
            }

            projectEntity.Update();

            grdProjects.DataBind();
        }

    }
}
