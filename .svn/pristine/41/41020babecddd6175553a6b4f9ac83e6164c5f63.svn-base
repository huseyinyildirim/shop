$(document).ready(function () {
    GetDialog("#div_uyelik");

    $("#link_uyelik").click(function () {
        $("#div_uyelik").dialog("open");
        GetTextJS(function (a) { $("#div_uyelik").html(a); }, 233);
        return false;
    });

    $('#txt_ad').bind('keyup', function () {
        BuyukHarf($(this))
    });
    $('#txt_eposta').bind('keyup', function () {
        KucukHarf($(this))
    });
    $('#txt_telefon').bind('keyup', function () {
        SayisalKarakter($(this))
    });

    $("#btn_kayit_ol").click(function () {
        if ($("#txt_ad").val() == "") {
            GetTextJS(function (a) { alert(a) }, 29); YakSondur($("#txt_ad"))
            return (false);
        }
        if ($("#txt_eposta").val() == "") {
            GetTextJS(function (a) { alert(a) }, 30); YakSondur($("#txt_eposta"))
            return (false);
        }
        if (!MailKontrol($("#txt_eposta").val())) {
            GetTextJS(function (a) { alert(a) }, 31); YakSondur($("#txt_eposta"))
            return (false);
        }
        if ($("#txt_telefon").val() == "") {
            GetTextJS(function (a) { alert(a) }, 32); YakSondur($("#txt_telefon"))
            return (false);
        }
        if ($("#txt_sifre").val() == "") {
            GetTextJS(function (a) { alert(a) }, 218); YakSondur($("#txt_sifre"))
            return (false);
        }
        if ($("#txt_sifretekrar").val() == "") {
            GetTextJS(function (a) { alert(a) }, 218); YakSondur($("#txt_sifretekrar"))
            return (false);
        }
        if (($("#txt_sifre").val() != "") && ($("#txt_sifretekrar").val() != "")) {
            if ($("#txt_sifre").val() != $("#txt_sifretekrar").val()) {
                GetTextJS(function (a) { alert(a) }, 220); YakSondur($("#txt_sifretekrar"))
                return (false);
            }
        }
        if (typeof $("input:checkbox[name=uyelik_sozlesmesi]:checked").val() == 'undefined') {
            GetTextJS(function (a) { alert(a) }, 235); YakSondur($("#uyelik_sozlesmesi"))
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