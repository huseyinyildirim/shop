<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment-pos.aspx.cs" Inherits="SHOP.payment_pos"
    EnableEventValidation="False" ValidateRequest="false" %>

<%@ Register TagPrefix="include" TagName="alt" Src="~/ascx/alt.ascx" %>
<%@ Register TagPrefix="include" TagName="ust" Src="~/ascx/ust.ascx" %>
<%@ Register TagPrefix="include" TagName="sitil" Src="~/ascx/sitil.ascx" %>
<%@ Register TagPrefix="include" TagName="kayanmarkabar" Src="~/ascx/kayanmarkabar.ascx" %>
<include:sitil runat="server" ID="sitil" />
<body>
    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(330));%>
    <script src="/js/payment-pos.js" type="text/javascript"></script>
    <form id="form1" runat="server">
    <include:ust runat="server" ID="ust" />
    <div class="clear">
    </div>
    <div id="nerdesin">
        <div id="nerdesincerceve">
            <asp:Literal runat="server" ID="lit_nerdesin" />
        </div>
    </div>
    <div class="clear">
    </div>
    <div class="icerik">
        <div class="icerikcerceve">
            <!-- Sol bölüm -->
            <div id="solblok">
                <div class="bloklar">
                    <div class="ust">
                        <div class="baslik">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(299));%></div>
                    </div>
                    <div class="orta">
                        <div class="blokicerik">
                            <p style="text-align: center;">
                                <img src="/images/pos.png" /></p>
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(300));%>
                        </div>
                    </div>
                    <div class="alt">
                    </div>
                </div>
            </div>
            <!-- Sol bölüm -->
            <div id="genisortablok">
                <div class="ortablokbaslik">
                    <asp:Literal runat="server" ID="lit_ortabaslik" />
                </div>
                <div class="h10">
                </div>
                <asp:GridView ID="grid_sepet" runat="server" Width="100%" CssClass="gridstil" AutoGenerateColumns="false"
                    DataKeyNames="id" OnRowDataBound="sepet_RowDataBound">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30" Visible="false">
                            <HeaderTemplate>
                                <asp:CheckBox ID="hepsinisec" runat="server" onClick="return coklusec(this);" ClientIDMode="Static" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="secim" runat="server" onClick="return coklusec(this);" ClientIDMode="Static" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="urunadi" HeaderStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="urunid" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100" />
                        <asp:BoundField DataField="adet" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50" />
                        <asp:BoundField DataField="urunid" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100" />
                    </Columns>
                </asp:GridView>
                <div class="h10">
                </div>
                <div class="sol" style="width: 330px;">
                    <!-- BİRİKMİŞ PUAN KULLANDIRMA -->
                    <asp:PlaceHolder runat="server" ID="place_holder_puan" Visible="false">Kredi kartınızda
                        birikmiş olan&nbsp;<asp:Literal runat="server" ID="lit_puan" />&nbsp;<asp:Literal
                            runat="server" ID="lit_puan_para_birim" />&nbsp;kullanmak istiyorsanız lütfen
                        tıklayınız.<br />
                        <br />
                        <asp:Button ID="btn_puan" runat="server" OnClick="btn_puan_Click" />
                    </asp:PlaceHolder>
                    <!-- BİRİKMİŞ PUAN KULLANDIRMA -->
                </div>
                <div class="sag" style="width: 350px;">
                    <table class="sepettoplam" align="right" summary="">
                        <tbody>
                            <tr>
                                <td class="baslik">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(289));%>
                                </td>
                                <td class="baslik">
                                    :
                                </td>
                                <td width="150">
                                    <asp:Literal runat="server" ID="lit_tutar" />
                                </td>
                            </tr>
                            <!-- İNDİRİM -->
                            <asp:PlaceHolder runat="server" ID="place_holder_indirim">
                                <tr>
                                    <td class="baslik">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(290));%>
                                    </td>
                                    <td class="baslik">
                                        :
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="lit_indirimtutar" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="baslik">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(134));%>
                                    </td>
                                    <td class="baslik">
                                        :
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="lit_toplamtutar" />
                                    </td>
                                </tr>
                            </asp:PlaceHolder>
                            <!-- İNDİRİM -->
                            <asp:Literal runat="server" ID="lit_kdvler" />
                            <tr>
                                <td class="baslik">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(135));%>
                                </td>
                                <td class="baslik">
                                    :
                                </td>
                                <td>
                                    <asp:Literal runat="server" ID="lit_toplamkdv" />
                                </td>
                            </tr>
                            <tr>
                                <td class="baslik">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(136));%>
                                </td>
                                <td class="baslik">
                                    :
                                </td>
                                <td>
                                    <asp:Literal runat="server" ID="lit_geneltoplam" />
                                </td>
                            </tr>
                            <!-- KARGO PAYI -->
                            <asp:PlaceHolder runat="server" ID="place_holder_kargo_payi">
                                <tr>
                                    <td class="baslik">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(217));%>
                                    </td>
                                    <td class="baslik">
                                        :
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="lit_kargo_payi" />
                                    </td>
                                </tr>
                            </asp:PlaceHolder>
                            <!-- KARGO PAYI -->
                            <!-- İNDİRİM KOMİSYON -->
                            <asp:PlaceHolder runat="server" ID="place_holder_indirim_komisyon">
                                <tr>
                                    <td class="baslik">
                                        <asp:Literal runat="server" ID="lit_komisyon_adi" />
                                    </td>
                                    <td class="baslik">
                                        :
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="lit_komisyon_tutar" />
                                    </td>
                                </tr>
                            </asp:PlaceHolder>
                            <!-- İNDİRİM KOMİSYON -->
                            <tr>
                                <td class="genelbaslik">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(292));%>
                                </td>
                                <td class="genelbaslik">
                                    :
                                </td>
                                <td>
                                    <asp:Literal runat="server" ID="lit_toplam" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- Taksit oranları -->
                    <asp:Literal runat="server" ID="lit_kredi_oran" />
                    <!-- Taksit oranları -->
                </div>
                <div class="h10">
                </div>
                <div class="ortablokbaslik">
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(118));%></div>
                <div class="h10">
                </div>
                <table width="100%">
                    <tbody>
                        <tr>
                            <td width="48%" valign="top">
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(138));%>:</strong><br />
                                <br />
                                <asp:Label runat="server" ID="lbl_faturaadres" />
                            </td>
                            <td width="2%">
                                &nbsp;
                            </td>
                            <td width="48%" valign="top">
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(139));%>:</strong><br />
                                <br />
                                <asp:Label runat="server" ID="lbl_teslimatadres" />
                            </td>
                        </tr>
                        <tr>
                            <td width="48%" valign="top">
                                &nbsp;
                            </td>
                            <td width="2%">
                                &nbsp;
                            </td>
                            <td width="48%" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="48%" valign="top">
                                <asp:Button ID="btn_degistir" runat="server" OnClick="btn_degistir_Click" />
                            </td>
                            <td width="2%">
                                &nbsp;
                            </td>
                            <td width="48%" valign="top">
                                <asp:Button ID="btn_degistir0" runat="server" OnClick="btn_degistir_Click" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="h10">
                </div>
                <div class="ortablokbaslik">
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(309));%></div>
                <div class="h10">
                </div>
                <table width="100%">
                    <tbody>
                        <tr>
                            <td width="48%" valign="top">
                                <table>
                                    <tbody>
                                        <!-- KREDİ KARTI ÖDEME BİLGİLERİ -->
                                        <asp:PlaceHolder runat="server" ID="place_holder_kk_odeme_bilgileri" Visible="false">
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(169));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_kk_isim" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(172));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_kk_kart_no" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(171));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_kk_son_kullanma" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(173));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_kk_cvc" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(170));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_kk_tip" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(174));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_kk_banka" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <!-- KREDİ KARTI PUAN BİLGİSİ -->
                                            <asp:PlaceHolder runat="server" ID="place_holder_puan_td" Visible="false">
                                                <tr>
                                                    <td>
                                                        <strong>
                                                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(331));%></strong>
                                                    </td>
                                                    <td>
                                                        <strong>:</strong>
                                                    </td>
                                                    <td>
                                                        <asp:Literal ID="lit_puan_td" runat="server" />&nbsp;<asp:Literal ID="lit_puan_para_birim_td"
                                                            runat="server" />
                                                    </td>
                                                </tr>
                                            </asp:PlaceHolder>
                                            <!-- KREDİ KARTI PUAN BİLGİSİ -->
                                        </asp:PlaceHolder>
                                        <!-- KREDİ KARTI ÖDEME BİLGİLERİ -->
                                        <!-- HAVALE ÖDEME BİLGİLERİ -->
                                        <asp:PlaceHolder runat="server" ID="place_holder_havale_odeme_bildirim" Visible="false">
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(163));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_havale_banka_adi" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(164));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_havale_hesap_sahibi" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(165));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_havale_sube" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(166));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_havale_hesap_no" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(167));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="lit_havale_iban_no" runat="server" />
                                                </td>
                                            </tr>
                                        </asp:PlaceHolder>
                                        <!-- HAVALE ÖDEME BİLGİLERİ -->
                                        <tr>
                                            <td>
                                                <strong>
                                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(332));%></strong>
                                            </td>
                                            <td>
                                                <strong>:</strong>
                                            </td>
                                            <td>
                                                <asp:Literal ID="lit_cekilecek_td" runat="server" />
                                                &nbsp;<asp:Literal ID="lit_cekilecek_para_birim_td" runat="server" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td width="2%">
                                &nbsp;
                            </td>
                            <td width="48%" valign="top">
                                <a href="/basket-payment.aspx">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(310));%></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="h10">
                </div>
                <div class="ortablokbaslik">
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td width="48%">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(307));%>
                                </td>
                                <td width="2%">
                                    &nbsp;
                                </td>
                                <td width="48%">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(308));%>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="h10">
                </div>
                <!-- KREDİ KARTI ÖDEME ONAYI -->
                <asp:PlaceHolder runat="server" ID="place_holder_kk_odeme_onay" Visible="false">
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td width="48%" valign="top">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(305));%>
                                </td>
                                <td width="2%">
                                    &nbsp;
                                </td>
                                <td width="48%" valign="top">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(306));%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <!-- Ön Bilgilendirme ve Mesafeli Satış Sözleşmesi -->
                                    <input name="satis_sozlesme" id="satis_sozlesme" type="checkbox" value="" />
                                    <a href="#" id="link_sozlesme">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(333));%></a>
                                    <!-- Ön Bilgilendirme ve Mesafeli Satış Sözleşmesi -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_3dpos" runat="server" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btn_2dpos" runat="server" OnClick="btn_2dpos_Click" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </asp:PlaceHolder>
                <!-- KREDİ KARTI ÖDEME ONAYI -->
                <asp:Button ID="btn_havale" runat="server" Text="Havale Ödeme (Dummy Kayıt)" OnClick="btn_havale_Click" />
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <!-- Hiddenfield -->
                <asp:HiddenField ID="posnetData" runat="server" />
                <asp:HiddenField ID="posnetData2" runat="server" Value="&quot;&quot;" />
                <asp:HiddenField ID="digest" runat="server" />
                <asp:HiddenField ID="mid" runat="server" />
                <asp:HiddenField ID="posnetID" runat="server" />
                <asp:HiddenField ID="vftCode" runat="server" />
                <!-- <asp:HiddenField ID="koiCode" runat="server" /> -->
                <asp:HiddenField ID="merchantReturnURL" runat="server" />
                <!-- Static Parameters -->
                <asp:HiddenField ID="lang" runat="server" Value="tr" />
                <asp:HiddenField ID="url" runat="server" />
                <asp:HiddenField ID="openANewWindow" runat="server" />
                <!-- Hiddenfield -->
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    <div id="div_sozlesme" title="<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(333));%>"></div>
    </form>
</body>
</html>