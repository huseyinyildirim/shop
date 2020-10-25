$(document).ready(function () {
    $("#btn_devamet").click(function () {
        if (typeof $("input:radio[name=hesap_no_id]:checked").val() == 'undefined') {
            GetTextJS(function (a) { alert(a) }, 222);
            return (false);
        }
    })
})