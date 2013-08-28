/*function setCookie(name, value, expires, path, domain, secure) {
    document.cookie = name + "=" + escape(value) +
        ((expires) ? "; expires=" + expires : "") +
        ((path) ? "; path=" + path : "") +
        ((domain) ? "; domain=" + domain : "") +
        ((secure) ? "; secure" : "");
}

function getCookie(name) {
    var cookie = " " + document.cookie;
    var search = " " + name + "=";
    var setStr = null;
    var offset = 0;
    var end = 0;
    if (cookie.length > 0) {
        offset = cookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = cookie.indexOf(";", offset)
            if (end == -1) {
                end = cookie.length;
            }
            setStr = unescape(cookie.substring(offset, end));
        }
    }
    return (setStr);
}

$(document).ready(function () {

    if (getCookie('clicks_num') == 3) {
        var tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);
        setCookie('clicks_num', 4, tomorrow);
        $('.callorder2_btn').click();
    }

    $('a').click(function () {
        if (!$(this).hasClass('callorder2_btn')) {
            if (!getCookie('clicks_num')) {
                var cn = 0;
            }
            else {
                var cn = getCookie('clicks_num');
            }

            if (cn < 3) {
                cn++;
                var tomorrow = new Date();
                tomorrow.setDate(tomorrow.getDate() + 1);
                setCookie('clicks_num', cn, tomorrow);
            }
        }
    });

}); 

*/