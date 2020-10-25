<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order-detail.aspx.cs" Inherits="SHOP.order_detail"
    EnableEventValidation="False" ValidateRequest="false" EnableViewState="False"
    ViewStateMode="Disabled" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<%@ Register TagPrefix="include" TagName="alt" Src="~/ascx/alt.ascx" %>
<%@ Register TagPrefix="include" TagName="ust" Src="~/ascx/ust.ascx" %>
<%@ Register TagPrefix="include" TagName="solblok" Src="~/ascx/solblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sagblok" Src="~/ascx/sagblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sitil" Src="~/ascx/sitil.ascx" %>
<%@ Register TagPrefix="include" TagName="kayanmarkabar" Src="~/ascx/kayanmarkabar.ascx" %>
<include:sitil runat="server" ID="sitil" />
<body>
    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(330));%>
    <form id="form1" runat="server">
    <include:ust runat="server" ID="ust" />
    <div class="clear">
    </div>
    <div id="nerdesin">
        <div id="nerdesincerceve">
            <asp:Literal runat="server" ID="lit_nerdesin" /></div>
    </div>
    <div class="clear">
    </div>
    <div class="icerik">
        <div class="icerikcerceve">
            <include:solblok runat="server" ID="solblok" />
            <div id="genisortablok">
                <div class="ortablokbaslik">
                    <asp:Literal runat="server" ID="lit_ortabaslik" /></div>
                <div class="h10">
                </div>
                <asp:Literal runat="server" ID="lit_sepetbilgi" />
                <div class="h10">
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
                <div class="sag">
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
                            <asp:Panel runat="server" ID="pnl_indirim" Visible="false">
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
                            </asp:Panel>
                            <asp:Literal runat="server" ID="kdvler" />
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
                            <asp:Panel runat="server" ID="pnl_kargo_payi" Visible="false">
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
                            </asp:Panel>
                            <asp:Panel runat="server" ID="pnl_komisyon" Visible="false">
                                <tr>
                                    <td class="baslik">
                                        <asp:Literal runat="server" ID="lit_komisyon_ad" />
                                    </td>
                                    <td class="baslik">
                                        :
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="lit_komisyon" />
                                    </td>
                                </tr>
                            </asp:Panel>
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
                </div>
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <table id="bilgitablo" summary="">
                    <tbody>
                        <tr class="baslik">
                            <td width="1%">
                                &nbsp;
                            </td>
                            <td width="48%" height="35">
                                <img src="/images/icon-kargo.png" alt="" />
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(139).ToUpper());%></strong>
                            </td>
                            <td width="1%">
                                &nbsp;
                            </td>
                            <td width="48%">
                                <img src="/images/icon-fatura.png" alt="" />
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(138).ToUpper());%></strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top">
                                <asp:Literal runat="server" ID="LitKargoAdres" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top">
                                <asp:Literal runat="server" ID="LitFaturaAdres" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <asp:Literal runat="server" ID="lit_durumlar" />
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <div class="sol">
                    <asp:Button runat="server" ID="btn_havale_bildirimi_yap" OnClick="btn_havale_bildirimi_yap_Click"
                        Visible="False" CssClass="main-sprite btn-big-act" />
                </div>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>