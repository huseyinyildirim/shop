<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="firma-adresleri.aspx.cs" Inherits="SHOP.admin.firma_adresleri" EnableViewState="False" ViewStateMode="Disabled" EnableEventValidation="False"
	ValidateRequest="false"%>

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
	    var BayrakGoster = function (data) {

	        var bb = data.replace(".png", "").replace(".jpg", "").replace(".gif", "").toUpperCase();
	        var cc = '';

	        for (var i = 0; i < bb.split("_").length; i++) {
	            cc = cc + bb.split("_")[i] + " ";
	        }

	        return String.format("<img alt=\"" + cc + "\" src=\"../userfiles/flag/" + data + "\">");
	    };

	    var IkonYol = function (data) {
	        return String.format("<a href=\"" + data.replace(IkonYolu, "../userfiles/flag/") + "\" target=\"_blank\">" + data.replace(IkonYolu, "../userfiles/flag/") + "</a>");
	    };

	    var HaritaYol = function (data) {
	        if (data != null) {
	            return String.format("<a href=\"" + data + "\" target=\"_blank\">" + data + "</a>");
	        }
	    };

	    var BayrakGetir1 = function () {
	        if (Ekle_ComboBoxBayrak.getValue() != "") {
	            PanelBayrakResim1.show();

	            var bb = Ekle_ComboBoxBayrak.getValue().replace(".png", "").replace(".jpg", "").replace(".gif", "").toUpperCase();
	            var cc = '';

	            for (var i = 0; i < bb.split("_").length; i++) {
	                cc = cc + bb.split("_")[i] + " ";
	            }

	            Ext.get("BayrakResimDiv1").dom.innerHTML = "<span style=\"vertical-align:middle\">" + cc + "</span> <img style=\"vertical-align:middle\" src=\"" + "../userfiles/flag/" + Ekle_ComboBoxBayrak.getValue() + "\" alt=\"\" id=\"EkleResim\" />";
	            return false;
	        }
	    }

	    var BayrakGetir2 = function () {
	        if (Duzenle_ComboBoxBayrak.getValue() != "") {
	            PanelBayrakResim2.show();

	            var bb = Duzenle_ComboBoxBayrak.getValue().replace(".png", "").replace(".jpg", "").replace(".gif", "").toUpperCase();
	            var cc = '';

	            for (var i = 0; i < bb.split("_").length; i++) {
	                cc = cc + bb.split("_")[i] + " ";
	            }

	            Ext.get("BayrakResimDiv2").dom.innerHTML = "<span style=\"vertical-align:middle\">" + cc + "</span> <img style=\"vertical-align:middle\" src=\"" + "../userfiles/flag/" + Duzenle_ComboBoxBayrak.getValue() + "\" alt=\"\" id=\"EkleResim\" />";
	            return false;
	        }
	    }

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
	            if (WindowEkle.items.items[i].xtype == "textfield" || WindowEkle.items.items[i].xtype == "textarea") {
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

	    var WindowDuzenleClear = function () {
	        for (var i = 0; i <= WindowDuzenle.items.items.length; i++) {
	            if (WindowDuzenle.items.items[i].xtype == "textfield" || WindowDuzenle.items.items[i].xtype == "textarea") {
	                WindowDuzenle.items.items[i].clear();
	            }
	        }
	    }

	    var WindowSiralamaClear = function () {
	        for (var i = 0; i <= WindowSiralama.items.items.length; i++) {
	            if (WindowSiralama.items.items[i].xtype == "textfield") {
	                WindowSiralama.items.items[i].clear();
	            }
	        }
	    }

	    var DuzenleKontrol = function () {
	        if (Duzenle_ComboBoxUlke.getSelectedIndex() == -1 || Duzenle_ComboBoxUlke.getValue() == "") {
	            Ext.Msg.show({ title: 'Hata', msg: 'Lütfen bir ülke seçin.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
	            return false;
	        }
	        else if (!Duzenle_TextAreaAdres.validate()) {
	            Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
	            return false;
	        }
	    }

	    var KaydetKontrol = function () {
	        if (Ekle_ComboBoxUlke.getSelectedIndex() == -1 || Ekle_ComboBoxUlke.getValue() == "") {
	            Ext.Msg.show({ title: 'Hata', msg: 'Lütfen bir ülke seçin.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
	            return false;
	        }
	        else if (Ekle_ComboBoxBayrak.getValue() == "") {
	            Ext.Msg.show({ title: 'Hata', msg: 'Lütfen bir bayrak seçin.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
	            return false;
	        }
	        else if (!Ekle_TextAreaAdres.validate()) {
	            Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
	            return false;
	        }
	    }

	    var GridKomutlari = function (cmd, record) {
	        switch (cmd) {
	            case "IslemKaydi":
	                PencereGetir("WindowY" + record.data.id, "icon-usercomment", "İşlem Kayıtlarını Gösterim Penceresi - " + record.data.id, "Kayıtlar yükleniyor...", "isleme-ait-kayitlar.aspx?tablo_adi=tbl_firma_adresler&kayit_id=" + record.data.id);
	                break;

	            case "Siralama":
	                SiralaSTD(record.data.id);
	                break;

	            case "Sil":
	                SilSTD(record);
	                break;

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
        <ext:KeyBinding StopEvent="true">
            <Keys>
                <ext:Key Code="DELETE" />
            </Keys>
            <Listeners>
                <Event Fn="SecilenleriSil" />
            </Listeners>
        </ext:KeyBinding>
	</ext:KeyMap>
	<ext:Viewport ID="Viewport1" runat="server" Layout="FitLayout" StyleSpec="background-color:#F0F0F0">
		<Items>
			<ext:Window ID="Window1" runat="server" Maximized="true" Title="Firma Adres(ler)i" Layout="FitLayout"
				Icon="Map" Closable="false" Minimizable="false" MinHeight="480"
				MinWidth="640">
				<Items>
					<ext:GridPanel ID="GridPanel1" runat="server" ColumnLines="true" SortType="AsUCString"
						AutoExpandColumn="adres" OnBeforeClientInit="GridPanelYuklenmedenOnce" AnchorHorizontal="100%"
						Region="Center" AutoScroll="true" MonitorResize="true" TrackMouseOver="true">
						<Store>
							<ext:Store ID="Store1" runat="server" OnRefreshData="KayitlariYenile" OnAfterRecordDeleted="KayitSil"
								RemoteSort="true">
								<Proxy>
									<ext:PageProxy />
								</Proxy>
								<AutoLoadParams>
									<ext:Parameter Name="limit" Value="25" Mode="Raw" />
									<ext:Parameter Name="sort" Value="" />
									<ext:Parameter Name="dir" Value="" />
								</AutoLoadParams>
								<SortInfo Field="id" Direction="DESC" />
								<Reader>
									<ext:JsonReader IDProperty="id">
										<Fields>
											<ext:RecordField Name="id" Type="Int" />
											<ext:RecordField Name="ikon" />
											<ext:RecordField Name="ikon2" />
											<ext:RecordField Name="ulke_id" Type="Int" />
											<ext:RecordField Name="ulke" />
											<ext:RecordField Name="baslik" />
											<ext:RecordField Name="adres" />
											<ext:RecordField Name="harita_url" />
											<ext:RecordField Name="sira" Type="Int" />
											<ext:RecordField Name="ekleyen" />
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
									Width="55" />
								<ext:Column DataIndex="id" Header="ID" />
								<ext:Column DataIndex="ikon" Header="İkon" Width="30" MenuDisabled="true" Resizable="false"
									Sortable="false">
									<Renderer Fn="BayrakGoster" />
								</ext:Column>
								<ext:Column DataIndex="ikon2" Header="İkon Yol" Hidden="true" MenuDisabled="true"
									Sortable="false">
									<Renderer Fn="IkonYol" />
								</ext:Column>
								<ext:Column DataIndex="ulke_id" Header="Ülke ID" Hidden="true"/>
								<ext:Column DataIndex="ulke" Header="Ülke" MenuDisabled="true" Sortable="false" />
								<ext:Column DataIndex="baslik" Header="Başlık" />
								<ext:Column DataIndex="adres" Header="Adres" />
								<ext:Column DataIndex="harita_url" Header="Harita URL">
								<Renderer Fn="HaritaYol" />
								</ext:Column>
								<ext:Column DataIndex="sira" Header="Sıra" Width="40" />
								<ext:Column DataIndex="ekleyen" Header="Ekleyen" />
								<ext:DateColumn DataIndex="tarih_ek" Header="Kayıt Tarihi" Align="Center" Format="dd/MM/yyyy - HH:mm:ss"
									Width="125" />
								<ext:Column DataIndex="guncelleyen" Header="Güncelleyen" />
								<ext:DateColumn DataIndex="tarih_gun" Header="Güncelleme Tarihi" Align="Center" Format="dd/MM/yyyy - HH:mm:ss"
									Width="125" />
								<ext:Column DataIndex="onay" Header="Onay" Align="Center" Width="60">
									<Renderer Fn="OnayRenk" />
								</ext:Column>
								<ext:CommandColumn Header="Sıra" Align="Center" Width="35" MenuDisabled="true" Resizable="false"
									ButtonAlign="Center">
									<Commands>
										<ext:GridCommand Icon="Outline" CommandName="Siralama">
											<ToolTip Text="Seçilen kaydın sırasını ayarla." />
										</ext:GridCommand>
									</Commands>
								</ext:CommandColumn>
								<ext:CommandColumn Header="İşlemler" Align="Center" Width="115" MenuDisabled="true"
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
										<ext:CommandSeparator />
									</Commands>
									<Commands>
										<ext:GridCommand Icon="Delete" CommandName="Sil">
											<ToolTip Text="Seçilen kaydı sil." />
										</ext:GridCommand>
									</Commands>
									<PrepareToolbar Fn="DugmelerinDurumu" />
								</ext:CommandColumn>
								<ext:CommandColumn Header="İK" Align="Center" Width="28" MenuDisabled="true" Resizable="false"
									ButtonAlign="Center">
									<Commands>
										<ext:GridCommand Icon="UserComment" CommandName="IslemKaydi">
											<ToolTip Text="İşlem Kaydını göster" />
										</ext:GridCommand>
									</Commands>
								</ext:CommandColumn>
							</Columns>
						</ColumnModel>
						<Plugins>
							<ext:GridFilters runat="server" ID="GridFilters1" Local="true">
								<Filters>
									<ext:NumericFilter DataIndex="id" />
									<ext:NumericFilter DataIndex="ulke_id" />
									<ext:StringFilter DataIndex="adres" />
									<ext:StringFilter DataIndex="ekleyen" />
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
							<ext:Button runat="server" ID="Button4" Text="Sil" Icon="Delete">
								<DirectEvents>
									<Click OnEvent="SecilenleriSil">
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
				<ext:ComboBox ID="Ekle_ComboBoxUlke" FieldLabel="Ülke (Kısaltma)" AnchorHorizontal="96%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan"
						runat="server" DisplayField="ad" ValueField="id" Editable="true" TypeAhead="true"
						Mode="Local" ForceSelection="true" SelectOnFocus="true" EmptyText="Ülke Seçiniz...">
						<Store>
							<ext:Store ID="StoreUlke1" runat="server" WarningOnDirty="false">
								<Reader>
									<ext:JsonReader IDProperty="id">
										<Fields>
										<ext:RecordField Name="id" />
											<ext:RecordField Name="ad" />
										</Fields>
									</ext:JsonReader>
								</Reader>
							</ext:Store>
						</Store>
					</ext:ComboBox>
									<ext:ComboBox ID="Ekle_ComboBoxBayrak" FieldLabel="Bayrak" AnchorHorizontal="96%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan"
						runat="server" DisplayField="Ad" ValueField="ResimAdi" Editable="true" TypeAhead="true"
						Mode="Local" ForceSelection="true" SelectOnFocus="true" EmptyText="Bayrak Seçiniz...">
						<Store>
							<ext:Store ID="StoreBayrak1" runat="server" WarningOnDirty="false">
								<Reader>
									<ext:JsonReader IDProperty="Ad">
										<Fields>
											<ext:RecordField Name="Ad" />
                                            <ext:RecordField Name="ResimAdi" />
										</Fields>
									</ext:JsonReader>
								</Reader>
							</ext:Store>
						</Store>
						<Listeners>
							<Select Fn="BayrakGetir1" />
						</Listeners>
					</ext:ComboBox>
					<ext:Panel ID="PanelBayrakResim1" Hidden="true" runat="server" StyleSpec="margin-bottom:5px">
						<Content>
							<div id="BayrakResimDiv1" style="float: right; padding: 5px">
							</div>
						</Content>
					</ext:Panel>
						<ext:TextField MsgTarget="Side" ID="Ekle_TextFieldBaslik" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
						runat="server" FieldLabel="Başlık" AnchorHorizontal="96%" EnableKeyEvents="true">
						<Listeners>
							<KeyUp Handler="this.setValue(this.getValue().toUpperCase());" />
						</Listeners>
					</ext:TextField>
				<ext:TextArea ID="Ekle_TextAreaAdres" runat="server" MsgTarget="Side" AllowBlank="false" FieldLabel="Adres" BlankText="Lütfen bir adres yazın." AnchorHorizontal="96%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan"/>
					<ext:TextField ID="Ekle_TextFieldHaritaURL" MaxLength="600" MaxLengthText="Maksimum karakter sınırını aştınız."
						runat="server" FieldLabel="Harita URL" AnchorHorizontal="100%"
						EnableKeyEvents="true">
						<Listeners>
							<KeyUp Handler="this.setValue(this.getValue().toLowerCase());" />
						</Listeners>
					</ext:TextField>
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
			<ext:Window ID="WindowDuzenle" runat="server" Modal="true" Resizable="True" Height="500"
				Icon="NoteEdit" Title="Düzenle" Width="640" Padding="5" Layout="FormLayout" ButtonAlign="Center"
				Shadow="None" LabelSeparator=" : " Draggable="True" AutoFocus="True" AutoHeight="True"
				Hidden="true">
				<Items>
					<ext:TextField ID="Duzenle_ID" Hidden="true" runat="server" />
					<ext:TextField ID="Duzenle_EskiBayrak" Hidden="true" runat="server" />
					<ext:ComboBox ID="Duzenle_ComboBoxUlke" FieldLabel="Ülke (Kısaltma)" AnchorHorizontal="96%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan"
						runat="server" DisplayField="ad" ValueField="id" Editable="true" TypeAhead="true"
						Mode="Local" ForceSelection="true" SelectOnFocus="true" EmptyText="Ülke Seçiniz...">
						<Store>
							<ext:Store ID="StoreUlke2" runat="server" WarningOnDirty="false">
								<Reader>
									<ext:JsonReader IDProperty="id">
										<Fields>
										<ext:RecordField Name="id" />
											<ext:RecordField Name="ad" />
										</Fields>
									</ext:JsonReader>
								</Reader>
							</ext:Store>
						</Store>
					</ext:ComboBox>
					<ext:ComboBox ID="Duzenle_ComboBoxBayrak" FieldLabel="Bayrak" AnchorHorizontal="96%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan"
						runat="server" DisplayField="Ad" ValueField="ResimAdi" Editable="true" TypeAhead="true"
						Mode="Local" ForceSelection="true" SelectOnFocus="true" EmptyText="Bayrak Seçiniz...">
						<Store>
							<ext:Store ID="StoreBayrak2" runat="server" WarningOnDirty="false">
								<Reader>
									<ext:JsonReader IDProperty="Ad">
										<Fields>
											<ext:RecordField Name="Ad" />
                                            <ext:RecordField Name="ResimAdi" />
										</Fields>
									</ext:JsonReader>
								</Reader>
							</ext:Store>
						</Store>
						<Listeners>
							<Select Fn="BayrakGetir2" />
						</Listeners>
					</ext:ComboBox>
					<ext:Panel ID="PanelBayrakResim2" Hidden="true" runat="server" StyleSpec="margin-bottom:5px">
						<Content>
							<div id="BayrakResimDiv2" style="float: right; padding: 5px">
							</div>
						</Content>
					</ext:Panel>
					<ext:Panel ID="PanelBayrakResim3" runat="server" StyleSpec="margin-bottom:5px">
					</ext:Panel>
							<ext:TextField MsgTarget="Side" ID="Duzenle_TextFieldBaslik" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
						runat="server" FieldLabel="Başlık" AnchorHorizontal="96%" EnableKeyEvents="true">
						<Listeners>
							<KeyUp Handler="this.setValue(this.getValue().toUpperCase());" />
						</Listeners>
					</ext:TextField>
					<ext:TextArea ID="Duzenle_TextAreaAdres" runat="server" MsgTarget="Side" AllowBlank="false" FieldLabel="Adres" BlankText="Lütfen bir adres yazın." AnchorHorizontal="96%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan"/>
					<ext:TextField ID="Duzenle_TextFieldHaritaURL" MaxLength="600" MaxLengthText="Maksimum karakter sınırını aştınız."
						runat="server" FieldLabel="Harita URL" AnchorHorizontal="100%"
						EnableKeyEvents="true">
						<Listeners>
							<KeyUp Handler="this.setValue(this.getValue().toLowerCase());" />
						</Listeners>
					</ext:TextField>
					<ext:ComboBox ID="Duzenle_ComboBoxOnay" runat="server" FieldLabel="Onay" Editable="false"
						Selectable="true">
						<Items>
							<ext:ListItem Text="EVET" Value="1" />
							<ext:ListItem Text="HAYIR" Value="0" />
						</Items>
					</ext:ComboBox>
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
			<ext:Window ID="WindowSiralama" runat="server" Modal="true" Resizable="True" Height="500"
				Icon="NoteEdit" Title="Sıralamayı Düzenle" Width="640" Padding="5" Layout="FormLayout"
				ButtonAlign="Center" Shadow="None" LabelSeparator=" : " Draggable="True" AutoFocus="True"
				AutoHeight="True" Hidden="true">
				<Items>
					<ext:TextField ID="Duzenle_ID2" Hidden="true" runat="server" />
					<ext:TextField ID="Duzenle_Sira" MaskRe="[0-9]" MaxLength="9" MaxLengthText="Maksimum karakter sınırını aştınız."
						runat="server" FieldLabel="Sıra" AnchorHorizontal="96%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan" />
				</Items>
				<Buttons>
					<ext:Button ID="Button5" runat="server" Text="Güncelle" Icon="Accept" Type="Submit">
						<DirectEvents>
							<Click OnEvent="SiralamaGuncelle">
								<EventMask ShowMask="true" Msg="Güncelleniyor..." MinDelay="500" />
							</Click>
						</DirectEvents>
					</ext:Button>
				</Buttons>
				<Listeners>
					<Hide Handler="WindowSiralamaClear()" />
				</Listeners>
			</ext:Window>
		</Items>
	</ext:Viewport>
	</form>
</body>
</html>