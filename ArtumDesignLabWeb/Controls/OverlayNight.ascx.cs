using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using ArtumDesignLab.Utils;

public partial class Controls_OverlayNight : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkSend_Click(object sender, EventArgs e)
    {
        RequestHelper.SendLead(
           "заказ yjxyjq crblrb",
           SearchUtils.GetSearchTypeAsString(Session["SearchType"] as SearchType?),
           Session["SearchKeyword"] != null
               ? Session["SearchKeyword"].ToString()
               : Session["Referer"] != null
                   ? Session["Referer"].ToString()
                   : String.Empty,
           String.Format("Тел: {0}<br />город: {1}", txtPhone.Value, Session["CityToEmail"]),
           txtName.Value,
           Session["Referer"] != null ? String.Format("Реферрер: {0}", Session["Referer"]) : String.Empty);

        if (!String.IsNullOrEmpty(txtPhone.Value))
        {
            if (String.IsNullOrEmpty(txtName.Value))
                txtName.Value = "";
            if (String.IsNullOrEmpty(txtTime.Value))
                txtTime.Value = "";

            string[] strReplies = MailConfig.GetMailListForSend();
            foreach (string str in strReplies)
            {
                try
                {
                    MailSender mail = new MailSender();
                    mail.Message.To.Add(new MailAddress(str));
                    mail.Message.From = new MailAddress(MailConfig.GetFromAddress());
                    mail.Message.Subject = "С сайта artumstudio.ru заказана ночная скидка";
                    mail.Message.Body = String.Format("Заказана ночная скидка - пользователь: {0}<br />Телефон: {1}<br />Время для звонка: {2}<p>Время: {3}</p><p></p>Текст был отправлен с IP адреса {4} через браузер {5}, со страницы {6}<br />{7}",
                        txtName.Value, 
                        txtPhone.Value, 
                        txtTime.Value, 
                        DateTime.Now, 
                        Request.UserHostAddress, 
                        Request.UserAgent, 
                        Request.RawUrl,
                    SearchUtils.GetStatisticsInfo(
                        Session["SearchType"] as SearchType?,
                        Session["Referer"] as Uri,
                        Session["SearchUrl"] as Uri,
                        String.Format("{0}<br />Referrer: {1}", Request.Url, Session["Referer"] != null ? Session["Referer"].ToString() : "")));
                    mail.SendMail();

                }
                catch (Exception /*ex*/) { }
            }

             Response.Redirect("http://www.artumstudio.ru/thankyou");
        }
    }
}