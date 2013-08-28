$(document).ready(function () {
    //align element in the middle of the screen
    $.fn.alignCenter = function () {
        //get margin left
        var marginLeft = -$(this).width() / 2 + 'px';
        //get margin top
        var marginTop = -$(this).height() / 2 + 'px';
        //return updated element
        return $(this).css({ 'margin-left': marginLeft, 'margin-top': marginTop });
    };



    //close pop-up box
    function closePopup() {
        $('#popupOverlay').hide();
        $('.popup').hide();
    };

    //open pop-up
    function showPopup() {
        $('#popupOverlay').height($(document).height()).fadeTo('slow', 0.7);
    };

    $('#popupOverlay').click(function () {
        closePopup();
    });


    $('.close-popup').click(function () {
        closePopup();
    });

});

$(document).ready(function () {
    // Main menu
    $('.nav .firstlevel').hover(function () {
        $(this).toggleClass("active");
    });

    $('.object-list li h3').click(function () {
        $(this).toggleClass('active');
        $(this).next('.object-photos-holder').slideToggle('slow');
    });

    $(".js-price-toggler").click(function () {
        var item = $(this);
        $("i", item)
            .toggleClass("arrow-right")
            .toggleClass("arrow-down");
        item
            .next(".js-prices")
            .slideToggle("slow");
    });

    //    $('.side-nav span').click(function () {
    //        $(this).next('.second-level').slideToggle('slow');
    //        $(this).parent('.side-nav li').toggleClass('active');
    //    });


    //http://sorgalla.com/projects/jcarousel/

    $('#jcarousel').jcarousel({ scroll: 4 });

    $('#gallery a, .object-photos a, .ourwork-list .ourwork-img a, .oject-list-holder .object-list a, a[rel^=lightbox]').lightBox({
        fixedNavigation: true,
        imageLoading: '/images/lightbox-ico-loading.gif',
        imageBtnClose: '/images/lightbox/close.png',
        imageBtnPrev: '/images/lightbox/prev.png',
        imageBtnNext: '/images/lightbox/next.png',
        containerBorderSize: 9,
        containerResizeSpeed: 0
    });
    $(".ourwork-list .img-overlay").click(function () {
        // Вызываем лайтбокс кликом по ссылке
        $(this).closest(".ourwork-img").find("a").click();
    });
    $(".object-list .img-overlay").click(function () {
        // Вызываем лайтбокс кликом по ссылке
        $(this).closest(".ourwork-img").find("a").click();
    });

    $('.callorder_btn, .callorder2_btn, .callorder3_btn').fancybox({ 'margin': 0, 'padding': 0, 'overlayColor': '#000' });

    $('input[placeholder], textarea[placeholder]').placeholder();

    function timer() {
        var seconds = parseInt($('#day').text(), 10) * 24 * 60 * 60 + parseInt($('#hour').text(), 10) * 60 * 60 +
                      parseInt($('#min').text(), 10) * 60 + parseInt($('#sec').text(), 10) - 1;

        if (seconds > 0) {
            var day = Math.floor(seconds / 86400);
            seconds -= day * 86400;
            var hour = Math.floor(seconds / 3600);
            seconds -= hour * 3600;
            var min = Math.floor(seconds / 60);
            seconds -= min * 60;
            var sec = seconds;

            $('#day').text(day > 9 ? day : '0' + day);
            $('#hour').text(hour > 9 ? hour : '0' + hour);
            $('#min').text(min > 9 ? min : '0' + min);
            $('#sec').text(sec > 9 ? sec : '0' + sec);
        } else {
            $('#day').text("00");
            $('#hour').text("00");
            $('#min').text("00");
            $('#sec').text("00");
        }
    }

    timer();
    setInterval(timer, 1000);
});

function validateCallOrderForm(item) {
    var form = $(item).closest(".js-request-form");

    var phone = $(".js-request-phone", form).val();
    var emailField = $(".js-request-email", form);
    var email = emailField.length > 0 ? emailField.val() : null;

    if (phone.length == 0 && (email == null || email.length == 0)) {
        alert("Укажите номер телефона и E-mail!");
        return false;
    }
    if (email == null || email.length == 0) {
        alert("Укажите E-mail!")
        return false;
    }
    if (phone.length == 0) {
        alert("Укажите номер телефона!");
        return false;
    }
    if (!phone.match(/^[+]{0,1}[- (),0-9]{7,}$/)) {
        alert("Некорректно введен номер!")
        return false;
    }
    if (!email.match(/^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/)) {
        alert("Некорректно введен E-mail!")
        return false;
    }
}

function validateCallOrderFormShort(item) {
    var form = $(item).closest(".js-request-form");
    var phone = $(".js-request-phone", form).val();
    if (phone.length == 0) {
        alert("Укажите номер телефона");
        return false;
    }
    if (!phone.match(/^[+]{0,1}[- (),0-9]{7,}$/)) {
        alert("Некорректно введен номер!")
        return false;
    }
    //alert("Ok!")
    //return false;
}

function validatePaymentForm(item) {
    var form = $(item).closest(".js-request-form");

    var name = $(".js-request-name", form).val();
    var surname = $(".js-request-surname", form).val();
    var phone = $(".js-request-phone", form).val();
    var emailField = $(".js-request-email", form);
    var email = emailField.length > 0 ? emailField.val() : null;
    var source = $(".js-request-source", form).val();

    if (name.length == 0 || surname == 0 || phone.length == 0 || email == null || email.length == 0 || source == 0) {
        alert("Заполните все контактные данные!");
        return false;
    }

}