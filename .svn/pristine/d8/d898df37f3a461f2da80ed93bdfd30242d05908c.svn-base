<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="siparis-kargo-bilgi-yazdir.aspx.cs" Inherits="SHOP.admin.dummy.siparis_kargo_bilgi_yazdir"
    EnableViewState="False" ViewStateMode="Disabled" EnableEventValidation="False"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Language" content="TR" />
    <meta http-equiv="Charset" content="UTF-8" />
    <meta http-equiv="Imagetoolbar" content="no" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta name="Robots" content="noindex,nofollow" />
    <title>Yönetici Paneli</title>
    <style media="all" type="text/css">
        @import url("../css/sitil.css");
    </style>
    <style type="text/css">
        body
        {
            font: 11px/13px arial,tahoma,helvetica,sans-serif;
            background: #fff;
            margin: 0;
            padding: 0;
        }
        h1
        {
            padding: 0;
            margin: 0;
            font-size: 14px;
            color: #6681FF;
        }
        .baslik
        {
            background: none #FFF9CC;
        }
        #div0, #div1, #div2, #div3, #div4, #div5
        {
            border: 1px solid #C3DAF9;
            padding: 3px;
            background: #fff;
            margin: 10px;
        }
        .tablo
        {
            width: 100%;
        }
        .tablo td
        {
            border: 1px solid #C3DAF9;
            padding: 3px;
        }
        .tdbas
        {
            background: #CCFFE4;
            font-weight: bold;
            border: none 1px solid #ADBCD3;
        }
        
        hr
        {
            border: none;
            border-bottom: 1px solid #B8CEEB;
            height: 1px;
            width: 90%;
        }
    </style>
    <script type="text/javascript">
<!--
        function NoError() {
            //alert("Sayfada JS hatası oluştu.\nLütfen tarayıcıyı kapatıp açarak, yeniden deneyiniz");
            return (true);
        }
        onerror = NoError;
//-->
    </script>
</head>
<body>
    <form id="form1" runat="server">    
    <!-- KARGO BİLGİLERİ -->
    <div id="div5">
        <table summary="" border="0" cellpadding="0" cellspacing="0" class="tablo">
            <tbody>
                <tr>
                    <td align="right" class="baslik">
                        <h1>KARGO BİLGİLERİ</h1>
                    </td>
                </tr>
                <tr>
                    <td class="tdbas">Gönderen Adresi</td>
                </tr>
                <tr>
                    <td><p><asp:Literal runat="server" ID="LitGonderenAdres" /></p></td>
                </tr>
                <tr>
                    <td class="tdbas">Alıcı Adresi</td>
                </tr>
                <tr>
                    <td><p><asp:Literal runat="server" ID="LitKargoAdres" /></p></td>
                </tr>
            </tbody>
        </table>
    </div>
    <center><input type="button" value="Kargo Bilgisini Yazdır" onClick="window.print()"></center>
    <!-- KARGO BİLGİLERİ -->
    </form>
</body>
</html>