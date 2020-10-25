<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="SHOP.category"
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
            <div id="ortablok">
                <div class="ortablokbaslik">
                    <h1>
                        <asp:Literal runat="server" ID="lit_ortabaslik" /></h1>
                </div>
                <div id="ortablokfilitre">
                    <div class="sol">
                        <img src="/images/List1.png" alt="" />
                        <img src="/images/List2.png" alt="" />
                        <img src="/images/List3.png" alt="" /></div>
                    <div class="sag">
                        <asp:DropDownList ID="ddl_filitre" runat="server" AutoPostBack="True" OnSelectedIndexChanged="filitre_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="h10">
                </div>
                <asp:ListView runat="server" ID="list_urunler">
                    <ItemTemplate>
                        <%# SHOP.SHOPClass.Fonksiyonlar.Uygulama.UrunDetay(DataBinder.Eval(Container.DataItem, "id").ToString())%>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(232));%></EmptyDataTemplate>
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