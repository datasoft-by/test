<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DesignProjectInfo.ascx.cs" Inherits="Controls_DesignProjectInfo" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<div class="portfolio-block">
	<h3>Дизайн проект</h3>
	<ul class="portfolio-list">
        <li><a href="<%= SiteHelper.GetWebPath("~/DesignProject.aspx") %>">Дизайн проект</a></li>
        <li><a href="<%= SiteHelper.GetWebPath("~/pages/Example.aspx") %>">Состав дизайн-проекта</a></li>
		<li><a href="<%= SiteHelper.GetWebPath("~/Prices.aspx") %>">Стоимость проекта</a></li>
<%--        <li><a href="<%= SiteHelper.GetWebPath("~/pages/Advantages.aspx") %>">Преимущества работы с нами</a></li>
        <li><a href="<%= SiteHelper.GetWebPath("~/pages/Rabotasklientom.aspx")  %>">Работа с клиентом</a></li>
        <li><a href="<%= SiteHelper.GetWebPath("~/pages/ZachemDizainProekt.aspx") %>">Зачем вам нужен дизайн-проект?</a></li>
        <li><a href="<%= SiteHelper.GetWebPath("~/pages/Dogovor.aspx") %>">Договор на дизайн-проект</a></li>
        <li><a href="<%= SiteHelper.GetWebPath("~/Services/Faq_interior.aspx") %>">FAQ</a></li>--%>
	</ul>
</div>