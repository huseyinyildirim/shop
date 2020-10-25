$(document).ready(function () {
    $('#txt_eposta').bind('keyup', function () {
        KucukHarf($(this))
    });

    $("#btn_uye_giris").click(function () {
        if (!MailKontrol($("#txt_eposta").val())) {
            GetTextJS(function (a) { alert(a) }, 31); YakSondur($("#txt_eposta"))
            return (false);
        }
        if ($("#txt_sifre2").val() == "") {
            GetTextJS(function (a) { alert(a) }, 218); YakSondur($("#txt_sifre2"))
            return (false);
        }
    })
})