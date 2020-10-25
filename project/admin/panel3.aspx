<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel3.aspx.cs" Inherits="SHOP.admin.panel3"
    EnableViewState="False" ViewStateMode="Disabled" EnableEventValidation="False"
    ValidateRequest="false" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
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
        @import url("css/sitil.css");
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
    <ext:ResourcePlaceHolder ID="ResourcePlaceHolder1" runat="server" Mode="Script" />
</head>
<body>
    <script type="text/javascript">

        /*
        jQuery.noConflict();

        jQuery(function ($) {
        $("#HyperLink2_Container").cssRemove();
        }
        );

        $(function () {
        $("#HyperLink1_Container,#HyperLink2_Container,#HyperLink3_Container").attr("style", "")
        });

        Ext.select("BayrakResimDiv").setStyle('float', '');
        Ext.get("BayrakResimDiv").dom.style;
        */

        var CikisYap = function () {
            Ext.Msg.confirm('Uyarı', 'Çıkış yapmak istediğinize emin misiniz?', function (btn) {
                if (btn == "yes") {
                    Ext.net.DirectMethods.DM_CikisYap();
                }
            });
        }

        var OnlineYoneticiler = function () {
            TabEkle(TabPanel1, 'MenuItem22', 'online-yoneticiler.aspx', 'MenuPanel7', 'Online Yöneticiler');
        }

        var OnlineKullanicilar = function () {
            TabEkle(TabPanel1, 'MenuItem21', 'online-kullanicilar.aspx', 'MenuPanel7', 'Online Kullanıcılar');
        }

        var GirisCikislar = function () {
            TabEkle(TabPanel1, 'MenuItem18', 'giris-cikis-kayitlari.aspx', 'MenuPanel3', 'Giriş - Çıkış Kayıtları');
        }

        var TabEkle = function (panelID, id, url, MenuPanelID, MenuTitle) {

            //var nurl = url;
            var trh = new Date();
            var cache = "?cache=ok";
            var tab = panelID.getComponent(id);
            var url2 = url;

            if (CheckBox1.getValue()) {
                url2 = url2 + cache + "&rnd=" + trh.getTime();
            }
            else {
                url2 = url2 + "?rnd=" + trh.getTime();
            }

            if (!tab) {
                tab = panelID.add({
                    id: id,
                    //title: MenuTitle + " | " + nurl,
                    title: MenuTitle,
                    closable: true,
                    iconCls: "icon-table",
                    autoLoad: {
                        showMask: true,
                        url: url2,
                        mode: "iframe",
                        maskMsg: "Yükleniyor..."
                    }
                });

            }

            tab.on("activate", function () {
                var item = MenuPanelID.menu.items.get(id);

                if (item) {
                    MenuPanelID.setSelection(item);
                }
            }, this);

            panelID.setActiveTab(tab);
        }
    </script>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Gray" Locale="tr-TR"
        GZip="true" />
    <ext:Viewport ID="Viewport1" runat="server" Layout="BorderLayout" StyleSpec="background:none #F0F0F0">
        <Items>
            <ext:Panel ID="Panel1" runat="server" Region="North" Header="false">
                <Content>
                    <div id="top">
                        <div id="ust">
                            <div id="ustsol">
                                <ext:LinkButton runat="server" ID="LinkButton1" Icon="User">
                                    <Listeners>
                                        <Click Handler="GirisCikislar()" />
                                    </Listeners>
                                </ext:LinkButton>
                                <ext:Label ID="LabelShop" runat="server" />
                            </div>
                            <div id="ustsag">
                                <div id="Div1" style="float: left">
                                    <ext:Checkbox ID="CheckBox1" runat="server">
                                        <ToolTips>
                                            <ext:ToolTip Title="Bu ayar aktif edildiğinde;<br/>veritabanından dönen kayıtlar<br/>cache bellekten sunulur." />
                                        </ToolTips>
                                    </ext:Checkbox>
                                </div>
                                <ext:LinkButton runat="server" ID="LinkButton2" Icon="UserRed">
                                    <Listeners>
                                        <Click Handler="OnlineKullanicilar()" />
                                    </Listeners>
                                </ext:LinkButton>
                                <ext:LinkButton runat="server" ID="LinkButton3" Icon="User">
                                    <Listeners>
                                        <Click Handler="OnlineYoneticiler()" />
                                    </Listeners>
                                </ext:LinkButton>
                            </div>
                        </div>
                        <div id="sol">
                            <div id="logo">
                                <ext:ImageButton runat="server" ID="ImageButton1" />
                            </div>
                        </div>
                        <div id="sag">
                            <ext:Label ID="Label1" runat="server" Icon="User" />
                            <ext:Button ID="Button2" runat="server" Icon="DoorOut" ToolTip="Çıkış yap" Text="Çıkış Yap">
                                <Listeners>
                                    <Click Fn="CikisYap" />
                                </Listeners>
                            </ext:Button>
                        </div>
                    </div>
                </Content>
            </ext:Panel>
            <ext:Panel ID="Panel2" runat="server" Title="» İŞLEMLER" Icon="Plugin" Region="West"
                Layout="AccordionLayout" Width="200" MinWidth="200" MaxWidth="400" Split="true"
                Collapsible="true" AnimCollapse="true">
                <Items>
                    <ext:MenuPanel AutoScroll="true" ID="MenuPanel2" runat="server" Title="Sipariş İşlemleri"
                        Icon="Money" Border="false" Collapsed="true">
                        <Menu ID="Menu4" runat="server">
                            <Items>
                                <ext:MenuItem ID="MenuItem47" runat="server" Text="Siparişler" Icon="MoneyDollar">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem47','siparisler.aspx',#{MenuPanel2},#{MenuItem47.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator47" runat="server" />
                            </Items>
                        </Menu>
                    </ext:MenuPanel>
                    <ext:MenuPanel AutoScroll="true" ID="MenuPanel5" runat="server" Title="Ürün İşlemleri"
                        Icon="Package" Border="false" Collapsed="true">
                        <Menu ID="Menu6" runat="server">
                            <Items>
                                <ext:MenuItem ID="MenuItem10" runat="server" Text="Ürünler" Icon="PackageGreen">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem10','urunler.aspx',#{MenuPanel5},#{MenuItem10.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator23" runat="server" />
                                <ext:MenuItem ID="MenuItem25" runat="server" Text="Ürün Resimleri [K]" Icon="Picture">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem25','urun-resimleri.aspx',#{MenuPanel5},#{MenuItem25.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator18" runat="server" />
                                <ext:MenuItem ID="MenuItem12" runat="server" Text="Resimler/Videolar" Icon="PageWhitePicture">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem12','resimler-videolar.aspx',#{MenuPanel5},#{MenuItem12.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator24" runat="server" />
                                <ext:MenuItem ID="MenuItem6" runat="server" Text="Ürün Kodları" Icon="PackageLink">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem6','urun-kodlari.aspx',#{MenuPanel5},#{MenuItem6.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator6" runat="server" />
                                <ext:MenuItem ID="MenuItem33" runat="server" Text="Arama Kayıtları" Icon="MagifierZoomOut">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem33','arama-kayitlari.aspx',#{MenuPanel5},#{MenuItem33.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator33" runat="server" />
                                <ext:MenuItem ID="MenuItem13" runat="server" Text="Resim Grupları" Icon="PhotoLink">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem13','resim-gruplari.aspx',#{MenuPanel10},#{MenuItem13.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator25" runat="server" />
                                <ext:MenuItem ID="MenuItem20" runat="server" Text="Video Grupları" Icon="FilmLink">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem20','video-gruplari.aspx',#{MenuPanel10},#{MenuItem20.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator20" runat="server" />
                                <ext:MenuItem ID="MenuItem24" runat="server" Text="Gruplara Atanan Resim/Video" Icon="LinkGo">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem24','gruplara-atanan-resim-video.aspx',#{MenuPanel10},#{MenuItem24.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator22" runat="server" />
                                <ext:MenuItem ID="MenuItem34" runat="server" Text="Ürün Kategorileri" Icon="PackageLink">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem34','urun-kategorileri.aspx',#{MenuPanel12},#{MenuItem34.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator34" runat="server" />
                                <ext:MenuItem ID="MenuItem35" runat="server" Text="Kategorilere Atanan Ürünler" Icon="PackageStart">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem35','kategorilere-atanan-urunler.aspx',#{MenuPanel12},#{MenuItem35.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator45" runat="server" />
                                <ext:MenuItem ID="MenuItem45" runat="server" Text="Kategori Resimleri [K]" Icon="BoxPicture">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem45','kategori-resimleri.aspx',#{MenuPanel12},#{MenuItem45.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator35" runat="server" />
                                <ext:MenuItem ID="MenuItem36" runat="server" Text="Markalar" Icon="ShapeMoveBackwards">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem36','markalar.aspx',#{MenuPanel13},#{MenuItem36.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator36" runat="server" />
                                <ext:MenuItem ID="MenuItem37" runat="server" Text="Markalara Atanan Ürünler" Icon="ShapeMoveFront">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem37','markalara-atanan-urunler.aspx',#{MenuPanel13},#{MenuItem37.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator37" runat="server" />
                                <ext:MenuItem ID="MenuItem1" runat="server" Text="Etiketler" Icon="TagOrange">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem1','etiketler.aspx',#{MenuPanel1},#{MenuItem1.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator1" runat="server" />
                                <ext:MenuItem ID="MenuItem2" runat="server" Text="Etiketlere Atanan Ürünler" Icon="TagBlueEdit">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem2','etiketlere-atanan-urunler.aspx',#{MenuPanel1},#{MenuItem2.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator2" runat="server" />
                            </Items>
                        </Menu>
                    </ext:MenuPanel>
                    <ext:MenuPanel AutoScroll="true" ID="MenuPanel9" runat="server" Title="Gelen Mail İşlemleri"
                        Icon="Mail" Border="false" Collapsed="true">
                        <Menu ID="Menu3" runat="server">
                            <Items>
                                <ext:MenuItem ID="MenuItem26" runat="server" Text="İletişimden Gelen Mailler" Icon="EmailOpen">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem26','iletisimden-gelen-mailler.aspx',#{MenuPanel9},#{MenuItem26.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator26" runat="server" />
                            </Items>
                        </Menu>
                    </ext:MenuPanel>
                    <ext:MenuPanel AutoScroll="true" ID="MenuPanel14" runat="server" Title="* Maillist İşlemleri"
                        Icon="EmailStar" Border="false" Collapsed="true">
                        <Menu ID="Menu11" runat="server">
                            <Items>
                                <ext:MenuItem ID="MenuItem27" runat="server" Text="Liste İşlemleri" Icon="EmailEdit">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem27','javascript:void(0)',#{MenuPanel14},#{MenuItem14.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator27" runat="server" />
                                <ext:MenuItem ID="MenuItem28" runat="server" Text="Mail Tanımlama İşlemleri" Icon="EmailAdd">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem28','javascript:void(0)',#{MenuPanel14},#{MenuItem28.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator28" runat="server" />
                                <ext:MenuItem ID="MenuItem29" runat="server" Text="Mail Gönderim İşlemleri" Icon="EmailTransfer">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem29','javascript:void(0)',#{MenuPanel14},#{MenuItem29.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator29" runat="server" />
                            </Items>
                        </Menu>
                    </ext:MenuPanel>
                    <ext:MenuPanel AutoScroll="true" ID="MenuPanel4" runat="server" Title="İçerik İşlemleri"
                        Icon="Pictures" Border="false" Collapsed="true">
                        <Menu ID="Menu5" runat="server">
                            <Items>
                                <ext:MenuItem ID="MenuItem43" runat="server" Text="Haberler" Icon="FeedMagnify">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem43','haberler.aspx',#{MenuPanel18},#{MenuItem43.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator43" runat="server" />
                                <ext:MenuItem ID="MenuItem44" runat="server" Text="Haber Resimleri [K]" Icon="FeedLink">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem44','haber-resimleri.aspx',#{MenuPanel18},#{MenuItem44.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator44" runat="server" />
                                <ext:MenuItem ID="MenuItem42" runat="server" Text="Bottom (Copyright İmi)" Icon="TextAlignJustify">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem42','bottom-copyright-imi.aspx',#{MenuPanel4},#{MenuItem42.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator42" runat="server" />
                                <ext:MenuItem ID="MenuItem7" runat="server" Text="Bottom/Header Resim İşlemleri"
                                    Icon="PictureSave">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem7','bottom-header-resim-islemleri.aspx',#{MenuPanel4},#{MenuItem7.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator7" runat="server" />
                                <ext:MenuItem ID="MenuItem8" runat="server" Text="Bottom/Header Resimleri [K]" Icon="PicturesThumbs">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem8','bottom-header-resimleri.aspx',#{MenuPanel9},#{MenuItem8.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator8" runat="server" />
                                <ext:MenuItem ID="MenuItem4" runat="server" Text="Headerlar (Sloganlar)" Icon="PictureKey">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem4','headerlar-sloganlar.aspx',#{MenuPanel2},#{MenuItem4.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator4" runat="server" />
                                <ext:MenuItem ID="MenuItem5" runat="server" Text="Header (Slogan) Resimleri [K]"
                                    Icon="Photo">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem5','header-slogan-resimleri.aspx',#{MenuPanel2},#{MenuItem5.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator5" runat="server" />
                                <ext:MenuItem ID="MenuItem9" runat="server" Text="Firma Bilgileri" Icon="VcardEdit">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem9','firma-bilgileri.aspx',#{MenuPanel16},#{MenuItem9.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator14" runat="server" />
                                <ext:MenuItem ID="MenuItem38" runat="server" Text="Firma Adres(ler)i" Icon="Map">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem38','firma-adresleri.aspx',#{MenuPanel16},#{MenuItem38.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator38" runat="server" />
                            </Items>
                        </Menu>
                    </ext:MenuPanel>
                    <ext:MenuPanel AutoScroll="true" ID="MenuPanel3" runat="server" Title="Kullanıcı/Yönetici İşlemleri"
                        Icon="UserMature" Border="false" Collapsed="true">
                        <Menu ID="Menu2" runat="server">
                            <Items>
                                <ext:MenuItem ID="MenuItem46" runat="server" Text="Kullanıcılar" Icon="Group">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem46','kullanicilar.aspx',#{MenuPanel3},#{MenuItem46.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator46" runat="server" />
                                <ext:MenuItem ID="MenuItem59" runat="server" Text="Üyelik Tipleri" Icon="Group">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem59','uyelik-metot.aspx',#{MenuPanel3},#{MenuItem59.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator59" runat="server" />
                                <ext:MenuItem ID="MenuItem21" runat="server" Text="Online Kullanıcılar" Icon="UserRed">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem21','online-kullanicilar.aspx',#{MenuPanel7},#{MenuItem21.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator13" runat="server" />
                                <ext:MenuItem ID="MenuItem3" runat="server" Text="Yöneticiler" Icon="Group">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem3','yoneticiler.aspx',#{MenuPanel3},#{MenuItem3.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator3" runat="server" />
                                <ext:MenuItem ID="MenuItem22" runat="server" Text="Online Yöneticiler" Icon="GroupLink">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem22','online-yoneticiler.aspx',#{MenuPanel7},#{MenuItem22.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator15" runat="server" />
                                <ext:MenuItem ID="MenuItem17" runat="server" Text="Giriş Hataları" Icon="Error">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem17','giris-hatalari.aspx',#{MenuPanel3},#{MenuItem17.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator10" runat="server" />
                                <ext:MenuItem ID="MenuItem18" runat="server" Text="Giriş - Çıkış Kayıtları" Icon="DatabaseTable">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem18','giris-cikis-kayitlari.aspx',#{MenuPanel3},#{MenuItem18.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator11" runat="server" />
                                <ext:MenuItem ID="MenuItem19" runat="server" Text="İşlem Kayıtları" Icon="ServerChart">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem19','islem-kayitlari.aspx',#{MenuPanel3},#{MenuItem19.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator12" runat="server" />
                            </Items>
                        </Menu>
                    </ext:MenuPanel>
                    <ext:MenuPanel AutoScroll="true" ID="MenuPanel11" runat="server" Title="Ayarlar"
                        Icon="Wrench" Border="false" Collapsed="true">
                        <Menu ID="Menu8" runat="server">
                            <Items>
                                <ext:MenuItem ID="MenuItem23" runat="server" Text="Menüler" Icon="PageWhiteStar">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem23','menuler.aspx',#{MenuPanel8},#{MenuItem23.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator19" runat="server" />
                                <ext:MenuItem ID="MenuItem16" runat="server" Text="Diller" Icon="FlagChecked">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem16','diller.aspx',#{MenuPanel6},#{MenuItem16.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator9" runat="server" />
                                <ext:MenuItem ID="MenuItem11" runat="server" Text="Bayraklar [K]" Icon="FlagPurple">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem11','bayraklar.aspx',#{MenuPanel6},#{MenuItem11.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator21" runat="server" />
                                <ext:MenuItem ID="MenuItem30" runat="server" Text="Kodlar (Scriptler)" Icon="ScriptCodeRed">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem30','kodlar-scriptler.aspx',#{MenuPanel15},#{MenuItem30.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator30" runat="server" />
                                <ext:MenuItem ID="MenuItem14" runat="server" Text="Mail Ayarları" Icon="EmailEdit">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem14','mail-ayarlari.aspx',#{MenuPanel11},#{MenuItem14.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator16" runat="server" />
                                <ext:MenuItem ID="MenuItem31" runat="server" Text="Site Sabitleri" Icon="CalendarViewWeek">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem31','site-sabitleri.aspx',#{MenuPanel11},#{MenuItem31.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator31" runat="server" />
                                <ext:MenuItem ID="MenuItem32" runat="server" Text="Sabitlere Atananlar" Icon="CalendarLink">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem32','sabitlere-atananlar.aspx',#{MenuPanel11},#{MenuItem32.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator32" runat="server" />
                                <ext:MenuItem ID="MenuItem48" runat="server" Text="Bankalar" Icon="MoneyDollar">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem48','bankalar.aspx',#{MenuPanel11},#{MenuItem48.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator48" runat="server" />
                                <ext:MenuItem ID="MenuItem49" runat="server" Text="İndirimler" Icon="MoneyDollar">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem49','indirimler.aspx',#{MenuPanel11},#{MenuItem49.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator49" runat="server" />
                                <ext:MenuItem ID="MenuItem50" runat="server" Text="İndirim Komisyonlar" Icon="MoneyDollar">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem50','indirimler-komisyonlar.aspx',#{MenuPanel11},#{MenuItem50.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator50" runat="server" />
                                <ext:MenuItem ID="MenuItem51" runat="server" Text="Kargo Firmaları" Icon="Lorry">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem51','kargolar.aspx',#{MenuPanel11},#{MenuItem51.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator51" runat="server" />
                                <ext:MenuItem ID="MenuItem52" runat="server" Text="Kargo Hesaplama Tipleri" Icon="LorryGo">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem52','kargo-hesaplama-tip.aspx',#{MenuPanel11},#{MenuItem52.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator52" runat="server" />
                                <ext:MenuItem ID="MenuItem53" runat="server" Text="KDV" Icon="MoneyAdd">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem53','kdvler.aspx',#{MenuPanel11},#{MenuItem53.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator53" runat="server" />
                                <ext:MenuItem ID="MenuItem54" runat="server" Text="Kredi Kartı Tipleri" Icon="Money">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem54','kredi-karti-tip.aspx',#{MenuPanel11},#{MenuItem54.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator54" runat="server" />
                                <ext:MenuItem ID="MenuItem55" runat="server" Text="Ödeme Şekilleri" Icon="MoneyDollar">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem55','odeme-sekli.aspx',#{MenuPanel11},#{MenuItem55.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator55" runat="server" />
                                <ext:MenuItem ID="MenuItem56" runat="server" Text="Para Birimleri" Icon="Money">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem56','para-birim.aspx',#{MenuPanel11},#{MenuItem56.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator56" runat="server" />
                                <ext:MenuItem ID="MenuItem57" runat="server" Text="Sanal Pos Para Birimleri" Icon="Money">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem57','sanal-pos-para-birim.aspx',#{MenuPanel11},#{MenuItem57.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator57" runat="server" />
                                <ext:MenuItem ID="MenuItem58" runat="server" Text="Sipariş Durumları" Icon="BasketEdit">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem58','siparis-durum.aspx',#{MenuPanel11},#{MenuItem58.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator58" runat="server" />
                            </Items>
                        </Menu>
                    </ext:MenuPanel>
                    <ext:MenuPanel AutoScroll="true" ID="MenuPanel17" runat="server" Title="İstatistikler"
                        Icon="ChartBar" Border="false" Collapsed="true">
                        <Menu ID="Menu14" runat="server">
                            <Items>
                                <ext:MenuItem ID="MenuItem40" runat="server" Text="Site Ziyaretleri" Icon="TableSort">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem40','site-ziyaretleri.aspx',#{MenuPanel17},#{MenuItem40.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator40" runat="server" />
                                <ext:MenuItem ID="MenuItem15" runat="server" Text="* Veritabanı İstatistikleri" Icon="ServerChart">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem15','javascript:void(0)',#{MenuPanel17},#{MenuItem15.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator17" runat="server" />
                                <ext:MenuItem ID="MenuItem39" runat="server" Text="* Kod/Sistem İstatistikleri" Icon="ChartCurve">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem39','javascript:void(0)',#{MenuPanel17},#{MenuItem39.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator39" runat="server" />
                                <ext:MenuItem ID="MenuItem41" runat="server" Text="* Dosya/Klasör İstatistikleri"
                                    Icon="ChartOrganisation">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem41','javascript:void(0)',#{MenuPanel17},#{MenuItem41.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator41" runat="server" />
                                <ext:MenuItem ID="MenuItem60" runat="server" Text="Hata Kayıtları"
                                    Icon="Error">
                                    <Listeners>
                                        <Click Handler="TabEkle(#{TabPanel1},'MenuItem60','hata-kayitlari.aspx',#{MenuPanel17},#{MenuItem60.Text})" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuSeparator ID="MenuSeparator60" runat="server" />
                            </Items>
                        </Menu>
                    </ext:MenuPanel>
                </Items>
                <%--
			<BottomBar>
			<ext:StatusBar runat="server" ID="StatusBar2" Icon="Bomb">
			<Items>
			<ext:Label runat="server" Text="deneme text" ID="Label2"></ext:Label>
			</Items>
			</ext:StatusBar>
			</BottomBar>
                --%>
            </ext:Panel>
            <ext:TabPanel ID="TabPanel1" runat="server" Region="Center" Closable="false" Header="false"
                Collapsible="false">
                <LoadMask ShowMask="true" Msg="Yükleniyor..." />
                <Items>
                    <%--MAIN TAB--%>
                    <ext:Panel ID="Panel0" Icon="HouseStar" runat="server" Title="Masaüstü" Html="Ana Tab" AutoScroll="true" />
                    <%--MAIN TAB--%>
                </Items>
                <BottomBar>
                    <ext:StatusBar runat="server" ID="StatusBar1" Icon="Time" Split="true">
                        <Items>
                            <ext:Label runat="server" Icon="RosetteBlue" Text="Root Yönetici" ID="BottomLabel">
                            </ext:Label>
                        </Items>
                    </ext:StatusBar>
                </BottomBar>
                <%--
				<TopBar>
				<ext:StatusBar runat="server" ID="StatusBar2" Icon="Time" Split="true">
				<Items>
				<ext:Label runat="server" Icon="RosetteBlue" Text="Root Yönetici" ID="Label2" />
				</Items>
				</ext:StatusBar>
				</TopBar>
                --%>
            </ext:TabPanel>
        </Items>
    </ext:Viewport>
    <ext:TaskManager ID="TaskManager1" runat="server">
        <Tasks>
            <ext:Task TaskID="Task1" Interval="60000">
                <DirectEvents>
                    <Update OnEvent="OnlineDurumlari">
                    </Update>
                </DirectEvents>
            </ext:Task>
        </Tasks>
    </ext:TaskManager>
    </form>
</body>
</html>
