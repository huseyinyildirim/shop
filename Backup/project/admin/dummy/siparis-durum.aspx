<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="siparis-durum.aspx.cs" Inherits="SHOP.admin.dummy.siparis_durum"
    EnableViewState="False" ViewStateMode="Disabled" EnableEventValidation="False" ClientIDMode="Static"
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

    <!-- DURUM BİLGİSİ DEĞİŞTİR -->
    <div id="div3">
        <table summary="" border="0" cellpadding="0" cellspacing="0" class="tablo">
            <tbody>
                <tr>
                    <td align="right" class="baslik"><h1>DURUM BİLGİSİ GÜNCELLEME</h1></td>
                </tr>
                <tr>
                    <td><asp:DropDownList ID="ddl_durumlar" runat="server"></asp:DropDownList>&nbsp;<asp:Button 
                            ID="btn_durum_guncelle" runat="server" Text="Durumu Değiştir" 
                            onclick="btn_durum_guncelle_Click"></asp:Button></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- DURUM BİLGİSİ DEĞİŞTİR -->

    <!-- DURUM BİLGİLERİ -->
    <div id="div2">
        <table summary="" border="0" cellpadding="0" cellspacing="0" class="tablo">
            <tbody>
                <tr>
                    <td width="50%" colspan="2" align="right" class="baslik"><h1>DURUM BİLGİLERİ</h1></td>
                </tr>
                <tr>
                    <td width="50%" align="center" class="tdbas">Durum</td>
                    <td align="center" class="tdbas" width="50%">Tarih</td>
                </tr>
                <asp:Literal ID="LitSiparisDurum" runat="server" />
            </tbody>
        </table>
    </div>
    <!-- DURUM BİLGİLERİ -->
    <center><a href="../isleme-ait-kayitlar.aspx?tablo_adi=tbl_siparisler_durumlar&kayit_id=<%=Request.QueryString["id"].ToString() %>">İşlem Kayıtları için tıklayınız</a></center>
    </form>
</body>
</html>