<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="SHOP.admin.panel"
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
                    iconCls: "icon-stargold",
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
    <ext:Viewport ID="Viewport1" runat="server" Layout="BoxLayout" StyleSpec="background:none #F0F0F0">
        <Items>
            <%--WINDOW--%>
            <ext:Window ID="Window0" runat="server" Padding="5" Layout="FormLayout" Unstyled="true"
                Closable="false" Maximized="true" Shadow="None" Border="false" MonitorResize="true">
                <Items>
                    <%--MAIN LAYOUT--%>
                    <ext:BorderLayout ID="BorderLayout0" runat="server">
                        <%--MAIN TOP--%>
                        <North>
                            <ext:Container ID="North" runat="server" Layout="FitLayout" AutoHeight="true">
                                <Items>
                                    <ext:Panel ID="Panel1" runat="server" Header="false" Shadow="None" Border="false">
                                        <Content>
                                            <div id="dtop">
                                                <%--TOP LEFT--%>
                                                <div id="dtopl">
                                                    <%--<a href='default.aspx?rnd=<%=(DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond)%>'>
                                                        <img src="images/logo.png" alt='' />
                                                    </a>--%>
                                                    <h1>
                                                        <asp:Literal ID="Literal_Header" runat="server" Text="Yönetici Paneli" />
                                                    </h1>
                                                </div>
                                                <%--TOP LEFT--%>
                                                <%--TOP RIGHT--%>
                                                <div id="dtopr"></div>
                                                <%--TOP RIGHT--%>
                                            </div>
                                        </Content>
                                        <TopBar>
                                            <ext:StatusBar runat="server">
                                                <Items>
                                                    <ext:Label ID="Label1" runat="server" Icon="User" /><ext:MenuSeparator />
                                                    <ext:Label ID="LabelShop" runat="server" /><ext:MenuSeparator />
                                                    <ext:Checkbox ID="CheckBox1" runat="server">
                                                        <ToolTips>
                                                            <ext:ToolTip runat="server" Title="Bu ayar aktif edildiğinde;<br/>veritabanından dönen kayıtlar<br/>cache bellekten sunulur." />
                                                        </ToolTips>
                                                    </ext:Checkbox><ext:MenuSeparator />
                                                    <ext:LinkButton runat="server" ID="LinkButton1" Icon="User">
                                                        <Listeners>
                                                            <Click Handler="GirisCikislar()" />
                                                        </Listeners>
                                                    </ext:LinkButton><ext:MenuSeparator />
                                                    <ext:LinkButton runat="server" ID="LinkButton2" Icon="UserRed">
                                                        <Listeners>
                                                            <Click Handler="OnlineKullanicilar()" />
                                                        </Listeners>
                                                    </ext:LinkButton><ext:MenuSeparator />
                                                    <ext:LinkButton runat="server" ID="LinkButton3" Icon="User">
                                                        <Listeners>
                                                            <Click Handler="OnlineYoneticiler()" />
                                                        </Listeners>
                                                    </ext:LinkButton><ext:MenuSeparator />
                                                    <ext:LinkButton runat="server" ID="LinkButton4" Icon="Help">
                                                    </ext:LinkButton><ext:MenuSeparator />
                                                    <ext:LinkButton runat="server" ID="LinkButton5" Icon="Link">
                                                    </ext:LinkButton><ext:MenuSeparator />
                                                    <ext:Button ID="Button2" runat="server" Icon="DoorOut" ToolTip="Çıkış yap" Text="Çıkış Yap">
                                                        <Listeners>
                                                            <Click Fn="CikisYap" />
                                                        </Listeners>
                                                    </ext:Button>
                                                </Items>
                                            </ext:StatusBar>
                                        </TopBar>
                                        <BottomBar>
                                            <%--MENU--%>
                                            <ext:Toolbar ID="MenuToolbar" runat="server" />
                                            <%--MENU--%>
                                        </BottomBar>
                                    </ext:Panel>
                                </Items>
                            </ext:Container>
                        </North>
                        <%--MAIN TOP--%>
                        <%--MAIN CENTER--%>
                        <Center>
                            <ext:Container ID="Center" runat="server" Layout="ColumnLayout">
                                <Items>
                                    <%--CENTER ITEMS--%>
                                    <ext:Window ID="Window1" runat="server" Maximized="true" Closable="false" Minimizable="false"
                                        Region="Center" Header="false" Unstyled="true" Layout="FitLayout">
                                        <Items>
                                            <%--TABS--%>
                                            <ext:TabPanel ID="TabPanel1" runat="server" Closable="false" Header="false" Collapsible="false">
                                                <LoadMask ShowMask="true" Msg="Yükleniyor..." />
                                                <Items>
                                                    <%--MAIN TAB--%>
                                                    <ext:Panel ID="Panel0" Icon="HouseStar" runat="server" Title="Masaüstü">
                                                        <AutoLoad Url="desktop.aspx" Mode="IFrame" ShowMask="true" MaskMsg="Masaüstü bilgileri yükleniyor..." />
                                                        </ext:Panel>
                                                    <%--MAIN TAB--%>
                                                </Items>
                                            </ext:TabPanel>
                                            <%--TABS--%>
                                        </Items>
                                    </ext:Window>
                                    <%--CENTER ITEMS--%>
                                </Items>
                            </ext:Container>
                        </Center>
                        <%--MAIN CENTER--%>
                        
                    </ext:BorderLayout>
                    <%--MAIN LAYOUT--%>
                </Items>
            </ext:Window>
            <%--WINDOW--%>
        </Items>
    </ext:Viewport>
    </form>
</body>
</html>
