<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="siparisler.aspx.cs" Inherits="SHOP.admin.siparisler"
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
        var ParaBirimi;

        var ParaBirimiAl = function (data) {
            if (data != null) {
                ParaBirimi = data;
                return data;
            }
        };

        var DegeriParaBirimliYaz = function (data) {
         if (data != null)
         {
            if (data != '' || data != '0' || data != 0) { 
                return String.format(data + " " + ParaBirimi);
            }
            }
        }; 

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

        var GridKomutlari = function (cmd, record) {
            switch (cmd) {

                case "IslemKaydi":
                    PencereGetir("WindowY" + record.data.id, "icon-usercomment", "İşlem Kayıtlarını Gösterim Penceresi - " + record.data.id, "Kayıtlar yükleniyor...", "isleme-ait-kayitlar.aspx?tablo_adi=tbl_siparisler&kayit_id=" + record.data.id);
                    break;

                case "DetayGoster":
                    PencereGetir("WindowS" + record.data.id, "icon-usercomment", "Sipariş Detayları Gösterim Penceresi - " + record.data.no, "Sipariş bilgileri yükleniyor...", "dummy/siparis-detay.aspx?id=" + record.data.id);
                    break;
                case "SiparistekiUrunler":
                    PencereGetir("WindowA" + record.data.id, "icon-usercomment", "Siparişteki Ürünler Gösterim Penceresi - " + record.data.no, "Sipariş bilgileri yükleniyor...", "dummy/siparisteki-urunler.aspx?id=" + record.data.id);
                    break;
                case "OdemeBilgileri":
                    PencereGetir("WindowB" + record.data.id, "icon-usercomment", "Sipariş Ödeme Bilgileri Gösterim Penceresi - " + record.data.no, "Sipariş bilgileri yükleniyor...", "dummy/odeme-bilgileri.aspx?id=" + record.data.id);
                    break;
                case "SiparisDurum":
                    PencereGetir("WindowC" + record.data.id, "icon-usercomment", "Sipariş Durun Gösterim Penceresi - " + record.data.no, "Sipariş bilgileri yükleniyor...", "dummy/siparis-durum.aspx?id=" + record.data.id);
                    break;
                case "SiparisKargoBilgi":
                    PencereGetir("WindowD" + record.data.id, "icon-usercomment", "Sipariş Kargo Bilgisi Gösterim Penceresi - " + record.data.no, "Sipariş bilgileri yükleniyor...", "dummy/siparis-kargo-bilgi.aspx?id=" + record.data.id);
                    break;
                case "SiparisKargoBilgiYazdir":
                    PencereGetir("WindowE" + record.data.id, "icon-usercomment", "Sipariş Kargo Bilgisini Yazdırma Penceresi - " + record.data.no, "Sipariş bilgileri yükleniyor...", "dummy/siparis-kargo-bilgi-yazdir.aspx?id=" + record.data.id);
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
            <ext:Window ID="Window1" runat="server" Maximized="true" Title="Siparişler (Satışlar)"
                Layout="FitLayout" Icon="Money" Closable="false" Minimizable="false" MinHeight="480"
                MinWidth="640">
                <Items>
                    <ext:GridPanel ID="GridPanel1" runat="server" ColumnLines="true" SortType="AsUCString"
                        AutoExpandColumn="no" OnBeforeClientInit="GridPanelYuklenmedenOnce" AnchorHorizontal="100%"
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
                                            <ext:RecordField Name="id" Type="Int" />
                                            <ext:RecordField Name="kullanici_id" Type="Int" />
                                            <ext:RecordField Name="kullanici" />
                                            <ext:RecordField Name="no" />
                                            <ext:RecordField Name="tutar" Type="Float" />
                                            <ext:RecordField Name="indirim_tutari" Type="Float" />
                                            <ext:RecordField Name="toplam_tutar" Type="Float" />
                                            <ext:RecordField Name="toplam_kdv" Type="Float" />
                                            <ext:RecordField Name="genel_toplam" Type="Float" />
                                            <ext:RecordField Name="indirim_komisyon_id" Type="Int" />
                                            <ext:RecordField Name="indirim" />
                                            <ext:RecordField Name="komisyon_tutari" Type="Float" />
                                            <ext:RecordField Name="kargo_payi" Type="Float" />
                                            <ext:RecordField Name="puan_tutari" Type="Float" />
                                            <ext:RecordField Name="toplam" Type="Float" />
                                            <ext:RecordField Name="para_birimi_id" Type="Int" />
                                            <ext:RecordField Name="para_birimi" />
                                            <ext:RecordField Name="odeme_sekli_id" Type="Int" />
                                            <ext:RecordField Name="odeme_sekli" />
                                            <ext:RecordField Name="kur_tarih" Type="Date" />
                                            <ext:RecordField Name="durum" />
                                            <ext:RecordField Name="tarih" Type="Date" />
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
                                <ext:Column DataIndex="kullanici_id" Header="Kullanıcı ID" Hidden="true" />
                                <ext:Column DataIndex="kullanici" Header="Kullanıcı" MenuDisabled="true" Sortable="false"
                                    Width="180" />
                                <ext:Column DataIndex="no" Header="Sipariş No" Width="75" />
                                <ext:Column DataIndex="tutar" Header="Tutar" Hidden="true">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="indirim_tutari" Header="İndirim Tutarı" Hidden="true">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="toplam_tutar" Header="Toplam Tutar" Hidden="true">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="toplam_kdv" Header="Toplam KDV" Hidden="true">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="genel_toplam" Header="Genel Toplam" Hidden="true">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="indirim_komisyon_id" Header="İndirim ID" Hidden="true" />
                                <ext:Column DataIndex="indirim" Header="İndirim" MenuDisabled="true" Sortable="false" Hidden="true" />
                                <ext:Column DataIndex="komisyon_tutari" Header="Komisyon Tutarı" Hidden="true">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="kargo_payi" Header="Kargo Payı" Hidden="true">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="puan_tutari" Header="Puan Tutarı" Hidden="true">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="toplam" Header="Toplam">
                                <Renderer Fn="DegeriParaBirimliYaz" />
                                </ext:Column>
                                <ext:Column DataIndex="para_birimi_id" Header="Para Birimi ID" Hidden="true" />
                                <ext:Column DataIndex="para_birimi" Header="Para Birimi" Hidden="true" MenuDisabled="true" Sortable="false"
                                    Width="30">
                                    <Renderer Fn="ParaBirimiAl" />
                                    </ext:Column>
                                <ext:Column DataIndex="odeme_sekli_id" Header="Ödeme Şekli ID" Hidden="true" />
                                <ext:Column DataIndex="odeme_sekli" Header="Ödeme Şekli" MenuDisabled="true" Sortable="false" Width="125" />
                                <ext:DateColumn DataIndex="kur_tarih" Header="Kur Tarihi" Align="Center" Format="dd/MM/yyyy"
                                    Width="70" Hidden="true" />
                                <ext:Column DataIndex="durum" Header="Durum" MenuDisabled="true" Sortable="false" Width="200" />
                                <ext:DateColumn DataIndex="tarih" Header="Kayıt Tarihi" Align="Center" Format="dd/MM/yyyy - HH:mm:ss"
                                    Width="125" />
                                <ext:CommandColumn Header="İşlemler" Align="Center" Width="145" MenuDisabled="true"
                                    Resizable="false" ButtonAlign="Center">
                                    <Commands>
                                        <ext:GridCommand Icon="CartPut" CommandName="SiparistekiUrunler">
                                            <ToolTip Text="Siparişteki ürünleri gör" />
                                        </ext:GridCommand>
                                        <ext:CommandSeparator />
                                        <ext:GridCommand Icon="Money" CommandName="OdemeBilgileri">
                                            <ToolTip Text="Ödeme bilgilerini gör" />
                                        </ext:GridCommand>
                                        <ext:CommandSeparator />
                                        <ext:GridCommand Icon="PackageGo" CommandName="SiparisDurum">
                                            <ToolTip Text="Siparişin durumunu gör/düzenle" />
                                        </ext:GridCommand>
                                        <ext:CommandSeparator />
                                        <ext:GridCommand Icon="Lorry" CommandName="SiparisKargoBilgi">
                                            <ToolTip Text="Kargo bilgilerini gör" />
                                        </ext:GridCommand>
                                        <ext:CommandSeparator />
                                        <ext:GridCommand Icon="PrinterGo" CommandName="SiparisKargoBilgiYazdir">
                                            <ToolTip Text="Kargo bilgisini yazdır" />
                                        </ext:GridCommand>
                                        <ext:CommandSeparator />
                                    </Commands>
                                    <PrepareToolbar Fn="DugmelerinDurumu" />
                                </ext:CommandColumn>
                                    <ext:CommandColumn Header="Det." Align="Center" Width="28" MenuDisabled="true" Resizable="false"
                                    ButtonAlign="Center">
                                    <Commands>
                                        <ext:GridCommand Icon="PageWhiteStar" CommandName="DetayGoster">
                                            <ToolTip Text="Siparişe ait tüm detayları göster" />
                                        </ext:GridCommand>
                                    </Commands>
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
                                    <ext:StringFilter DataIndex="no" />
                                    <ext:NumericFilter DataIndex="id" />
                                    <ext:NumericFilter DataIndex="kullanici_id" />
                                    <ext:NumericFilter DataIndex="tutar" />
                                    <ext:NumericFilter DataIndex="indirim_tutari" />
                                    <ext:NumericFilter DataIndex="toplam_tutar" />
                                    <ext:NumericFilter DataIndex="toplam_kdv" />
                                    <ext:NumericFilter DataIndex="genel_toplam" />
                                    <ext:NumericFilter DataIndex="indirim_komisyon_id" />
                                    <ext:NumericFilter DataIndex="komisyon_tutari" />
                                    <ext:NumericFilter DataIndex="kargo_payi" />
                                    <ext:NumericFilter DataIndex="puan_tutari" />
                                    <ext:NumericFilter DataIndex="toplam" />
                                    <ext:NumericFilter DataIndex="para_birimi_id" />
                                    <ext:NumericFilter DataIndex="odeme_sekli_id" />
                                    <ext:DateFilter DataIndex="tarih">
                                        <DatePickerOptions runat="server" TodayText="Now" />
                                    </ext:DateFilter>
                                    <ext:DateFilter DataIndex="kur_tarih">
                                        <DatePickerOptions runat="server" TodayText="Now" />
                                    </ext:DateFilter>
                                </Filters>
                            </ext:GridFilters>
                        </Plugins>
                        <SelectionModel>
                            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" />
                        </SelectionModel>
                        <LoadMask ShowMask="true" Msg="Yükleniyor..." />
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
            <ext:Window ID="WindowDetay" runat="server" Modal="true" Resizable="True" Height="500"
				Icon="NoteEdit" Title="Düzenle" Width="640" Padding="5" Layout="FormLayout" ButtonAlign="Center"
				Shadow="None" LabelSeparator=" : " Draggable="True" AutoFocus="True" AutoHeight="True"
				Hidden="true">
				<Items>
					<ext:Panel ID="PanelUrunler" runat="server" Title="Ürün Bilgileri"
						FormGroup="true" Layout="FormLayout" Padding="5" StyleSpec="margin-top:5px;background:#fff;border:1px solid #C3DAF9"
						Collapsed="false" LabelSeparator=" : ">
						<Content>
                            <table border="0" cellpadding="0" cellspacing="0" class="tablo">
                            <tbody>
                                <tr>
                                    <td><b>Ürün Kodu</b></td>
                                    <td><b>Ürün Adı</b></td>
                                    <td><b>Birim Fiyat</b></td>
                                    <td><b>KDV</b></td>
                                    <td><b>KDV Tutarı</b></td>
                                    <td><b>Adet</b></td> 
                                    <td><b>Toplam Fiyat</b></td>
                                </tr> 
                                </tbody>
                            </table> 
						</Content>
					</ext:Panel>
				</Items> 
			</ext:Window>
        </Items>
    </ext:Viewport>
    </form>
</body>
</html>
