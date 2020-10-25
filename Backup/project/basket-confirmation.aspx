<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basket-confirmation.aspx.cs"
    Inherits="SHOP.basket_confirmation" EnableEventValidation="False" ValidateRequest="false"
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
            <div id="genisortablok">
                <div class="ortablokbaslik">
                    <asp:Literal runat="server" ID="lit_ortabaslik" /></div>
                <div class="h10">
                </div>
                <div runat="server" id="div_sepeticerik">
                    <table id="sepetadim">
                        <tbody>
                            <tr>
                                <td>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(117));%>
                                </td>
                                <td class="spr">
                                    <img src="/images/spr-sepetadim.jpg" alt="" />
                                </td>
                                <td>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(118));%>
                                </td>
                                <td class="spr">
                                    <img src="/images/spr-sepetadim.jpg" alt="" />
                                </td>
                                <td>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(210));%>
                                </td>
                                <td class="spr">
                                    <img src="/images/spr-sepetadim.jpg" alt="" />
                                </td>
                                <td>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(119));%>
                                </td>
                                <td class="spr">
                                    <img src="/images/spr-sepetadim.jpg" alt="" />
                                </td>
                                <td class="secili">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(120));%>
                                </td>
                                <td class="spr">
                                    <img src="/images/spr-sepetadim.jpg" alt="" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="h10">
                    </div>
                    <asp:Literal runat="server" ID="lit_mesaj" />
                </div>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>