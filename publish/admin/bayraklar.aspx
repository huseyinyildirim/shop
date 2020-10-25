<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bayraklar.aspx.cs" Inherits="SHOP.admin.bayraklar"
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
        @import url("css/resim.css");
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
    <script src="js/js.js" type="text/javascript"></script>
    <script src="js/data-view-plugins.js" type="text/javascript"></script>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Gray" Locale="tr-TR"
        GZip="true" />
    <ext:KeyMap ID="KeyMapPanel1" runat="server" Target="#{form1}">
        <ext:KeyBinding StopEvent="true">
            <Keys>
                <ext:Key Code="F5" />
            </Keys>
            <Listeners>
                <Event Handler="#{Store1}.reload();" />
            </Listeners>
        </ext:KeyBinding>
        <ext:KeyBinding StopEvent="true">
            <Keys>
                <ext:Key Code="DELETE" />
            </Keys>
            <Listeners>
                <Event Fn="SecilenleriSil" />
            </Listeners>
        </ext:KeyBinding>
    </ext:KeyMap>
    <ext:Store ID="Store1" runat="server" OnRefreshData="KayitlariYenile">
        <Reader>
            <ext:JsonReader IDProperty="ID">
                <Fields>
                    <ext:RecordField Name="Ad" />
                    <ext:RecordField Name="URL" />
                    <ext:RecordField Name="Boyut" Type="Int" />
                </Fields>
            </ext:JsonReader>
        </Reader>
        <AutoLoadParams>
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="limit" Value="25" Mode="Raw" />
        </AutoLoadParams>
    </ext:Store>
    <ext:Viewport ID="Viewport1" runat="server" Layout="FitLayout" StyleSpec="background-color:#F0F0F0">
        <Items>
            <ext:Window ID="Window1" runat="server" Maximized="true" Title="Bayraklar [K]" Layout="FitLayout"
                Icon="FlagPurple" Closable="false" Minimizable="false" MinHeight="480" MinWidth="640">
                <Items>
                    <ext:DataView ID="ImageView" runat="server" StoreID="Store1" AutoHeight="true" MultiSelect="true"
                        OverClass="x-view-over" Cls="images-view" ItemSelector="div.thumb-wrap" EmptyText="Resim Yok!"
                        SingleSelect="true">
                        <Template ID="Template1" runat="server">
                            <Html>
                                <tpl for=".">
								<div class="thumb-wrap" id="{Ad}">
									<div class="thumb"><img src="{URL}" title="{Ad}" alt="{Ad}"></div>
									<span class="x-editable">{Ad}</span>
									<span class="x-editable">{Boyut}</span>
								</div>
							</tpl>
                                <div class="x-clear"></div>
                            </Html>
                        </Template>
                        <PrepareData Fn="DosyaBoyutuFormatla" />
                        <Plugins>
                            <ext:GenericPlugin ID="GenericPlugin1" runat="server" InstanceName="Ext.DataView.DragSelector" />
                        </Plugins>
                    </ext:DataView>
                </Items>
                <TopBar>
                    <ext:StatusBar runat="server" ID="StatusBar2" Icon="Lightbulb">
                        <Items>
                            <ext:Label runat="server" ID="Label2">
                            </ext:Label>
                        </Items>
                    </ext:StatusBar>
                </TopBar>
                <BottomBar>
                    <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="25" StoreID="Store1"
                        HideRefresh="true">
                        <Items>
                            <ext:Label ID="Label3" runat="server" Text="Sayfalama Sayısı :" />
                            <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
                            <ext:ComboBox ID="ComboBox1" runat="server" Width="60" Editable="false">
                                <Items>
                                    <ext:ListItem Text="10" />
                                    <ext:ListItem Text="25" />
                                    <ext:ListItem Text="50" />
                                    <ext:ListItem Text="100" />
                                    <ext:ListItem Text="500" />
                                </Items>
                                <SelectedItem Value="25" />
                                <Listeners>
                                    <Select Handler="#{PagingToolbar1}.pageSize = parseInt(this.getValue()); #{PagingToolbar1}.doLoad(); #{Store1}.load({params: {start:0, limit:parseInt(this.getValue())} });" />
                                </Listeners>
                            </ext:ComboBox>
                            <ext:ToolbarSpacer ID="ToolbarSpacer3" runat="server" Width="5" />
                            <ext:ToolbarSeparator>
                            </ext:ToolbarSeparator>
                            <ext:Label runat="server" ID="YoneticiAdi" OnBeforeClientInit="YoneticiAdiYaz">
                            </ext:Label>
                        </Items>
                    </ext:PagingToolbar>
                </BottomBar>
                <Buttons>
                    <ext:Button runat="server" ID="Button3" Text="Dosya Yükle" Icon="Attach">
                        <DirectEvents>
                            <Click OnEvent="DosyaYuklemeEkraniGetir">
                                <EventMask ShowMask="true" MinDelay="500" Msg="Yükleniyor..." />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                    <ext:Button runat="server" ID="Button1" Text="Sil" Icon="Delete">
                        <DirectEvents>
                            <Click OnEvent="SecilenleriSil">
                                <EventMask ShowMask="true" MinDelay="500" Msg="Seçilenler siliniyor..." />
                                <Confirmation ConfirmRequest="true" Message="Seçimi onaylıyor musunuz?" Title="Onay" />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                    <ext:Button runat="server" ID="Button2" Text="Seçimi Temizle" Icon="Cross">
                        <DirectEvents>
                            <Click OnEvent="SecimiTemizle">
                                <EventMask ShowMask="true" MinDelay="500" Msg="Seçim temizleniyor..." />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                </Buttons>
            </ext:Window>
            <ext:Window ID="WindowResimYukle" runat="server" Modal="true" Resizable="True" Height="500"
                Icon="Attach" Title="Dosya Yükle" Width="640" Padding="5" Layout="FormLayout"
                ButtonAlign="Center" Shadow="None" LabelSeparator=" : " Draggable="true" AutoFocus="True"
                AutoHeight="True" Hidden="true">
                <Items>
                    <ext:FileUploadField ID="gonderilecek_dosya" runat="server" AnchorHorizontal="90%"
                        Icon="Attach" MsgTarget="Side" AllowBlank="false" BlankText="Lütfen bir dosya seçiniz."
                        FieldLabel="Dosya" />
                </Items>
                <Buttons>
                    <ext:Button ID="Button6" runat="server" Text="Gönder" Icon="Accept" Type="Submit">
                        <Listeners>
                            <Click Fn="DosyaGonder" />
                        </Listeners>
                        <DirectEvents>
                            <Click OnEvent="DosyaGonderClick">
                                <EventMask ShowMask="true" Msg="Dosya yükleniyor..." MinDelay="500" />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                </Buttons>
            </ext:Window>
        </Items>
    </ext:Viewport>
    </form>
</body>
</html>
