<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestLeadsPhone.aspx.cs" Inherits="TestLeadsPhone" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ddlSource" runat="server">
            <asp:ListItem Text="Direct" Value="0" />
            <asp:ListItem Text="GoogleSearch" Value="1" />
            <asp:ListItem Text="YandexSearch" Value="2" />
            <asp:ListItem Text="YandexDirect" Value="3" />
            <asp:ListItem Text="GoogleAdwords" Value="4" />
            <asp:ListItem Text="Referer" Value="5" />
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="ddlCities" runat="server">
            <asp:ListItem Text="Москва" Value="Москва" />
            <asp:ListItem Text="Санкт-Петербург" Value="Санкт-Петербург" />
            <asp:ListItem Text="Регионы" Value="Регионы" />
            <asp:ListItem Text="N/A" Value="" />
       </asp:DropDownList>
        <br />
        <br />
       <asp:Button ID="btnSend" runat="server" OnClick="btnSend_clck" Text="Send" />
        <br />
        <br />
        <br />
        Телефон:&nbsp;&nbsp;&nbsp;<b><asp:Literal ID="lResult" runat="server" Text="-------------------" /></b>
        <br />
        <br />
        <br />
        <hr />
        <br />
        <br />
        <br />
        <asp:DropDownList ID="ddlRequests" runat="server">
            <asp:ListItem Text="from google seo" Value="http://test.com"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="ddlReferrers" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="ddlCitiesRequest" runat="server">
            <asp:ListItem Text="Москва" Value="Москва" />
            <asp:ListItem Text="Санкт-Петербург" Value="Санкт-Петербург" />
            <asp:ListItem Text="Регионы" Value="Регионы" />
            <asp:ListItem Text="N/A" Value="" />
       </asp:DropDownList>
        <br />
        <br />
       <asp:Button ID="RequestSend" runat="server" OnClick="btnRequestSend_clck" Text="Send" />
        <br />
        <br />
        <br />
        SearchType:&nbsp;&nbsp;&nbsp;<b><asp:Literal ID="lSearchType" runat="server" Text="" /></b>
        SearchKeyword:&nbsp;&nbsp;&nbsp;<b><asp:Literal ID="lSearchKeyword" runat="server" Text="" /></b>
        Referer:&nbsp;&nbsp;&nbsp;<b><asp:Literal ID="lReferer" runat="server" Text="" /></b>
        SearchUrl:&nbsp;&nbsp;&nbsp;<b><asp:Literal ID="lSearchUrl" runat="server" Text="" /></b>



    </div>
    </form>
</body>
</html>
