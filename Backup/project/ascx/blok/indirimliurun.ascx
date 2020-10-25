<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="indirimliurun.ascx.cs" Inherits="SHOP.ascx.blok_indirimliurun" %>

<script type="text/javascript">
    $.ajax({
        type: "POST",
        url: "/asmx/GetProduct.asmx/IndirimliUrunler",
        //data: d,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //beforeSend: function () { $("#div_indirimli_urun").html('<img src="/images/loading.gif" alt="" />') },
        //complete: function () { $("#div_indirimli_urun").replaceWith('<img src="/images/loading.gif" alt="" />') },
        error: function (b, c, a) {
            alert(b.status + "\r\n" + c + "\r\n" + a)
        },
        success: function (b, c) {
            c == "success" && $.each(b, function (a, b) {
                $('#div_indirimli_urun').empty();
                $.each(b.UrunDetaylar, function (key, value) {
                    $('#div_indirimli_urun')
                        .append(JSON.stringify(value.UrunAd) + '<br />')
                        .append(JSON.stringify(value.Indirim) + '<br />')
                        .append(JSON.stringify(value.DovizIndirimliFiyat) + '<br /><br />')
                });
            })
        }
    })
</script>
<asp:Literal runat="server" ID="lit_indirimurun" />
<div id="div_indirimli_urun"></div>
