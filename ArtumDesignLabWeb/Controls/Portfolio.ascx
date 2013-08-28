<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Portfolio.ascx.cs" Inherits="Controls_Portfolio" %>
<%@ Import Namespace="ArtumDesignLab.Utils"%>

<div class="portfolio-block">
	<h3>Портфолио:</h3>
	<ul class="portfolio-list">
			<li><a href="http://www.artumstudio.ru/portfolio/interery_kvartir">Интерьеры квартир</a></li>
			<li><a href="http://www.artumstudio.ru/portfolio/interery_zagorodnyx_domov">Интерьеры загородных домов</a></li>			
			<li><a href="http://www.artumstudio.ru/portfolio/interery_ofisov">Интерьеры офисов</a></li>    
            <li><a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov">Интерьеры ресторанов и кафе</a></li>    
            <li><a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty">Интерьеры салонов красоты</a></li>           
        <%--<li><span>Мебель на заказ</span>
			<ul class="second-level">
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
			</ul>
		</li> --%>
	</ul>
</div>