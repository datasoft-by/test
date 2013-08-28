using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using System.IO;
using System.Drawing.Imaging;

namespace ArtumDesignLab.Admin
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            NewEntity newsEntity = new NewEntity();

            newsEntity.Entity.Date = DateTime.Now;
            newsEntity.Entity.Header = txtNewsHeader.Text;
            newsEntity.Entity.Url = SiteHelper.ConvertNameToUrl(txtNewsHeader.Text);
            newsEntity.Entity.Text = htmlEditor.Html;

            if (!string.IsNullOrEmpty(txtNewsDate.Text))
                newsEntity.Entity.Date = DateTime.Parse(txtNewsDate.Text);

            if (upcImage.HasFile)
            {
                string name = Guid.NewGuid() + ".jpg";
                using (System.Drawing.Image img = System.Drawing.Image.FromStream(upcImage.FileContent))
                {
                    // Thumbnail medium
                    using (Bitmap cutted = ImageUtils.CutImage(img, 192, 108))
                    {
                        using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 7))
                        {
                            rounded.Save(MapPath(Settings.NewsImagesThumbs) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                        }
                    }                    
                }

                using (System.Drawing.Image img = System.Drawing.Image.FromStream(upcImage.FileContent))
                {
                    using (Bitmap cutted = ImageUtils.CutImage(img, 624, 214))
                    {
                        using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 5))
                        {
                            rounded.Save(MapPath(Settings.NewsImagesFull) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                        }
                    }
                }
                newsEntity.Entity.Image = name;
            }
            newsEntity.Create();
            ClearAll();
            BindNews();
        }
        private void ClearAll()
        {
            txtNewsHeader.Text = "";
            txtNewsDate.Text = "";
            htmlEditor.Html = "";
        }
        private void BindNews()
        {
            NewsGridView.DataBind();
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int iNewsId;
            int.TryParse(lblId.Text, out iNewsId);
            if (iNewsId > 0)
            {
                NewEntity newsEntity = new NewEntity();
                newsEntity.Read(iNewsId);
                newsEntity.Entity.Header = txtNewsHeader.Text;
                newsEntity.Entity.Text = htmlEditor.Html;
                newsEntity.Entity.Date = DateTime.Parse(txtNewsDate.Text);

                newsEntity.Update();
                ClearAll();
                BindNews();
            }
        }      

        protected void NewsGridView_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            if (e.AffectedRecords == 1)
            {
                // Delete image
                string name = e.Values["Image"].ToString();
                string path = MapPath(Settings.NewsImagesThumbs) + name;

                if (File.Exists(path))
                {
                    File.Delete(path);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            NewEntity newsEntity = new NewEntity();

            foreach (var nNew in newsEntity.GetList())
                nNew.Url = SiteHelper.ConvertNameToUrl(nNew.Header);

            newsEntity.Update();

            NewsGridView.DataBind();
        }
    }
}
