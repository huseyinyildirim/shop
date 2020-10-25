<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="SHOP._products"
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
                <script type="text/javascript">
                    $(function () {
                        $("#urun_tabs").tabs();
                    });
                </script>
                <div id="urun_tabs">
                    <ul>
                        <li><a href="#sectiklerimiz">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(63));%></a></li>
                        <li><a href="#urunyorum">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(122));%></a></li>
                        <li><a href="#taksitsecenek">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(123));%></a></li>
                        <li><a href="#urunresim">
                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(124));%></a></li>
                    </ul>
                    <div id="sectiklerimiz" style="overflow: hidden;">
                        <asp:ListView runat="server" ID="list_urunler">
                            <ItemTemplate>
                                <%# SHOP.SHOPClass.Fonksiyonlar.Uygulama.UrunDetay(DataBinder.Eval(Container.DataItem, "id").ToString())%>
                            </ItemTemplate>
                        </asp:ListView>
                        <div id="div_sayfalama" runat="server">
                            <asp:DataPager ID="sayfalamasp" runat="server" PagedControlID="list_urunler" PageSize="10"
                                QueryStringField="s">
                                <Fields>
                                    <asp:NumericPagerField NextPageText="»" PreviousPageText="«" ButtonCount="10" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </div>
                    <div id="urunyorum" style="overflow: hidden;">
                        ürün yorumları</div>
                    <div id="taksitsecenek" style="overflow: hidden;">
                        taksit seçenek</div>
                    <div id="urunresim" style="overflow: hidden;">
                        ürün resim</div>
                </div>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>