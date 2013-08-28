<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true" 
    CodeFile="Teasers.aspx.cs" Inherits="ArtumDesignLab.Admin.Teasers" %>   
<%@ Import Namespace="ArtumDesignLab.Utils"%>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Тизеры
    </div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="ArtumDesignLab.SiteDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="Teasers">
    </asp:LinqDataSource>
    <br/>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LinqDataSource1" KeyFieldName="TeaserID">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="TeaserID" ReadOnly="True" 
                VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Image" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Link" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <br/>
&nbsp;<br/>
</asp:Content>
