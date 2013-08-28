using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;

public partial class Controls_SpecialOfferSide : System.Web.UI.UserControl
{
    public string strHeader;
    public string Header
    {
        get { return strHeader; }
        set { strHeader = value; }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //ltrHeader.Text = "Планировочное решение – бесплатно!";
        if (!IsPostBack)
        {
            SpecialOfferEntity entity = new SpecialOfferEntity();
            ArtumDesignLab.SpecialOffer offer = entity.GetFirst();
            //if (String.IsNullOrEmpty(strHeader))
            //else
            //    ltrHeader.Text = strHeader;


            //if (offer != null)
            //{
            //    ltrDiscount.Text = SiteHelper.ParseTextWithCustomTag(offer.Discount);
            //    ltrDescription.Text = offer.Description;
            //    ltrNewPrice.Text = SiteHelper.ParseTextWithCustomTag(offer.NewPrice);
            //    //ltrOldPrice.Text = SiteHelper.ParseTextWithCustomTag(offer.OldPrice);
            //}

            CustomDataEntity dataEntity = new CustomDataEntity();
            string date = dataEntity.GetValueByName("SpecialOfferEndDate");
            DateTime endDate;
            if (DateTime.TryParse(date, out endDate))
            {
                long remainTicks = endDate.Ticks - DateTime.Now.Ticks;
                //int howdays = (DateTime.Now - endDate).Days;
                //int d = ((((int)(((DateTime.Now - endDate).Days) / 4)) + 1) * 4) - ((DateTime.Now - endDate).Days);
                DateTime remain;
                if (remainTicks > 0)
                {
                    remain = new DateTime(DateTime.Now.Year, endDate.Month, endDate.Day);
                    //ltrDay.Text = remain.Day.ToString("D2");
                    //ltrHour.Text = remain.Hour.ToString("D2");
                    //ltrMin.Text = remain.Minute.ToString("D2");
                    //ltrSec.Text = remain.Second.ToString("D2");
                }
                else
                {
                    int d = ((((int)(((DateTime.Now - endDate).Days) / 4)) + 1) * 4) - ((DateTime.Now - endDate).Days);
                    remain = new DateTime(DateTime.Now.AddDays(d).Year, DateTime.Now.AddDays(d).Month, DateTime.Now.AddDays(d).Day);
                }
                ltrDay.Text = (remain - DateTime.Now).Days.ToString("D2");
                ltrHour.Text = (remain - DateTime.Now).Hours.ToString("D2");
                ltrMin.Text = (remain - DateTime.Now).Minutes.ToString("D2");
                ltrSec.Text = (remain - DateTime.Now).Seconds.ToString("D2");
            }
        }
    }
}