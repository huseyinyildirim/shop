<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="SHOP.product"
    EnableEventValidation="False" ValidateRequest="false" EnableViewState="False"
    ViewStateMode="Disabled" %>

<%@ Register TagPrefix="include" TagName="alt" Src="~/ascx/alt.ascx" %>
<%@ Register TagPrefix="include" TagName="ust" Src="~/ascx/ust.ascx" %>
<%@ Register TagPrefix="include" TagName="solblok" Src="~/ascx/solblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sagblok" Src="~/ascx/sagblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sitil" Src="~/ascx/sitil.ascx" %>
<%@ Register TagPrefix="include" TagName="kayanmarkabar" Src="~/ascx/kayanmarkabar.ascx" %>
<include:sitil runat="server" ID="sitil" />
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#buttons-expanded').jsShare({ initialdisplay: 'expanded', maxwidth: 360 });

            $("#link_urun_resim").click(function () {
                $('#urun_tabs').tabs('select', '#urunresim');
                return false;
            });
            
        });
    </script>
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
                    <h1>
                        <asp:Literal runat="server" ID="lit_urunad" /></h1>
                </div>
                <div class="h10">
                </div>
                <asp:Literal runat="server" ID="lit_urunbilgisi" />
                <div class="h10">
                </div>
                <div id="buttons-expanded">
                </div>
                <div class="h10">
                </div>
                
                <div id="urun_tabs">
                    <ul>
                        <li><a href="#urunbilgi">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(121));%></a></li>
                        <!--<li><a href="#urunyorum"><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(122));%></a></li>-->
                        <li id="pnl_taksitsecenek" runat="server"><a href="#taksitsecenek">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(123));%></a></li>
                        <li id="pnl_urunresim" runat="server"><a href="#urunresim">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(124));%></a></li>
                        <li id="pnl_urunvideo" runat="server"><a href="#urunvideo">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(125));%></a></li>
                        <!--<li><a href="#oneri"><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(126));%></a></li>-->
                    </ul>
                    <div id="urunbilgi">
                        <asp:Literal runat="server" ID="lit_urunbilgileri" /></div>
                    <!--<div id="urunyorum">ürün yorumları</div>-->
                    <div id="taksitsecenek" runat="server">
                        <asp:Literal runat="server" ID="lit_taksitsecenekleri" /></div>
                    <div id="urunresim" runat="server">
                        <asp:Literal runat="server" ID="lit_urunresimleri" /></div>
                    <div id="urunvideo" runat="server">
                        <asp:Literal runat="server" ID="lit_urunvideolari" /></div>
                    <!--<div id="oneri">öneri</div>-->
                </div>
                <script type="text/javascript">
                    $(function () {
                        $("#urun_tabs").tabs({ active: 2 });
                    });
                </script>
                <asp:Literal runat="server" ID="lit_etiketler" />
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>