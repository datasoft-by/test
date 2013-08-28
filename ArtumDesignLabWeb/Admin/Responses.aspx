<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true"
    CodeFile="Responses.aspx.cs" Inherits="ArtumDesignLab.Admin.SpecialOffer" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Отзывы
    </div>
    <br />
    <p>Имя: <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
    </p>
    <p>Должность: <asp:TextBox ID="TextBoxPost" runat="server"></asp:TextBox>
    </p>
    <p>Контакты: <asp:TextBox ID="TextBoxContacts" runat="server"></asp:TextBox>
    </p>
    <p>Позиция: <asp:TextBox ID="TextBoxPosition" runat="server"></asp:TextBox>
    </p>
    <p>Email: <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
    </p>
    <p>Facebook: <asp:TextBox ID="TextBoxFacebook" runat="server"></asp:TextBox>
    </p>
    <p>Twitter: <asp:TextBox ID="TextBoxTwitter" runat="server"></asp:TextBox>
    </p>
    <p>Vkontakte: <asp:TextBox ID="TextBoxVkotakte" runat="server"></asp:TextBox>
    </p>
    <p>Фотография: <asp:FileUpload ID="FileUploadPhoto" runat="server" />
    </p>
    <p>Отзыв: <br /><asp:TextBox ID="TextBoxResponce" runat="server" Columns="35" Rows="10" 
            TextMode="MultiLine"></asp:TextBox>
    </p>
    <p><asp:Button ID="SaveButton" runat="server" Text="Добавить" 
            onclick="SaveButton_Click" /></p>
    <asp:LinqDataSource ID="ResponsesDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="Responses">
    </asp:LinqDataSource>
    <dx:ASPxGridView ID="ResponsesGridView" runat="server" 
        AutoGenerateColumns="False" DataSourceID="ResponsesDataSource"
        KeyFieldName="ResponseId">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ResponseId" ReadOnly="True" 
                VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Post" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Position" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Contacts" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="Facebook" VisibleIndex="4">
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="Twitter" VisibleIndex="5">
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="Vkontakte" VisibleIndex="6">
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn FieldName="Image" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Text" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <br />
</asp:Content>
