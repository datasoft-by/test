<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainMenu.ascx.cs" Inherits="ArtumDesignLab.UI.Controls_MainMenu" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<ul class="nav">
	<%--<li><a href="<%= SiteHelper.GetWebPath("/") %>">Главная</a></li>--%>
	<li>
        <a>О нас</a>
		<ul class="second-level">
			<li><a href="<%= SiteHelper.GetWebPath("~/About.aspx") %>">Наша команда</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/News.aspx") %>">Новости</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/Blog.aspx") %>">Блог студии</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/Partners.aspx") %>">Партнеры</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/Responses.aspx") %>">Отзывы</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/Clients.aspx") %>">Клиенты</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/Vacancy.aspx") %>">Вакансии</a></li>
            <li><a rel="nofollow" href="http://praktika.artumstudio.ru">Курсы по дизайну интерьера</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/plagiat.aspx") %>">Плагиат</a></li>

		</ul>
	</li>
    <li>
        <a href="<%= SiteHelper.GetWebPath("~/DesignProject.aspx") %>">Дизайн-проект</a>
		<ul class="second-level">
			<li><a href="<%= SiteHelper.GetWebPath("~/pages/Example.aspx") %>">Состав дизайн-проекта</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/pages/Example.aspx") %>">Пример дизайн-проекта</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/pages/ZachemDizainProekt.aspx") %>">Зачем вам дизайн-проект?</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/pages/Rabotasklientom.aspx") %>">Работа с клиентом</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/pages/Advantages.aspx") %>">Наши преимущества</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/pages/Answers.aspx") %>">Ответы дизайнера</a></li>
		</ul>
    </li>
	<li>
		<a>Услуги</a>
		<ul class="second-level">
			<li><a href="<%= SiteHelper.GetWebPath("~/Services/Flat.aspx") %>">Дизайн проекты квартир</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/Services/House.aspx") %>">Дизайн проекты загородных домов</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/Services/Public.aspx") %>">Дизайн проекты общественных помещений</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/Services/Office.aspx") %>">Дизайн проекты офисов</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/Services/designproektsalonov.aspx") %>">Дизайн проекты салонов красоты</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/Services/designproektrestoranov.aspx") %>">Дизайн проекты ресторанов и кафе</a></li>
            <li><a href="<%= SiteHelper.GetWebPath("~/Services/arhproject.aspx.aspx") %>">Архитектурное проектирование</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/Services/avtorskij_nadzor.aspx") %>">Авторский надзор</a></li>
			<li><a href="<%= SiteHelper.GetWebPath("~/Services/remont.aspx") %>">Ремонт под ключ</a></li>
            <%--<li><a href="<%= SiteHelper.GetWebPath("~/Services/Elitmebel.aspx") %>">Изготовление эксклюзивной мебели из массива</a></li>--%>
			<%--<li><a href="<%= SiteHelper.GetWebPath("~/Services/Faq_interior.aspx") %>">Часто задаваемые вопросы</a></li>--%>
		</ul>
	</li>
    <li><a href="<%= SiteHelper.GetWebPath("~/Prices.aspx") %>">Цены</a></li>
    <li><a href="<%= SiteHelper.GetWebPath("~/Responses.aspx") %>">Отзывы</a></li>
	<li>
		<a>Портфолио</a>
		<ul class="second-level">
			<li><a href="http://www.artumstudio.ru/portfolio/interery_kvartir">Интерьеры квартир</a></li>
			<li><a href="http://www.artumstudio.ru/portfolio/interery_zagorodnyx_domov">Интерьеры загородных домов</a></li>			
			<li><a href="http://www.artumstudio.ru/portfolio/interery_ofisov">Интерьеры офисов</a></li>    
            <li><a href="http://www.artumstudio.ru/portfolio/interery_restoranov_kafe_barov">Интерьеры ресторанов и кафе</a></li>    
            <li><a href="http://www.artumstudio.ru/portfolio/interery_salonov_krasoty">Интерьеры салонов красоты</a></li>               		
            
			<%--<li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?cat=1" %>">Мебель по индивидуальным проектам</a></li>--%>
            <%--<li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?cat=2" %>">Мебель из массива на заказ</a></li>--%>
		</ul>
	</li>
    <li><a href="<%= SiteHelper.GetWebPath("~/Contacts.aspx") %>">Контакты</a></li>
</ul>