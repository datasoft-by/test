﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Utils;
using System.Net.Mail;

public partial class Controls_CallOrder : UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButtonOrder_Click(object sender, EventArgs e)
    {
        RequestHelper.SendLead(
            "запрос на обратный звонок",
            SearchUtils.GetSearchTypeAsString(Session["SearchType"] as SearchType?),
            Session["SearchKeyword"] != null
                ? Session["SearchKeyword"].ToString()
                : Session["Referer"] != null
                    ? Session["Referer"].ToString()
                    : String.Empty,
            String.Format("Тел: {0}<br />город: {1}", txtPhone.Text, Session["CityToEmail"]),
            txtName.Text,
            String.Format("<br />Страница: {0}", Request.RawUrl));

        string[] strReplies = MailConfig.GetMailListForSend();
        foreach (string str in strReplies)
        {
            try
            {
                MailSender mail = new MailSender();
                mail.Message.To.Add(new MailAddress(str));
                mail.Message.From = new MailAddress(MailConfig.GetFromAddress());
                mail.Message.Subject = "С сайта artumstudio.ru заказан звонок " + Session["CityToEmail"];

                mail.Message.Body = String.Format("Со страницы сверху - пользователь: {0}<br />Город: {1}<br />Телефон: {2}<br /><p>Время: {3}</p><p></p>Текст был отправлен с IP адреса {4} через браузер {5}, со страницы {6}<br />{7}",
                    txtName.Text,
                    Session["CityToEmail"] as string,
                    txtPhone.Text,
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
                litTitle.Text = "Спасибо! Мы вам обязательно перезвоним!";
            }
            catch (Exception /*ex*/) { }
        }

        Response.Redirect("http://www.artumstudio.ru/thankyou");
    }

}