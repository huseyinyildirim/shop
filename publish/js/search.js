$(document).ready(function () {
    $('#txt_arama').bind('keyup', function () {
        KucukHarf($(this))
    });

    $("#btn_arama").click(function () {
        if ($("#txt_arama").val() == "") {
            GetTextJS(function (a) { alert(a) }, 48); YakSondur($("#txt_arama"))
            return (false);
        }
        if ($("#txt_arama").val() != "") {
            if ($("#txt_arama").val().length < 3) {
                GetTextJS(function (a) { alert(a) }, 49); YakSondur($("#txt_arama"));
                return (false)
            }
        }
    })
})