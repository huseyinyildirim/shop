<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basket-address.aspx.cs"
    Inherits="SHOP.basket_address" ClientIDMode="Static" EnableEventValidation="False"
    ValidateRequest="false" EnableViewState="False" ViewStateMode="Disabled" %>

<%@ Register TagPrefix="include" TagName="alt" Src="~/ascx/alt.ascx" %>
<%@ Register TagPrefix="include" TagName="ust" Src="~/ascx/ust.ascx" %>
<%@ Register TagPrefix="include" TagName="solblok" Src="~/ascx/solblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sagblok" Src="~/ascx/sagblok.ascx" %>
<%@ Register TagPrefix="include" TagName="sitil" Src="~/ascx/sitil.ascx" %>
<%@ Register TagPrefix="include" TagName="kayanmarkabar" Src="~/ascx/kayanmarkabar.ascx" %>
<include:sitil runat="server" ID="sitil" />
<body>
    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(330));%>
    <script src="/js/basket-address.js" type="text/javascript"></script>
    <script type="text/javascript">
        function countProperties(c) { var b, a = 0; for (b in c) a++; return a }

        function FillDropDown(a, b, c) {
            if (!c) {
                $(a + " option:not(:first)").remove();
            }
            for (var i = 0; i < countProperties(b); i++) {
                $(a).append($("<option><\/option>").val(b[i].ID).html(b[i].Baslik));
            }
        }

        function DropDropItemsRemove(a, b) {
            if (!b) {
                $(a + " option:not(:first)").remove();
            }
            else {
                $(a + " option").remove();
            }
        }

        //returnparams,url,objectname,postdata
        function GetServiceJSON(a, u, f, d) {
            $.ajax({
                type: "POST",
                url: u,
                data: d,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $("#lbl_faturaadres").html(''); $("#lbl_teslimatadres").html(''); $("#loading").show() },
                complete: function () { $("#loading").hide() },
                error: function (b, c, a) {
                    alert(b.status + "\r\n" + c + "\r\n" + a)
                },
                success: function (b, c) {
                    c == "success" && $.each(b, function (c, b) {
                        if (b["Message"].Type == 0) {
                            a(b["Message"], b[f])
                        }
                        else {
                            a(b["Message"])
                        }
                    })
                }
            })
        }

        $(function () {
            GetServiceJSON(function (a, b) {
                if (a.Type == 0) {
                    $("#lbl_faturaadres").html('');
                    if (countProperties(b) > 0) {
                        FillDropDown("#ddl_faturaadres", b, false);
                    }
                }
                else {
                    $("#lbl_faturaadres").html(JSON.stringify(a.Text));
                }
            }, "/asmx/GetMemberInfo.asmx/ButunAdresler", "Adresler", "{KullaniciID:1,Tip:false}");

            $("#ddl_faturaadres").bind("change", function () {
                FillCities($(this).val());
            });

            GetServiceJSON(function (a, b) {
                if (a.Type == 0) {
                    $("#lbl_teslimatadres").html('');
                    if (countProperties(b) > 0) {
                        FillDropDown("#ddl_teslimatadres", b, false);
                    }
                }
                else {
                    $("#lbl_teslimatadres").html(JSON.stringify(a.Text));
                }
            }, "/asmx/GetMemberInfo.asmx/ButunAdresler", "Adresler", "{KullaniciID:1,Tip:true}");

            $("#ddl_teslimatadres").bind("change", function () {
                FillCities($(this).val());
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
                            <td class="secili">
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
                <div id="loading" style="display: none">
                    <img src="/images/loading.gif" alt="" /></div>
                <table width="100%" summary="">
                    <tbody>
                        <tr>
                            <td width="49%">
                                <img src="/images/icon-fatura.png" alt="<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(138));%>" />
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(138).ToUpper());%></strong>&nbsp;&nbsp;<asp:Button
                                        runat="server" ID="btn_yenifaturadresekle" OnClick="btn_yenifaturadresekle_Click" />
                            </td>
                            <td width="2%">
                                &nbsp;
                            </td>
                            <td width="49%">
                                <img src="/images/icon-kargo.png" alt="<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(139));%>" />
                                <strong>
                                    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(139).ToUpper());%></strong>&nbsp;&nbsp;<asp:Button
                                        runat="server" ID="btn_yeniteslimatadresekle" OnClick="btn_yeniteslimatadresekle_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:DropDownList ID="ddl_faturaadres" runat="server" Width="100%">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top">
                                <asp:DropDownList ID="ddl_teslimatadres" runat="server" Width="100%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <div id="lbl_faturaadres">
                                </div>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top">
                                <div id="lbl_teslimatadres">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="h10">
                </div>
                <div class="sol">
                    <asp:Button ID="btn_geri" runat="server" OnClick="btn_geri_Click" CssClass="main-sprite btn-prev" /></div>
                <div class="sag">
                    <asp:Button ID="btn_devamet" runat="server" OnClick="btn_devamet_Click" CssClass="main-sprite btn-next" /></div>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>