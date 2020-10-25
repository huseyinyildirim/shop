$(document).ready(function () {
    $('#txt_hizli_kullanici_adi').bind('keyup', function () {
        KucukHarf($(this))
    });

    $("#kullanici_giris").click(function () {
        if (!MailKontrol($("#txt_hizli_kullanici_adi").val())) {
            GetTextJS(function (a) { alert(a) }, 31); YakSondur($("#txt_hizli_kullanici_adi"))
            return (false);
        }
        if ($("#txt_hizli_sifre").val() == "") {
            GetTextJS(function (a) { alert(a) }, 87); YakSondur($("#txt_hizli_sifre"))
            return (false);
        }
    })
})