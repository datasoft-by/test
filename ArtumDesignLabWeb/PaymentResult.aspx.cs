using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using System.Net.Mail;
using System.Globalization;

public partial class PaymentResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // your registration data 
        string sMrchPass2 = Settings.RobokassaPassword2; 
        // HTTP parameters 
        string sOutSum = GetPrm("OutSum");
        string sInvId = GetPrm("InvId");
        string sCrc = GetPrm("SignatureValue");
        string sCrcBase = string.Format("{0}:{1}:{2}", sOutSum, sInvId, sMrchPass2);
        // build own CRC 
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        byte[] bSignature = md5.ComputeHash(Encoding.ASCII.GetBytes(sCrcBase));
        StringBuilder sbSignature = new StringBuilder();
        foreach (byte b in bSignature) sbSignature.AppendFormat("{0:x2}", b);
        string sMyCrc = sbSignature.ToString();
        if (sMyCrc.ToUpper() != sCrc.ToUpper())
        {
            Response.Write("bad sign");
            return;
        }
        Response.Write(string.Format("OK{0}", sInvId));
        // perform some action (change order state to paid)
        
        int id = 0;
        if (Int32.TryParse(sInvId, out id))
        {
            CoursesEntity entity = new CoursesEntity();
            entity.Read(id);
            entity.Entity.PaymentDate = DateTime.Now;
            entity.Entity.TransactionId = sInvId;
            int summ = 0;
            if (Int32.TryParse(sOutSum, NumberStyles.AllowDecimalPoint, CultureInfo.InvariantCulture, out summ))
            {
                entity.Entity.Summ = summ;
            }

            entity.Update();

            string[] coursesName = { "", "3-х часовой Мастер-Класс", "Стандартный курс - 16 ак. часов", "Расширенный курс - 40 ак. часов" };
            try
            {
                MailSender mail = new MailSender();
                mail.Message.To.Add(new MailAddress(entity.Entity.Email));
                mail.Message.From = new MailAddress(MailConfig.GetFromAddress());
                mail.Message.Subject = "Извещение об оплате курсов";

                mail.Message.Body = String.Format("Добрый день, Вы оплатили курс \"{0}\" в размере {1} руб. В день начала курсов за 1 час Вам придет ссылка на вебинар и напоминание за один день до курсов.",
                    coursesName[entity.Entity.CourseNumber],
                    entity.Entity.Summ);
                mail.SendMail();
            }
            catch (Exception) { }
        }


    }

    private string GetPrm(string sName)
    {
        string sValue = HttpContext.Current.Request.Form[sName] as string;
        if (string.IsNullOrEmpty(sValue))
            sValue = HttpContext.Current.Request.QueryString[sName] as string;
        if (string.IsNullOrEmpty(sValue))
            sValue = String.Empty; 
        return sValue;
    }

}