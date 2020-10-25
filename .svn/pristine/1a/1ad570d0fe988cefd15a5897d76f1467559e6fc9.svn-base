<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="question.aspx.cs" Inherits="SHOP.question"
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
    <script src="/js/contact.js" type="text/javascript"></script>
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
            <div id="ortablok">
                <div class="ortablokbaslik">
                    <asp:Literal runat="server" ID="lit_ortabaslik" /></div>
                <div class="h10">
                </div>
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(270));%>
                <div class="h10">
                </div>
                <table summary="">
                    <tr>
                        <td>
                            <strong>
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(11));%></strong>
                        </td>
                        <td>
                            <strong>:</strong>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txt_ad" Width="200px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(12));%></strong>
                        </td>
                        <td>
                            <strong>:</strong>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txt_eposta" Width="200px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(13));%></strong>
                        </td>
                        <td>
                            <strong>:</strong>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txt_telefon" Width="200px" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <strong>
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(14));%></strong>
                        </td>
                        <td valign="top">
                            <strong>:</strong>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txt_mesaj" TextMode="MultiLine" Width="350px" Height="150px" />
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
                            <recaptcha:RecaptchaControl ID="recaptcha" runat="server" PublicKey="6LeaS8sSAAAAACwlNo7FC1Nku7kS1I-yL3DF4REI"
                                PrivateKey="6LeaS8sSAAAAAEi3LJlUY2zKj-qqwhmVw-IjfY-A" />
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
                            <asp:Button ID="btn_iletisim_gonder" runat="server" OnClick="btn_iletisim_gonder_Click" CssClass="main-sprite btn-act" />
                        </td>
                    </tr>
                </table>
            </div>
            <include:sagblok runat="server" ID="sagblok" />
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>