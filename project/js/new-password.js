$(document).ready(function () {
    $('#txt_sifre').bind('keyup', function () {
        SayisalKarakter($(this))
    });
    $('#txt_sifretekrar').bind('keyup', function () {
        SayisalKarakter($(this))
    });

    $("#btn_kayit_ol").click(function () {
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
    })
})