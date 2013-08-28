using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Utils;
using System.Net.Mail;
using ArtumDesignLab.Biz;
using System.Text.RegularExpressions;

public partial class pages_Answers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindQuestions();
        }
    }

    private void BindQuestions()
    {
        QuestionEntity entity = new QuestionEntity();
        var questions = entity.GetListForSite().ToArray();
        lvQuestion.DataSource = questions;
        lvQuestion.DataBind();
        
        dpgPager.Visible = dpgPager.TotalRowCount > dpgPager.PageSize;

    }
    protected void LinkButtonQuestion_Click(object sender, EventArgs e)
    {
        QuestionEntity entity = new QuestionEntity();
        entity.Entity.Date = DateTime.Now;
        entity.Entity.Email = txtEmail.Text.Trim();
        entity.Entity.Phone = txtPhone.Text.Trim();
        entity.Entity.QuestionText = SiteHelper.nl2br(txtQuestion.Text.Trim());
        entity.Entity.Name = txtName.Text.Trim();
        entity.Create();
        
        //RequestHelper.SendLead(
        //   "заказ консультации дизайнера",
        //   SearchUtils.GetSearchTypeAsString(Session["SearchType"] as SearchType?),
        //   Session["SearchKeyword"] != null
        //       ? Session["SearchKeyword"].ToString()
        //       : Session["Referer"] != null
        //           ? Session["Referer"].ToString()
        //           : String.Empty,
        //   String.Format("Тел: {0}<br />город: {1}", txtPhone.Text, Session["CityToEmail"]),
        //   txtName.Text,
        //   String.Format("<br />Страница: {0}", Request.RawUrl));

        //string[] strReplies = MailConfig.GetMailListForSend();
        //foreach (string str in strReplies)
        //{
        //    try
        //    {
        //        MailSender mail = new MailSender();
        //        mail.Message.To.Add(new MailAddress(str));
        //        mail.Message.From = new MailAddress(MailConfig.GetFromAddress());
        //        mail.Message.Subject = "С сайта artumstudio.ru заказана консультация дизайнера";

        //        mail.Message.Body = String.Format("Со страницы снизу - Пользователь: {0}<br />Город: {1}<br />Телефон: {2}<br />Вопрос: {3}<br /><p>Время: {4}</p><p></p>Текст был отправлен с IP адреса {5} через браузер {6}, со страницы {7}<br />{8}",
        //            txtName.Text,
        //            Session["CityToEmail"] as string,
        //            txtPhone.Text,
        //            txtQuestion.Text,
        //            DateTime.Now,
        //            Request.UserHostAddress,
        //            Request.UserAgent,
        //            Request.RawUrl,
        //             SearchUtils.GetStatisticsInfo(
        //                Session["SearchType"] as SearchType?,
        //                Session["Referer"] as Uri,
        //                Session["SearchUrl"] as Uri,
        //                String.Format("{0}<br />Referrer: {1}", Request.Url, Session["Referer"] != null ? Session["Referer"].ToString() : "")));
        //        mail.SendMail();
        //    }
        //    catch (Exception) { }
        //}

        Response.Redirect("http://www.artumstudio.ru/thankyou");
    }

    protected void lvQuestion_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpgPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        BindQuestions();
    }
    
    protected void lvwItems_DataBound(object sender, EventArgs e)
    {
        // this check is important to avoid touching the Hyperlinks if the Pager doesn't configured to use Query string Field
        if (string.IsNullOrEmpty(dpgPager.QueryStringField))
            return;

        foreach (DataPagerFieldItem item in dpgPager.Controls)
        {
            foreach (Control control in item.Controls)
            {
                HyperLink link = control as HyperLink;

                if (link == null) continue;

                string pageNumber = Regex.Match(link.NavigateUrl, @"\d+$").Value;
                link.NavigateUrl = SiteHelper.GetWebPath(string.Format("pages/answers/{0}-{1}", dpgPager.QueryStringField, pageNumber));
            }
        }
    }
}