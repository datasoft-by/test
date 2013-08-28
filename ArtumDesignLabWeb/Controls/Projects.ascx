<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Projects.ascx.cs" Inherits="ArtumDesignLab.UI.Controls_Projects" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<div class="project-list-holder">
	<ul class="project-list">
		<li class="project-01"><a href="<%= SiteHelper.GetWebPath("~/Services/Flat.aspx") %>">Дизайн-проекты квартир</a></li>
		<li class="project-02"><a href="<%= SiteHelper.GetWebPath("~/Services/House.aspx") %>">Дизайн-проекты загородных домов</a></li>
		<li class="project-03"><a href="<%= SiteHelper.GetWebPath("~/Services/Public.aspx") %>">Дизайн-проекты общественных помещений</a></li>
		<li class="project-04"><a href="<%= SiteHelper.GetWebPath("~/Services/Office.aspx") %>">Дизайн-проекты офисов</a></li>
		<li class="project-05"><a href="<%= SiteHelper.GetWebPath("~/Services/Elitmebel.aspx") %>">Мебель на заказ из массива</a></li>
		<li class="project-06"><a href="<%= SiteHelper.GetWebPath("~/Services/Podbor.aspx") %>">Подбор отделочных материалов</a></li>
	</ul>
</div>