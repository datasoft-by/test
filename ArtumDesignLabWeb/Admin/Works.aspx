<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true"
    CodeFile="Works.aspx.cs" Inherits="ArtumDesignLab.Admin.Works" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v10.1, Version=10.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Работы портфолио
    </div>
    <asp:LinqDataSource ID="WorkCategoriesLinqDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        TableName="WorkCategories">
    </asp:LinqDataSource>
    <table width="100%">
        <tr>
            <td>
                Название работы
            </td>
            <td align="left">
                <asp:TextBox ID="txtHeader" runat="server" Width="500px" />
            </td>
        </tr>
        <tr>
            <td>
                Meta description
            </td>
            <td align="left">
                <asp:TextBox ID="txtDescription" TextMode="MultiLine" Height="100px" runat="server"
                    Width="500px" />
            </td>
        </tr>
        <tr>
            <td style="height: 26px">
                Meta keywords
            </td>
            <td align="left" style="height: 26px">
                <asp:TextBox ID="txtKeyWords" runat="server" Width="500px" />
            </td>
        </tr>
        <tr>
            <td>
                Title
            </td>
            <td align="left">
                <asp:TextBox ID="txtTitle" runat="server" Width="500px" />
            </td>
        </tr>
        <tr>
            <td>
                Категория
            </td>
            <td align="left">
                <dx:ASPxComboBox ID="cmbCategory" runat="server" DataSourceID="WorkCategoriesLinqDataSource"
                    ValueType="System.String" TextField="Name" ValueField="WorkCategoryID" />
            </td>
        </tr>
        <tr>
            <td>
                Текст
            </td>
            <td align="left">
                <dx:ASPxHtmlEditor ID="htmlText" runat="server" />
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
                <dx:ASPxButton ID="btnAdd" runat="server" Text="Добавить" 
                    onclick="btnAdd_Click" />
            </td>
        </tr>
    </table>
    <div class="user_data">
        <asp:LinqDataSource ID="WorksLinqDataSource" runat="server" 
            ContextTypeName="ArtumDesignLab.SiteDataContext" OrderBy="WorkID desc" 
            TableName="Works" />
        <dx:ASPxGridView ID="grdProjects" runat="server" KeyFieldName="WorkID" Width="100%"
            ClientInstanceName="grdProjects" AutoGenerateColumns="False" 
            OnRowCommand="grdProjects_RowCommand" DataSourceID="WorksLinqDataSource">
            <Columns>
                <dx:GridViewDataImageColumn VisibleIndex="1">
                    <DataItemTemplate>
                        <img src="<%# SiteHelper.GetWebPath(Settings.WorksImagesThumbsSmall) + Eval("Image") %>" />
                    </DataItemTemplate>
                </dx:GridViewDataImageColumn>
                <dx:GridViewDataColumn FieldName="Header" CellStyle-HorizontalAlign="Right"
                    HeaderStyle-HorizontalAlign="Right" Caption="Название" VisibleIndex="2">
                    <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                    <CellStyle HorizontalAlign="Right">
                    </CellStyle>
                </dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn Caption="Title" Name="ProjectTitle" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="KeyWords" Name="ProjectKeyWords" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn VisibleIndex="4">
                    <DataItemTemplate>
                        <asp:LinkButton ForeColor="Maroon" ID="btnChange" runat="server" Text='Изменить'
                            CommandName="Change" CommandArgument='<%# Eval("WorkID") %>'></asp:LinkButton>
                        <br />
                        <asp:LinkButton ForeColor="Maroon" ID="btnDelete" runat="server" Text='Удалить' CommandName="Delete"
                            CommandArgument='<%# Eval("WorkID") %>'></asp:LinkButton>
                        <br />
                        <asp:LinkButton ForeColor="Maroon" ID="btnAddColor" runat="server" Text='Добавить фото'
                            CommandName="AddPhoto" CommandArgument='<%# Eval("WorkID") %>'></asp:LinkButton>
                        <br />
                        <asp:LinkButton ForeColor="Maroon" ID="btnAddQuickLinks" runat="server" Text='Добавить ссылки'
                            CommandName="AddQuickLinks" CommandArgument='<%# Eval("WorkID") %>'></asp:LinkButton>
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
    <asp:LinqDataSource ID="WorkQuickLinksDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="WorkQuickLinks"
        Where="WorkID == @WorkID">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="0" Name="WorkID" SessionField="ID"
                Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <dx:ASPxPopupControl ID="PopupControl" runat="server" Modal="True" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" Width="400px">
        <Windows>
            <dx:PopupWindow>
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTreeList ID="ASPxTreeList2" runat="server" AutoGenerateColumns="False" DataSourceID="WorkQuickLinksDataSource"
                            KeyFieldName="WorkQuickLinkLinkID" OnInitNewNode="ASPxTreeList1_InitNewNode"
                            ParentFieldName="SubmenuLinkID">
                            <Columns>
                                <dx:TreeListTextColumn FieldName="WorkID" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn FieldName="SubmenuLinkID" ShowInCustomizationForm="True" Visible="False"
                                    VisibleIndex="1">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn FieldName="Title" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:TreeListTextColumn>
                                <dx:TreeListTextColumn FieldName="URL" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:TreeListTextColumn>
                                <dx:TreeListCommandColumn ShowInCustomizationForm="True" VisibleIndex="4" 
                                    ShowNewButtonInHeader="True">
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
            <dx:PopupWindow>
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl5" runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxUploadControl ID="WorkPhotosUploadControl" runat="server" FileInputCount="3"
                            ShowAddRemoveButtons="True">
                        </dx:ASPxUploadControl>
                        <br />
                        <asp:Button ID="AddImagesButton" runat="server" OnClick="AddImagesButton_Click" Text="Button" />
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:PopupWindow>
        </Windows>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl6" runat="server">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
