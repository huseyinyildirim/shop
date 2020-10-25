<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="siparisteki-urunler.aspx.cs" Inherits="SHOP.admin.dummy.siparisteki_urunler"
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
    <!-- KULLANICI BİLGİLERİ -->
    <div id="div1">
        <table summary="" border="0" cellpadding="0" cellspacing="0" class="tablo">
            <tbody>
                <tr>
                    <td colspan="4" align="right" class="baslik"><h1>KULLANICI BİLGİLERİ</h1></td>
                </tr>
                <tr>
                    <td width="25%" align="center" class="tdbas">Ad Soyad</td>
                    <td width="25%" align="center" class="tdbas">Mail</td>
                    <td width="25%" align="center" class="tdbas">Telefon</td>
                    <td width="25%" align="center" class="tdbas">Üyelik Tarihi</td>
                </tr>
                <tr>
                    <td width="25%" align="center"><asp:Literal ID="LitKullaniciAd" runat="server" /></td>
                    <td width="25%" align="center"><asp:Literal ID="LitKullaniciMail" runat="server" /></td>
                    <td width="25%" align="center"><asp:Literal ID="LitKullaniciTel" runat="server" /></td>
                    <td width="25%" align="center"><asp:Literal ID="LitKullaniciTarih" runat="server" /></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- KULLANICI BİLGİLERİ -->

    <!-- ÜRÜN BİLGİLERİ -->
    <div id="div3">
        <table summary="" border="0" cellpadding="0" cellspacing="0" class="tablo">
            <tbody>
                <tr>
                    <td colspan="9" align="right" class="baslik"><h1>ÜRÜN BİLGİLERİ</h1></td>
                </tr>
                <tr>
                    <td colspan="9">
                        <table summary="" border="0" cellpadding="0" cellspacing="0" class="tablo">
                            <tbody>
                                <tr>
                                    <td class="tdbas">Ürün Kodu</td>
                                    <td class="tdbas">Ürün Adı</td>
                                    <td class="tdbas">Birim Fiyat</td>
                                    <td class="tdbas">İndirim</td>
                                    <td class="tdbas">İndirim Tutarı</td>
                                    <td class="tdbas">KDV</td>
                                    <td class="tdbas">KDV Tutarı</td>
                                    <td class="tdbas">Adet</td>
                                    <td class="tdbas">Toplam Fiyat</td>
                                </tr>
                                <asp:Literal ID="liturunler" runat="server" />
                                <tr>
                                    <td colspan="9" align="right">
                                        <table summary="" border="0" cellpadding="0" cellspacing="0" class="tablo">
                                            <tbody>
                                                <tr>
                                                    <td align="right" width="85%" class="tdbas">TUTAR</td>
                                                    <td><asp:Literal ID="LitTutar" runat="server" /></td>
                                                </tr>
                                                <asp:PlaceHolder runat="server" ID="ph_indirim_tutari">
                                                <tr>
                                                    <td align="right" class="tdbas">İNDİRİM TUTARI</td>
                                                    <td><asp:Literal ID="LitIndirimTutari" runat="server" /></td>
                                                </tr>
                                                </asp:PlaceHolder>
                                                <tr>
                                                    <td align="right" class="tdbas">TOPLAM TUTAR</td>
                                                    <td><asp:Literal ID="LitToplamTutar" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="tdbas">TOPLAM KDV</td>
                                                    <td><asp:Literal ID="LitToplamKdv" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="tdbas">GENEL TOPLAM</td>
                                                    <td><asp:Literal ID="LitGenelToplam" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="tdbas"><asp:Literal runat="server" ID="LitKomisyonTutariText" /></td>
                                                    <td><asp:Literal ID="LitKomisyonTutari" runat="server" /></td>
                                                </tr>
                                                <asp:PlaceHolder runat="server" ID="ph_kargo_payi">
                                                <tr>
                                                    <td align="right" class="tdbas">KARGO PAYI</td>
                                                    <td><asp:Literal ID="LitKargoPayi" runat="server" /></td>
                                                </tr>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" ID="ph_puan_tutari">
                                                <tr>
                                                    <td align="right" class="tdbas">PUAN TUTARI</td>
                                                    <td><asp:Literal ID="LitPuanTutari" runat="server" /></td>
                                                </tr>
                                                </asp:PlaceHolder>
                                                <tr>
                                                    <td align="right" class="tdbas">TOPLAM</td>
                                                    <td><asp:Literal ID="LitToplam" runat="server" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- ÜRÜN BİLGİLERİ -->
    </form>
</body>
</html>