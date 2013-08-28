<%@ Page Title="Стоимость дизайна интерьера квартир, цена дизайн проекта в студии «Artum»" Language="C#"
    AutoEventWireup="true" CodeFile="Prices.aspx.cs" Inherits="ArtumDesignLab.UI.Prices" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:content id="Content2" contentplaceholderid="headContent" runat="server">
    <meta name="description" content="Стоимость разработки дизайн проекта жилых и коммерческих помещений в Санкт-Петербурге. Дизайн интерьера по очень привлекательным ценам в студии «Artum»" />
    <meta name="keywords" content="Стоимость дизайн проекта, цены на дизайн проект" />
</asp:content>
<asp:Content ID="Content4" ContentPlaceHolderID="TitleContent" Runat="Server">
   Мы создаём дизайн проекты качественно и в срок по оптимальной стоимости
</asp:Content> 
<asp:content id="Content3" contentplaceholderid="sidebarContent" runat="Server">
  
                
                <at:ResponseControl ID="response" runat="server" />
                 <at:Portfolio ID="Portfolio1" runat="server" />
                  <at:SpecialOfferSide ID="specialOfferSide" runat="server" />  
                 <at:ContactInfo ID="contactInfo" runat="server" />
   
</asp:content>
<asp:content id="Content1" contentplaceholderid="basicContent" runat="server">

    <h1>Цены на разработку дизайн-проекта интерьера</h1>
    <h2>Стоимость разработки дизайн-проекта:</h2>

    <at:GetProjectCost runat="server" id="projectCost" />
    <at:Prices ID="prices" runat="server" />



   
    <at:CallOrder ID="callOrder" runat="server" />
</asp:content>

  <%--<h5>Стоимости даны с учетом действующих скидок, до <%= SiteHelper.ParseTextWithCustomTag(@"<data name=""SpecialOfferEndDate"" />")%> 2012 года, успейте позвонить!</h5>--%>