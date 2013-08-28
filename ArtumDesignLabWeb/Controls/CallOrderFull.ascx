<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CallOrderFull.ascx.cs" Inherits="Controls_CallOrderFull" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>
<%--$('#call-window input, #call-window textarea').val(''); OnClientClick=" $('#call-window .msg').show(); return true;"--%>
<div class="request-form with-phone js-request-form" style="width:554px;">
<noindex>
   <div class="close" style="float: right; font-weight: bold; border-radius: 15px 15px 15px 15px; display: inline-block; font-size: 10px; text-transform: uppercase; padding: 5px; line-height: 7px; cursor: pointer; margin: -10px -15px 0px 0px; border: 1px solid gray;" onclick="$.fancybox.close()">x</div>
<%--             <div style="float:right; padding-bottom:5px;">
                <a href="#" onclick="$.fancybox.close();return false;"><img alt="закрыть" height="15" width="17" src="<%= SiteHelper.GetSiteAddress() %>/Content/NewDesign/images/cancel.png" /></a>
            </div>
--%>    <h4 style="font-size:22px;">Получите бесплатную консультацию дизайнера! Выезд на объект!</h4>

    <asp:TextBox class="f1 js-request-name" ID="txtName1" placeholder="Ваше имя" runat="server"  />
    <asp:TextBox class="f2 js-request-phone" ID="txtPhone1" placeholder="Телефон*" runat="server" />
    <%--<asp:TextBox class="f2 js-request-meters" ID="txtMeters" placeholder="Кол-во квадратных метров" runat="server" />
    <asp:TextBox class="f3 js-request-email" ID="txtEmail" placeholder="e-mail" runat="server" />--%>
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
        <asp:LinkButton runat="server" class="button js-send-form" ID="LinkButtonOrder" Text="Оставить заявку" OnClick="LinkButtonOrder_Click" OnClientClick="return  validateCallOrderFormShort(this);" />
    </div>
    <div style="display:none;" class="stamp"></div>
</noindex>
</div>
