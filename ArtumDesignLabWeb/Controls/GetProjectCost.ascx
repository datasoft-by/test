<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GetProjectCost.ascx.cs" Inherits="Controls_GetProjectCost" %>

<div style="height:330px;width:554px;" class="request-form with-phone js-request-form">
<noindex>
   
    <h4 style="margin-bottom:15px;font-size:26px;">Рассчитать стоимость дизайн-проекта в 3-х ценовых вариантах (эконом, стандарт, премиум):</h4>

    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Ваше имя:</div>
    <asp:TextBox class="f1 js-request-name" ID="txtName" placeholder="Ваше имя" runat="server"  />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Телефон:</div>
    <asp:TextBox class="f2 js-request-phone" ID="txtPhone" placeholder="Телефон" runat="server" />
    <div style="color:Black;font-size:16px;font-weight:bold;margin-bottom:3px;">Количество квадратных метров:</div>
    <asp:TextBox class="f2 js-request-phone" ID="txtMeters" placeholder="Квадратных метров:" runat="server" />
   
    <div class="button-holder" style="right:245px;top: 329px;width:330px;">
        <asp:LinkButton runat="server" Width="330" class="button js-send-form" ID="LinkButtonOrder" Text="Рассчитать стоимость проекта" OnClick="LinkButtonOrder_Click" OnClientClick="return validateCallOrderForm(this);" />
    </div>
</noindex>
</div>