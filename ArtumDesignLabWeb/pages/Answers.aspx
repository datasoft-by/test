<%@ Page Title="Ответы дизайнера | студия дизайна «Artum»" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" 
CodeFile="Answers.aspx.cs" Inherits="pages_Answers" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">

<script type="text/javascript">
    function toggle(id) {
        $("." + id).toggle();
        return false;
    }
</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebarContent" Runat="Server">
    <at:DesignProjectInfo ID="DesignProjectInfo1" runat="server" /> 
    <at:Portfolio ID="Portfolio1" runat="server" />
    <at:ContactInfo ID="contactInfo" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="basicContent" Runat="Server">
<h1>Ответы дизайнера</h1>
<div style="height:450px;width:554px;" class="request-form with-phone js-request-form">
<noindex>
    <h4 style="margin-bottom:15px;font-size:26px;">Задайте вопрос нашим дизайнерам!</h4>
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Ваше имя:</div>
    <asp:TextBox class="f1 js-request-name" ID="txtName" runat="server"  />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">E-mail:*</div>
    <asp:TextBox class="f2 js-request-email" ID="txtEmail" runat="server" />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Телефон:*</div>
    <asp:TextBox class="f2 js-request-phone" ID="txtPhone" runat="server" />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Ваш вопрос:</div>
    <asp:TextBox TextMode="MultiLine" Width="330" Height="150px" class="f2 js-request-question" ID="txtQuestion" runat="server" style="resize:none;" />
     <div class="button-holder" style="right:248px;top:435px;width:332px;">
        <asp:LinkButton runat="server" Width="330" class="button js-send-form" ID="LinkButtonOrder" Text="Отправить" OnClick="LinkButtonQuestion_Click" OnClientClick="return validateCallOrderForm(this);" />
    </div>
</noindex>
</div>

<asp:ListView ID="lvQuestion" runat="server" OnPagePropertiesChanging="lvQuestion_PagePropertiesChanging" OnDataBound="lvwItems_DataBound" >
            <LayoutTemplate>
                <ul>
                    <li runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>
    <ItemTemplate>
        <li>
            <div style="margin-bottom:20px;">
                <%# Eval("QuestionText") %>
                <br /><a href="#" id="question<%# Eval("QuestionID") %>" onclick="return toggle(this.id)">Ответ дизайнера</a>
            </div>
            <div class="question<%# Eval("QuestionID") %> hidden" style="margin-bottom:20px; min-height:200px;">
                <div class="snippet-img">
                    <img width="100" alt="<%# Eval("Personnel.Name") %>" src="<%# SiteHelper.GetWebPath(Settings.PersonalImages + Eval("Personnel.ThumbImage"))%>" />
                </div> 
                <div class="review-txt">  
                    <%# Eval("AnswerText")%><br />
                    С уважением, <a href="<%# SiteHelper.GetWebPath("~/About.aspx/" + Eval("Personnel.Url")) %>"><%# Eval("Personnel.Name")%></a>
                </div>
            </div>
        </li>
    </ItemTemplate>
</asp:ListView>
        <div class="paginator-holder side">
            <span>Страницы:</span>
            <div class="paginator">
                <asp:DataPager ID="dpgPager" PagedControlID="lvQuestion" QueryStringField="page" PageSize="10" runat="server">
                <Fields>
                    <asp:NextPreviousPagerField 
                        ButtonType="Button"
                        ButtonCssClass="arrows prew"
                        RenderDisabledButtonsAsLabels="true"
                        ShowFirstPageButton="false"
                        ShowPreviousPageButton="true" PreviousPageText="<"
                        ShowNextPageButton="false"
                        ShowLastPageButton="false" /><%--ShowFirstPageButton="true" FirstPageText="<<"--%>

                    <asp:NumericPagerField
                        ButtonType="Button"
                        ButtonCount="6"
                        CurrentPageLabelCssClass="current"
                        RenderNonBreakingSpacesBetweenControls="true" />

                    <asp:NextPreviousPagerField
                        ButtonType="Button"
                        ButtonCssClass="arrows next"
                        RenderDisabledButtonsAsLabels="true"
                        ShowFirstPageButton="false"
                        ShowPreviousPageButton="false"
                        ShowLastPageButton="false"
                        ShowNextPageButton="true" NextPageText=">" /><%--ShowLastPageButton="true" LastPageText=">>"--%>

                </Fields>
                    
                </asp:DataPager>
            </div>
        </div>



</asp:Content>

