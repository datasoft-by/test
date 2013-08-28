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
    public partial class SpecialOffer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            ResponceEntity entity = new ResponceEntity();
            entity.Entity.Name = TextBoxName.Text;
            entity.Entity.Position = int.Parse(TextBoxPosition.Text);
            entity.Entity.Post = TextBoxPost.Text;
            entity.Entity.Contacts = TextBoxContacts.Text;
            entity.Entity.Email = TextBoxEmail.Text;
            entity.Entity.Facebook = TextBoxFacebook.Text;
            entity.Entity.Twitter = TextBoxTwitter.Text;
            entity.Entity.Vkontakte = TextBoxVkotakte.Text;
            entity.Entity.Text = TextBoxResponce.Text;

            if (FileUploadPhoto.HasFile)
            {
                string name = Guid.NewGuid() + ".jpg";
                using (System.Drawing.Image img = System.Drawing.Image.FromStream(FileUploadPhoto.FileContent))
                {
                    using (Bitmap cutted = ImageUtils.CutImage(img, 88, 72))
                    {
                        using (System.Drawing.Image rounded = ImageUtils.CreateRoundedImage(cutted, 7))
                        {
                            rounded.Save(MapPath(Settings.ResponcesImagesThumbs) + name, ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(80L));
                        }
                    }                    
                }
                entity.Entity.Image = name;
            }

            entity.Create();

            ClearAll();
            BindData();
        }

        private void ClearAll()
        {
            TextBoxName.Text = "";
            TextBoxPosition.Text = "";
            TextBoxPost.Text = "";
            TextBoxEmail.Text = "";
            TextBoxTwitter.Text = "";
            TextBoxVkotakte.Text = "";
            TextBoxResponce.Text = "";
            TextBoxContacts.Text = "";
        }

        private void BindData()
        {
            ResponsesGridView.DataBind();
        }
    }
}
