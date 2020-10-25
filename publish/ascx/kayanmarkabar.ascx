<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="kayanmarkabar.ascx.cs"
    Inherits="SHOP.ascx.kayanmarkabar" EnableViewState="False" ViewStateMode="Disabled" %>
<asp:Panel ID="pnl_markakayanbar" runat="server">
    <div class="h10">
    </div>
    <div id="markakayanbar">
        <div class="sol">
            <img src="/images/markakayanbarsol.jpg" alt="" /></div>
        <div class="orta">
            <marquee behavior="scroll" onmouseover="this.stop();" onmouseout="this.start();" scrollamount="5" width="100%" direction="left" scrolldelay="1"><asp:Literal runat="server" ID="lit_markabar" /></marquee>
        </div>
        <div class="sag">
            <img src="/images/markakayanbarsag.jpg" alt="" /></div>
    </div>
</asp:Panel>
<div class="h10">
</div>
<div class="iccerceve2">
    <div id="socialmedia">
        <ul>
            <li><a href="#">
                <img id="SocialMediaIcon1" src="/images/icon/rss.png" alt="" class="arr" /></a></li>
            <%
                #region Mail
                if (!string.IsNullOrEmpty(SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.mail).FirstOrDefault()))
                {
                    Response.Write("<li><a href=\"mailto:" + SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.mail).FirstOrDefault() + "\"><img id=\"SocialMediaIcon2\" src=\"/images/icon/email.png\" alt=\"\" class=\"arr\"/></a></li>");
                }
                #endregion

                #region Flicker
                if (!string.IsNullOrEmpty(SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.flickr).FirstOrDefault()))
                {
                    Response.Write("<li><a target=\"_blank\" href=\"http://www.flickr.com/photos/" + SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.flickr).FirstOrDefault() + "\"><img id=\"SocialMediaIcon3\" src=\"/images/icon/flickr.png\" alt=\"\" class=\"arr\"/></a></li>");
                }
                #endregion

                #region Youtube
                if (!string.IsNullOrEmpty(SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.youtube).FirstOrDefault()))
                {
                    Response.Write("<li><a target=\"_blank\" href=\"http://www.youtube.com/user/" + SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.youtube).FirstOrDefault() + "\"><img id=\"SocialMediaIcon4\" src=\"/images/icon/youtube.png\" alt=\"\" class=\"arr\"/></a></li>");
                }
                #endregion

                #region Vimeo
                if (!string.IsNullOrEmpty(SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.vimeo).FirstOrDefault()))
                {
                    Response.Write("<li><a target=\"_blank\" href=\"http://www.vimeo.com/" + SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.vimeo).FirstOrDefault() + "\"><img id=\"SocialMediaIcon5\" src=\"/images/icon/vimeo.png\" alt=\"\" class=\"arr\"/></a></li>");
                }
                #endregion

                #region Facebook
                if (!string.IsNullOrEmpty(SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.facebook).FirstOrDefault()))
                {
                    Response.Write("<li><a target=\"_blank\" href=\"http://www.facebook.com/" + SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.facebook).FirstOrDefault() + "\"><img id=\"SocialMediaIcon6\" src=\"/images/icon/facebook.png\" alt=\"\" class=\"arr\"/></a></li>");
                }
                #endregion

                #region Google Plus
                if (!string.IsNullOrEmpty(SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.google_plus).FirstOrDefault()))
                {
                    Response.Write("<li><a target=\"_blank\" href=\"https://plus.google.com/" + SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.google_plus).FirstOrDefault() + "\"><img id=\"SocialMediaIcon7\" src=\"/images/icon/google_plus.png\" alt=\"\" class=\"arr\"/></a></li>");
                }
                #endregion

                #region Twitter
                if (!string.IsNullOrEmpty(SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.twitter).FirstOrDefault()))
                {
                    Response.Write("<li><a target=\"_blank\" href=\"http://www.twitter.com/" + SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.twitter).FirstOrDefault() + "\"><img id=\"SocialMediaIcon8\" src=\"/images/icon/twitter.png\" alt=\"\" class=\"arr\"/></a></li>");
                }
                #endregion
            %>
        </ul>
    </div>
</div>