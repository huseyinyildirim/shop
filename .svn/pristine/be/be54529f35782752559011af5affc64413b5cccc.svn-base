$(document).ready(function () {
    $('#txt_ad').bind('keyup', function () {
        BuyukHarf($(this))
    });
    $('#txt_telefon').bind('keyup', function () {
        SayisalKarakter($(this))
    });

    $("#sifre_guncelle").bind("change", function () {
        if (typeof $("input:checkbox[name=sifre_guncelle]:checked").val() == 'undefined') {

            $("#txt_eski_sifre").val('');
            $("#txt_sifre").val('');
            $("#txt_sifretekrar").val('');
            $("#txt_eski_sifre").attr("disabled", "disabled");
            $("#txt_sifre").attr("disabled", "disabled");
            $("#txt_sifretekrar").attr("disabled", "disabled");
        }
        else {
            $("#txt_eski_sifre").val('');
            $("#txt_sifre").val('');
            $("#txt_sifretekrar").val('');
            $("#txt_eski_sifre").removeAttr("disabled", "disabled");
            $("#txt_sifre").removeAttr("disabled");
            $("#txt_sifretekrar").removeAttr("disabled");
        }
    });

    $("#btn_kullanici_guncelle").click(function () {
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
        if (typeof $("input:checkbox[name=sifre_guncelle]:checked").val() != 'undefined') {

            if ($("#txt_eski_sifre").val() == "") {
                GetTextJS(function (a) { alert(a) }, 218); YakSondur($("#txt_eski_sifre"))
                return (false);
            }
            if ($("#txt_sifre").val() == "") {
                GetTextJS(function (a) { alert(a) }, 218); YakSondur($("#txt_sifre"))
                return (false);
            }
            if ($("#txt_sifretekrar").val() == "") {
                GetTextJS(function (a) { alert(a) }, 219); YakSondur($("#txt_sifretekrar"))
                return (false);
            }
            if (($("#txt_sifre").val() != "") && ($("#txt_sifretekrar").val() != "")) {
                if ($("#txt_sifre").val() != $("#txt_sifretekrar").val()) {
                    GetTextJS(function (a) { alert(a) }, 220); YakSondur($("#txt_sifretekrar"))
                    return (false);
                }
            }
            return (false);
        }
    })
})