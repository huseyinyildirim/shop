$(document).ready(function () {
    $('#txt_maillist').bind('keyup', function () {
        KucukHarf($(this))
    });

    $("#btn_maillist").click(function () {
        if (!MailKontrol($("#txt_maillist").val())) {
            GetTextJS(function (a) { alert(a) }, 31); YakSondur($("#txt_maillist"))
            return (false);
        }
    })
})