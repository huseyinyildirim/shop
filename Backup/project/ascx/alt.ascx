<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="alt.ascx.cs" Inherits="SHOP.ascx.alt"
    EnableViewState="False" ViewStateMode="Disabled" %>
<div class="clear">
</div>
<div id="alt">
    <div class="iccerceve">
        <div id="altsol">
            <a href="#" onclick="$('html,body').animate({scrollTop:0},750,function(){});return false;">
                <img src="/images/btn-yukari.png" alt="Yukarı" /></a></div>
        <div id="altsag">
            <table width="100%" summary="">
                <tbody>
                    <tr>
                        <td width="50%">
                            <div id="altsollink">
                                <ul>
                                    <li>&raquo; <a href="/customer-services.aspx">Müşteri Hizmetleri</a></li>
                                    <li>&raquo; <a href="/bank-account.aspx">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(241));%></a></li>
                                    <li>&raquo; <a href="/order-tracking.aspx">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(101));%></a></li>
                                </ul>
                            </div>
                            <div id="altsaglink">
                                <ul>
                                    <li>&raquo; <a id="cont_satis" href="#">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(239));%></a></li>
                                    <li>&raquo; <a id="cont_garanti" href="#">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(237));%></a></li>
                                    <li>&raquo; <a id="cont_gizlilik" href="#">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(238));%></a></li>
                                </ul>
                            </div>
                        </td>
                        <td width="50%" align="right">
                            <img src="/images/icon-ssl-visa.png" alt="Visa" />
                            <img src="/images/icon-ssl-rapidssl.png" alt="Rapid SSL" />
                            <img src="/images/icon-ssl-mastercard.png" alt="Master Card" />
                            <img src="/images/icon-ssl-3d.png" alt="3D Secure" /><br />
                            <br />
                            <asp:Literal runat="server" ID="lit_bottom_baslik" /><br />
                            <asp:Literal runat="server" ID="lit_bottom_text" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div id="div_satis" title="<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(239));%>"></div>
<div id="div_garanti" title="<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(237));%>"></div>
<div id="div_gizlilik" title="<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(238));%>"></div>