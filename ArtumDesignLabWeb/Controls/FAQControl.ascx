<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FAQControl.ascx.cs" Inherits="Controls_FAQControl" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<div class="side-nav-holder">
	    <div class="side-nav-header">
		    <h4>FAQ</h4>
	    </div>
        <div style="margin-bottom: 10px;" class="side-nav-block">
		    <ul class="side-nav">
                <div>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Services/Faq_interior.aspx") %>">FAQ - Дизайн интерьера</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Services/Faq_mebel.aspx") %>">FAQ - Мебель на заказ</a></li>
                </div>
		    </ul>
	    </div>
    </div> 