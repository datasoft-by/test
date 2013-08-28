using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using ArtumDesignLab.Utils;

public partial class PaymentSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // your registration data 
        string sMrchPass1 = Settings.RobokassaPassword1;
        // HTTP parameters 
        string sOutSum = GetPrm("OutSum");
        string sInvId = GetPrm("InvId");
        string sCrc = GetPrm("SignatureValue");
        string sCrcBase = string.Format("{0}:{1}:{2}", sOutSum, sInvId, sMrchPass1);
        // build own CRC 
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        byte[] bSignature = md5.ComputeHash(Encoding.ASCII.GetBytes(sCrcBase));
        StringBuilder sbSignature = new StringBuilder();
        foreach (byte b in bSignature)
            sbSignature.AppendFormat("{0:x2}", b);
        string sMyCrc = sbSignature.ToString();
        if (sMyCrc.ToUpper() != sCrc.ToUpper())
            lResult.Text = "Оплата не проведена";
        else
            // you can check here, that ResultURL was called 
            // (for better security) 
            // OK, payment proceeds 
            lResult.Text = "Оплата произведена успешно";
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