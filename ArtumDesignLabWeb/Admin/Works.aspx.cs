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
using DevExpress.Web.ASPxUploadControl;

namespace ArtumDesignLab.Admin
{
    public partial class Works : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            WorkEntity entity = new WorkEntity();

            entity.Entity.WorkCategoryID = int.Parse(cmbCategory.SelectedItem.Value.ToString());

            entity.Entity.MetaTitle = txtTitle.Text;
            entity.Entity.MetaDescription = txtDescription.Text;
            entity.Entity.MetaKeywords = txtKeyWords.Text;

            entity.Entity.Header = txtHeader.Text;
            entity.Entity.Text = htmlText.Html;
            entity.Entity.CreateDate = DateTime.Now;

            if (fluImage.HasFile)
            {
                string name = Guid.NewGuid() + Path.GetExtension(fluImage.FileName);

                using (System.Drawing.Image img = System.Drawing.Image.FromStream(fluImage.FileContent))
                {
                    using (Bitmap cutted = ImageUtils.CutImage(img, 195, 100))
                    {
                        using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 7))
                        {
                            rounded.Save(MapPath(Settings.WorksImagesThumbsSmall) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                        }
                    }

                    using (Bitmap cutted = ImageUtils.CutImage(img, 155, 140))
                    {
                        using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 7))
                        {
                            rounded.Save(MapPath(Settings.WorksImagesThumbsMedium) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                        }
                    }
                }

                entity.Entity.Image = name;
            }

            entity.Create();

            grdProjects.DataBind();
            ClearControls();
        }

        private void ClearControls()
        {
            txtHeader.Text = "";
            txtTitle.Text = "";
            txtKeyWords.Text = "";
            txtDescription.Text = "";
            htmlText.Html = "";
        }

        protected void grdProjects_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName.ToString() == "AddPhoto")
            {
                int workID;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out workID))
                {
                    Session["ID"] = e.CommandArgs.CommandArgument;
                    PopupControl.Windows[1].ShowOnPageLoad = true;
                }
            }

            if (e.CommandArgs.CommandName.ToString() == "Delete")
            {
                int workID;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out workID))
                {
                    WorkEntity workEntity = new WorkEntity();
                    workEntity.Read(workID);

                    if (workEntity.Entity.WorkID > 0)
                    {
                        // Deleting thumbnail
                        try
                        {
                            File.Delete(MapPath(Settings.WorksImagesThumbsSmall) + workEntity.Entity.Image);
                            File.Delete(MapPath(Settings.WorksImagesThumbsMedium) + workEntity.Entity.Image);
                        }
                        catch { }

                        // Deleting photos
                        WorkPhotoEntity workPhotoEntity = new WorkPhotoEntity();

                        foreach (WorkPhoto photo in workPhotoEntity.GetListByWorkID(workID))
                        {
                            try
                            {
                                File.Delete(MapPath(Settings.WorksImagesThumbsMedium) + photo.Name);
                                File.Delete(MapPath(Settings.WorksImagesFullSize) + photo.Name);
                            }
                            catch { }
                        }

                        workPhotoEntity.DeleteByWorkID(workID);

                        workEntity.DeleteByID(workID);
                    }
                }
            }

            if (e.CommandArgs.CommandName.ToString() == "Change")
            {
                int workID;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out workID))
                {

                }
            }
            else if (e.CommandArgs.CommandName == "AddQuickLinks")
            {
                int workID;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out workID))
                {
                    Session["ID"] = e.CommandArgs.CommandArgument;
                    PopupControl.Windows[0].ShowOnPageLoad = true;
                }
            }

            grdProjects.DataBind();           
        }

        protected void ASPxTreeList1_InitNewNode(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["WorkID"] = Session["ID"];
        }

        protected void AddImagesButton_Click(object sender, EventArgs e)
        {
            int id;
            if (Session["ID"] != null && int.TryParse(Session["ID"].ToString(), out id))
            {
                foreach (UploadedFile file in WorkPhotosUploadControl.UploadedFiles)
                {
                    if (file.PostedFile.ContentLength > 0)
                    {
                        string name = Guid.NewGuid() + ".jpg";

                        using (System.Drawing.Image img = System.Drawing.Image.FromStream(file.FileContent))
                        {
                            using (Bitmap cutted = ImageUtils.CutImage(img, 155, 140))
                            {
                                using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 7))
                                {
                                    rounded.Save(MapPath(Settings.WorksImagesThumbsMedium) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                                }
                            }

                            using (Bitmap cutted = ImageUtils.CreateThumbnail(img, 900, 800))
                            {
                                cutted.Save(MapPath(Settings.WorksImagesFullSize) + name,
                                    ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(100L));
                            }
                        }

                        WorkPhotoEntity entity = new WorkPhotoEntity();
                        entity.Entity.WorkID = id;
                        entity.Entity.Name = name;
                        entity.Create();
                    }
                }
            }
            PopupControl.Windows[1].ShowOnPageLoad = false;
        }
    }
}
