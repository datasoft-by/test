<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true"
    CodeFile="Projects.aspx.cs" Inherits="ArtumDesignLab.Admin.Projects" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v10.1, Version=10.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        <asp:DropDownList ID="ddlCategories" runat="server" />
        <asp:Button ID="btnShow" runat="server" Text="Вывести" />
    </div>
    <br />
    <div class="manager_data">
        <dx:ASPxButton ID="btnAddGirl" runat="server" Text="Добавить проект" AutoPostBack="True"
            OnClick="btnAddGirl_Click" Width="152px">
        </dx:ASPxButton>
    </div>
    <br />
    <dx:ASPxPopupControl ID="popupAddPictures" runat="server" HeaderText="Добавить картинки"
        AllowDragging="True" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle"
        Width="600px">
        <ContentStyle VerticalAlign="Top">
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblProjectId" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtFirst" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:FileUpload ID="fluPicture1" runat="server" />
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmbFirst" runat="server" TextField="Name" Width="150px" ValueField="ProjectPhotoCategoryID"
                                ShowShadow="False" ValueType="System.String" AutoPostBack="false">
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
                            <asp:TextBox ID="txtSecond" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:FileUpload ID="fluPicture2" runat="server" />
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmbSecond" runat="server" TextField="Name" Width="150px" ValueField="ProjectPhotoCategoryID"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                ValueType="System.String" AutoPostBack="false" LoadingPanelImagePosition="Top"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                            <asp:TextBox ID="txtThird" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:FileUpload ID="fluPicture3" runat="server" />
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmbThird" runat="server" TextField="Name" Width="150px" ValueField="ProjectPhotoCategoryID"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                ValueType="System.String" AutoPostBack="false" LoadingPanelImagePosition="Top"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                            <asp:TextBox ID="txtFourth" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:FileUpload ID="fluPicture4" runat="server" />
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmbFourth" runat="server" TextField="Name" Width="150px" ValueField="ProjectPhotoCategoryID"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                ValueType="System.String" AutoPostBack="false" LoadingPanelImagePosition="Top"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                            <asp:TextBox ID="txtFifth" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:FileUpload ID="fluPicture5" runat="server" />
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmbFifth" runat="server" TextField="Name" Width="150px" ValueField="ProjectPhotoCategoryID"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                ValueType="System.String" AutoPostBack="false" LoadingPanelImagePosition="Top"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                            <asp:TextBox ID="txtSix" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:FileUpload ID="fluPicture6" runat="server" />
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmbSix" runat="server" TextField="Name" Width="150px" ValueField="ProjectPhotoCategoryID"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                ValueType="System.String" AutoPostBack="false" LoadingPanelImagePosition="Top"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                            <asp:TextBox ID="txtSeven" runat="server" Width="330px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:FileUpload ID="fluPicture7" runat="server" />
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cmbSeven" runat="server" TextField="Name" Width="150px" ValueField="ProjectPhotoCategoryID"
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" ShowShadow="False"
                                ValueType="System.String" AutoPostBack="false" LoadingPanelImagePosition="Top"
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
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
                        <td colspan="2">
                            <dx:ASPxButton ID="btnAddPicture" runat="server" Text="Добавить картинки" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" OnClick="btnAddPicture_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
                                Width="173px">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="popUpAddWork" runat="server" HeaderText="Добавить проект"
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
                            <asp:Label ID="lblUpdateProjectId" runat="server"></asp:Label>
                            <asp:LinqDataSource ID="ProjectCategoriesLinqDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
                                TableName="ProjectCategories">
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
                            <dx:ASPxButton ID="btnAdd" runat="server" Text="Добавить" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" OnClick="btnAdd_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <div class="user_data">
    <asp:LinqDataSource ID="ProjectsDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableUpdate="True" TableName="Projects" Where="ProjectCategoryID=@ProjectCategoryID"><%----%>
        <WhereParameters>
            <asp:ControlParameter Name="ProjectCategoryID" DefaultValue="0" ControlID="ddlCategories" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
        <dx:ASPxGridView ID="grdProjects" runat="server" KeyFieldName="ProjectID" Width="100%" DataSourceID="ProjectsDataSource"
            ClientInstanceName="grdProjects" AutoGenerateColumns="False" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
            CssPostfix="Aqua" OnRowCommand="grdProjects_RowCommand">
            <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                <LoadingPanel ImageSpacing="8px">
                </LoadingPanel>
            </Styles>
            <SettingsLoadingPanel ImagePosition="Top" />
            <SettingsPager AlwaysShowPager="false" PageSize="500">
                <Summary AllPagesText="Страницы: {0} - {1} ({2})" Text="Страницы {0} из {1} ({2})" />
            </SettingsPager>
            <ImagesFilterControl>
                <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                </LoadingPanel>
            </ImagesFilterControl>
            <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                </LoadingPanelOnStatusBar>
                <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                </LoadingPanel>
            </Images>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Место"  FieldName="Place" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataImageColumn VisibleIndex="0">
                    <DataItemTemplate>
                        <img src='<%# Eval("ProjectThumb") != null ? SiteHelper.GetWebPath(Settings.PortfolioImagesThumbsSmall) + Eval("ProjectThumb").ToString() : "" %>' />
                    </DataItemTemplate>
                </dx:GridViewDataImageColumn>
                <dx:GridViewDataColumn FieldName="ProjectName" CellStyle-HorizontalAlign="Right"
                    HeaderStyle-HorizontalAlign="Right" Caption="Название" VisibleIndex="1">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn CellStyle-HorizontalAlign="Right" Caption="Кол.<br />фото" VisibleIndex="1">
                    <DataItemTemplate><%# GetProjectPhotoCount((Int32)Eval("ProjectID"))%></DataItemTemplate>
                 </dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn Caption="Title" FieldName="ProjectTitle" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Url" VisibleIndex="2" FieldName="Url">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="KeyWords" FieldName="ProjectKeyWords" ShowInCustomizationForm="True"
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Дизайнер" FieldName="Personnel.Name" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn VisibleIndex="6">
                    <DataItemTemplate>
                        <asp:LinkButton ForeColor="Maroon" ID="btnChange" runat="server" Text='Изменить'
                            CommandName="Change" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                        <br />
                        <asp:LinkButton ForeColor="Maroon" ID="btnDelete" runat="server" Text='Удалить' CommandName="Delete"
                            CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                        <br />
                        <asp:LinkButton ForeColor="Maroon" ID="btnAddColor" runat="server" Text='Добавить фото'
                            CommandName="AddPhoto" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                        <br />
                        <asp:LinkButton ForeColor="Maroon" ID="btnAddQuickLinks" runat="server" Text='Добавить ссылки'
                            CommandName="AddQuickLinks" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                        <br />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <StylesEditors>
                <CalendarHeader Spacing="1px">
                </CalendarHeader>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
            <ImagesEditors>
                <DropDownEditDropDown>
                    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                </DropDownEditDropDown>
                <SpinEditIncrement>
                    <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                        PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
                </SpinEditIncrement>
                <SpinEditDecrement>
                    <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                        PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
                </SpinEditDecrement>
                <SpinEditLargeIncrement>
                    <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                        PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
                </SpinEditLargeIncrement>
                <SpinEditLargeDecrement>
                    <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                        PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
                </SpinEditLargeDecrement>
            </ImagesEditors>
        </dx:ASPxGridView>
    </div>
    <asp:LinqDataSource ID="ProjectQuickLinksDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="ProjectQuickLinks"
        Where="ProjectID == @ProjectID">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="0" Name="ProjectID" SessionField="ProjectID"
                Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <dx:ASPxPopupControl ID="QuickLinksPopup" runat="server" Modal="True" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" Width="400px">
        <Windows>
            <dx:PopupWindow>
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="ProjectQuickLinksDataSource"
                            KeyFieldName="ProjectQuickLinkID" OnInitNewNode="ASPxTreeList1_InitNewNode" ParentFieldName="SubmenuLinkID">
                            <Columns>
                                <dx:TreeListTextColumn FieldName="ProjectID" ShowInCustomizationForm="True" VisibleIndex="0">
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
        </Windows>
    </dx:ASPxPopupControl>
    <p>
        Сгенерировать адреса:
        <asp:Button Visible="false" ID="Button2" runat="server" Text="Сгенерировать" OnClick="Button2_Click" /></p>
</asp:Content>
