﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Admin_Blog" ValidateRequest="False" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="Server">
    <div class="main_body_header">
        Блог 
    </div>
    <table width="800px">
        <tr>
            <td>
                Ид
            </td>
            <td>
                <asp:Label ID="lblUpdateBlogId" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Категория
            </td>
            <td>
                <dx:ASPxComboBox ID="cmbCategories" TextField="Name" ValueField="BlogCategoryID"
                    runat="server" ValueType="System.Int32">
                </dx:ASPxComboBox>
             </td>
        </tr>
        <tr>
            <td>
                Заголовок статьи
            </td>
            <td>
                <dx:ASPxTextBox ID="txtHeader" runat="server" Width="650px" />
            </td>
        </tr>
        <tr>
            <td>
                Meta description
            </td>
            <td>
                <dx:ASPxTextBox ID="txtDescription" runat="server" Width="650px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Meta title
            </td>
            <td>
                <dx:ASPxTextBox ID="txtTitle" runat="server" Width="650px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Meta keywords
            </td>
            <td>
                <dx:ASPxTextBox ID="txtKeywords" runat="server" Width="650px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Предпоказ статьи
            </td>
            <td>
                <dx:ASPxMemo ID="txtPreview" Height="71px" Width="650px" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Изображение
            </td>
            <td>
                <asp:FileUpload ID="fluImage" runat="server" />
                <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" />
                <cs:CropImage ID="imgCrop" runat="server" Image="imgImage" Ratio="624/214" X="0"
                    Y="0" Y2="214" Visible="false" CanvasWidth="600" />
                <asp:Image ID="imgImage" Width="600" runat="server" Visible="False" />
            </td>
        </tr>
        <tr>
            <td>
                Текст
            </td>
            <td>
                <dx:ASPxHtmlEditor ID="htmlText" runat="server">
                    <SettingsImageUpload UploadImageFolder="~/Content/Images/Blog/">
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
                <dx:ASPxButton ID="btnSave" runat="server" Text="Сохранить" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>
    Список постов
    <br />
    <dx:ASPxGridView  ID="BlogGridView" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" KeyFieldName="BlogID" 
    PreviewFieldName="PreviewText" SettingsPager-PageSize="50" OnRowCommand="BlogGridView_RowCommand">
