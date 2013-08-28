<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="500.aspx.cs" Inherits="_505" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="basicContent" Runat="Server">
    <div class="simple-text">
	    <h1>К сожалению ваша страница не найдена!</h1>
        <div class="simple-text">
            <p>Мы обновляем наш сайт, поэтому некоторые страницы могут отображаться некорректно. Для вашего удобства, можете воспользоваться картой сайта:</p>
            <h3>Студия</h3>
            <ul>
				<li><a href="<%= SiteHelper.GetWebPath("~/About.aspx") %>">Мы и наши преимущества</a></li>
				<li><a href="<%= SiteHelper.GetWebPath("~/News.aspx") %>">Новости</a></li>
				<li><a href="<%= SiteHelper.GetWebPath("~/Blog.aspx") %>">Блог студии</a></li>
				<li><a href="<%= SiteHelper.GetWebPath("~/Partners.aspx") %>">Партнеры</a></li>
                <li><a href="<%= SiteHelper.GetWebPath("~/Responses.aspx") %>">Отзывы</a></li>
				<li><a href="<%= SiteHelper.GetWebPath("~/Clients.aspx") %>">Клиенты</a></li>
                <li><a href="<%= SiteHelper.GetWebPath("~/Garanty.aspx") %>">Гарантии</a></li>
                <li><a href="<%= SiteHelper.GetWebPath("~/MebelFactory.aspx") %>">Мебельное производство</a></li>
            </ul>
            <h3>Услуги</h3>
            <ul>
					<li><a href="<%= SiteHelper.GetWebPath("~/Services/Flat.aspx") %>">Дизайн проект квартиры</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Services/House.aspx") %>">Дизайн проект загородного дома</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Services/Shop.aspx") %>">Дизайн проект общественного помещения</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Services/Elitmebel.aspx") %>">Изготовление эксклюзивной мебели из массива</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Services/Faq.aspx") %>">Часто задаваемые вопросы</a></li>
            </ul>
            <h3>Портфолио</h3>
            <ul>
					<li><a href="http://www.artumstudio.ru/portfolio/interery_kvartir">Интерьеры квартир</a></li>
					<li><a href="http://www.artumstudio.ru/portfolio/interery_zagorodnyx_domov">Интерьеры загородных домов</a></li>			
					<li><a href="http://www.artumstudio.ru/portfolio/interery_obshhestvennyx_pomeshhenij">Интерьеры общественных помещений</a></li>                    		
					<!--<li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?cat=1" %>">Мебель по индивидуальным проектам</a></li>-->
                    <li><a href="<%= SiteHelper.GetWebPath("~/Works.aspx") + "?cat=2" %>">Мебель из массива на заказ</a></li>
            </ul>
            <h3>Цены</h3>
            <ul>
				<li><a href="<%= SiteHelper.GetWebPath("~/Prices.aspx") %>">Цены</a></li>
            </ul>
            <h3>Контакты</h3>
            <ul>
				<li><a href="<%= SiteHelper.GetWebPath("~/Contacts.aspx") %>">Контакты</a></li>
            </ul>


        </div>
    </div>
</asp:Content>

