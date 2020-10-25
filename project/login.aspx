<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SHOP.login"
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
    <script src="/js/member-login.js" type="text/javascript"></script>
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
                    //
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(98));%></div>
                <div class="h10">
                </div>
                <div class="fLeft" style="width: 267px">
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(65));%><br />
                    <asp:TextBox ID="txt_eposta" runat="server" Width="250px" CssClass="gray-border radius-5" /><br />
                    <br />
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(66));%><br />
                    <asp:TextBox ID="txt_sifre2" runat="server" Width="250px" TextMode="Password" CssClass="gray-border radius-5" />
                    <br />
                    <br />
                    <a href="/lost-password.aspx" class="fLeft">
                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(68));%></a>
                    <asp:Button ID="btn_uye_giris" runat="server" OnClick="kullanici_giris_Click" CssClass="fRight main-sprite btn-act radius-5" />
                    <br />
                    <a href="/register.aspx">
                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(69));%></a>
                </div>
                <asp:PlaceHolder runat="server" ID="GenelGosterim">
                <div class="h20">
                </div>
                <div class="ortablokbaslik">
                    //
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(295));%></div>
                <div class="h10">
                </div>
                <!-- Sosyal ağ girişleri başlıyor -->
                
                <ul class="social-login">
                    <li style="float: left; display: inline;">
                        <asp:Button ID="btn_google" CssClass="google-login" runat="server" Text="Google Login"
                            OnClick="btn_google_Click" /></li>
                    <li style="float: left; display: inline;">
                        <asp:Button ID="btn_facebook" CssClass="facebook-login" runat="server" OnClick="btn_facebook_Click"
                            Text="Facebook Login" /></li>
                    <li style="float: left; display: inline;">
                        <asp:Button ID="btn_twitter" CssClass="twitter-login" runat="server" Text="Twitter Login"
                            OnClick="btn_twitter_Click" /></li>
                </ul>
                </asp:PlaceHolder>
                <!-- Sosyal ağ girişleri bitiyor -->
            </div>
            <include:sagblok runat="server" ID="sagblok" />
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>