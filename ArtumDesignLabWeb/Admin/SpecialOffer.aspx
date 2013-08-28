<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true"
    CodeFile="SpecialOffer.aspx.cs" Inherits="ArtumDesignLab.Admin.SpecialOffer"
    ValidateRequest="false" %>

<%@ Import Namespace="ArtumDesignLab.Utils" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v10.1, Version=10.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Специальное предложение
    </div>
    <br />
    <asp:LinqDataSource ID="SpecialOfferDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="SpecialOffers">
    </asp:LinqDataSource>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SpecialOfferDataSource"
        KeyFieldName="SpecialOfferID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="SpecialOfferID" ReadOnly="True" 
                VisibleIndex="0" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Discount" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OldPrice" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NewPrice" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="5">
                <EditButton Visible="True">
                </EditButton>
            </dx:GridViewCommandColumn>
        </Columns>
    </dx:ASPxGridView>
</asp:Content>
