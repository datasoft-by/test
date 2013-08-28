<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true"
    CodeFile="CustomData.aspx.cs" Inherits="ArtumDesignLab.Admin.CustomData"
    ValidateRequest="false" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v10.1, Version=10.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Настраиваемые данные
    </div>
    <br />
    <asp:LinqDataSource ID="CustomDataLinqDataSource" runat="server" 
        ContextTypeName="ArtumDesignLab.SiteDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="CustomDatas">
    </asp:LinqDataSource>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="CustomDataLinqDataSource" KeyFieldName="CustomDataID">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="CustomDataID" ReadOnly="True" 
                Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Value" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <br />

</asp:Content>
