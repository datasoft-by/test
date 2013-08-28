<%@ Page Title="Преимущества работы с нашей студией | студия дизайна «Artum»" Language="C#" 
         AutoEventWireup="true" CodeFile="Advantages.aspx.cs" Inherits="pages_Advantages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">
    <at:DesignProjectInfo ID="DesignProjectInfo1" runat="server" /> 
    <at:Portfolio ID="Portfolio1" runat="server" />
        <at:ContactInfo ID="contactInfo" runat="server" />
 </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" Runat="Server">
<h1>Преимущества работы с нашей студией</h1>
<noindex>
<at:Reason10 ID="reason" runat="server" />
</noindex>
</asp:Content>

