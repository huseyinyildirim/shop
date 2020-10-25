<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ust.ascx.cs" Inherits="SHOP.ascx.ust"
    ClientIDMode="Static" EnableViewState="False" ViewStateMode="Disabled" %>
<%
    #region Test modu
    if (SHOP.Class.Fonksiyonlar.Firma.Ayar().Select(p => p.mode).FirstOrDefault() == true)
    {
        Response.Write("<div class=\"hata testmode\">TEST MODU AÇIKTIR!</div>");
    }
    #endregion
%>

<div id="anamenu">
    <div class="iccerceve">
        <div class="sol">
            <ul id="anamenuler">
                <asp:Literal runat="server" ID="lit_anamenu" />
            </ul>
        </div>
        <div id="parlama" class="sol">
        </div>
        <div id="sepet-uyegiris" class="sol">
            <div runat="server" id="div_uyegiris">
                <div class="blokicerik">
                    <ul class="sign-in">
                        <li><a class="btn" href="/basket.aspx">
                            <div class="basket fLeft">
                            </div>
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(228));%></a></li>
                        <li class=""><a class="btn last top-login" href="javascript:void(0)">
                            <div class="people fLeft">
                            </div>
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(229));%></a></li>
                    </ul>
                </div>
                <script src="/js/member-login2.js" type="text/javascript"></script>
                <div id="signin_menu" style="display: none">
                    <div class="ucgen">
                    </div>
                    <div class="normal-login fLeft" style="width: 204px">
                        <div class="fLeft">
                            <label for="username">
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(65));%></label>
                            <div class="clear">
                            </div>
                            <asp:TextBox ID="txt_hizli_kullanici_adi" runat="server" CssClass="radius-5 blue-border"></asp:TextBox>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="fLeft">
                            <label for="password">
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(66));%></label>
                            <div class="clear">
                            </div>
                            <asp:TextBox ID="txt_hizli_sifre" runat="server" TextMode="Password" CssClass="radius-5 blue-border"></asp:TextBox>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="" style="margin: 10px 0 0 0">
                            <asp:Button ID="kullanici_giris" CssClass="fRight main-sprite btn-act" runat="server"
                                TabIndex="6" OnClick="kullanici_giris_Click" ValidationGroup="uyelik" />
                            <a href="/lost-password.aspx" id="resend_password_link" class="fLeft" style="margin: 10px 0 0 0">
                                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(68));%></a>
                        </div>
                    </div>
                    <div class="fLeft">
                        <div class="separator" style="margin: 0 30px 0 30px;">
                        </div>
                    </div>
                    <div class="fLeft">
                        <ul class="social-login">
                            <li>
                                <asp:Button CssClass="facebook-login" ID="btnFacebookLogin" runat="server" />
                            </li>
                            <li>
                                <asp:Button CssClass="twitter-login" ID="btnTwitterLogin" runat="server" />
                            </li>
                            <li>
                                <asp:Button CssClass="google-login" ID="btnGoogleLogin" runat="server" />
                            </li>
                        </ul>
                    </div>
                    <div class="register" style="position: absolute; bottom: 0; right: 57px">
                        <a id="forgot_username_link" href="/register.aspx" class="register-button">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(69));%></a>
                    </div>
                </div>
            </div>
            <div runat="server" id="div_uye">
                <!--<div class="blokicerik">
                            <ul class="ovalbuton" style="float:right;">
                                <li><a class="icon-sepet-ust" href="/basket.aspx"><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(228));%></a></li>
                                <li><a class="signin" href="#"><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(230));%></a></li>
                            </ul>
                    </div>-->
                <div class="blokicerik">
                    <ul class="sign-in">
                        <li><a class="btn" href="/basket.aspx">
                            <div class="basket fLeft">
                            </div>
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(228));%></a></li>
                        <li><a class="btn top-login" href="#">
                            <div class="people fLeft">
                            </div>
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(230));%></a></li>
                    </ul>
                </div>
                <div id="user_menu" class="radius-5" style="display: none">
                    <div class="ucgen">
                    </div>
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(280));%>&nbsp;<asp:Literal
                        runat="server" ID="kullanici_adi" /><br />
                    <br />
                    <ul>
                        <li><a href="/basket.aspx">&raquo;
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(97));%></a><br />
                        </li>
                        <li><a href="/customer-services.aspx">&raquo;
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(100));%></a><br />
                        </li>
                        <li><a href="/order-tracking.aspx">&raquo;
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(101));%></a><br />
                        </li>
                        <li><a href="/member-info.aspx">&raquo;
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(102));%></a><br />
                        </li>
                        <li><a href="/member-address.aspx">&raquo;
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(118));%></a><br />
                        </li>
                        <li><a href="/logout.aspx">&raquo;
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(99));%></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear">
</div>
<div id="logo" class="iccerceve">
    <div class="sol">
        <a href="/">
            <img src="/images/logo.png" alt="<%Response.Write(SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault()); %>" /></a>
        <div class="clear">
        </div>
        <div id="slogancerceve" class="sol">
            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(64));%></div>
    </div>
    <script src="/js/search.js" type="text/javascript"></script>
    <div id="aramakutusu" class="gray-border radius-5">
        <asp:TextBox ID="txt_arama" runat="server" Width="200" CssClass="pad5" />
        <asp:Button ID="btn_arama" runat="server" OnClick="btn_arama_Click" TabIndex="999"
            CssClass="main-sprite btn-search" />
    </div>
</div>
<div class="clear">
</div>
<div id="kategorimenu">
    <div class="iccerceve">
        <ul id="kategorimenuler">
            <asp:Literal runat="server" ID="lit_kategorimenu" />
        </ul>
    </div>
</div>