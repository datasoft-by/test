<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FurnitureInfo.ascx.cs" Inherits="Controls_FurnitureInfo" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<div class="side-nav-holder">
	    <div class="side-nav-header">
		    <h4>Мебель из массива</h4>
	    </div>
	    <div class="side-nav-block">
		    <ul class="side-nav">
                <div>

                	<li><a href="<%= SiteHelper.GetWebPath("~/Mebel/BasePrices.aspx") %>">Базовая стоимость изделий</a></li>
			        <li><a href="<%= SiteHelper.GetWebPath("~/Mebel/Otdelka.aspx")%>">Способы отделки</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Mebel/Derevo.aspx") %>">Породы древесины</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Mebel/Advantages.aspx") %>">Наши преимущества</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Mebel/Possibilities.aspx")  %>">Наши возможности</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Mebel/MebelFactory.aspx") %>">Мебельное производство</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Services/faq_mebel.aspx") %>">FAQ</a></li>
                </div>
		    </ul>
	    </div>
    </div> 