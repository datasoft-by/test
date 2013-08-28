<%@ Page Title="Подтверждение оплаты" Language="C#" MasterPageFile="~/Template.master" 
    AutoEventWireup="true" CodeFile="PaymentSuccess.aspx.cs" Inherits="PaymentSuccess" %>
<asp:Content ID="Content3" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="sidebarContent" Runat="Server">
<at:Portfolio ID="Portfolio1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="basicContent" Runat="Server">
<div class="simple-text">
	    <h1>
            <asp:Literal ID="lResult" runat="server" />
        </h1>
</div>
</asp:Content>
