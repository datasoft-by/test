<%@ Page Title="Вакансии | студия дизайна «Artum»" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Vacancy.aspx.cs" Inherits="Vacancy" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
    <meta name="description" content="Вакансии студии дизайна интерьера" />
    <meta name="keywords" content="Вакансии" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarContent" Runat="Server">
<at:StudioInfo ID="StudioInfo1" runat="server" />
<at:ContactInfo ID="contactInfo" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="basicContent" runat="server">
    <h1>Вакансии нашей студии</h1>
    <h4 class="dotted"><i class="arrow-down"></i>Дизайнер интерьера</h4>

    <div class="price-list-holder">
        <h5>Требования:</h5>
        <ul class="price-list">
            <li>Высшее специальное ПРОФИЛЬНОЕ образование (не курсы!)</li>
            <li>Уверенное владение программами Autocad‚ 3Dmax+vray‚ либо Archicad + Artlantis</li>
            <li>Опыт работы по специальности</li>
            <li>Ответственное отношение к профессии</li>
            <li>Профессиональный подход к делу</li>
            <li>Опыт проектирования мебели</li>
            <li>Опыт эффективного общения с людьми</li>
            <li>Знание рынка отделочных материалов</li>
        </ul>
        <h5>Обязанности:</h5>
        <ul class="price-list">
            <li>Разработка дизайн-проектов интерьера жилых (квартиры‚ загородные дома) и общественных(рестораны‚ кафе) помещений</li>
            <li>Комплектация объекта отделочными материалами‚ мебелью‚ сантехникой‚ освещением</li>
            <li>Авторский надзор</li>
        </ul>
        <h5>Условия:</h5>
        <ul class="price-list">
            <li>График работы - обсуждаемый‚ по договоренности</li>
            <li>Оплата - по договоренности></li>
        </ul>
    </div>

    <p>ОГРОМНАЯ ПРОСЬБА: присылайте на почту резюме‚ в случае заинтересованности мы ответим вам сами. <br />Спасибо!</p>
</asp:Content>