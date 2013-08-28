<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true" 
CodeFile="Payments.aspx.cs" Inherits="ArtumDesignLab.Admin.Payments" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" runat="server">
    <div class="main_body_header">
        Платежи
    </div>
    <br />

    <asp:LinqDataSource ID="PaymentsDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableUpdate="True" TableName="Courses">
    </asp:LinqDataSource>
    <dx:ASPxGridView ID="PaymentsGridView" runat="server" 
        AutoGenerateColumns="False" DataSourceID="PaymentsDataSource"
        KeyFieldName="CourseID">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="CourseID" ReadOnly="True"  
                VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Surname" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Phone" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CouponNumber" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ReferenceSource" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CourseNumber" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Summ" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PaymentDate" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransactionId" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <br />

</asp:Content>

