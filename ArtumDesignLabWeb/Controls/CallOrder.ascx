<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CallOrder.ascx.cs" Inherits="Controls_CallOrder" %>
<noindex>
<div class="request-form with-phone js-request-form">
    <h4><asp:Literal ID="litTitle" runat="server">Оставьте свой номер телефона и получите бесплатную консультацию дизайнера!</asp:Literal></h4>

    <asp:TextBox class="f1 js-request-name" ID="txtName" placeholder="Ваше имя" runat="server"  />
    <asp:TextBox class="f2 js-request-phone" ID="txtPhone" placeholder="Телефон" runat="server" />
    <%--<asp:TextBox class="f3 js-request-email" ID="txtEmail" placeholder="e-mail" runat="server" />--%>
        <table>
            <tr>
                <td>
<br/>
                    <img width="30px;" src="http://artumstudio.ru/images/conf.png">
                </td>
                <td>
                <div style="padding-left:8px;padding-top:14px;color:Black;font-size:14px;font-weight:bold;">
                    Мы гарантируем конфиденциальность<br> ваших данных.
                    </div>
                </td>
            </tr>
            </table>
    <div class="button-holder">
        <asp:LinkButton runat="server" class="button js-send-form" ID="LinkButtonOrder" Text="Оставить заявку" OnClick="LinkButtonOrder_Click" OnClientClick="return validateCallOrderForm(this);" />
    </div>
    <div class="stamp"></div>
</div>
</noindex>
<%--<style type="text/css">
    .request-form {
        background: linear-gradient(to bottom,  #C93E00 0%, #D6CDC0 100%) repeat-scroll 0 0 trans
    }
</style>--%>