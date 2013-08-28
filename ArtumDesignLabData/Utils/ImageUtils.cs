using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace ArtumDesignLab.Utils
{
    public static class ImageUtils
    {
        public static Bitmap CreateRoundedImage(System.Drawing.Image source, int radius, Color borderColor)
        {
            int width = source.Width;
            int height = source.Height;

            Bitmap bmp = new Bitmap(width, height);

            using (Graphics graphic = Graphics.FromImage(bmp))
            {
                int d = 2 * radius;
                GraphicsPath path = new GraphicsPath();
                path.StartFigure();
                path.AddArc(0, 0, d, d, 180, 90); // left top corner
                path.AddArc(width - d, 0, d, d, -90, 90); // right top corner
                path.AddArc(width - d, height - d, d, d, 0, 90); // right bottom corner
                path.AddArc(0, height - d, d, d, 90, 90); // left bottom corner
                path.CloseFigure();

                TextureBrush texture = new TextureBrush(source);
                texture.WrapMode = System.Drawing.Drawing2D.WrapMode.Clamp;

                graphic.SmoothingMode = SmoothingMode.HighQuality;
                graphic.PixelOffsetMode = PixelOffsetMode.Half;
                
                graphic.FillRectangle(new SolidBrush(Color.Transparent), 0, 0, width, height);

                graphic.FillPath(texture, path);

                GraphicsPath penPath = new GraphicsPath();
                penPath.StartFigure();
                penPath.AddArc(0, 0, d, d, 180, 90); // left top corner
                penPath.AddArc(width - d, 0, d, d, -90, 90); // right top corner
                penPath.AddArc(width - d, height - d, d, d, 0, 90); // right bottom corner
                penPath.AddArc(0, height - d, d, d, 90, 90); // left bottom corner
                penPath.CloseFigure();

                using (Pen pen = new Pen(borderColor, 1f))
                {
                    graphic.DrawPath(pen, path);
                }
            }

            return bmp;
        }

        public static Bitmap CreateRoundedImage(System.Drawing.Image source, int radius)
        {
            return CreateRoundedImage(source, radius, Color.Transparent);
        }

        public static Bitmap CutImage(System.Drawing.Image source, int nWidth, int nHeight)
        {
            int sWidth = source.Width;
            int sHeight = source.Height;

            double sourceRation = (double)source.Width / source.Height;
            double newRatio = (double)nWidth / nHeight;

            Bitmap bmp;
            int newWidth, newHeight;

            if (newRatio > sourceRation)
            {
                // Crop to width 
                newWidth = sWidth;
                newHeight = (int)((double)sWidth * nHeight / nWidth);
                bmp = new Bitmap(newWidth, newHeight);
            }
            else
            {
                // Crop to height
                newWidth = (int)((double)sHeight * nWidth / nHeight);
                newHeight = sHeight;
                bmp = new Bitmap(newWidth, newHeight);
            }

            // Crop image
            using (Graphics graphic = Graphics.FromImage(bmp))
            {               
                graphic.FillRectangle(new SolidBrush(Color.Transparent), 0, 0, newWidth, newHeight);
                graphic.DrawImageUnscaledAndClipped(source, new Rectangle(0, 0, newWidth , newHeight));
            }

            Bitmap outBmp = new Bitmap(nWidth, nHeight);

            // Crop image
            using (Graphics graphic = Graphics.FromImage(outBmp))
            {
                graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                graphic.SmoothingMode = SmoothingMode.HighQuality;

                graphic.FillRectangle(new SolidBrush(Color.Transparent), 0, 0, newWidth, newHeight);
                graphic.DrawImage(bmp, 0, 0, nWidth, nHeight);
            }

            bmp.Dispose();

            return outBmp;
        }

        public static Bitmap AddWatermark(Bitmap image, string pathToWatermark)
        {
            const int padRight = 5;
            const int padBottom = 5;

            Graphics graphics = Graphics.FromImage(image);
            System.Drawing.Bitmap watermark = new System.Drawing.Bitmap(pathToWatermark);

            int wx = image.Width - watermark.Width - padRight;
            int wy = image.Height - watermark.Height - padBottom;
            graphics.DrawImage(watermark, new Point(wx, wy));

            return image;
        }

        public static Bitmap CreateThumbnail(System.Drawing.Image source, int nWidth, int nHeight)
        {
            int sWidth = source.Width;
            int sHeight = source.Height;

            int newWidth, newHeight;

            if (sWidth >= nWidth)
            {
                // Crop to width 
                newWidth = nWidth;
                newHeight = (int)((double)sHeight * nWidth / sWidth);                
            }
            else if (sHeight >= nHeight)
            {
                // Crop to height
                newWidth = (int)((double)sWidth * nHeight / sHeight);
                newHeight = nHeight;
            }
            else
            {
                return new Bitmap(source);
            }

            Bitmap bmp = new Bitmap(newWidth, newHeight);

            // Crop image
            using (Graphics graphic = Graphics.FromImage(bmp))
            {
                graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                graphic.SmoothingMode = SmoothingMode.HighQuality;

                graphic.FillRectangle(new SolidBrush(Color.Transparent), 0, 0, newWidth, newHeight);
                graphic.DrawImage(source, 0, 0, newWidth, newHeight);
            }

            return bmp;            
        }        

        public static EncoderParameters GetEncoderJpegQuality(long quality)
        {
            System.Drawing.Imaging.Encoder encoder = System.Drawing.Imaging.Encoder.Quality;
            EncoderParameters encoderParameters = new EncoderParameters(1);

            EncoderParameter encoderParameter = new EncoderParameter(encoder, quality);
            encoderParameters.Param[0] = encoderParameter;

            return encoderParameters;
        }

        public static ImageCodecInfo GetEncoder(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();

            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }

        public static ImageCodecInfo GetJpegEncoder()
        {
            return GetEncoder(ImageFormat.Jpeg);
        }

    }
}