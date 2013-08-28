using System;
using System.Drawing;
using ArtumDesignLab.Utils;

public partial class Image : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bitmap bmp = new Bitmap(MapPath("~/Source.jpg"));
        using (Bitmap b = ImageUtils.CreateRoundedImage(bmp, 10, Color.White))
        {
            b.Save(MapPath("~/SourceOut.jpg"), ImageUtils.GetJpegEncoder(), ImageUtils.GetEncoderJpegQuality(100L));
        }
    }
}