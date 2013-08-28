<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true"
    CodeFile="News.aspx.cs" Inherits="ArtumDesignLab.Admin.News" ValidateRequest="false" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v10.1, Version=10.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Новости
    </div>
    <br />
    <table width="800px">
        <tr>
            <td class="right">
                Заголовок:
            </td>
            <td>
                <asp:TextBox ID="txtNewsHeader" runat="server" Width="650px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="right">
                Дата:
            </td>
            <td>
                <asp:TextBox ID="txtNewsDate" runat="server" Width="650px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="right">
                Изображение:
            </td>
            <td>
                <asp:FileUpload ID="upcImage" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="top right">
                Текст:
            </td>
            <td>
                <dx:ASPxHtmlEditor ID="htmlEditor" runat="server">
                    <SettingsImageUpload UploadImageFolder="~/Content/Images/News/Other/">
                        <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/x-png">
                        </ValidationSettings>
                    </SettingsImageUpload>
                </dx:ASPxHtmlEditor>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnYes" runat="server" Text="Добавить" OnClick="btnAdd_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblId" runat="server" />
    <br />
    <dx:ASPxGridView ID="NewsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="NewsLinqDataSource"
        KeyFieldName="NewID" onrowdeleted="NewsGridView_RowDeleted">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="NewID" ReadOnly="True" Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date" Caption="Дата" VisibleIndex="1">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Header" Caption="Заголовок" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Url" FieldName="Url" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Текст" FieldName="Text" VisibleIndex="3">
                <PropertiesMemoEdit Rows="7">
                </PropertiesMemoEdit>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataTextColumn FieldName="Image" Name="Image" Visible="False" 
                VisibleIndex="6">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataImageColumn VisibleIndex="5" Caption="Изображение">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Settings.NewsImagesThumbs + Eval("Image") %>' />
                </DataItemTemplate>
            </dx:GridViewDataImageColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="NewsLinqDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        OrderBy="Date desc" TableName="News" EnableDelete="True" 
        EnableUpdate="True">
    </asp:LinqDataSource>
    <br />
    <p>Сгенерировать адреса: <asp:Button ID="Button2" runat="server" 
            Text="Сгенерировать" onclick="Button2_Click" /></p>
</asp:Content>
