<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true"
    CodeFile="Categories.aspx.cs" Inherits="ArtumDesignLab.Admin.Categories" %>
<%@ Import Namespace="ArtumDesignLab.Utils"%>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Справочник категорий
    </div>
    <br />
    <div class="section-header"><span>Категории проектов</span></div>
    <div class="section">
        <h3>Добавление новой категории</h3>
        <div class="section-content">
        <table>
            <tr>
                <td>
                    Название:
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtText" runat="server" Width="300px" >
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Заголовок:
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtProjectsTitle" runat="server" Width="300px" >
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td class="top">
                    Описание:
                </td>
                <td>
                    <dx:ASPxHtmlEditor ID="htmlProjectDescription" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <dx:ASPxButton ID="btnAdd" runat="server" Text="Добавить категорию" OnClick="btnAdd_Click" />
                </td>
            </tr>
        </table>
        </div>
    </div>
    <div class="section">
        <h3>Редактирование категорий</h3>
        <div class="section-content">
            <asp:LinqDataSource ID="ProjectsCategoriesLinqDataSource" runat="server" 
                ContextTypeName="ArtumDesignLab.SiteDataContext" EnableDelete="True" 
                EnableUpdate="True" TableName="ProjectCategories">
            </asp:LinqDataSource>
            <dx:ASPxGridView ID="gridViewCategories" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ProjectsCategoriesLinqDataSource" 
                KeyFieldName="ProjectCategoryID">
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0">
                        <EditButton Visible="True">
                        </EditButton>
                        <DeleteButton Visible="True">
                        </DeleteButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ProjectCategoryID" ReadOnly="True" 
                        Visible="False" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Url" FieldName="Url" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn FieldName="Text" VisibleIndex="3">
                        <PropertiesMemoEdit Rows="7">
                        </PropertiesMemoEdit>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn Caption="Ссылка" VisibleIndex="5">
                        <DataItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# SiteHelper.GetWebPath("~/Portfolio.aspx") + "?cat=" + Eval("ProjectCategoryID") %>' 
                                Text='<%# SiteHelper.GetWebPath("~/Portfolio.aspx") + "?cat=" + Eval("ProjectCategoryID") %>'></asp:HyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>

        <p>Сгенерировать адреса: <asp:Button ID="Button2" runat="server" 
                Text="Сгенерировать" onclick="Button2_Click" /></p>
    </div>

    <br />
    <div class="manager_data">
        <b>Категории работ</b>
        <asp:LinqDataSource ID="WorksCategoriesLinqDataSource" runat="server" 
            ContextTypeName="ArtumDesignLab.SiteDataContext" EnableDelete="True" 
            EnableInsert="True" EnableUpdate="True" TableName="WorkCategories" />
        
        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" 
            DataSourceID="WorksCategoriesLinqDataSource" KeyFieldName="WorkCategoryID">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="WorkCategoryID" ReadOnly="True" 
                    VisibleIndex="0" Caption="ID">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1" Caption="Название">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="2" 
                    Caption="Заголовок">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Text" VisibleIndex="3" Caption="Описание">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>        
    </div>
    <br />
    <div class="manager_data">
        <b>Категории фотографий проектов</b>
        <br />
        <asp:LinqDataSource ID="ProjectPhotosCategoriesLinqDataSource" runat="server" 
            ContextTypeName="ArtumDesignLab.SiteDataContext" EnableDelete="True" 
            EnableInsert="True" EnableUpdate="True" TableName="ProjectPhotoCategories">
        </asp:LinqDataSource>
        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ProjectPhotosCategoriesLinqDataSource" 
            KeyFieldName="ProjectPhotoCategoryID">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ProjectPhotoCategoryID" ReadOnly="True" 
                    VisibleIndex="0" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <br />
    <div class="manager_data">
        <b>Категории блога</b>
        <table>
            <tr>
                <td>
                    <asp:LinqDataSource ID="BlogCategoriesDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
                        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="BlogCategories">
                    </asp:LinqDataSource>
                    <br />
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="BlogCategoriesDataSource"
                        KeyFieldName="BlogCategoryID">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="BlogCategoryID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Название категории" FieldName="Name" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewCommandColumn VisibleIndex="2">
                                <EditButton Visible="True">
                                </EditButton>
                                <NewButton Visible="True">
                                </NewButton>
                                <DeleteButton Visible="True">
                                </DeleteButton>
                            </dx:GridViewCommandColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </td>
            </tr>
        </table>
    </div>
    </span>
</asp:Content>
