<%@ Page Title="FAQ - Дизайн интерьера | студия дизайна «Artum»" Language="C#"
         AutoEventWireup="true" CodeFile="faq_interior.aspx.cs" Inherits="Services_faq" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" runat="Server">

    <at:DesignProjectInfo ID="DesignProjectInfo1" runat="server" />
    <at:Portfolio ID="Portfolio1" runat="server" />    
    <at:CallOrderSidebar ID="сallOrderSidebar" runat="server" />
        <at:ContactInfo ID="contactInfo" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" runat="Server">
    <div id="post-content">
        <h1>
            FAQ: Дизайн интерьеров</h1>
                    
                <h2 style="color: #FFCC86; font-size: 20px; padding-bottom: 8px;">Раздел находится в стадии заполнения! </h2>
</div>              
</asp:Content>
