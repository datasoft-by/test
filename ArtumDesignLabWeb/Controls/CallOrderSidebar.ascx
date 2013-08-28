<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CallOrderSidebar.ascx.cs" Inherits="Controls_CallOrderSidebar" %>
<noindex>
    <div style="padding-right:10px;padding-left:17px;padding-bottom:8px;" class="request-form js-request-form">
			<h4 style="font-size:17px;">Оставить заявку на бесплатную консультацию</h4>
            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="side-call-title">Мы обязательно перезвоним!</asp:Panel>
            <asp:TextBox Width="258" id="txtName" runat="server" placeholder="Ваше имя" class="field1 js-request-name" />
            <asp:TextBox Width="258" id="txtPhone" runat="server" placeholder="Телефон" class="field2 js-request-phone" />
            <!--<asp:TextBox Width="258" id="txtComment" runat="server" placeholder="Комментарий (необязательно)" class="field3 js-request-comment" />-->
			<div class="button-holder">
				<asp:LinkButton  runat="server" class="button js-send-form" Text="Оставить заявку" ID="LinkButtonOrder" OnClick="LinkButtonOrder_Click" OnClientClick="return validateCallOrderForm(this);" />
			</div>
            <br />
            <table>
            <tr>
                <td>
                    <img style="width:30px;" src="http://artumstudio.ru/images/conf.png">
                </td>
                <td>
                    <div style="padding-left:8px;color:Black;font-size:12px;font-weight:bold;">
                    Мы гарантируем конфиденциальность ваших данных.
                    </div>
                </td>
            </tr>
            </table>
			<!--<div class="stamp">
			</div>-->
		</div>
        </noindex>