<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- INCLUDE head.tpl -->
<body><div class="bg">
<div class="main">
    <!-- INCLUDE widget/menu.tpl -->
    <div class="header"><table><tr>
        <td width="33%"><div class="logo">
            <a href="./"><!-- BEGIN logo --><img src="images/logo/logo.png?rand={RAND}" alt="{SITE_NAME}"<!-- BEGIN widget.if_cert --> style="max-width:310px;"<!-- END widget.if_cert -->/><!-- END logo --></a>
        </div></td>
        <!-- BEGIN widget.if_cert -->
        <td width="33%">
            <!-- INCLUDE widget/cert.tpl -->
        </td>
        <!-- END widget.if_cert -->
        <td width="33%"><div class="contact">
            <div class="phone"><span>{PHONE}</span></div>
            <div class="phone2"><span>{PHONE2}</span></div>
            <div class="time">{WORK_HOURS}</div>
            <div class="button red3 call">Заказать обратный звонок</div>
        </div></td>
    </tr>
    <!-- BEGIN descript -->
    <tr><td colspan="3"><div class="descript">{DESCRIPT}</div></td></tr>
    <!-- END descript -->
    </table></div>
    <!-- BEGIN blocks -->
    <div class="blocks"><table><tr>
        <!-- BEGIN special -->
        <td rowspan="2" width="66%" class="w"><div class="block special item">
            <h2>{special.HEADER}</h2>
            <div class="L img" style="width:300px;"><!-- BEGIN special.img --><a href="item/{special.KEY}"><img src="images/stuff/special.png?rand={RAND}" alt="" style="max-width:300px;"/></a><!-- END special.img --></div>
            <div class="R" style="margin-left:320px;">
                <h2><a href="item/{special.KEY}">{special.NAME}</a></h2>
                <div class="text">{special.BODY}</div>
                <!-- BEGIN special.param -->
                <div class="param"><span>{special.param.NAME}</span>
                    <select>
                        <!-- BEGIN special.param.val --><option value="{special.ID}:{special.param.val.NUM}" rel="{special.param.val.PRICE}" rel2="{special.param.val.PRICE_OLD}">{special.param.val.NAME}</option><!-- END special.param.val -->
                    </select>
                </div>
                <!-- END special.param -->
                <!-- BEGIN special.price_old --><div class="oldprice text">Старая цена: <span>{special.PRICE_OLD}</span> {CURRENCY}</div><!-- END special.price_old -->
                <!-- BEGIN special.price --><div class="price">Цена: <span>{special.PRICE}</span> {CURRENCY}</div><!-- END special.price -->
                <div class="actions">
                    <div class="button red3 {BUTTON_ORDER_CLASS}" id="{special.ID}<!-- BEGIN special.param -->:0<!-- END special.param -->">{BUTTON_ORDER_TEXT}</div>
                </div>
            </div>
        </div></td>
        <!-- END special -->
        
        <!-- BEGIN guarantee -->
        <td width="33%" class="w"><div class="block">
            <h2>{guarantee.HEADER}</h2>
            <div class="L"><!-- BEGIN guarantee.img --><a href="{guarantee.LINK}"><img src="images/stuff/guarantee.png?rand={RAND}" alt=""/></a><!-- END guarantee.img --></div>
            <div class="R">
                <div class="text">{guarantee.BODY}</div>
            </div>
        </div></td>
        <!-- END guarantee -->
        <!-- BEGIN promo -->
        <!-- BEGIN special --></tr><tr><!-- END special -->
<!-- BEGIN promo.timer -->
<script:no-cache language="javascript" type="text/javascript"> 
$(document).ready(function(){
    /*setInterval(function(){
        var now = new Date(); 
        var endTS = {promo.TIMESTAMP}*1000; 
        var totalRemains = (endTS-now.getTime()); 
        if (totalRemains>1){ 
            var RemainsSec=(parseInt(totalRemains/1000)); 
            var RemainsFullDays=(parseInt(RemainsSec/(24*60*60))); 
            var secInLastDay=RemainsSec-RemainsFullDays*24*3600; 
            var RemainsFullHours=(parseInt(secInLastDay/3600)); 
            if (RemainsFullHours<10){RemainsFullHours="0"+RemainsFullHours}; 
            var secInLastHour=secInLastDay-RemainsFullHours*3600; 
            var RemainsMinutes=(parseInt(secInLastHour/60)); 
            if (RemainsMinutes<10){RemainsMinutes="0"+RemainsMinutes}; 
            var lastSec=secInLastHour-RemainsMinutes*60; 
            if (lastSec<10){lastSec="0"+lastSec}; 
            $('.timer>.digits').html((RemainsFullDays ? "<span>"+RemainsFullDays+"дн.</span> " :"")+RemainsFullHours+":"+RemainsMinutes+":"+lastSec);
        } 
        else {$(".timer").remove();} 
    },1000);*/
});
</script>
<!-- END promo.timer -->
        <td width="33%" class="w"><div class="block">
            <h2>{promo.HEADER}</h2>
            <div class="L"><!-- BEGIN promo.img --><a href="{promo.LINK}"><img src="images/stuff/promo.png?rand={RAND}" alt=""/></a><!-- END promo.img --></div>
            <div class="R">
                <div class="text">{promo.BODY}</div>
                <!-- BEGIN promo.timer -->
                <div class="timer">
                    <p>До конца акции</p>
                    <div class="digits"></div>
                </div>
                <!-- END promo.timer -->
            </div>
        </div></td>
        <!-- END promo -->
        <!-- BEGIN no_special --><!-- BEGIN discount -->
        <td width="33%" class="w"><div class="block">
            <h2>{discount.HEADER}</h2>
            <div class="L"><!-- BEGIN discount.img --><a href="{discount.LINK}"><img src="images/stuff/discount.png?rand={RAND}" alt=""/></a><!-- END discount.img --></div>
            <div class="R"><div class="text">{discount.BODY}</div></div>
        </div></td>
        <!-- END discount --><!-- END no_special -->
    </tr></table></div>
    <!-- END blocks -->
    <!-- INCLUDE widget/cats.tpl -->
    <div class="body">
        <div class="R">
            <!-- BEGIN special --><!-- BEGIN discount -->
            <div class="w block">
                <h2>{discount.HEADER}</h2>
                <div class="L"><!-- BEGIN discount.img --><a href="{discount.LINK}"><img src="images/stuff/discount.png?rand={RAND}" alt=""/></a><!-- END discount.img --></div>
                <div class="R"><div class="text">{discount.BODY}</div></div>
            </div>
            <!-- END discount --><!-- END special -->
            <!-- INCLUDE widget/search.tpl -->
            <!-- INCLUDE widget/testimonials.tpl -->
            <!-- INCLUDE widget/justbuy.tpl -->
            <!-- INCLUDE widget/community.tpl -->
        </div>
        <div class="L">