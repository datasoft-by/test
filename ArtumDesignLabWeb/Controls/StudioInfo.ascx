<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudioInfo.ascx.cs" Inherits="Controls_StudioInfo" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<div class="portfolio-block">
	<h3>Студия</h3>
	<ul class="portfolio-list">
		<li><a href="<%= SiteHelper.GetWebPath("~/About.aspx") %>">Мы и наши преимущества</a></li>
		<li><a href="<%= SiteHelper.GetWebPath("~/News.aspx") %>">Новости</a></li>
		<li><a href="<%= SiteHelper.GetWebPath("~/Blog.aspx") %>">Блог студии</a></li>
		<li><a href="<%= SiteHelper.GetWebPath("~/Partners.aspx") %>">Партнеры</a></li>
        <li><a href="<%= SiteHelper.GetWebPath("~/Responses.aspx") %>">Отзывы</a></li>
		<li><a href="<%= SiteHelper.GetWebPath("~/Clients.aspx") %>">Клиенты</a></li>
        <li><a href="<%= SiteHelper.GetWebPath("~/Vacancy.aspx") %>">Вакансии</a></li>
        <%-- <li><a href="<%= SiteHelper.GetWebPath("~/MebelFactory.aspx") %>">Мебельное производство</a></li>--%>
	</ul>
</div>