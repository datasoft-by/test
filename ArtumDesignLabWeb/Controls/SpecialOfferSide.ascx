<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SpecialOfferSide.ascx.cs" Inherits="Controls_SpecialOfferSide" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>
<noindex>
<!--<asp:Literal ID="ltrDiscount" runat="server" />-->
<!--<asp:Literal ID="ltrNewPrice" runat="server" />-->
<!--<asp:Literal ID="ltrOldPrice" runat="server" />-->

    <div class="action-banner">
	    <img width="305" height="240" src="http://www.artumstudio.ru/images/sidebar.jpg">
	    <div style="padding-left:19px;padding-top:10px;" class="action-header"><span style="font-size:16px;font-weight:bold;color:#FFCF2A;text-decoration:underline;">Бесплатная консультация дизайнера интерьера!</span></div>
	    <div class="action-footer">
		    <a class="button-var callorder3_btn" style="text-align: center;right:13px;top:-20px;left:13px;" href="#call-window">Получить консультацию</a>
	    </div>
        <div style="right:14px; top:118px;" class="clock">
		    <span id="day" class="day-clock"><asp:Literal ID="ltrDay" runat="server" /></span>
		    <span id="hour" class="hour-clock"><asp:Literal ID="ltrHour" runat="server" /></span>
		    <span id="min" class="min-clock"><asp:Literal ID="ltrMin" runat="server" /></span>
		    <span id="sec" class="sec-clock"><asp:Literal ID="ltrSec" runat="server" /></span>
	    </div>
	    <div style="display:none;" class="label"></div>
    </div>
    <script type="text/ecmascript">
        $(function () {
            function zeroPad(nr, base) {
                var len = (String(base).length - String(nr).length) + 1;
                return len > 0 ? new Array(len).join('0') + nr : nr;
            }

            var daysContainer = $("#day");
            var hoursContainer = $("#hour");
            var minsContainer = $("#min");
            var secsContainer = $("#sec");
            var days = "<%= System.Configuration.ConfigurationManager.AppSettings.Get("BannerDaysLeft") %>";
            //daysContainer.text(zeroPad(days, 10));
            daysContainer.text(zeroPad(daysContainer, 10));

            function redraw() {
                var date = new Date();
                var hours = 24 - date.getHours() - 1;
                var mins = 60 - date.getMinutes();
                var secs = 60 - date.getSeconds();
                if (secs == 0 && mins == 0)
                    hours++;

                hoursContainer.text(zeroPad(hours, 10));
                minsContainer.text(zeroPad(mins, 10));
                secsContainer.text(zeroPad(secs, 10));
            }
            redraw();
            setInterval(redraw, 1000);
        });
    </script>
</noindex>

