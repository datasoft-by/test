<%@ Page Title="Плагиат студии дизайна интерьера, ворованный контент, сайты непорядочных работников" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="plagiat.aspx.cs" Inherits="plagiat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">
    <at:Portfolio ID="Portfolio1" runat="server" />
    <at:ResponseControl ID="response" runat="server" />
    <at:OurWorks ID="OurWorks" runat="server" />
    <at:News id="news" runat="server" />
    <at:CallOrderSidebar ID="сallOrderSidebar" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" Runat="Server">
    <h1>Плагиат</h1>
    <p>В данном разделе перечислены сайты, которые скопировали информацию с нашего сайта, наше портфолио.</p>

    <h4 class="dotted"><i class="arrow-down"></i>Студия дизайна интерьера Galaxio</h4>
    <p>Что украли: Скопирован весь сайт целиком, всё порфолио студии.<br />
    Адрес сайта - http://galaxio.com.ua</p>
    <img src="../images/plagiat/galaxio.jpg" alt="Студия дизайна интерьера Galaxio"/>
    <p class="info"><em>Студия дизайна интерьера в Киеве Galaxio, студия Galaxio, galaxio.com.ua отзывы</em></p>

    <h4 class="dotted"><i class="arrow-down"></i>Студия дизайна интерьера Арт-Дизайн</h4>
    <p>Что украли: Скопированы все тексты с сайта<br />
    Адрес сайта - http://www.art-design52.ru</p>
    <img src="../images/plagiat/art-design52.jpg" alt="Студия дизайна интерьера Арт-Дизайн"/>
    <p class="info"><em>Студия дизайна интерьера в Нижнем Новгороде art-design52, студия art-design52 отзывы</em></p>

    <h4 class="dotted"><i class="arrow-down"></i>Студия дизайна интерьера Idesign studio</h4>
    <p>Что украли: Скопированы тексты с сайта<br />
    Адрес сайта - http://www.idesign-studio.ru/</p>
    <img src="../images/plagiat/idesign-studio.jpg" alt="Студия дизайна интерьера Idesign studio"/>
    <p class="info"><em>Студия дизайна интерьера в Казани idesign-studio.ru, студия idesign-studio.ru отзывы</em></p>

    <h3 style="color: #FFCC86;font-size: 24px;">Уважаемые galaxio.com.ua, art-design52.ru, idesign-studio.ru - пожалуйста уберите с ваших сайтов, то, что принадлежит не вам!!!</h3>
</asp:Content>