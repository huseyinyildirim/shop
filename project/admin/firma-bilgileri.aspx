<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="firma-bilgileri.aspx.cs"
    Inherits="SHOP.admin.firma_bilgileri" EnableViewState="False" ViewStateMode="Disabled"
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
    <script type="text/javascript">
        var FormKontrol = function () {
            if (!TextFieldFirma.validate() || !TextFieldMarka.validate() || !TextFieldDomain.validate() || !TextFieldMail.validate() || !TextAreaDescription.validate() || !TextAreaTitle.validate()) {
                Ext.Msg.show({ title: 'Hata', msg: 'Lütfen zorunlu tüm alanları doldurun.', buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR });
                return false;
            }
        }
    </script>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Gray" Locale="tr-TR"
        GZip="true" />
    <ext:Viewport ID="Viewport1" runat="server" Layout="FitLayout" StyleSpec="background-color:#F0F0F0">
        <Items>
            <ext:Window ID="Window1" runat="server" AnchorHorizontal="100%" AnchorVertical="100%"
                Icon="VcardEdit" Title="Firma Bilgileri" Padding="5" Layout="FormLayout" ButtonAlign="Center"
                LabelSeparator=" : " Maximized="true" Closable="false" Minimizable="false" AutoScroll="true">
                <Items>
                    <ext:TabPanel ID="TabPanel1" runat="server" Border="false">
                        <Items>
                            <ext:Panel ID="Tab1" Title="Firma Bilgileri" runat="server" CloseAction="Hide" AutoWidth="true"
                                AutoHeight="true" Layout="FormLayout" Padding="5">
                                <Items>
                                    <ext:TextField MsgTarget="Side" AllowBlank="false" ID="TextFieldFirma" MaxLength="255"
                                        MaxLengthText="Maksimum karakter sınırını aştınız." runat="server" FieldLabel="Adı (Kısa)"
                                        BlankText="Lütfen firma adını yazın." AnchorHorizontal="98%" IndicatorIcon="BulletStar"
                                        IndicatorTip="Zorunlu alan" />
                                    <ext:TextField MsgTarget="Side" AllowBlank="false" ID="TextFieldMarka" MaxLength="255"
                                        MaxLengthText="Maksimum karakter sınırını aştınız." runat="server" FieldLabel="Marka"
                                        BlankText="Lütfen markanızı yazın." AnchorHorizontal="98%" IndicatorIcon="BulletStar"
                                        IndicatorTip="Zorunlu alan" EnableKeyEvents="true">
                                        <Listeners>
                                            <KeyUp Handler="this.setValue(this.getValue().toLowerCase());" />
                                        </Listeners>
                                    </ext:TextField>
                                    <ext:TextField MsgTarget="Side" AllowBlank="false" ID="TextFieldDomain" MaxLength="255"
                                        MaxLengthText="Maksimum karakter sınırını aştınız." runat="server" FieldLabel="Domain"
                                        BlankText="Lütfen alan adınızı yazın." AnchorHorizontal="98%" IndicatorIcon="BulletStar"
                                        IndicatorTip="Zorunlu alan" EnableKeyEvents="true">
                                        <Listeners>
                                            <KeyUp Handler="this.setValue(this.getValue().toLowerCase());" />
                                        </Listeners>
                                    </ext:TextField>
                                    <ext:TextField MsgTarget="Side" AllowBlank="false" ID="TextFieldMail" Vtype="email"
                                        VtypeText="Lütfen geçerli bir mail adresi giriniz" MaxLength="320" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        runat="server" FieldLabel="Mail" BlankText="Lütfen mail adresinizi yazın." AnchorHorizontal="98%"
                                        IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan" EnableKeyEvents="true">
                                        <Listeners>
                                            <KeyUp Handler="this.setValue(this.getValue().toLowerCase());" />
                                        </Listeners>
                                    </ext:TextField>
                                    <ext:TextArea MsgTarget="Side" AllowBlank="false" Height="120" ID="TextAreaDescription"
                                        runat="server" FieldLabel="Tanımlama" BlankText="Lütfen sayfa için tanımla yazın."
                                        AnchorHorizontal="98%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan" />
                                    <ext:TextArea MsgTarget="Side" AllowBlank="false" Height="120" ID="TextAreaTitle"
                                        runat="server" FieldLabel="Sayfa Başlığı" BlankText="Lütfen sayfa için title (başlık) yazın."
                                        AnchorHorizontal="98%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan" />
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel1" Title="Sosyal Ağlar" runat="server" CloseAction="Hide" AutoWidth="true"
                                AutoHeight="true" Layout="FormLayout" Padding="5">
                                <Items>
                                    <ext:TextField ID="TextFieldFlickr_ID" runat="server" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="Flickr ID" AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextFieldYoutube_ID" runat="server" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="Youtube ID" AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextFieldVimeo_ID" runat="server" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="Vimeo ID" AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextFieldFacebook_ID" runat="server" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="Facebook ID" AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextFieldGooglePlus_ID" runat="server" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="Google Plus ID" AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextFieldTwitter_ID" runat="server" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="Twitter ID" AnchorHorizontal="98%" />
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel2" Title="Google Ayarları" runat="server" CloseAction="Hide"
                                AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                                <Items>
                                    <ext:TextArea Height="120" ID="TextAreaGoogleAnalytics" runat="server" FieldLabel="Analytics Kodu"
                                        AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextAreaGoogleDogrulamaKodu" runat="server" FieldLabel="Meta Kodu"
                                        AnchorHorizontal="98%" />
                                </Items>
                            </ext:Panel>
                            <ext:Panel ID="Panel3" Title="Kuruluş Bilgileri" runat="server" CloseAction="Hide"
                                AutoWidth="true" AutoHeight="true" Layout="FormLayout" Padding="5">
                                <Items>
                                    <ext:ComboBox ID="ComboBoxFirmaTip" runat="server" FieldLabel="Firma Tipi" Editable="false"
                                        Selectable="true">
                                        <Items>
                                            <ext:ListItem Text="Şahıs Firması" Value="0" />
                                            <ext:ListItem Text="Sermaye Şirketi" Value="1" />
                                            <ext:ListItem Text="Diğer" Value="2" />
                                        </Items>
                                        <SelectedItem Value="0" />
                                    </ext:ComboBox>
                                    <ext:TextArea MsgTarget="Side" AllowBlank="false" Height="60" ID="TextAreaUnvan"
                                        runat="server" FieldLabel="Tam Ünvan" BlankText="Lütfen firma tam ünvanını yazın."
                                        AnchorHorizontal="98%" IndicatorIcon="BulletStar" IndicatorTip="Zorunlu alan" />
                                    <ext:TextField ID="TextFieldAdres" runat="server" FieldLabel="Kuruluş Adresi" AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextFieldVergiDaire" runat="server" MaxLength="255" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="Vergi Dairesi" AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextFieldVergiNo" runat="server" MaxLength="13" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="Vergi No" AnchorHorizontal="98%" />
                                    <ext:TextField ID="TextFieldTcKimlikNo" runat="server" MaxLength="11" MaxLengthText="Maksimum karakter sınırını aştınız."
                                        FieldLabel="TC Kimlik No" AnchorHorizontal="98%" />
                                </Items>
                            </ext:Panel>
                        </Items>
                    </ext:TabPanel>
                </Items>
                <Buttons>
                    <ext:Button ID="ButtonGuncelle" runat="server" Text="Güncelle" Icon="Accept" Type="Submit">
                        <Listeners>
                            <Click Fn="FormKontrol" />
                        </Listeners>
                        <DirectEvents>
                            <Click OnEvent="Guncelle">
                                <EventMask ShowMask="true" Msg="Güncelleniyor..." MinDelay="500" />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                </Buttons>
                <DirectEvents>
                    <BeforeRender OnEvent="Veriler" />
                </DirectEvents>
            </ext:Window>
        </Items>
    </ext:Viewport>
    </form>
</body>
</html>