<%--        <Templates>
            <EditForm>
                Категория<br /><asp:DropDownList ID="ddlCategories" DataTextField="Name" DataValueField="BlogCategoryID"
                    runat="server" DataSourceID="BlogCategoriesDataSource" Width="500" />
                <br /><br />
                Meta title<br /><dx:ASPxTextBox ID="txtBoxTitle" Text='<%# Eval("MetaTitle") %>' runat="server"
                    Width="500">
                </dx:ASPxTextBox>
                <br />
                Meta description<br /><dx:ASPxTextBox ID="txtDescription" Text='<%# Eval("MetaDescription") %>' runat="server"
                    Width="500">
                </dx:ASPxTextBox>
                <br />
                Meta keywords<br /><dx:ASPxTextBox ID="txtKeywords" Text='<%# Eval("MetaKeywords") %>' runat="server"
                    Width="500">
                </dx:ASPxTextBox>
                <br />
                Заголовок статьи<br /><dx:ASPxTextBox ID="txtH1" Text='<%# Eval("Header") %>' runat="server"
                    Width="500">
                </dx:ASPxTextBox>
                <br />
                Placeholder<br /><dx:ASPxTextBox ID="txtPlaceholder" Text='<%# Eval("Placeholder") %>'
                    runat="server" Width="500">
                </dx:ASPxTextBox>
                <br />
                Текст<br /><dx:ASPxHtmlEditor ID="TextHtmlEditor" runat="server" Html='<%# Eval("Text") %>'>
                    <SettingsImageUpload UploadImageFolder="~/Content/Images/Blog/">
                        <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/x-png">
                        </ValidationSettings>
                    </SettingsImageUpload>
                </dx:ASPxHtmlEditor>
                <br />
                <div style="text-align: left; padding: 2px 2px 2px 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                </div>
            </EditForm>
        </Templates>--%>
        <Columns>
            <dx:GridViewDataHyperLinkColumn VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="btnChange" runat="server" Text='Изменить'
                        CommandName="Change" CommandArgument='<%# Eval("BlogID") %>'></asp:LinkButton>
                    <br />
                    <asp:LinkButton ID="btnDelete" runat="server" Text='Удалить' CommandName="Delete"
                        CommandArgument='<%# Eval("BlogID") %>' OnClientClick="return confirm('Удалить, Вы уверены?');"></asp:LinkButton>
               </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
            <%--<dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True" />
           </dx:GridViewCommandColumn>

            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <DeleteButton Visible="True">
                </DeleteButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>--%>
            <dx:GridViewDataTextColumn FieldName="BlogID" VisibleIndex="0" ReadOnly="True" 
                Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Категория" FieldName="BlogCategoryID" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="BlogCategoriesDataSource" TextField="Name" ValueField="BlogCategoryID"
                    ValueType="System.String">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="2" Caption="Дата создания">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Header" VisibleIndex="3" Caption="Заголовок">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Placeholder" VisibleIndex="3" Caption="Placeholder">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="URL" FieldName="Url" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MetaTitle" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MetaDescription" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MetaKeywords" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Текст предпросмотра" FieldName="PreviewText" Visible="False" VisibleIndex="8">
                <PropertiesMemoEdit Rows="7">
                </PropertiesMemoEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataTextColumn Caption="Полный текст" FieldName="Text" Visible="False" VisibleIndex="9">
                <PropertiesTextEdit EncodeHtml="False">
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Image" VisibleIndex="10" Width="88px" Caption="Изображение">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%# Eval("Image") != null ? SiteHelper.GetWebPath(Settings.BlogImagesThumbsSmall + Eval("Image")) : "" %>'>
                    </dx:ASPxImage>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn ShowInCustomizationForm="True" VisibleIndex="11">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("BlogID") %>'
                        CommandName="AddQuickLinks" OnCommand="LinkButton1_Command">Добавить ссылки</asp:LinkButton>
                    <br />
                    <asp:LinkButton ID="AddPhotosLinkButton" runat="server" CommandArgument='<%# Eval("BlogID") %>'
                        CommandName="AddPhotos" OnCommand="AddPhotos_Command">Добавить изображения</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
        <Settings ShowPreview="True" ShowFilterRow="True" ShowFilterRowMenu="true" />
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" OrderBy="BlogID desc" TableName="Blogs" EnableInsert="True"
        EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="BlogCategoriesDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        TableName="BlogCategories">
    </asp:LinqDataSource>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" Modal="True" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" Width="400px">
        <Windows>
            <dx:PopupWindow>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource2"
                            KeyFieldName="BlogQuickLinkID" OnInitNewNode="ASPxTreeList1_InitNewNode" ParentFieldName="SubmenuLinkID">
                            <Columns>
                                <dx:TreeListTextColumn FieldName="BlogID" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn FieldName="SubmenuLinkID" ShowInCustomizationForm="True" Visible="False"
                                    VisibleIndex="1">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn FieldName="Title" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn FieldName="URL" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:TreeListTextColumn>
                                <dx:TreeListCommandColumn ShowInCustomizationForm="True" ShowNewButtonInHeader="True"
                                    VisibleIndex="4">
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <NewButton Visible="True">
                                    </NewButton>
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                </dx:TreeListCommandColumn>
                            </Columns>
                        </dx:ASPxTreeList>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:PopupWindow>
<%--            <dx:PopupWindow>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxUploadControl ID="BlogPhotosUploadControl" runat="server" FileInputCount="3"
                            ShowAddRemoveButtons="True">
                        </dx:ASPxUploadControl>
                        <br />
                        <asp:Button ID="AddImagesButton" runat="server" OnClick="AddImagesButton_Click" 
                            Text="Сохранить" />
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:PopupWindow>--%>
        </Windows>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <br />
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="BlogQuickLinks"
        Where="BlogID == @BlogID">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="0" Name="BlogID" SessionField="PostID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    
<%--    <p>Сгенерировать адреса: <asp:Button Visible="false" ID="Button2" runat="server" 
            Text="Сгенерировать" onclick="Button2_Click" /></p>--%>
</asp:Content>
