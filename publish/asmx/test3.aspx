<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test3.aspx.cs" Inherits="SHOP.asmx.test3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
 <script src="/js/jquery.js" type="text/javascript"></script>
    <title>JSON Test</title>
</head>
<body>
 <script type="text/javascript">

     //$(function ()}); document ready ile aynı şeydir ama sen document ready kullan.

     function countProperties(c) { var b, a = 0; for (b in c) a++; return a }

     //DropDown Elemanı, Veriler, İlk Kaydı Sil/Silme
     function FillDropDown(a, b, c) {
         if (!c) {
             $(a + " option:not(:first)").remove();
         }
         for (var i = 0; i < countProperties(b); i++) {
             $(a).append($("<option><\/option>").val(b[i].ID).html(b[i].Ad));
         }
     }

     //DropDown Elemanı, İlk Kaydı Sil/Silme
     function DropDropItemsRemove(a, b) {
         if (!b) {
             $(a + " option:not(:first)").remove();
         }
         else {
             $(a + " option").remove();
         }
     }

     //Ülke ID
     function DoldurIl(t) {
         GetServiceJSON(function (a, b) {
             if (a.Type == 0) {
                 $("#sonuc").html('');
                 if (countProperties(b) > 0) {
                     FillDropDown("#SelectSehirler", b, false);
                 }
                 else {
                     DropDropItemsRemove("#SelectSehirler", false);
                     DropDropItemsRemove("#SelectIlce", false);
                 }
             }
             else {
                 DropDropItemsRemove("#SelectSehirler", false);
                 DropDropItemsRemove("#SelectIlce", false);
                 $("#sonuc").html(JSON.stringify(a.Text));
             }
         }, "/asmx/GetCountries.asmx/IlGetir", "Sehirler", "{UlkeID:" + t + "}");
     };

     //Il ID
     function DoldurIlce(t) {
         GetServiceJSON(function (a, b) {
             if (a.Type == 0) {
                 $("#sonuc").html('');
                 if (countProperties(b) > 0) {
                     FillDropDown("#SelectIlce", b, false);
                 }
                 else {
                     DropDropItemsRemove("#SelectIlce", false);
                 }
             }
             else {
                 DropDropItemsRemove("#SelectIlce", false);
                 $("#sonuc").html(JSON.stringify(a.Text));
             }
         }, "/asmx/GetCountries.asmx/IlceGetir", "Ilceler", "{IlID:" + t + "}");
     };

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

         //message,data

         //tek ülke çek 
         GetServiceJSON(function (a, b) {
             if (a.Type == 0) {
                 $("#sonuc").html('');
                 if (countProperties(b) > 0) {
                     FillDropDown("#SelectUlke", b, false);
                 }
             }
             else {
                 $("#sonuc").html(JSON.stringify(a.Text));
             }
         }, "/asmx/GetCountries.asmx/UlkeGetir", "Ulke", "{ID:235}");

         //ülkeleri çek
         GetServiceJSON(function (a, b) {
             if (a.Type == 0) {
                 $("#sonuc").html('');
                 if (countProperties(b) > 0) {
                     FillDropDown("#SelectUlkeler", b, false);
                 }
             }
             else {
                 $("#sonuc").html(JSON.stringify(a.Text));
             }
         }, "/asmx/GetCountries.asmx/ButunUlkeler", "Ulke", null);

         $("#SelectUlkeler").bind("change", function () {

             if ($("#SelectUlkeler").val() != "-1") {
                 DoldurIl($(this).val());
             }
             else {
                 DropDropItemsRemove("#SelectSehirler", false);
                 DropDropItemsRemove("#SelectIlce", false);
             }
         });

         $("#SelectUlke").bind("change", function () {

             if ($("#SelectUlke").val() != "-1") {
                 DoldurIl($(this).val());
             }
             else {
                 DropDropItemsRemove("#SelectSehirler", false);
                 DropDropItemsRemove("#SelectIlce", false);
             }
         });

         $("#SelectSehirler").bind("change", function () {

             if ($("#SelectSehirler").val() != "-1") {
                 DoldurIlce($(this).val());
             }
             else {
                 DropDropItemsRemove("#SelectIlce", false);
             }
         });
     }); 
 </script>

 <select id="SelectUlkeler" name="SelectUlkeler">
<option value="-1">ÜLKE SEÇİNİZ</option>
</select>

<select id="SelectUlke" name="SelectUlke">
<option value="-1">ÜLKE SEÇİNİZ</option>
</select>

 <select id="SelectSehirler" name="SelectSehirler">
<option value="-1">İL SEÇİNİZ</option>
</select>

<select id="SelectIlce" name="SelectIlce">
<option value="-1">İLÇE SEÇİNİZ</option>
</select>

<div id="loading" style="display:none">Bekle yarram!</div>
<div id="sonuc"></div>
</body>
</html>
