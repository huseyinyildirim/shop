<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer-services.aspx.cs"
    Inherits="SHOP.customer_services" EnableEventValidation="False" ValidateRequest="false"
    EnableViewState="False" ViewStateMode="Disabled" %>

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
                    <asp:Literal runat="server" ID="lit_ortabaslik" /></div>
                <div class="h10">
                </div>
                <a href="/order-tracking.aspx"><strong>
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(101));%></strong></a><br />
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(265));%>
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <a href="/member-info.aspx"><strong>
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(102));%></strong></a><br />
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(266));%>
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <a href="/member-address.aspx"><strong>
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(118));%></strong></a><br />
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(322));%>
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <a href="/bank-account.aspx"><strong>
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(241));%></strong></a><br />
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(267));%>
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <a href="/payment-manifesto.aspx"><strong>
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(199));%></strong></a><br />
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(268));%>
                <div class="h10">
                </div>
                <div class="h10">
                </div>
                <a href="/question.aspx"><strong>
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(269));%></strong></a><br />
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(270));%>
            </div>
            <include:sagblok runat="server" ID="sagblok" />
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>