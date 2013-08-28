<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Robokassa.ascx.cs" Inherits="Controls_Robokassa" %>
<noindex>
<br />
<br />
<a class="button-var callorder3_btn" href="#pay-window">Купить курс</a>
<br />
<br />
<br />
<div style="display: none;">
    <div id="pay-window">
        <div class="request-form with-phone js-request-form" style="width:554px;">
            <h4>
                <asp:Literal ID="litTitle" runat="server" />
            </h4>
<%--            <asp:DropDownList ID="ddlCourses" runat="server" >
                <asp:ListItem Text="3-х часовой Мастер-Класс" Value="1" />
                <asp:ListItem Text="Стандартный курс - 16 ак. часов" Value="2" />
                <asp:ListItem Text="Расширенный курс - 40 ак. часов" Value="3" />
            </asp:DropDownList>
--%>            <asp:TextBox class="js-request-name" ID="txtName" placeholder="Ваше имя" runat="server" />
            <asp:TextBox class="js-request-surname" ID="txtSurname" placeholder="Ваша фамилия" runat="server" />
            <asp:TextBox class="js-request-phone" ID="txtPhone" placeholder="Телефон" runat="server" />
            <asp:TextBox class="js-request-email" ID="txtEmail" placeholder="e-mail" runat="server" />
            <asp:TextBox class="js-request-number" ID="txtNumber" placeholder="Номер купона(если есть)" runat="server" />
            <asp:TextBox class="js-request-source" ID="txtSource" placeholder="Откуда узнали о наших курсах" runat="server" />
            <table>
                <tr>
                    <td>
                        <br />
                        <img width="30px;" src="http://artumstudio.ru/images/conf.png">
                    </td>
                    <td>
                        <div style="padding-left: 8px; padding-top: 14px; color: Black; font-size: 14px;
                            font-weight: bold;">
                            Мы гарантируем конфиденциальность<br>
                            ваших данных.
                        </div>
                    </td>
                </tr>
            </table>
            <div class="button-holder">
                <asp:LinkButton runat="server" class="button js-send-form" ID="LinkButtonPay" Text="Оплатить"
                    OnClick="LinkButtonPay_Click" OnClientClick="return validatePaymentForm(this);" />
            </div>
        </div>
    </div>
</div>
</noindex>
