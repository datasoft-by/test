<%@ Page Title="К сожалению, страница не найдена! " Language="C#" MasterPageFile="~/Template.master" 
         AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>
<asp:Content ID="Content3" ContentPlaceHolderID="headContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="sidebarContent" Runat="Server">
<at:ResponseControl ID="responseControl" runat="server" />
<at:Portfolio ID="Portfolio1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="basicContent" Runat="Server">
<div class="simple-text">
	    <h1>К сожалению, Ваша страница не найдена!</h1>
        <div class="simple-text">
            <p>Мы обновляем наш сайт, поэтому некоторые страницы могут отображаться некорректно. Для Вашего удобства можете воспользоваться картой сайта:</p>
            <h2 style="color: #FFCC86; font-size: 20px;">Студия</h2>
            <ul>
					<li><a href="<%= SiteHelper.GetWebPath("~/About.aspx") %>">Мы и наши преимущества</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/News.aspx") %>">Новости</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Blog.aspx") %>">Блог студии</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Partners.aspx") %>">Партнеры</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Responses.aspx") %>">Отзывы</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Clients.aspx") %>">Клиенты</a></li>
            </ul>
            <h2 style="color: #FFCC86; font-size: 20px;">Услуги</h2>
            <ul>
					<li><a href="<%= SiteHelper.GetWebPath("~/Services/Flat.aspx") %>">Дизайн проекты квартир</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Services/House.aspx") %>">Дизайн проекты загородных домов</a></li>
					<li><a href="<%= SiteHelper.GetWebPath("~/Services/Public.aspx") %>">Дизайн проекты общественных помещений</a></li>
                    <li><a href="<%= SiteHelper.GetWebPath("~/Services/Office.aspx") %>">Дизайн проекты офисов</a></li>

					<li><a href="<%= SiteHelper.GetWebPath("~/Services/Faq_interior.aspx") %>">Часто задаваемые вопросы</a></li>
            </ul>
            <h2 style="color: #FFCC86; font-size: 20px;">Портфолио</h2>
            <ul>
					<li><a href="http://www.artumstudio.ru/portfolio/interery_kvartir">Интерьеры квартир</a></li>
					<li><a href="http://www.artumstudio.ru/portfolio/interery_zagorodnyx_domov">Интерьеры загородных домов</a></li>			
					<li><a href="http://www.artumstudio.ru/portfolio/interery_obshhestvennyx_pomeshhenij">Интерьеры общественных помещений</a></li>                    		
					
                  
            </ul>
            <h2 style="color: #FFCC86; font-size: 20px;">Цены</h2>
            <ul>
				<li><a href="<%= SiteHelper.GetWebPath("~/Prices.aspx") %>">Цены</a></li>
            </ul>
            <h2 style="color: #FFCC86; font-size: 20px;">Контакты</h2>
            <ul>
				<li><a href="<%= SiteHelper.GetWebPath("~/Contacts.aspx") %>">Контакты</a></li>
            </ul>


        </div>
    </div>
</asp:Content>