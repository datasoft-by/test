<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CallDesignerQuestion.ascx.cs" Inherits="Controls_CallDesignerQuestion" %>

<div style="height:420px;width:450px;" class="request-form with-phone js-request-form">
<noindex>
    <div class="close" style="float: right; font-weight: bold; border-radius: 15px 15px 15px 15px; display: inline-block; font-size: 10px; text-transform: uppercase; padding: 5px; line-height: 7px; cursor: pointer; margin: -10px -15px 0px 0px; border: 1px solid gray;" onclick="$.fancybox.close()">x</div>
    <h4 style="margin-bottom:15px;font-size:26px;">Оставьте заявку на бесплатную консультацию дизайнера!</h4>
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Ваше имя:</div>
    <asp:TextBox class="f1 js-request-name" ID="txtName" runat="server"  />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Телефон:*</div>
    <asp:TextBox class="f2 js-request-phone" ID="txtPhone" runat="server" />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Ваш вопрос:</div>
    <asp:TextBox TextMode="MultiLine" Width="330" Height="150px" class="f2 js-request-question" ID="txtQuestion" runat="server" style="resize:none;" />
    <div class="button-holder" style="right:144px;top:410px;width:332px;">
        <asp:LinkButton runat="server" Width="330" class="button js-send-form" ID="LinkButtonOrder" Text="Отправить" OnClick="LinkButtonOrder_Click" OnClientClick="return validateCallOrderFormShort(this);" />
    </div>
</noindex>
</div>