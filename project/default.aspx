<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SHOP._default"
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
    <script src="/js/fade-plugin.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#yourSliderId").fadeTransition({
                pauseTime: 4000,
                transitionTime: 700,
                ignore: "#introslide",
                delayStart: 0,
                manualNavigation: false,
                pauseOnMouseOver: true,
                createNavButtons: true
            });
        });
    </script>
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
    <div class="icerik" runat="server" id="slidercerceve" style="background: url(../images/bg-slider.jpg) repeat-x;">
        <div class="iccerceve" style="height: 315px; background: url(../images/bg-slider2.jpg) no-repeat top;">
            <div class="slider">
                <asp:Literal runat="server" ID="lit_manset" />
                <div id="container">
                    <!--<div class="slider_arrow_left"></div>
                    <div class="slider_arrow_right"></div>-->
                    <ul class="slider_selector">
                    </ul>
                </div>
            </div>
        </div>
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
            <include:sagblok runat="server" ID="sagblok" />
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>