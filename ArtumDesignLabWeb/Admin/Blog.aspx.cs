﻿using System;
using System.Drawing;
using System.IO;
using System.Web.UI.WebControls;
using ArtumDesignLab;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;

public partial class Admin_Blog : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            BindCategories();
        }
    }

    private void BindCategories() {
        BlogCategoryEntity blogCategoryEntity = new BlogCategoryEntity();
        cmbCategories.DataSource = blogCategoryEntity.GetList();
        cmbCategories.DataBind();

        if (cmbCategories.Items.Count > 0)
            cmbCategories.SelectedIndex = 0;
    }

    protected void BlogGridView_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        if (e.CommandArgs.CommandName.ToString() == "Delete")
        {
            int blogId;
            if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out blogId))
            {
                BlogEntity blogEntity = new BlogEntity();
                blogEntity.Read(blogId);
                try
                {
                    File.Delete(MapPath(Settings.BlogImagesFullSize) + blogEntity.Entity.Image);
                    File.Delete(MapPath(Settings.BlogImagesThumbsMedium) + blogEntity.Entity.Image);
                    File.Delete(MapPath(Settings.BlogImagesThumbsSmall) + blogEntity.Entity.Image);
                }
                catch { }
                blogEntity.Delete();
                BlogGridView.DataBind();
            }
        }

        if (e.CommandArgs.CommandName.ToString() == "Change")
        {
            int blogId;
            if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out blogId))
            {
                lblUpdateBlogId.Text = blogId.ToString();
                BlogEntity blogEntity = new BlogEntity();
                blogEntity.Read(blogId);
                cmbCategories.Value = blogEntity.Entity.BlogCategoryID;
                txtHeader.Text = blogEntity.Entity.Header;
                txtDescription.Text = blogEntity.Entity.MetaDescription;
                txtTitle.Text = blogEntity.Entity.MetaTitle;
                txtKeywords.Text = blogEntity.Entity.MetaKeywords;
                txtPreview.Text = blogEntity.Entity.PreviewText;
                htmlText.Html = blogEntity.Entity.Text;
                if (!String.IsNullOrEmpty(blogEntity.Entity.Image))
                {
                    imgImage.ImageUrl = SiteHelper.GetWebPath(Settings.BlogImagesFullSize) + blogEntity.Entity.Image;
                    imgImage.Visible = true;
                }
             }
        }
    }

    //protected void BlogGridView_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
    //{
    //    if (e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.EditForm)
    //    {
    //        DropDownList lst = (BlogGridView.FindEditFormTemplateControl("ddlCategories") as DropDownList);
    //        lst.SelectedValue = e.GetValue("BlogCategoryID").ToString();
    //    }
    //}


    protected void btnSave_Click(object sender, EventArgs e) {
        int blogId;
        BlogEntity blogEntity = new BlogEntity();
        if (int.TryParse(lblUpdateBlogId.Text, out blogId))
        {
            blogEntity.Read(blogId);
        }
        blogEntity.Entity.BlogCategoryID = int.Parse(cmbCategories.SelectedItem.Value.ToString());
        blogEntity.Entity.CreateDate = DateTime.Now;
        blogEntity.Entity.Header = txtHeader.Text;
        blogEntity.Entity.Url = SiteHelper.ConvertNameToUrl(txtHeader.Text);
        blogEntity.Entity.MetaTitle = txtTitle.Text;
        blogEntity.Entity.MetaDescription = txtDescription.Text;
        blogEntity.Entity.MetaKeywords = txtKeywords.Text;
        blogEntity.Entity.PreviewText = txtPreview.Text;
        blogEntity.Entity.Text = htmlText.Html;

        if (!String.IsNullOrEmpty(imgImage.ImageUrl) && 
            (!String.IsNullOrEmpty(blogEntity.Entity.Image) && !imgImage.ImageUrl.Contains(blogEntity.Entity.Image)))
        {
            string tmpName = MapPath(imgImage.ImageUrl);
            string name = Guid.NewGuid() + ".jpg";
            using (Bitmap img = new Bitmap(tmpName))
            {
                // Thumbnail medium
                using (Bitmap cutted = ImageUtils.CutImage(img, 192, 108))
                {
                    using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 5))
                    {
                        rounded.Save(MapPath(Settings.BlogImagesThumbsMedium) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                    }
                }
               // Thumbnail small
                using (Bitmap cutted = ImageUtils.CutImage(img, 88, 72))
                {
                    using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 5))
                    {
                        rounded.Save(MapPath(Settings.BlogImagesThumbsSmall) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                    }
                }
            }
            imgCrop.Crop(tmpName);
            using (Bitmap img = new Bitmap(tmpName))
            {
                using (Bitmap cutted = ImageUtils.CutImage(img, 624, 214))
                {
                    using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 5))
                    {
                        rounded.Save(MapPath(Settings.BlogImagesFullSize) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                    }
                }
            }
            blogEntity.Entity.Image = name;
        }
        if (blogId == 0)
            blogEntity.Create();
        else
            blogEntity.Update();
        ClearInput();
        // Delete temporary image
        // File.Delete(tmpName);
        BlogGridView.DataBind();
    }

    private void ClearInput() {
        lblUpdateBlogId.Text = "";
        txtHeader.Text = "";
        txtDescription.Text = "";
        txtTitle.Text = "";
        txtKeywords.Text = "";
        txtPreview.Text = "";
        htmlText.Html = "";
        cmbCategories.SelectedIndex = 0;
        imgImage.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e) {
        if (fluImage.HasFile) {
            string fileName = Guid.NewGuid() + Path.GetExtension(fluImage.FileName);

            fluImage.SaveAs(MapPath(Settings.ImagesTemp) + fileName);
            imgImage.ImageUrl = ResolveUrl(Settings.ImagesTemp) + fileName;
            imgImage.Visible = true;
            imgCrop.Visible = true;
        }
    }
    protected void LinkButton1_Command(object sender, CommandEventArgs e) {
        if (e.CommandName == "AddQuickLinks") {
            int postID;
            if (int.TryParse(e.CommandArgument.ToString(), out postID)) {
                Session["PostID"] = postID;
                ASPxPopupControl1.Windows[0].ShowOnPageLoad = true;
            }
        }
    }

    protected void AddPhotos_Command(object sender, CommandEventArgs e) {
        if (e.CommandName == "AddPhotos") {
            int postID;
            if (int.TryParse(e.CommandArgument.ToString(), out postID)) {
                Session["PostID"] = postID;
                ASPxPopupControl1.Windows[1].ShowOnPageLoad = true;
            }
        }
    }

    protected void ASPxTreeList1_InitNewNode(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e) {
        e.NewValues["BlogID"] = Session["PostID"];
    }

    //protected void AddImagesButton_Click(object sender, EventArgs e) {
    //    int postID;
    //    if (Session["PostID"] != null && int.TryParse(Session["PostID"].ToString(), out postID)) {
    //        foreach (UploadedFile file in BlogPhotosUploadControl.UploadedFiles) {
    //            if (file.PostedFile.ContentLength > 0) {
    //                string name = Guid.NewGuid() + ".jpg";

    //                using (System.Drawing.Image img = System.Drawing.Image.FromStream(file.FileContent)) {
    //                    using (Bitmap cutted = ImageUtils.CutImage(img, 155, 140)) {
    //                        using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 7)) {
    //                            rounded.Save(MapPath(Settings.BlogImagesThumbsMedium) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
    //                        }
    //                    }

    //                    using (Bitmap cutted = ImageUtils.CreateThumbnail(img, 900, 800)) {
    //                        // TODO: Add watermark
    //                        cutted.Save(MapPath(Settings.BlogImagesFullSize) + name,
    //                            ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(100L));
    //                    }
    //                }

    //                BlogPhotoEntity entity = new BlogPhotoEntity();
    //                entity.Entity.BlogID = postID;
    //                entity.Entity.Name = name;
    //                entity.Create();
    //            }
    //        }
    //        ASPxPopupControl1.Windows[1].ShowOnPageLoad = false;
    //    }
    //}

    //protected void BlogGridView_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e) {
    //    // Delete post image
 
    //    try {
    //        string name = e.Values["Image"].ToString();
    //        File.Delete(MapPath(Settings.BlogImagesThumbsSmall) + name);
    //        File.Delete(MapPath(Settings.BlogImagesThumbsMedium) + name);
    //        File.Delete(MapPath(Settings.BlogImagesFullSize) + name);
    //    } catch { }

    //    // Removing blog photos
    //    int id = int.Parse(e.Values["BlogID"].ToString());

    //    BlogPhotoEntity blogPhotoEntity = new BlogPhotoEntity();

    //    // Delete files
    //    foreach (BlogPhoto photo in blogPhotoEntity.GetListByBlogID(id)) {
    //        try {
    //            File.Delete(MapPath(Settings.BlogImagesThumbsSmall) + photo.Name);
    //            File.Delete(MapPath(Settings.BlogImagesThumbsMedium) + photo.Name);
    //            File.Delete(MapPath(Settings.BlogImagesFullSize) + photo.Name);
    //        } catch { }
    //    }

    //    // Remove records from db
    //    blogPhotoEntity.DeleteByBlogID(id);
    //}
    
    //protected void BlogGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
    //    ASPxGridView grid = sender as ASPxGridView;
    //    ASPxHtmlEditor htmlEditor = BlogGridView.FindEditFormTemplateControl("TextHtmlEditor") as ASPxHtmlEditor;
    //    ASPxTextBox txtboxTitle = BlogGridView.FindEditFormTemplateControl("txtBoxTitle") as ASPxTextBox;
    //    ASPxTextBox txtH1 = BlogGridView.FindEditFormTemplateControl("txtH1") as ASPxTextBox;
    //    ASPxTextBox txtPlaceholder = BlogGridView.FindEditFormTemplateControl("txtPlaceholder") as ASPxTextBox;
    //    ASPxTextBox txtDescription = BlogGridView.FindEditFormTemplateControl("txtDescription") as ASPxTextBox;
    //    ASPxTextBox txtKeywords = BlogGridView.FindEditFormTemplateControl("txtKeywords") as ASPxTextBox;
    //    DropDownList ddlCategories = BlogGridView.FindEditFormTemplateControl("ddlCategories") as DropDownList;
    //    e.NewValues["Text"] = htmlEditor.Html;
    //    e.NewValues["MetaTitle"] = txtboxTitle.Text;
    //    e.NewValues["Header"] = txtH1.Text;
    //    e.NewValues["Placeholder"] = txtPlaceholder.Text;
    //    e.NewValues["MetaDescription"] = txtDescription.Text;
    //    e.NewValues["MetaKeywords"] = txtKeywords.Text;
    //    int categoryId = 0;
    //    if(Int32.TryParse(ddlCategories.SelectedValue, out categoryId))
    //        e.NewValues["BlogCategoryID"] = categoryId;
    //    e.NewValues["Url"] = SiteHelper.ConvertNameToUrl(txtH1.Text);
    //    BlogGridView.DataBind();
    //}

    //protected void Button2_Click(object sender, EventArgs e) {
    //    BlogEntity blogEntity = new BlogEntity();

    //    foreach (var blog in blogEntity.GetList()) {
    //        blog.Url = SiteHelper.ConvertNameToUrl(blog.Header);
    //    }

    //    blogEntity.Update();

    //    BlogGridView.DataBind();
    //}

}