<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CallOrderShort.ascx.cs" Inherits="Controls_CallOrderShort" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>
<div class="request-form js-request-form" style="width:300px;">
<noindex>
   <div class="close" style="float: right; font-weight: bold; border-radius: 15px 15px 15px 15px; display: inline-block; font-size: 10px; text-transform: uppercase; padding: 5px; line-height: 7px; cursor: pointer; margin: -10px -15px 0px 0px; border: 1px solid gray;" onclick="$.fancybox.close()">x</div>
 			<h4 style="font-size:22px;">Оставьте пожалуйста свой номер телефона и мы Вам перезвоним!</h4>
            <asp:TextBox Width="282" id="txtName" runat="server" placeholder="Ваше имя" class="f1 js-request-name" />
            <asp:TextBox Width="282" id="txtPhone" runat="server" placeholder="Телефон*" class="f2 js-request-phone" />
			<div class="button-holder">
				<asp:LinkButton  runat="server" class="button js-send-form" Text="Оставить заявку" ID="LinkButtonOrder" OnClick="LinkButtonOrder_Click" OnClientClick="return validateCallOrderFormShort(this);" />
			</div>
            <br />
</noindex>
</div>
