using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Globalization;
using ArtumDesignLab.Utils;
using ArtumDesignLab.Biz;
using System.Configuration;

public partial class Controls_Robokassa : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        litTitle.Text = "Оплата " + CourseText;
    }
    protected void LinkButtonPay_Click(object sender, EventArgs e)
    {
        int courseNumber = 0;
        Int32.TryParse(CourseNumber, out courseNumber);
        string settigsKey = String.Concat("CourseCost", CourseNumber);
        string cost = ConfigurationManager.AppSettings.Get(settigsKey);
        
        decimal nOutSum = 0;
        decimal.TryParse(cost, out nOutSum);
        string sOutSum = nOutSum.ToString("0.00", CultureInfo.InvariantCulture);

        CoursesEntity entity = new CoursesEntity();
        entity.Entity.Name = txtName.Text.Trim();
        entity.Entity.Surname = txtSurname.Text.Trim();
        entity.Entity.Phone = txtPhone.Text.Trim();
        entity.Entity.Email = txtEmail.Text.Trim();
        entity.Entity.CouponNumber = txtNumber.Text.Trim();
        entity.Entity.ReferenceSource = txtSource.Text.Trim();
        entity.Entity.CourseNumber = courseNumber;
        int courseId = entity.Insert();
        ClearControls();

        string sCrcBase = string.Format("{0}:{1}:{2}:{3}", Settings.RobokassaLogin, sOutSum, courseId, Settings.RobokassaPassword1); 
 
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider(); 
        byte[] bSignature = md5.ComputeHash(Encoding.ASCII.GetBytes(sCrcBase)); 
        StringBuilder sbSignature = new StringBuilder(); 
        foreach (byte b in bSignature) 
            sbSignature.AppendFormat("{0:x2}", b); 
        string sCrc = sbSignature.ToString(); 
 
        Response.Redirect(
            String.Concat(
                Settings.RobokassaUrl,
                "?MrchLogin=", Settings.RobokassaLogin,
                "&OutSum=", sOutSum,
                "&InvId=", courseId,
                "&Desc=", String.Format("оплата курса \"{0}\"", CourseText), 
                "&SignatureValue=", sCrc)); 
    }

    private void ClearControls()
    {
        txtName.Text = String.Empty;
        txtSurname.Text = String.Empty;
        txtPhone.Text = String.Empty;
        txtEmail.Text = String.Empty;
        txtNumber.Text = String.Empty;
        txtSource.Text = String.Empty;
    }
    
    public string CourseNumber { get; set; }
    public string CourseText { get; set; }
}