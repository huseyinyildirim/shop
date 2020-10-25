<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hata-kayitlari.aspx.cs"
    Inherits="SHOP.admin.hata_kayitlari" EnableViewState="False" ViewStateMode="Disabled"
    EnableEventValidation="False" ValidateRequest="false" %>

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
        var URLGoster = function (data) {
            return String.format("<a href=\"" + "../" + data + "\" target=\"_blank\">" + data + "</a>");
        };

        var GridKomutlari = function (cmd, record) {
            switch (cmd) {

                case "IslemKaydi":
                    PencereGetir("WindowY" + record.data.ErrorId, "icon-usercomment", "Hata Kayıtları Detay Penceresi - " + record.data.ErrorId, "Kayıtlar yükleniyor...", "hata-kayitlari-detay.aspx?ErrorId=" + record.data.ErrorId);
                    break;

                case "Sil":
                    SilSTD(record);
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

            <ext:Window ID="Window1" runat="server" Maximized="true" Title="Hata Kayıtları" Layout="FitLayout"
                Icon="PageWhiteStar" Closable="false" Minimizable="false" MinHeight="480" MinWidth="640">
                <Items>
                    <ext:GridPanel ID="GridPanel1" runat="server" ColumnLines="true" SortType="AsUCString"
                        AutoExpandColumn="Message" OnBeforeClientInit="GridPanelYuklenmedenOnce" AnchorHorizontal="100%"
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
                                <SortInfo Field="ErrorId" Direction="DESC" />
                                <Reader>
                                    <ext:JsonReader IDProperty="ErrorId">
                                        <Fields>
                                            <ext:RecordField Name="ErrorId" />
                                            <ext:RecordField Name="Application" />
                                            <ext:RecordField Name="Host" />
                                            <ext:RecordField Name="Type" />
                                            <ext:RecordField Name="Source" />
                                            <ext:RecordField Name="Message" />
                                            <ext:RecordField Name="User" />
                                            <ext:RecordField Name="StatusCode" Type="Int" />
                                            <ext:RecordField Name="TimeUtc" Type="Date" />
                                            <ext:RecordField Name="Sequence" Type="Int" />
                                        </Fields>
                                    </ext:JsonReader>
                                </Reader>
                            </ext:Store>
                        </Store>
                        <ColumnModel runat="server">
                            <Columns>
                                <ext:Column DataIndex="ErrorId" Header="ErrorId" />
                                <ext:Column DataIndex="Application" Header="Application" Width="70" />
                                <ext:Column DataIndex="Host" Header="Host" />
                                <ext:Column DataIndex="Type" Header="Type" />
                                <ext:Column DataIndex="Source" Header="Source" />
                                <ext:Column DataIndex="Message" Header="Message" />
                                <ext:Column DataIndex="User" Header="User" />
                                <ext:Column DataIndex="StatusCode" Header="StatusCode" Width="50" />
                                <ext:DateColumn DataIndex="TimeUtc" Header="TimeUtc" Format="dd/MM/yyyy - HH:mm:ss" Width="125" />
                                <ext:Column DataIndex="Sequence" Header="Sequence" Width="50" />
                                <ext:CommandColumn Header="Detay" Align="Center" Width="40" MenuDisabled="true" Resizable="false"
                                    ButtonAlign="Center">
                                    <Commands>
                                        <ext:GridCommand Icon="ApplicationError" CommandName="IslemKaydi">
                                            <ToolTip Text="Hata detaylarını göster" />
                                        </ext:GridCommand>
                                    </Commands>
                                </ext:CommandColumn>
                            </Columns>
                        </ColumnModel>
                        <Plugins>
                            <ext:GridFilters runat="server" ID="GridFilters1" Local="true">
                                <Filters>
                                    <ext:StringFilter DataIndex="ErrorId" />
                                    <ext:StringFilter DataIndex="Application" />
                                    <ext:StringFilter DataIndex="Host" />
                                    <ext:StringFilter DataIndex="Type" />
                                    <ext:StringFilter DataIndex="Source" />
                                    <ext:StringFilter DataIndex="Message" />
                                    <ext:StringFilter DataIndex="User" />
                                    <ext:NumericFilter DataIndex="StatusCode" />
                                    <ext:DateFilter DataIndex="TimeUtc" />
                                    <ext:NumericFilter DataIndex="Sequence" />
                                </Filters>
                            </ext:GridFilters>
                        </Plugins>
                        <SelectionModel>
                            <ext:CheckboxSelectionModel ID="CheckboxSelectionModel1" runat="server" />
                        </SelectionModel>
                        <Buttons>
                            <ext:Button runat="server" ID="Button4" Text="Kayıtları Temizle" Icon="Delete">
                                <DirectEvents>
                                    <Click OnEvent="SecilenleriSil">
                                        <Confirmation ConfirmRequest="true" Message="İşlemi onaylıyor musunuz?" Title="Onay" />
                                        <EventMask ShowMask="true" MinDelay="500" Msg="Yükleniyor..." />
                                    </Click>
                                </DirectEvents>
                            </ext:Button>
                        </Buttons>
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

    </form>
</body>
</html>