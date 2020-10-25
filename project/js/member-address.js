$(document).ready(function () {
    $('#txt_baslik').bind('keyup', function () {
        BuyukHarf($(this))
    });
    $('#txt_isim0').bind('keyup', function () {
        BuyukHarf($(this))
    });
    $('#txt_vergidaire').bind('keyup', function () {
        BuyukHarf($(this))
    });
    $('#txt_postakodu').bind('keyup', function () {
        SayisalKarakter($(this))
    });
    $('#txt_postakodu0').bind('keyup', function () {
        SayisalKarakter($(this))
    });
    $('#txt_vergino').bind('keyup', function () {
        SayisalKarakter($(this))
    });
    $('#txt_tcno').bind('keyup', function () {
        SayisalKarakter($(this))
    });

    $("#btn_faturaadresekle").click(function () {
        if ($("#txt_baslik").val() == "") {
            GetTextJS(function (a) { alert(a) }, 314); YakSondur($("#txt_baslik"))
            return (false);
        }
        if ($("#txt_adres").val() == "") {
            GetTextJS(function (a) { alert(a) }, 315); YakSondur($("#txt_adres"))
            return (false);
        }
        if ($("txt_faturatip").val() == "0") {
            if ($("#txt_tcno").val() == "") {
                GetTextJS(function (a) { alert(a) }, 320); YakSondur($("#txt_tcno"))
                return (false);
            }
            if ($("#txt_tcno").val() != "") {
                if ($("#txt_tcno").val().length < 11) {
                    GetTextJS(function (a) { alert(a) }, 320); YakSondur($("#txt_tcno"));
                    return (false);
                }
            }
        }
        if ($("txt_faturatip").val() == "1") {
            if ($("#txt_vergidaire").val() == "") {
                GetTextJS(function (a) { alert(a) }, 318); YakSondur($("#txt_vergidaire"))
                return (false);
            }
            if ($("#txt_vergino").val() != "") {
                if ($("#txt_vergino").val().length < 10) {
                    GetTextJS(function (a) { alert(a) }, 319); YakSondur($("#txt_vergino"));
                    return (false);
                }
            }
        }
    })

    $("#btn_faturaadresduzenle").click(function () {
        if ($("#txt_baslik").val() == "") {
            GetTextJS(function (a) { alert(a) }, 314); YakSondur($("#txt_baslik"))
            return (false);
        }
        if ($("#txt_adres").val() == "") {
            GetTextJS(function (a) { alert(a) }, 315); YakSondur($("#txt_adres"))
            return (false);
        }
        if ($("#txt_faturatip").val() == "0") {
            if ($("#txt_tcno").val() == "") {
                GetTextJS(function (a) { alert(a) }, 320); YakSondur($("#txt_tcno"))
                return (false);
            }
            if ($("#txt_tcno").val() != "") {
                if ($("#txt_tcno").val().length < 11) {
                    GetTextJS(function (a) { alert(a) }, 320); YakSondur($("#txt_tcno"));
                    return (false);
                }
            }
        }
        if ($("#txt_faturatip").val() == "1") {
            if ($("#txt_vergidaire").val() == "") {
                GetTextJS(function (a) { alert(a) }, 318); YakSondur($("#txt_vergidaire"))
                return (false);
            }
            if ($("#txt_vergino").val() != "") {
                if ($("#txt_vergino").val().length < 10) {
                    GetTextJS(function (a) { alert(a) }, 319); YakSondur($("#txt_vergino"));
                    return (false);
                }
            }
        }
    })

    $("#btn_teslimatadresekle").click(function () {
        if ($("#txt_isim0").val() == "") {
            GetTextJS(function (a) { alert(a) }, 316); YakSondur($("#txt_isim0"))
            return (false);
        }
        if ($("#txt_adres0").val() == "") {
            GetTextJS(function (a) { alert(a) }, 317); YakSondur($("#txt_adres0"))
            return (false);
        }
    })

    $("#btn_teslimatadresduzenle").click(function () {
        if ($("#txt_isim0").val() == "") {
            GetTextJS(function (a) { alert(a) }, 316); YakSondur($("#txt_isim0"))
            return (false);
        }
        if ($("#txt_adres0").val() == "") {
            GetTextJS(function (a) { alert(a) }, 317); YakSondur($("#txt_adres0"))
            return (false);
        }
    })
})