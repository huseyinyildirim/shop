$(document).ready(function () {
    $("#btn_havale_odeme").click(function () {
        if (typeof $("input:radio[name=hesap_no_id]:checked").val() == 'undefined') {
            GetTextJS(function (a) { alert(a) }, 224);
            return (false);
        }
    })

    $("#btn_kredi_karti_odeme").click(function () {
        if ($("#txt_kart_isim").val() == "") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#txt_kart_isim"))
            return (false);
        }
        if ($("#ddl_son_tarih_ay").val() == "0") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#ddl_son_tarih_ay"))
            return (false);
        }
        if ($("#ddl_son_tarih_yil").val() == "0") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#ddl_son_tarih_yil"))
            return (false);
        }
        if ($("#txt_kart_no_1").val() == "") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#txt_kart_no_1"))
            return (false);
        }
        if ($("#txt_kart_no_2").val() == "") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#txt_kart_no_2"))
            return (false);
        }
        if ($("#txt_kart_no_3").val() == "") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#txt_kart_no_3"))
            return (false);
        }
        if ($("#txt_kart_no_4").val() == "") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#txt_kart_no_4"))
            return (false);
        }
        if ($("#txt_guvenlik_kodu").val() == "") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#txt_guvenlik_kodu"))
            return (false);
        }
        if ($("#ddl_banka").val() == "0") {
            GetTextJS(function (a) { alert(a) }, 224); YakSondur($("#ddl_banka"))
            return (false);
        }
    })
})