<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanicilar.aspx.cs" Inherits="SHOP.admin.kullanicilar"
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
    <script src="js/js.js" type="text/javascript"></script>
    <script type="text/javascript">
        var DugmelerinDurumu = function (grid, toolbar, rowIndex, record) {
            switch (record.data.onay) {
                case "EVET":
                    toolbar.items.get(2).setDisabled(true);
                    toolbar.items.get(2).setTooltip("İlgili kaydın durumu nedeniyle bu buton devre dışı bırakılmıştır.");
                    break;

                case "HAYIR":
                    toolbar.items.get(4).setDisabled(true);
                    toolbar.items.get(4).setTooltip("İlgili kaydın durumu nedeniyle bu buton devre dışı bırakılmıştır.");
                    break;
            }
        };

        var WindowEkleClear = function () {
            for (var i = 0; i <= WindowEkle.items.items.length; i++) {
                if (WindowEkle.items.items[i].xtype == "textfield") {
                    WindowEkle.items.items[i].clear();
                }
                else if (WindowEkle.items.items[i].xtype == "combo") {
                    if (WindowEkle.items.items[i].id == "Ekle_ComboBoxOnay") {
                        WindowEkle.items.items[i].selectByIndex(0);
                    }
                    else {
                        WindowEkle.items.items[i].clear();
                    }
                }
            }
        }

        var SifreDegistir = function () {
            if (Duzenle_Checbox.getValue()) {
                Duzenle_TextFieldSifre.setDisabled(false);
                Duzenle_TextFieldSifre.AllowBlank(true);
            }
            else {
                Duzenle_TextFieldSifre.setDisabled(true);
                Duzenle_TextFieldSifre.AllowBlank(false);
            }
        }

        var WindowDuzenleClear = function () {
            for (var i = 0; i <= WindowDuzenle.items.items.length; i++) {
                if (WindowDuzenle.items.items[i].xtype == "textfield") {
                    WindowDuzenle.items.items[i].clear();
                }
            }
        }

        var DuzenleKontrol = function () {
            if (Duzenle_ComboBoxUyelikMetotID.getValue() == "Üyelik Metot Seçiniz..." || Duzenle_ComboBoxUyelikMetotID.getValue() == "[]" || Duzenle_ComboBoxUyelikMetotID.getValue() == "") {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen üyelik metot seçin.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
            else if (!Duzenle_TextFieldAdSoyad.validate()) {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
            else if (!Duzenle_TextFieldMail.validate()) {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }

            if (Duzenle_Checbox.getValue()) {
                if (!Duzenle_TextFieldSifre.validate()) {
                    Ext.Msg.show({ title: 'Hata', msg: 'Lütfen şifre belirtin.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                    return false;
                }
            }
        }

        var KaydetKontrol = function () {
            if (Ekle_ComboBoxUyelikMetotID.getValue() == "Üyelik Metot Seçiniz..." || Ekle_ComboBoxUyelikMetotID.getValue() == "[]" || Ekle_ComboBoxUyelikMetotID.getValue() == "") {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen üyelik metot seçin.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
            else if (!Ekle_TextFieldAdSoyad.validate()) {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
            else if (!Ekle_TextFieldMail.validate()) {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
            else if (!Ekle_TextFieldSifre.validate()) {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
            else if (!Ekle_TextFieldSifreTekrar.validate()) {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
            else if (Ekle_TextFieldSifre.getValue() != Ekle_TextFieldSifreTekrar.getValue()) {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen şifre alanları kontrol ediniz.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
        }

        var GridKomutlari = function (cmd, record) {
            switch (cmd) {

                case "Duzenle":
                    DuzenleSTD(record.data.id);
                    break;

                case "OnayVer":
                    OnayVerSTD(record.data.id);
                    break;

                case "OnayKaldir":
                    OnayKaldirSTD(record.data.id);
                    break;
            }
        }
    </script>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Gray" Locale="tr-TR"
        GZip="true" />
    <ext:KeyMap ID="KeyMapPanel1" runat="server" Target="#{form1}">
        <ext:KeyBinding StopEvent="true">
            <Keys>
                <ext:Key Code="F5" />
            </Keys>
            <Listeners>
                <Event Handler="#{GridPanel1}.reload();" />
            </Listeners>
        </ext:KeyBinding>
    </ext:KeyMap>
    <ext:Viewport ID="Viewport1" runat="server" Layout="FitLayout" StyleSpec="background-color:#F0F0F0">
        <Items>
            <ext:Window ID="Window1" runat="server" Maximized="true" Title="Kullanıcılar" Layout="FitLayout"
                Icon="ShapeMoveBackwards" Closable="false" Minimizable="false" MinHeight="480"
                MinWidth="640">
                <Items>
                    <ext:GridPanel ID="GridPanel1" runat="server" ColumnLines="true" SortType="AsUCString"
                        AutoExpandColumn="ad_soyad" OnBeforeClientInit="GridPanelYuklenmedenOnce" AnchorHorizontal="100%"
                        Region="Center" AutoScroll="true" MonitorResize="true" TrackMouseOver="true">
                        <Store>
                            <ext:Store ID="Store1" runat="server" OnRefreshData="KayitlariYenile" RemoteSort="true">
                                <Proxy>
                                    <ext:PageProxy />
                                </Proxy>
                                <AutoLoadParams>
                                    <ext:Parameter Name="start" Value="0" Mode="Raw" />
                                    <ext:Parameter Name="limit" Value="25" Mode="Raw" />
                                    <ext:Parameter Name="sort" Value="" />
                                    <ext:Parameter Name="dir" Value="" />
                                </AutoLoadParams>
                                <SortInfo Field="id" Direction="DESC" />
                                <Reader>
                                    <ext:JsonReader IDProperty="id">
                                        <Fields>
                                            <ext:RecordField Name="id" />
                                            <ext:RecordField Name="uyelik_metot" />
                                            <ext:RecordField Name="ad_soyad" />
                                            <ext:RecordField Name="mail" />
                                            <ext:RecordField Name="alan_kodu_id" />
                                            <ext:RecordField Name="gsm" />
                                            <ext:RecordField Name="tarih_ek" Type="Date" />
                                            <ext:RecordField Name="guncelleyen" />
                                            <ext:RecordField Name="tarih_gun" Type="Date" />
                                            <ext:RecordField Name="onay" />
                                        </Fields>
                                    </ext:JsonReader>
                                </Reader>
                            </ext:Store>
                        </Store>
                        <ColumnModel runat="server">
                            <Columns>
                                <ext:RowNumbererColumn MenuDisabled="true" ColumnID="check" Resizable="false" Editable="false"
                                    Width="40" />
                                <ext:Column DataIndex="id" Header="ID" Width="40" />
                                <ext:Column DataIndex="uyelik_metot" Header="Üyelik Metot" Width="75" />
                                <ext:Column DataIndex="ad_soyad" Header="Adı Soyadı" />
                                <ext:Column DataIndex="mail" Header="E-Posta" />
                                <ext:Column DataIndex="alan_kodu_id" Header="Alan Kodu" Width="70" />
                                <ext:Column DataIndex="gsm" Header="Telefon" />
                                <ext:DateColumn DataIndex="tarih_ek" Header="Kayıt Tarihi" Align="Center" Format="dd/MM/yyyy - HH:mm:ss"
                                    Width="125" />
                                <ext:Column DataIndex="guncelleyen" Header="Güncelleyen" />
                                <ext:DateColumn DataIndex="tarih_gun" Header="Güncelleme Tarihi" Align="Center" Format="dd/MM/yyyy - HH:mm:ss"
                                    Width="125" />
                                <ext:Column DataIndex="onay" Header="Onay" Align="Center" Width="50">
                                    <Renderer Fn="OnayRenk" />
                                </ext:Column>
                                <ext:CommandColumn Header="İşlemler" Align="Center" Width="87" MenuDisabled="true"
                                    Resizable="false" ButtonAlign="Center">
                                    <Commands>
                                        <ext:GridCommand Icon="NoteEdit" CommandName="Duzenle">
                                            <ToolTip Text="Seçilen kaydı düzenle." />
                                        </ext:GridCommand>
                                        <ext:CommandSeparator />
                                    </Commands>
                                    <Commands>
                                        <ext:GridCommand Icon="Tick" CommandName="OnayVer">
                                            <ToolTip Text="Seçilen kayıt için onay ver." />
                                        </ext:GridCommand>
                                        <ext:CommandSeparator />
                                    </Commands>
                                    <Commands>
                                        <ext:GridCommand Icon="Cross" CommandName="OnayKaldir">
                                            <ToolTip Text="Seçilen kayıt için onayı kaldır." />
                                        </ext:GridCommand>
                                    </Commands>
                                    <PrepareToolbar Fn="DugmelerinDurumu" />
                                </ext:CommandColumn>
                            </Columns>
                        </ColumnModel>
                        <Plugins>
                            <ext:GridFilters runat="server" ID="GridFilters1" Local="true">
                                <Filters>
                                    <ext:NumericFilter DataIndex="id" />
                                    <ext:StringFilter DataIndex="uyelik_metot" />
                                    <ext:StringFilter DataIndex="ad_soyad" />
                                    <ext:StringFilter DataIndex="mail" />
                                    <ext:StringFilter DataIndex="alan_kodu_id" />
                                    <ext:StringFilter DataIndex="gsm" />
                                    <ext:StringFilter DataIndex="guncelleyen" />
                                    <ext:DateFilter DataIndex="tarih_ek">
                                        <DatePickerOptions runat="server" TodayText="Now" />
                                    </ext:DateFilter>
                                    <ext:DateFilter DataIndex="tarih_gun">
                                        <DatePickerOptions runat="server" TodayText="Now" />
                                    </ext:DateFilter>
                                    <ext:ListFilter DataIndex="onay" Options="EVET,HAYIR" />
                                </Filters>
                            </ext:GridFilters>
                        </Plugins>
                        <SelectionModel>
                            <ext:CheckboxSelectionModel ID="CheckboxSelectionModel1" runat="server" />
                        </SelectionModel>
                        <Buttons>
                            <ext:Button runat="server" ID="Button1" Text="Yeni" Icon="Add">
                                <DirectEvents>
                                    <Click OnEvent="YeniKayitEkraniGetir">
                                        <EventMask ShowMask="true" MinDelay="500" Msg="Yükleniyor..." />
                                    </Click>
                                </DirectEvents>
                            </ext:Button>
                            <ext:Button runat="server" ID="Button2" Text="Onayla" Icon="Tick">
                                <DirectEvents>
                                    <Click OnEvent="SecilenleriOnayla">
                                        <Confirmation ConfirmRequest="true" Message="İşlemi onaylıyor musunuz?" Title="Onay" />
                                        <EventMask ShowMask="true" MinDelay="500" Msg="Yükleniyor..." />
                                    </Click>
                                </DirectEvents>
                            </ext:Button>
                            <ext:Button runat="server" ID="Button3" Text="Onay Kaldır" Icon="Cross">
                                <DirectEvents>
                                    <Click OnEvent="SecilenleriOnaysizYap">
                                        <Confirmation ConfirmRequest="true" Message="İşlemi onaylıyor musunuz?" Title="Onay" />
                                        <EventMask ShowMask="true" MinDelay="500" Msg="Yükleniyor..." />
                                    </Click>
                                </DirectEvents>
                            </ext:Button>
                        </Buttons>
                        <LoadMask ShowMask="true" Msg="Yükleniyor..." />
                        <SaveMask ShowMask="true" Msg="Kaydediliyor..." />
                        <TopBar>
                            <ext:Toolbar ID="Toolbar1" runat="server">
                                <Items>
                                    <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                                    <ext:Button ID="ButtonXLS" runat="server" Text="XLS" Icon="PageWhiteExcel">
                                        <DirectEvents>
                                            <Click OnEvent="ExportEt" IsUpload="true" Before="ExportYap()">
                                                <ExtraParams>
                                                    <ext:Parameter Name="data" Value="#{GridPanel1}.getRowsValues()" Mode="Raw" Encode="true" />
                                                    <ext:Parameter Name="format" Value="xls" Mode="Value" />
                                                </ExtraParams>
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                    <ext:Button ID="ButtonDOC" runat="server" Text="DOC" Icon="PageWhiteWord">
                                        <DirectEvents>
                                            <Click OnEvent="ExportEt" IsUpload="true" Before="ExportYap()">
                                                <ExtraParams>
                                                    <ext:Parameter Name="data" Value="#{GridPanel1}.getRowsValues()" Mode="Raw" Encode="true" />
                                                    <ext:Parameter Name="format" Value="doc" Mode="Value" />
                                                </ExtraParams>
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                    <ext:Button ID="ButtonCSV" runat="server" Text="CSV" Icon="PageAttach">
                                        <DirectEvents>
                                            <Click OnEvent="ExportEt" IsUpload="true" Before="ExportYap()">
                                                <ExtraParams>
                                                    <ext:Parameter Name="data" Value="#{GridPanel1}.getRowsValues()" Mode="Raw" Encode="true" />
                                                    <ext:Parameter Name="format" Value="csv" Mode="Value" />
                                                </ExtraParams>
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                    <ext:Button ID="ButtonXML" runat="server" Text="XML" Icon="PageWhiteCode">
                                        <DirectEvents>
                                            <Click OnEvent="ExportEt" IsUpload="true" Before="ExportYap()">
                                                <ExtraParams>
                                                    <ext:Parameter Name="data" Value="#{GridPanel1}.getRowsValues()" Mode="Raw" Encode="true" />
                                                    <ext:Parameter Name="format" Value="xml" Mode="Value" />
                                                </ExtraParams>
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                    <ext:Button ID="ButtonHTML" runat="server" Text="HTML" Icon="PageWhiteH">
                                        <DirectEvents>
                                            <Click OnEvent="ExportEt" IsUpload="true" Before="ExportYap()">
                                                <ExtraParams>
                                                    <ext:Parameter Name="data" Value="#{GridPanel1}.getRowsValues()" Mode="Raw" Encode="true" />
                                                    <ext:Parameter Name="format" Value="html" Mode="Value" />
                                                </ExtraParams>
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                    <ext:Button ID="ButtonPDF" runat="server" Text="PDF" Icon="PageWhiteAcrobat">
                                        <DirectEvents>
                                            <Click OnEvent="ExportEt" IsUpload="true" Before="ExportYap()">
                                                <ExtraParams>
                                                    <ext:Parameter Name="data" Value="#{GridPanel1}.getRowsValues()" Mode="Raw" Encode="true" />
                                                    <ext:Parameter Name="format" Value="pdf" Mode="Value" />
                                                </ExtraParams>
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                </Items>
                            </ext:Toolbar>
                        </TopBar>
                        <BottomBar>
                            <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="25">
                                <Items>
                                    <ext:ToolbarSeparator>
                                    </ext:ToolbarSeparator>
                                    <ext:Label ID="Label_Sayfalama" runat="server" Text="Sayfalama Sayısı :" />
                                    <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
                                    <ext:ComboBox ID="ComboBox1" runat="server" Width="60" Editable="false">
                                        <Items>
                                            <ext:ListItem Text="10" />
                                            <ext:ListItem Text="25" />
                                            <ext:ListItem Text="50" />
                                            <ext:ListItem Text="100" />
                                            <ext:ListItem Text="500" />
                                            <ext:ListItem Text="1000" />
                                            <ext:ListItem Text="2500" />
                                            <ext:ListItem Text="5000" />
                                        </Items>
                                        <SelectedItem Value="25" />
                                        <Listeners>
                                            <Select Handler="#{PagingToolbar1}.pageSize = parseInt(this.getValue()); #{PagingToolbar1}.doLoad();" />
                                        </Listeners>
                                    </ext:ComboBox>
                                    <ext:ToolbarSpacer ID="ToolbarSpacer2" runat="server" Width="5" />
                                    <ext:ToolbarSeparator>
                                    </ext:ToolbarSeparator>
                                    <ext:Label runat="server" ID="YoneticiAdi" OnBeforeClientInit="YoneticiAdiYaz">
                                    </ext:Label>
                                </Items>
                            </ext:PagingToolbar>
                        </BottomBar>
                        <Listeners>
                            <Command Fn="GridKomutlari" />
                        </Listeners>
                    </ext:GridPanel>
                </Items>
            </ext:Window>
            <ext:Window ID="WindowEkle" runat="server" Modal="false" Resizable="True" Height="500"
                Icon="Add" Title="Ekle" Width="640" Padding="5" Layout="FormLayout" ButtonAlign="Center"
                Shadow="None" LabelSeparator=" : " Draggable="True" AutoFocus="True" AutoHeight="True"
                Hidden="true">
                <Items>
                    <ext:ComboBox MsgTarget="Side" ID="Ekle_ComboBoxUyelikMetotID" Selectable="true"
                        FieldLabel="Üyelik Metot" AnchorHorizontal="96%" runat="server" DisplayField="ad"
                        ValueField="id" Editable="true" Mode="Local" ForceSelection="true" SelectOnFocus="true"
                        EmptyText="Üyelik Metot Seçiniz..." IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan"
                        AllowBlank="false" EnableKeyEvents="true">
                        <Store>
                            <ext:Store ID="StoreUyelikMetot1" runat="server" WarningOnDirty="false">
                                <Reader>
                                    <ext:JsonReader>
                                        <Fields>
                                            <ext:RecordField Name="id" Type="Int" />
                                            <ext:RecordField Name="ad" />
                                        </Fields>
                                    </ext:JsonReader>
                                </Reader>
                            </ext:Store>
                        </Store>
                    </ext:ComboBox>
                    <ext:TextField MsgTarget="Side" ID="Ekle_TextFieldUyelikMetotUyeID" MaxLength="255"
                        MaxLengthText="Maksimum karakter sınırını aştınız." runat="server" FieldLabel="Üyelik Metot ID"
                        AnchorHorizontal="100%" EnableKeyEvents="true" />
                    <ext:TextField MsgTarget="Side" ID="Ekle_TextFieldUyelikMetotUyeInfo" MaxLength="255"
                        MaxLengthText="Maksimum karakter sınırını aştınız." runat="server" FieldLabel="Üyelik Metot İnfo"
                        AnchorHorizontal="100%" EnableKeyEvents="true" />
                    <ext:TextField MsgTarget="Side" AllowBlank="false" ID="Ekle_TextFieldAdSoyad" MaxLength="255"
                        MaxLengthText="Maksimum karakter sınırını aştınız." runat="server" FieldLabel="Ad Soyad"
                        BlankText="Lütfen bir ad soyad yazın." AnchorHorizontal="96%" IndicatorIcon="BulletStar"
                        IndicatorTip="Zorunlu alan" EnableKeyEvents="true" />
                    <ext:TextField MsgTarget="Side" AllowBlank="false" ID="Ekle_TextFieldMail" Enabled="false"
                        MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız." runat="server"
                        FieldLabel="Mail" BlankText="Lütfen mail yazın." AnchorHorizontal="96%" IndicatorIcon="BulletStar"
                        IndicatorTip="Zorunlu alan" EnableKeyEvents="true" />
                    <ext:Panel ID="Panel3" runat="server" Layout="FormLayout" Padding="5" StyleSpec="margin-top:5px; margin-bottom:5px;"
                        LabelSeparator=" : ">
                        <Content>
                            <ext:TextField MsgTarget="Side" AllowBlank="false" ID="Ekle_TextFieldSifre" InputType="Password"
                                MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız." runat="server"
                                FieldLabel="Şifre" BlankText="Lütfen şifre yazın." AnchorHorizontal="96%" IndicatorIcon="BulletStar"
                                IndicatorTip="Zorunlu alan" EnableKeyEvents="true" />
                            <ext:TextField MsgTarget="Side" AllowBlank="false" ID="Ekle_TextFieldSifreTekrar"
                                InputType="Password" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                runat="server" FieldLabel="Şifre Tekrar" BlankText="Lütfen şifre tekrar yazın."
                                AnchorHorizontal="96%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan"
                                EnableKeyEvents="true" />
                        </Content>
                    </ext:Panel>
                    <ext:Panel ID="Panel2" runat="server" Layout="FormLayout" Padding="5" StyleSpec="margin-top:5px; margin-bottom:5px;"
                        LabelSeparator=" : ">
                        <Content>
                            <ext:ComboBox ID="Ekle_ComboBoxAlanKoduID" FieldLabel="Alan Kodu" AnchorHorizontal="100%"
                                runat="server" DisplayField="alan_kodu" ValueField="id" Editable="true" TypeAhead="true"
                                Mode="Local" ForceSelection="true" SelectOnFocus="true">
                                <Store>
                                    <ext:Store ID="StoreAlanKodu1" runat="server" WarningOnDirty="false">
                                        <Reader>
                                            <ext:JsonReader>
                                                <Fields>
                                                    <ext:RecordField Name="id" Type="Int" />
                                                    <ext:RecordField Name="alan_kodu" />
                                                </Fields>
                                            </ext:JsonReader>
                                        </Reader>
                                    </ext:Store>
                                </Store>
                                <Triggers>
                                    <ext:FieldTrigger Icon="Clear" Qtip="Seçimi Temizle" />
                                </Triggers>
                                <Listeners>
                                    <TriggerClick Handler="this.clearValue();" />
                                </Listeners>
                            </ext:ComboBox>
                            <ext:TextField MsgTarget="Side" ID="Ekle_TextFieldGsm" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                runat="server" FieldLabel="Gsm No" AnchorHorizontal="100%" EnableKeyEvents="true" />
                        </Content>
                    </ext:Panel>
                    <ext:ComboBox ID="Ekle_ComboBoxOnay" runat="server" FieldLabel="Onay" Editable="false"
                        Selectable="true">
                        <Items>
                            <ext:ListItem Text="Onay Ver" Value="1" />
                            <ext:ListItem Text="Henüz Değil" Value="0" />
                        </Items>
                        <SelectedItem Value="1" />
                    </ext:ComboBox>
                </Items>
                <Buttons>
                    <ext:Button ID="Ekle_Kaydet" runat="server" Text="Kaydet" Icon="Accept" Type="Submit">
                        <Listeners>
                            <Click Fn="KaydetKontrol" />
                        </Listeners>
                        <DirectEvents>
                            <Click OnEvent="YeniKayitYap">
                                <EventMask ShowMask="true" Msg="Kaydediliyor..." MinDelay="500" />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                </Buttons>
                <Listeners>
                    <Hide Handler="WindowEkleClear()" />
                </Listeners>
            </ext:Window>
            <ext:Window ID="WindowDuzenle" runat="server" Modal="true" Resizable="True" Height="600"
                Icon="NoteEdit" Title="Düzenle" Width="900" Padding="5" Layout="FormLayout" ButtonAlign="Center"
                Shadow="None" LabelSeparator=" : " Draggable="True" AutoFocus="True" AutoHeight="True"
                Hidden="true">
                <Items>
                    <ext:TabPanel ID="TabPanel1" runat="server" Border="false">
                        <Items>
                            <ext:Panel ID="Tab1" Title="Üyelik Bilgileri" runat="server" CloseAction="Hide" AutoWidth="true"
                                AutoHeight="true" Layout="FormLayout" Padding="5">
                                <Items>
                                    <ext:TextField ID="Duzenle_ID" Hidden="true" runat="server" />
                                    <ext:TextField ID="Duzenle_Mail" Hidden="true" runat="server" />
                                    <ext:ComboBox ID="Duzenle_ComboBoxUyelikMetotID" Selectable="true" FieldLabel="Üyelik Metot"
                                        AnchorHorizontal="96%" runat="server" DisplayField="ad" ValueField="id" Editable="true"
                                        Mode="Local" ForceSelection="true" SelectOnFocus="true" EmptyText="Üyelik Metot Seçiniz..."
                                        IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan" AllowBlank="false" EnableKeyEvents="true">
                                        <Store>
                                            <ext:Store ID="StoreUyelikMetot2" runat="server" WarningOnDirty="false">
                                                <Reader>
                                                    <ext:JsonReader>
                                                        <Fields>
                                                            <ext:RecordField Name="id" Type="Int" />
                                                            <ext:RecordField Name="ad" />
                                                        </Fields>
                                                    </ext:JsonReader>
                                                </Reader>
                                            </ext:Store>
                                        </Store>
                                    </ext:ComboBox>
                                    <ext:TextField MsgTarget="Side" ID="Duzenle_TextFieldUyelikMetotUyeID" MaxLength="255"
                                        MaxLengthText="Maksimum karakter sınırını aştınız." runat="server" FieldLabel="Üyelik Metot ID"
                                        AnchorHorizontal="100%" EnableKeyEvents="true" />
                                    <ext:TextField MsgTarget="Side" ID="Duzenle_TextFieldUyelikMetotUyeInfo" MaxLength="255"
                                        MaxLengthText="Maksimum karakter sınırını aştınız." runat="server" FieldLabel="Üyelik Metot İnfo"
                                        AnchorHorizontal="100%" EnableKeyEvents="true" />
                                    <ext:TextField MsgTarget="Side" AllowBlank="false" ID="Duzenle_TextFieldAdSoyad"
                                        MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız." runat="server"
                                        FieldLabel="Ad Soyad" BlankText="Lütfen bir ad soyad yazın." AnchorHorizontal="96%"
                                        IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan" EnableKeyEvents="true" />
                                    <ext:TextField MsgTarget="Side" AllowBlank="false" ID="Duzenle_TextFieldMail" Enabled="false"
                                        MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız." runat="server"
                                        FieldLabel="Mail" BlankText="Lütfen mail yazın." AnchorHorizontal="96%" IndicatorIcon="BulletStar"
                                        IndicatorTip="Zorunlu alan" EnableKeyEvents="true" />
                                    <ext:Panel ID="Panel1" runat="server" Layout="FormLayout" Padding="5" StyleSpec="margin-top:5px; margin-bottom:5px;"
                                        LabelSeparator=" : ">
                                        <Content>
                                            <ext:Checkbox ID="Duzenle_Checbox" runat="server" FieldLabel="Şifre Değiştir">
                                                <Listeners>
                                                    <Check Fn="SifreDegistir" />
                                                </Listeners>
                                            </ext:Checkbox>
                                            <ext:TextField MsgTarget="Side" AllowBlank="false" ID="Duzenle_TextFieldSifre" InputType="Password"
                                                Disabled="true" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                                runat="server" FieldLabel="Şifre" BlankText="Lütfen şifre yazın." AnchorHorizontal="96%"
                                                IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan" EnableKeyEvents="true" />
                                        </Content>
                                    </ext:Panel>
                                    <ext:Panel ID="Panel4" runat="server" Layout="FormLayout" Padding="5" StyleSpec="margin-top:5px; margin-bottom:5px;"
                                        LabelSeparator=" : ">
                                        <Content>
                                            <ext:ComboBox ID="Duzenle_ComboBoxAlanKoduID" FieldLabel="Alan Kodu" AnchorHorizontal="100%"
                                                runat="server" DisplayField="alan_kodu" ValueField="id" Editable="true" TypeAhead="true"
                                                Mode="Local" ForceSelection="true" SelectOnFocus="true">
                                                <Store>
                                                    <ext:Store ID="StoreAlanKodu2" runat="server" WarningOnDirty="false">
                                                        <Reader>
                                                            <ext:JsonReader>
                                                                <Fields>
                                                                    <ext:RecordField Name="id" Type="Int" />
                                                                    <ext:RecordField Name="alan_kodu" />
                                                                </Fields>
                                                            </ext:JsonReader>
                                                        </Reader>
                                                    </ext:Store>
                                                </Store>
                                                <Triggers>
                                                    <ext:FieldTrigger Icon="Clear" Qtip="Seçimi Temizle" />
                                                </Triggers>
                                                <Listeners>
                                                    <TriggerClick Handler="this.clearValue();" />
                                                </Listeners>
                                            </ext:ComboBox>
                                            <ext:TextField MsgTarget="Side" ID="Duzenle_TextFieldGsm" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                                runat="server" FieldLabel="Gsm No" AnchorHorizontal="100%" EnableKeyEvents="true" />
                                        </Content>
                                    </ext:Panel>
                                    <ext:ComboBox ID="Duzenle_ComboBoxOnay" runat="server" FieldLabel="Onay" Editable="false"
                                        Selectable="true">
                                        <Items>
                                            <ext:ListItem Text="Onay Ver" Value="1" />
                                            <ext:ListItem Text="Henüz Değil" Value="0" />
                                        </Items>
                                        <SelectedItem Value="1" />
                                    </ext:ComboBox>
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel5" Title="Siparişler" runat="server" CloseAction="Hide"
                                AutoWidth="true" AutoHeight="true" Padding="5">
                                <Items>
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel6" Title="Teslimat Bilgileri" runat="server" CloseAction="Hide"
                                AutoWidth="true" AutoHeight="true" Layout="FitLayout" Padding="5">
                                <Items>
                                    <ext:Label ID="teslimat_adres3" runat="server" />
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel7" Title="Fatura Bilgileri" runat="server" CloseAction="Hide"
                                AutoWidth="true" AutoHeight="true" Layout="FitLayout" Padding="5">
                                <Items>
                                <ext:Label ID="fatura_adres3" runat="server" />
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel8" Title="Bildirimler" runat="server" CloseAction="Hide"
                                AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                                <Items>
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel9" Title="Oturum Geçmişi" runat="server" CloseAction="Hide"
                                AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                                <Items>
                                </Items>
                            </ext:Panel>
                        </Items>
                    </ext:TabPanel>
                </Items>
                <Buttons>
                    <ext:Button ID="Duzenle_Kaydet" runat="server" Text="Güncelle" Icon="Accept">
                        <Listeners>
                            <Click Fn="DuzenleKontrol" />
                        </Listeners>
                        <DirectEvents>
                            <Click OnEvent="GuncellemeYap">
                                <EventMask ShowMask="true" Msg="Güncelleniyor..." MinDelay="500" />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                </Buttons>
                <Listeners>
                    <Hide Handler="WindowDuzenleClear()" />
                </Listeners>
            </ext:Window>
        </Items>
    </ext:Viewport>
    </form>
</body>
</html>
