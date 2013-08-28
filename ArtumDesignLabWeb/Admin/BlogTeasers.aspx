<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true" 
    CodeFile="BlogTeasers.aspx.cs" Inherits="ArtumDesignLab.Admin.BlogTeasers" %>   
<%@ Import Namespace="ArtumDesignLab.Utils"%>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Тизеры блога
    </div>
    <asp:LinqDataSource ID="ldsBlogs" runat="server" 
        ContextTypeName="ArtumDesignLab.SiteDataContext" TableName="Blogs">
    </asp:LinqDataSource>
    <br/>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ldsBlogs" 
        DataTextField="Header" DataValueField="BlogID" AppendDataBoundItems="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
        AutoPostBack="True">
        <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
    <asp:LinqDataSource ID="ldsTisers" runat="server" 
        ContextTypeName="ArtumDesignLab.SiteDataContext" TableName="Teasers">
    </asp:LinqDataSource>
    <br/>
    <br/>
    <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="ldsTisers" 
        DataTextField="Image" DataValueField="TeaserID">
    </asp:CheckBoxList>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Сохранить" />
    <br/>
</asp:Content>
