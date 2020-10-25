<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basket-payment.aspx.cs"
    Inherits="SHOP.basket_payment" ClientIDMode="Static" EnableEventValidation="False"
    ValidateRequest="false" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<%@ Register TagPrefix="include" TagName="alt" Src="~/ascx/alt.ascx" %>
<%@ Register TagPrefix="include" TagName="ust" Src="~/ascx/ust.ascx" %>
<%@ Register TagPrefix="include" TagName="solblok" Src="~/ascx/solblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sagblok" Src="~/ascx/sagblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sitil" Src="~/ascx/sitil.ascx" %>
<%@ Register TagPrefix="include" TagName="kayanmarkabar" Src="~/ascx/kayanmarkabar.ascx" %>
<%@ Register TagPrefix="include" TagName="odeme_havale" Src="~/ascx/odeme-havale.ascx" %>
<%@ Register TagPrefix="include" TagName="odeme_kredikarti" Src="~/ascx/odeme-kredikarti.ascx" %>
<%@ Register TagPrefix="include" TagName="odeme_kapidaodeme" Src="~/ascx/odeme-kapidaodeme.ascx" %>
<%@ Register TagPrefix="include" TagName="odeme_paypal" Src="~/ascx/odeme-paypal.ascx" %>
<%@ Register TagPrefix="include" TagName="odeme_ptt" Src="~/ascx/odeme-ptt.ascx" %>
<include:sitil runat="server" ID="sitil" />
<body>
    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(330));%>
    <script src="/js/basket-payment.js" type="text/javascript"></script>
    <script type="text/javascript">
        function Anthem_PreCallBack() {
            $("#aloading").html("<img src=\"/images/loading.gif\" alt=\"\"/>");
        }

        function Anthem_PostCallBack() {
            $("#aloading").html("");
        }

        function Anthem_Error(result) {
            $("#aloading").html(result.error);
        }
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
    <div class="icerik">
        <div class="icerikcerceve">
            <include:solblok runat="server" ID="solblok" />
            <div id="genisortablok">
                <div class="ortablokbaslik">
                    <asp:Literal runat="server" ID="lit_ortabaslik" /></div>
                <div class="h10">
                </div>
                <table id="sepetadim" summary="">
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
                            <td class="secili">
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
                <asp:GridView ID="grid_sepet" runat="server" Width="100%" CssClass="gridstil" AutoGenerateColumns="false"
                    DataKeyNames="id" OnRowDataBound="sepet_RowDataBound">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30" Visible="false">
                            <HeaderTemplate>
                                <asp:CheckBox ID="hepsinisec" runat="server" onClick="return coklusec(this);" ClientIDMode="Static" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="secim" runat="server" onClick="return coklusec(this);" ClientIDMode="Static" />
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
                <div class="sag" style="width: 500px;">
                    <table class="sepettoplam" align="right" summary="">
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
                                    <td>
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
                                    <td>
                                        <asp:Literal runat="server" ID="lit_toplamtutar" />
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Literal runat="server" ID="kdvler" />
                            <tr>
                                <td class="baslik">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(135));%>
                                </td>
                                <td class="baslik">
                                    :
                                </td>
                                <td>
                                    <asp:Literal runat="server" ID="lit_toplamkdv" />
                                </td>
                            </tr>
                            <tr>
                                <td class="baslik">
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(136));%>
                                </td>
                                <td class="baslik">
                                    :
                                </td>
                                <td>
                                    <asp:Literal runat="server" ID="lit_geneltoplam" />
                                </td>
                            </tr>
                            <asp:Panel runat="server" ID="pnl_kargo_payi">
                                <tr>
                                    <td class="baslik">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(217));%>
                                    </td>
                                    <td class="baslik">
                                        :
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="lit_kargo_payi" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="genelbaslik">
                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(292));%>
                                    </td>
                                    <td class="genelbaslik">
                                        :
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="lit_toplam" />
                                    </td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td colspan="3">
                                    <anthem:Label runat="server" ID="lbl_komisyon_tutar" AutoUpdateAfterCallBack="True" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="h10">
                </div>
                <div id="odemecesitleri" class="usual">
                    <ul>
                        <li>
                            <anthem:LinkButton ID="lbtn_havale" runat="server" OnClick="havale_Click"></anthem:LinkButton></li>
                        <li>
                            <anthem:LinkButton ID="lbtn_kredikarti" runat="server" OnClick="kredikarti_Click"></anthem:LinkButton></li>
                        <li>
                            <anthem:LinkButton ID="lbtn_kapidaodeme" runat="server" OnClick="kapidaodeme_Click"
                                Visible="false"></anthem:LinkButton></li>
                        <li>
                            <anthem:LinkButton ID="lbtn_paypal" runat="server" OnClick="paypal_Click" Visible="false"></anthem:LinkButton></li>
                        <li>
                            <anthem:LinkButton ID="lbtn_ptt" runat="server" Visible="false"></anthem:LinkButton></li>
                    </ul>
                    <div class="tablar">
                        <div id="aloading">
                        </div>
                        <anthem:Label runat="server" ID="lbl_sepet_bos" Visible="false" AutoUpdateAfterCallBack="True" />
                        <anthem:Panel ID="pnl_havale" runat="server" Visible="false" AutoUpdateAfterCallBack="True">
                            <include:odeme_havale runat="server" ID="odeme_havale" />
                        </anthem:Panel>
                        <anthem:Panel ID="pnl_kredikarti" runat="server" Visible="true" AutoUpdateAfterCallBack="True">
                            <include:odeme_kredikarti runat="server" ID="odeme_kredikarti" />
                        </anthem:Panel>
                        <anthem:Panel ID="pnl_kapidaodeme" runat="server" Visible="false" AutoUpdateAfterCallBack="True">
                            <include:odeme_kapidaodeme runat="server" ID="odeme_kapidaodeme" />
                        </anthem:Panel>
                        <anthem:Panel ID="pnl_paypal" runat="server" Visible="false" AutoUpdateAfterCallBack="True">
                        </anthem:Panel>
                        <anthem:Panel ID="pnl_ptt" runat="server" Visible="false" AutoUpdateAfterCallBack="True">
                            <include:odeme_ptt runat="server" ID="odeme_ptt" />
                        </anthem:Panel>
                    </div>
                    <asp:Literal runat="server" ID="lit_deger" />
                    <div class="h10">
                    </div>
                    <div class="sol">
                        <asp:Button ID="btn_geri" runat="server" OnClick="btn_geri_Click" CssClass="main-sprite btn-prev" /></div>
                    <div class="sag">
                        <asp:Button ID="btn_devamet" runat="server" OnClick="btn_devamet_Click" CssClass="main-sprite btn-next" /></div>
                </div>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>