<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OverlayNight.ascx.cs" Inherits="Controls_OverlayNight" %>
<div style="position: relative;width:500px;">

<div id="overlayNight" class="overlay night" style="display:block;">
    <div style="position: relative; z-index: 1;">
        <div style="position: absolute; z-index: 3; top:25px; left: 205px;height: 16px;width: 16px;">
            <a onclick="$('.overlay').hide(); return false;" class="ui-icon ui-icon-closethick" href="#">
            </a>
        </div>
        <div style="position: absolute; z-index: 2;top:-10px; left: 0px;" class="content">
            <h5>Ночная скидка</h5>
            <p>Всем посетителям нашего сайта в ночное время предоставляется дополнительная скидка 3%!!!</p>
            <p style="color:#ABC">Для фиксированной ночной дополнительной скидки, прямо сейчас отправьте нам заполненную форму. Наш менеджер свяжется с Вами в указанное время</p>
            
                <input runat="server" id="txtPhone" type="text" style="color:black;" onfocus="this.value='';this.onfocus=''"  value="Номер телефона" /><br/>
                <input runat="server" id="txtName" type="text" style="color:black;" onfocus="this.value='';this.onfocus=''"  value="Ваше имя" /><br/>
                <input runat="server"  id="txtTime" type="text" style="color:black;" onfocus="this.value='';this.onfocus=''" value="Удобное время звонка" /><br/>
                <!-- <input type="hidden" name="type" value="night-discount">-->
                <asp:LinkButton runat="server" ID="lnkSend" CssClass="button" 
                Text="Жду звонка" onclick="lnkSend_Click"></asp:LinkButton>
               
            
        </div>
    </div>

    </div>
</div>
<script type="text/javascript">
    $(function () {
        var time = new Date().getHours();
        if (time >= 22 || time <= 6)
            $("#overlayNight").show();
    });
</script>


