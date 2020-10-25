$(document).ready(function () {
    $('#txt_eposta').bind('keyup', function () {
        KucukHarf($(this))
    });

    $("#btn_kayit_ol").click(function () {
        if ($("#txt_eposta").val() == "") {
            GetTextJS(function (a) { alert(a) }, 30); YakSondur($("#txt_eposta"))
            return (false);
        }
        if (!MailKontrol($("#txt_eposta").val())) {
            GetTextJS(function (a) { alert(a) }, 31); YakSondur($("#txt_eposta"))
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