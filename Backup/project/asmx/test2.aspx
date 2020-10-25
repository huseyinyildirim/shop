<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="SHOP.asmx.test2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
 <script src="/js/jquery.js" type="text/javascript"></script>
    <title>JSON Test</title>
</head>
<body runat="server">
<form id="form1" runat="server">
 <script type="text/javascript">
     function countProperties(c) { var b, a = 0; for (b in c) a++; return a }

     function FillDropDown(a, b, c) {
         if (!c) {
             $(a + " option:not(:first)").remove();
         }
         for (var i = 0; i < countProperties(b); i++) {
             $(a).append($("<option><\/option>").val(b[i].ID).html(b[i].Baslik));
         }
     }

     function DropDropItemsRemove(a, b) {
         if (!b) {
             $(a + " option:not(:first)").remove();
         }
         else {
             $(a + " option").remove();
         }
     }

     //returnparams,url,objectname,postdata
     function GetServiceJSON(a, u, f, d) {
         $.ajax({
             type: "POST",
             url: u,
             data: d,
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             beforeSend: function () { $("#sonuc").html(''); $("#loading").show() },
             complete: function () { $("#loading").hide() },
             error: function (b, c, a) {
                 alert(b.status + "\r\n" + c + "\r\n" + a)
             },
             success: function (b, c) {
                 c == "success" && $.each(b, function (c, b) {
                     if (b["Message"].Type == 0) {
                         a(b["Message"], b[f])
                     }
                     else {
                         a(b["Message"])
                     }
                 })
             }
         })
     }

     $(function () {
         GetServiceJSON(function (a, b) {
             if (a.Type == 0) {
                 $("#sonuc").html('');
                 if (countProperties(b) > 0) {
                     FillDropDown("#SelectFaturaAdres", b, false);
                 }
             }
             else {
                 $("#sonuc").html(JSON.stringify(a.Text));
             }
         }, "/asmx/GetMemberInfo.asmx/ButunAdresler", "Adresler", "{KullaniciID:1,Tip:false}");

         $("#SelectFaturaAdres").bind("change", function () {
             FillCities($(this).val());
         });
     });
 </script>

    <asp:DropDownList ID="SelectFaturaAdres" runat="server">
    </asp:DropDownList>
<div id="loading" style="display:none">Bekle yarram!</div>
<div id="sonuc"></div>
</form>
</body>
</html>

