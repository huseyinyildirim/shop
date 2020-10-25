<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment-manifesto.aspx.cs"
    Inherits="SHOP.payment_manifesto" EnableEventValidation="False" ValidateRequest="false" %>

<%@ Register TagPrefix="include" TagName="alt" Src="~/ascx/alt.ascx" %>
<%@ Register TagPrefix="include" TagName="ust" Src="~/ascx/ust.ascx" %>
<%@ Register TagPrefix="include" TagName="solblok" Src="~/ascx/solblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sagblok" Src="~/ascx/sagblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sitil" Src="~/ascx/sitil.ascx" %>
<%@ Register TagPrefix="include" TagName="kayanmarkabar" Src="~/ascx/kayanmarkabar.ascx" %>
<include:sitil runat="server" ID="sitil" />
<body>
    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(330));%>
    <script src="/js/payment-manifesto.js" type="text/javascript"></script>
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
                <asp:Literal runat="server" ID="lit_siparisyok" />
                <asp:Panel runat="server" ID="pnl_siparis">
                    <table summary="">
                        <tbody>
                            <tr>
                                <td>
                                    <strong>
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(188));%></strong>
                                </td>
                                <td>
                                    <strong>:</strong>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddl_siparisno" AutoPostBack="True" OnSelectedIndexChanged="ddl_siparisno_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <asp:Panel runat="server" ID="pnl_detay" Visible="false">
                                <tr>
                                    <td colspan="3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>
                                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(200));%></strong>
                                    </td>
                                    <td>
                                        <strong>:</strong>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbl_banka"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>
                                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(189));%></strong>
                                    </td>
                                    <td>
                                        <strong>:</strong>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbl_toplam_tutar"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>
                                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(201));%></strong>
                                    </td>
                                    <td>
                                        <strong>:</strong>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddl_islem_tipi" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>
                                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(202));%></strong>
                                    </td>
                                    <td>
                                        <strong>:</strong>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_islem_no"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>
                                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(203));%></strong>
                                    </td>
                                    <td>
                                        <strong>:</strong>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_odeme_tarih"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        &nbsp;
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
                                        <asp:Button runat="server" ID="btn_odeme_bildirim" OnClick="btn_odeme_bildirim_Click" CssClass="main-sprite btn-big-act" />
                                    </td>
                                </tr>
                            </asp:Panel>
                        </tbody>
                    </table>
                </asp:Panel>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>