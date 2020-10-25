$(function () {
    GetDialog("#div_sozlesme");

    $("#link_sozlesme").click(function () {
        $("#div_sozlesme").dialog("open");
        //Satış sözleşmesini dive basıyoruz
        GetTextJS(function (a) { $("#div_sozlesme").html(a); }, 236);
        return false;
    });
});

$(document).ready(function () {
    $("#btn_3dpos").click(function () {
        if (typeof $("input:checkbox[name=satis_sozlesme]:checked").val() == 'undefined') {
            GetTextJS(function (a) { alert(a) }, 335); YakSondur($("#satis_sozlesme"))
            return (false);
        }
        if (typeof $("input:radio[name=taksit_secenek]:checked").val() == 'undefined') {
            GetTextJS(function (a) { alert(a) }, 334); YakSondur($("#taksit_secenek"))
            return (false);
        }
    })

    $("#btn_2dpos").click(function () {
        if (typeof $("input:checkbox[name=satis_sozlesme]:checked").val() == 'undefined') {
            GetTextJS(function (a) { alert(a) }, 335); YakSondur($("#satis_sozlesme"))
            return (false);
        }
        if (typeof $("input:radio[name=taksit_secenek]:checked").val() == 'undefined') {
            GetTextJS(function (a) { alert(a) }, 334); YakSondur($("#taksit_secenek"))
            return (false);
        }
    })
})