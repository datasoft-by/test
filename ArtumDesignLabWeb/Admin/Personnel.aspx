<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true" 
CodeFile="Personnel.aspx.cs" Inherits="ArtumDesignLab.Admin.Personnel" ValidateRequest="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" Runat="Server">
    <div class="main_body_header">
        Сотрудники
    </div>
    <br />
    <div class="manager_data">
        <dx:ASPxButton ID="btnAddPersonnel" runat="server" Text="Добавить" AutoPostBack="True"
            OnClick="btnAddPersonnel_Click" Width="152px">
        </dx:ASPxButton>
    </div>
    <br />
    <asp:LinqDataSource ID="PersonnelDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableUpdate="True" TableName="Personnels">
    </asp:LinqDataSource>

    <dx:ASPxGridView ID="PersonnelGridView" runat="server" Width="1130" 
        AutoGenerateColumns="False" DataSourceID="PersonnelDataSource"
        KeyFieldName="PersonnelID">
        <SettingsPager PageSize="20"></SettingsPager>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" Caption="Action" Width="45" CellStyle-Wrap="Default">
                <EditButton Visible="True">
                </EditButton>
                <DeleteButton Visible="True" Text="Del">
                </DeleteButton>
            </dx:GridViewCommandColumn>
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

    <p>
        Сгенерировать адреса:
        <asp:Button ID="ButtonGenerate" runat="server" Text="Сгенерировать" OnClick="ButtonGenerate_Click" /></p>


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
                            Название проекта
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtProjectName" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Дизайнер
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlDesigners" runat="server" Width="500" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" Height="100px" runat="server"
                                Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            KeyWords
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtKeyWords" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Title
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtTitle" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Категория
                        </td>
                        <td align="left">
                            <dx:ASPxComboBox ID="cmbCategoriesPopUp" runat="server" TextField="Name" Width="300px"
                                ValueField="ProjectCategoryID" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" ShowShadow="False" ValueType="System.String" LoadingPanelImagePosition="Top"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" DataSourceID="ProjectCategoriesLinqDataSource">
                                <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                </LoadingPanelImage>
                                <DropDownButton>
                                    <Image>
                                        <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                    </Image>
                                </DropDownButton>
                                <ValidationSettings>
                                    <ErrorFrameStyle ImageSpacing="4px">
                                        <ErrorTextPaddings PaddingLeft="4px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Текст
                        </td>
                        <td align="left">
                            <dx:ASPxHtmlEditor ID="htmlEditor" runat="server">
                            </dx:ASPxHtmlEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Картинка
                        </td>
                        <td align="left">
                            <asp:FileUpload ID="fluImage" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%--<dx:ASPxButton ID="btnAdd" runat="server" Text="Добавить" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" OnClick="btnAdd_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxButton>--%>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

