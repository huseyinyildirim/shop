<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sagblok.ascx.cs" Inherits="SHOP.ascx.sagblok"
    ClientIDMode="Static" EnableViewState="False" ViewStateMode="Disabled" %>
<script src="/js/newsletter.js" type="text/javascript"></script>
<div id="sagblok">
    <asp:Panel runat="server" ID="pnl_sepet" Visible="false">
        <div class="bloklar">
            <div class="ust">
                <div class="baslik">
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(79));%></div>
            </div>
            <div class="orta">
                <div class="blokicerik">
                    <asp:Literal runat="server" ID="lit_sepet_ozet" />
                    <div class="h10">
                    </div>
                    <ul class="ovalbuton">
                        <li><a style="line-height: 28px;" class="main-sprite btn-act-orange" href="/basket.aspx">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(228));%></a></li>
                        <li class="fRight"><a style="line-height: 28px;" class="main-sprite btn-act fRight"
                            href="/basket.aspx">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(231));%></a></li>
                    </ul>
                </div>
            </div>
            <div class="alt">
            </div>
        </div>
        <div class="h10">
        </div>
    </asp:Panel>
    <div class="bloklar">
        <div class="ust">
            <div class="baslik">
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(80));%></div>
        </div>
        <div class="orta">
            <div class="blokicerik">
                <asp:Literal runat="server" ID="lit_yeniurun" />
            </div>
        </div>
        <div class="alt">
        </div>
    </div>
    <div class="h10">
    </div>
    <div class="bloklar">
        <div class="ust">
            <div class="baslik">
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(81));%></div>
        </div>
        <div class="orta">
            <div class="blokicerik" style="text-align: center;">
                <img src="/images/kargo-bedava.png" alt="75 TL ve üzeri alışverilerinizde kargo bedava" />
            </div>
        </div>
        <div class="alt">
        </div>
    </div>
    <asp:Panel ID="pnl_marka" runat="server">
        <div class="h10">
        </div>
        <div class="bloklar">
            <div class="ust">
                <div class="baslik">
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(76));%></div>
            </div>
            <div class="orta">
                <div class="blokicerik">
                    <div class="gray-border radius-5 " style="background-color: White">
                        <asp:DropDownList ID="ddl_marka" runat="server" Width="100%" onChange="Git(this.options[this.selectedIndex].value)"
                            name="ddl_marka" CssClass="pad5">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="alt">
            </div>
        </div>
    </asp:Panel>
    <div class="h10">
    </div>
    <div class="bloklar">
        <div class="ust">
            <div class="baslik">
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(82));%></div>
        </div>
        <div class="orta">
            <div class="blokicerik">
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(83));%><br />
                <br />
                <div class="gray-border radius-5 fLeft" style="background-color: White">
                    <asp:TextBox ID="txt_maillist" Width="140" runat="server" CssClass="pad5" />
                    <asp:Button ID="btn_maillist" runat="server" OnClick="btn_maillist_Click" />
                </div>
            </div>
        </div>
        <div class="alt">
        </div>
    </div>
    <div class="h10">
    </div>
    <div class="bloklar">
        <div class="ust">
            <div class="baslik">
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(7).ToUpper());%></div>
        </div>
        <div class="orta">
            <div class="blokicerik">
                <asp:Literal runat="server" ID="lit_etiketler" />
            </div>
        </div>
        <div class="alt">
        </div>
    </div>
</div>