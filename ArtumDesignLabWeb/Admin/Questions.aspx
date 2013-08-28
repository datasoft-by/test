<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Template.Master" AutoEventWireup="true" 
CodeFile="Questions.aspx.cs" Inherits="ArtumDesignLab.Admin.Questions" ValidateRequest="false" %>
<%@ Import Namespace="ArtumDesignLab.Utils"%>

<asp:Content ID="Content1" ContentPlaceHolderID="cntpCenter" Runat="Server">
    <div class="main_body_header">
        Вопросы
    </div>
    <br />
    <dx:ASPxPopupControl ID="popUpQuestion" runat="server" HeaderText="Редактировать"
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
                            <asp:Label ID="lblUpdateId" runat="server"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Имя
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtName" runat="server" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                   <tr>
                        <td>
                            Телефон
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtPhone" runat="server"   Width="500px"></asp:TextBox>
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
                            Вопрос
                        </td>
                        <td align="left">
                            <dx:ASPxHtmlEditor ID="htmlEditorQuestion" runat="server">
                            </dx:ASPxHtmlEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Ответ
                        </td>
                        <td align="left">
                            <dx:ASPxHtmlEditor ID="htmlEditorAnswer" runat="server">
                            </dx:ASPxHtmlEditor>
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
                            Показать на сайте
                        </td>
                        <td align="left">
                            <asp:CheckBox ID="chkVisible" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <dx:ASPxButton ID="btnSave" runat="server" Text="Сохранить" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                CssPostfix="Aqua" OnClick="btnSave_Click" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <asp:LinqDataSource ID="QuestionsDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableUpdate="True" TableName="Questions">
    </asp:LinqDataSource>

     <asp:LinqDataSource ID="PersonnelDataSource" runat="server" ContextTypeName="ArtumDesignLab.SiteDataContext"
        EnableDelete="True" EnableUpdate="True" TableName="Personnels">
    </asp:LinqDataSource>

    <dx:ASPxGridView ID="QuestionsGridView" runat="server" Width="1130" 
        AutoGenerateColumns="False" DataSourceID="QuestionsDataSource" OnRowCommand="QuestionsGridView_RowCommand"
        KeyFieldName="QuestionID">
        <SettingsPager PageSize="20"></SettingsPager>
        <Columns>
                <dx:GridViewDataHyperLinkColumn VisibleIndex="6">
                    <DataItemTemplate>
                        <asp:LinkButton ForeColor="Maroon" ID="btnChange" runat="server" Text='Изменить'
                            CommandName="Change" CommandArgument='<%# Eval("QuestionID") %>'></asp:LinkButton>
                        <br />
                        <asp:LinkButton ForeColor="Maroon" ID="btnDelete" runat="server" Text='Удалить' CommandName="Delete"
                            CommandArgument='<%# Eval("QuestionID") %>'></asp:LinkButton>
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn FieldName="Name" Caption="Имя"  VisibleIndex="1" Width="70">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Phone" Caption="Телефон" VisibleIndex="2" Width="105">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3" Width="200">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataColumn Caption="Вопрос" VisibleIndex="4" Width="200" >
                <DataItemTemplate>
                    <%# Eval("QuestionText")%> 
                </DataItemTemplate>
                <EditItemTemplate>
                    <textarea style="height:150px; width:100%"><%# Eval("QuestionText") != null ? SiteHelper.br2nl(Eval("QuestionText").ToString()) : ""%></textarea> 
                </EditItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Ответ" VisibleIndex="5" Width="200">
                <DataItemTemplate>
                    <%# Eval("AnswerText")%> 
                </DataItemTemplate>
                <EditItemTemplate>
                    <textarea style="height:150px; width:100%"><%# Eval("AnswerText") != null ? SiteHelper.br2nl(Eval("AnswerText").ToString()) : ""%></textarea> 
                </EditItemTemplate>
           </dx:GridViewDataColumn>
            <dx:GridViewDataCheckColumn FieldName="Visible" Caption="Показать<br />на сайте" VisibleIndex="5" Width="50">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="Date" Caption="Дата" EditFormSettings-Visible="False" VisibleIndex="6">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Name="DesignerID" FieldName="DesignerID" Caption="Дизайнер" VisibleIndex="5">
                <PropertiesComboBox ValueType="System.Int32" DataSourceID="PersonnelDataSource" TextField="Name" ValueField="PersonnelID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>

 </asp:Content>
