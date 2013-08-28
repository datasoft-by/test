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

    $('#gallery a, .object-photos a, .ourwork-list .ourwork-img a').lightBox({
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

    $('.callorder_btn, .callorder2_btn, .callorder3_btn').fancybox({ 'margin': 0, 'padding': 0, 'overlayColor': '#000' });



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

    var name = $(".js-request-name", form).val();
    var phone = $(".js-request-phone", form).val();
    var emailField = $(".js-request-email", form);
    var email = emailField.length > 0 ? emailField.val() : null;

    if (name.length == 0 && phone.length == 0 && (email == null || email.length == 0)) {
        alert("Заполните контактные данные!");
        return false;
    }

    if (phone.length == 0 && (email == null || email.length == 0)) {
        alert("Заполните поля телефон или email");
        return false;
    } else if (name.length == 0) {
        alert("Заполните имя");
        return false;
    }
}