<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CallDesignerConsultation.ascx.cs" Inherits="Controls_CallDesignerConsultation" %>

<div style="height:420px;width:554px;" class="request-form with-phone js-request-form">
<noindex>
    <h4 style="margin-bottom:15px;font-size:26px;">Оставьте заявку на бесплатную консультацию дизайнера!</h4>

    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Ваше имя:</div>
    <asp:TextBox class="f1 js-request-name" ID="txtName" runat="server"  />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Телефон:*</div>
    <asp:TextBox class="f2 js-request-phone" ID="txtPhone" runat="server" />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Ваш вопрос:</div>
    <asp:TextBox TextMode="MultiLine"  Width="330" Height="150px" class="f2 js-request-phone" ID="txtQuestion" runat="server" style="resize:none;" />

     <div class="button-holder" style="right:249px;top: 410px;width:330px;">
        <asp:LinkButton runat="server" Width="330" class="button js-send-form" ID="LinkButtonOrder" Text="Отправить" OnClick="LinkButtonOrder_Click" OnClientClick="return validateCallOrderFormShort(this);" />
    </div>
</noindex>
</div>