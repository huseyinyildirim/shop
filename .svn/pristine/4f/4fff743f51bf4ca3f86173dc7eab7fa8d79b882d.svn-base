$(document).ready(function () {
    $('#txt_eposta').bind('keyup', function () {
        KucukHarf($(this))
    });

    $('#txt_ad').bind('keyup', function () {
        BuyukHarf($(this))
    });
    $('#txt_telefon').bind('keyup', function () {
        SayisalKarakter($(this))
    });

    $("#btn_iletisim_gonder").click(function () {
        if ($("#txt_ad").val() == "") {
            GetTextJS(function (a) { alert(a) }, 29); YakSondur($("#txt_ad"))
            return (false);
        }
        if (!MailKontrol($("#txt_eposta").val())) {
            GetTextJS(function (a) { alert(a) }, 31); YakSondur($("#txt_eposta"))
            return (false);
        }
        if ($("#txt_telefon").val() == "") {
            GetTextJS(function (a) { alert(a) }, 90); YakSondur($("#txt_telefon"))
            return (false);
        }
        if ($("#txt_mesaj").val() == "") {
            GetTextJS(function (a) { alert(a) }, 33); YakSondur($("#txt_mesaj"))
            return (false);
        }
        if ($("#recaptcha_response_field").val() == "") {
            GetTextJS(function (a) { alert(a) }, 34); YakSondur($("#recaptcha_response_field"));
            return (false)
        }
        if ($("#recaptcha_response_field").val() != "") {
            if ($("#recaptcha_response_field").val().length < 5) {
                GetTextJS(function (a) { alert(a) }, 35); YakSondur($("#recaptcha_response_field"));
                return (false)
            }
        }
    })
})