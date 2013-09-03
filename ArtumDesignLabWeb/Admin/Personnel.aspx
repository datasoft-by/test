<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true" 
CodeFile="Personnel.aspx.cs" Inherits="ArtumDesignLab.Admin.Personnel" ValidateRequest="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" Runat="Server">
    <div class="main_body_header">
        Сотрудники
    </div>
    <br />
    <div class="manager_data">
        <dx:ASPxButton ID="btnAddNew" runat="server" Text="Добавить" AutoPostBack="True"
            OnClick="btnAddNew_Click" Width="152px">
        </dx:ASPxButton>
    </div>
    <br />
    <asp:LinqDataSource ID="PersonnelDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableUpdate="True" TableName="Personnels">
    </asp:LinqDataSource>

    <dx:ASPxGridView ID="PersonnelGridView" runat="server" Width="1130" 
        AutoGenerateColumns="False" DataSourceID="PersonnelDataSource"
        KeyFieldName="PersonnelID" OnRowCommand="PersonnelGridView_RowCommand">
        <SettingsPager PageSize="20"></SettingsPager>
        <Columns>
            <dx:GridViewDataHyperLinkColumn VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="btnChange" runat="server" Text='Изменить'
                        CommandName="Change" CommandArgument='<%# Eval("PersonnelID") %>'></asp:LinkButton>
                    <br />
                    <asp:LinkButton ID="btnDelete" runat="server" Text='Удалить' CommandName="Delete"
                        CommandArgument='<%# Eval("PersonnelID") %>' OnClientClick="return confirm('Удалить, Вы уверены?');"></asp:LinkButton>
               </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn FieldName="Place" ReadOnly="True" VisibleIndex="0" Width="20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PersonnelCategory.Name" Caption="Position" ReadOnly="True" VisibleIndex="0" Width="20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1" Width="70">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Phone" VisibleIndex="2" Width="105">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3" Width="200">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ThumbImage" Caption="Image" VisibleIndex="4" Width="40">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Experience" VisibleIndex="5" Width="100">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Styles" VisibleIndex="5" Width="200">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Url" Caption="Page Url" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>

<%--    <p>
        Сгенерировать адреса:
        <asp:Button ID="ButtonGenerate" runat="server" Text="Сгенерировать" OnClick="ButtonGenerate_Click" /></p>--%>


    <dx:ASPxPopupControl ID="popUpAddPersonnel" runat="server" HeaderText="Добавить сотрудника"
        AllowDragging="True" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle"
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Width="700px"
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
        <ContentStyle VerticalAlign="Top">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <table width="100%">
                    <tr>
                        <td>
                            Ид
                        </td>
                        <td>
                            <asp:Label ID="lblUpdatePersonnelId" runat="server"></asp:Label>
                            <asp:LinqDataSource ID="PersonnelCategoriesLinqDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
                                TableName="PersonnelCategories">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Место в выдаче
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtPlace" runat="server" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Категория
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlCategories" runat="server" DataTextField="Name" DataValueField="PersonnelCategoryID" 
                                DataSourceID="PersonnelCategoriesLinqDataSource" Width="500" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtName" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtPhone" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtEmail" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Image
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtImage" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Experience
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtExperience" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Styles
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtStyles" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
<%--                    <tr>
                        <td>
                            Картинка
                        </td>
                        <td align="left">
                            <asp:FileUpload ID="fluImage" runat="server" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td colspan="2">
                            <dx:ASPxButton ID="btnAdd" runat="server" Text="Сохранить" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" OnClick="btnAdd_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

