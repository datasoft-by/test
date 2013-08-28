<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FurniturePortfolio.ascx.cs" Inherits="Controls_FurniturePortfolio" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>
<div class="side-nav-holder">
	    <div class="side-nav-header">
		    <h4>Наши работы</h4>
	    </div>
	    <div class="side-nav-block" style="margin-bottom: 10px;">
		    <ul class="side-nav">
                <div>
			        <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=2&cat=2" %>">Стеновые панели</a></li>
			        <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=3&cat=2" %>">Арки, балки, порталы из массива</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=4&cat=2" %>">Кабинеты</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=5&cat=2" %>">Комоды, тумбы</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=6&cat=2" %>">Шкафы, витрины</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=7&cat=2" %>">Отделка потолков</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=8&cat=2" %>">Столы</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=9&cat=2" %>">Двери</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=10&cat=2" %>">Стулья</a></li>                
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=11&cat=2" %>">Столярные изделия</a></li>  
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?id=12&cat=2" %>">Лестницы</a></li>  
                </div>
		    </ul>
	    </div>
    </div>



