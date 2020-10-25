<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="desktop.aspx.cs" Inherits="SHOP.admin.desktop"
    EnableViewState="False" ViewStateMode="Disabled" EnableEventValidation="False"
    ValidateRequest="false" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
</head>
<body>
<script src="js/js.js" type="text/javascript"></script>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Gray" Locale="tr-TR"
        GZip="true" />
        <div style="padding:10px;">
    <!-- SOL -->
    <div class="left" style="width: 74%">
        <!-- İSTATİSTİKLER -->
        <ext:TabPanel ID="TabPanel1" runat="server">
            <Items>
                <ext:Panel ID="Tab1" Title="Özet İstatistikler" runat="server" CloseAction="Hide"
                    AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel1" Title="Ziyaretçi İstatistikleri" runat="server" CloseAction="Hide"
                    AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel2" Title="Sipariş İstatistikleri" runat="server" CloseAction="Hide"
                    AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel3" Title="Üye İstatistikleri" runat="server" CloseAction="Hide"
                    AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
            </Items>
        </ext:TabPanel>
        <!-- İSTATİSTİKLER -->
        <br />
        <!-- YÖNETİM LİNKLER -->
        <ext:TabPanel ID="TabPanel2" runat="server">
            <Items>
                <ext:Panel ID="Panel4" Title="Genel Yönetim" runat="server" CloseAction="Hide" AutoWidth="true"
                    AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel5" Title="Ürün/Kategori Yönetim" runat="server" CloseAction="Hide"
                    AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel6" Title="Kullanıcı/Üye Yönetim" runat="server" CloseAction="Hide"
                    AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel7" Title="Ayarlar" runat="server" CloseAction="Hide" AutoWidth="true"
                    AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
            </Items>
        </ext:TabPanel>
        <!-- YÖNETİM LİNKLER -->
    </div>
    <!-- SOL -->
    <!-- SAĞ -->
    <div class="left" style="width: 25%; margin-left: 10px;">
        <!-- LİSANS -->
        <ext:TabPanel ID="TabPanel3" runat="server">
            <Items>
                <ext:Panel ID="Panel8" Title="Lisans Bilgileri" runat="server" CloseAction="Hide"
                    AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                    <Items>
                    </Items>
                </ext:Panel>
            </Items>
        </ext:TabPanel>
        <!-- LİSANS -->
        <br />
        <!-- DÖVİZ -->
        <ext:TabPanel ID="TabPanel4" runat="server">
            <Items>
                <ext:Panel ID="Panel9" Title="Döviz Kurları" runat="server" CloseAction="Hide" AutoWidth="true"
                    AutoHeight="true" Padding="5">
                    <Items>
                        <ext:GridPanel ID="GridPanel1" runat="server" AutoExpandColumn="para_birim" Height="250" ColumnLines="true">
                            <Store>
                                <ext:Store ID="Store1" runat="server">
                                    <Reader>
                                        <ext:JsonReader>
                                            <Fields>
                                                <ext:RecordField Name="para_birim" />
                                                <ext:RecordField Name="alis" Type="Float" />
                                                <ext:RecordField Name="satis" Type="Float" />
                                                <ext:RecordField Name="efektif_alis" Type="Float" />
                                                <ext:RecordField Name="efektif_satis" Type="Float" />
                                            </Fields>
                                        </ext:JsonReader>
                                    </Reader>
                                </ext:Store>
                            </Store>
                            <ColumnModel ID="ColumnModel1" runat="server">
                                <Columns>
                                    <ext:Column DataIndex="para_birim" />
                                    <ext:Column DataIndex="alis" Header="Alış" Width="50" />
                                    <ext:Column DataIndex="satis" Header="Satış" Width="50" />
                                    <ext:Column DataIndex="efektif_alis" Header="E. Alış" Width="50" />
                                    <ext:Column DataIndex="efektif_satis" Header="E. Satış" Width="50" />
                                </Columns>
                            </ColumnModel>
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
                        </ext:GridPanel>
                    </Items>
                </ext:Panel>
            </Items>
        </ext:TabPanel>
        <!-- DÖVİZ -->
    </div>
    <!-- SAĞ -->
    </div>
    </form>
</body>
</html>