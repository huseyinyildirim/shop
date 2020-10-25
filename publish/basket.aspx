<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basket.aspx.cs" Inherits="SHOP.basket"
    ClientIDMode="Static" EnableEventValidation="False" ValidateRequest="false" EnableViewState="False"
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
                <div class="ortablokbaslik">
                    <asp:Literal runat="server" ID="lit_ortabaslik" /></div>
                <div class="h10">
                </div>
                <asp:Literal runat="server" ID="lit_sepetuyari" />
                <div runat="server" id="div_sepeticerik">
                    <table id="sepetadim" summary="">
                        <tbody>
                            <tr>
                                <td class="secili">
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
                                <td>
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
                    <asp:Literal runat="server" ID="lit_uyarilar" />
                    <asp:GridView ID="grid_sepet" runat="server" Width="100%" CssClass="gridstil" AutoGenerateColumns="false"
                        DataKeyNames="id" OnRowDataBound="sepet_RowDataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30">
                                <HeaderTemplate>
                                    <a href="/basket.aspx?p=delete&id=0">
                                        <img src="images/sil.png" alt="" /></a>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <a href="/basket.aspx?p=delete&id=<%#Eval("id")%>">
                                        <img src="images/sil.png" alt="" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="urunadi" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="urunid" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100" />
                            <asp:BoundField DataField="adet" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50" />
                            <asp:BoundField DataField="urunid" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100" />
                        </Columns>
                    </asp:GridView>
                    <div class="h10">
                    </div>
                    <div class="sag">
                        <table class="sepettoplam" summary="">
                            <tbody>
                                <tr>
                                    <td class="baslik">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(289));%>
                                    </td>
                                    <td class="baslik">
                                        :
                                    </td>
                                    <td width="150">
                                        <asp:Literal runat="server" ID="lit_tutar" />
                                    </td>
                                </tr>
                                <asp:Panel runat="server" ID="pnl_indirim">
                                    <tr>
                                        <td class="baslik">
                                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(290));%>
                                        </td>
                                        <td class="baslik">
                                            :
                                        </td>
                                        <td width="150">
                                            <asp:Literal runat="server" ID="lit_indirimtutar" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="baslik">
                                            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(134));%>
                                        </td>
                                        <td class="baslik">
                                            :
                                        </td>
                                        <td width="150">
                                            <asp:Literal runat="server" ID="lit_toplamtutar" />
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <asp:Literal runat="server" ID="lit_kdvler" />
                                <tr>
                                    <td class="baslik">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(135));%>
                                    </td>
                                    <td class="baslik">
                                        :
                                    </td>
                                    <td width="150">
                                        <asp:Literal runat="server" ID="lit_toplamkdv" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="genelbaslik">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(136));%>
                                    </td>
                                    <td class="genelbaslik">
                                        :
                                    </td>
                                    <td width="150">
                                        <asp:Literal runat="server" ID="lit_geneltoplam" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="h10">
                    </div>
                    <div class="sol">
                        <asp:Button ID="btn_sepet" runat="server" OnClick="btn_sepet_Click" CssClass="main-sprite btn-big-act-orange" />
                    </div>
                    <div class="sag">
                        <asp:Button ID="btn_alisveristamamla" runat="server" OnClick="btn_alisveristamamla_Click"
                            CssClass="main-sprite btn-big-act" /></div>
                    <div class="h10">
                    </div>
                    <div class="h10">
                    </div>
                    <strong>
                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(278).ToUpper());%></strong><br />
                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(277));%>
                </div>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>