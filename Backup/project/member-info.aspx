<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member-info.aspx.cs" Inherits="SHOP.member_info"
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
    <script src="/js/member-info.js" type="text/javascript"></script>
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
                <table summary="">
                    <tbody>
                        <tr>
                            <td>
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(65));%>
                                </strong>
                            </td>
                            <td>
                                <strong>:</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_eposta" runat="server" Width="250px"></asp:TextBox>
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
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(70));%>
                                </strong>
                            </td>
                            <td>
                                <strong>:</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_ad" runat="server" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(73));%>
                                </strong>
                            </td>
                            <td>
                                <strong>:</strong>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddl_alan_kodu">
                                </asp:DropDownList>
                                <asp:TextBox ID="txt_telefon" runat="server" Width="147px"></asp:TextBox>
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
                                <asp:CheckBox ID="sifre_guncelle" runat="server" />
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(181));%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(71));%>
                                </strong>
                            </td>
                            <td>
                                <strong>:</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_eski_sifre" runat="server" TextMode="Password" Width="250px"
                                    Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(182));%>
                                </strong>
                            </td>
                            <td>
                                <strong>:</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_sifre" runat="server" TextMode="Password" Width="250px" Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(183));%>
                                </strong>
                            </td>
                            <td>
                                <strong>:</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_sifretekrar" runat="server" TextMode="Password" Width="250px"
                                    Enabled="False" />
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
                                <asp:CheckBox runat="server" ID="maillist" />
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(256));%>
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
                                <asp:Button ID="btn_kullanici_guncelle" runat="server" OnClick="btn_kullanici_guncelle_Click"
                                    ValidationGroup="kayitol" CssClass="main-sprite btn-act" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>