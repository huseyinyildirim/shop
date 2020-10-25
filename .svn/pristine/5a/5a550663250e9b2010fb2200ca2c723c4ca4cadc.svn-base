<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member-address.aspx.cs"
    Inherits="SHOP.member_address" EnableEventValidation="False" ValidateRequest="false"
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
    <script src="/js/member-address.js" type="text/javascript"></script>
    <script type="text/javascript">
        function countProperties(c) { var b, a = 0; for (b in c) a++; return a }

        function FillDropDown(a, b, c) {
            if (!c) {
                $(a + " option:not(:first)").remove();
            }
            for (var i = 0; i < countProperties(b); i++) {
                $(a).append($("<option><\/option>").val(b[i].ID).html(b[i].Ad));
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

        function DoldurIl(t) {
            GetServiceJSON(function (a, b) {
                if (a.Type == 0) {
                    $("#sonuc").html('');
                    if (countProperties(b) > 0) {
                        FillDropDown("#txt_il", b, false);
                        FillDropDown("#txt_il0", b, false);
                    }
                    else {
                        DropDropItemsRemove("#txt_il", false);
                        DropDropItemsRemove("#txt_il0", false);
                        DropDropItemsRemove("#txt_ilce", false);
                        DropDropItemsRemove("#txt_ilce0", false);
                    }
                }
                else {
                    DropDropItemsRemove("#txt_il", false);
                    DropDropItemsRemove("#txt_il0", false);
                    DropDropItemsRemove("#txt_ilce", false);
                    DropDropItemsRemove("#txt_ilce0", false);
                    $("#sonuc").html(JSON.stringify(a.Text));
                }
            }, "/asmx/GetCountries.asmx/IlGetir", "Sehirler", "{UlkeID:" + t + "}");
        };

        function DoldurIlce(t) {
            GetServiceJSON(function (a, b) {
                if (a.Type == 0) {
                    $("#sonuc").html('');
                    if (countProperties(b) > 0) {
                        FillDropDown("#txt_ilce", b, false);
                        FillDropDown("#txt_ilce0", b, false);
                    }
                    else {
                        DropDropItemsRemove("#txt_ilce", false);
                        DropDropItemsRemove("#txt_ilce0", false);
                    }
                }
                else {
                    DropDropItemsRemove("#txt_ilce", false);
                    DropDropItemsRemove("#txt_ilce0", false);
                    $("#sonuc").html(JSON.stringify(a.Text));
                }
            }, "/asmx/GetCountries.asmx/IlceGetir", "Ilceler", "{IlID:" + t + "}");
        };

        function GetServiceJSON(a, u, f, d) {
            $.ajax({
                type: "POST",
                url: u,
                data: d,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $("#sonuc").html(''); $("#loading").show() },
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
                    $("#sonuc").html('');
                    if (countProperties(b) > 0) {
                        //FillDropDown("#txt_ulke_id", b, false);
                        //FillDropDown("#txt_ulke_id0", b, false);
                    }
                }
                else {
                    $("#sonuc").html(JSON.stringify(a.Text));
                }
            }, "/asmx/GetCountries.asmx/ButunUlkeler", "Ulke", null);

            $("#txt_ulke_id").bind("change", function () {

                if ($("#txt_ulke_id").val() != "0") {
                    DoldurIl($(this).val());
                }
                else {
                    DropDropItemsRemove("#txt_il", false);
                    DropDropItemsRemove("#txt_ilce", false);
                }
            });

            $("#txt_il").bind("change", function () {

                if ($("#txt_il").val() != "0") {
                    DoldurIlce($(this).val());
                }
                else {
                    DropDropItemsRemove("#txt_ilce", false);
                }
            });

            $("#txt_ulke_id0").bind("change", function () {

                if ($("#txt_ulke_id0").val() != "0") {
                    DoldurIl($(this).val());
                }
                else {
                    DropDropItemsRemove("#txt_il0", false);
                    DropDropItemsRemove("#txt_ilce0", false);
                }
            });

            $("#txt_il0").bind("change", function () {

                if ($("#txt_il0").val() != "0") {
                    DoldurIlce($(this).val());
                }
                else {
                    DropDropItemsRemove("#txt_ilce0", false);
                }
            });

            $("#txt_faturatip").bind("change", function () {
                if ($("#txt_faturatip").val() == "0") {
                    GetTextJS(function (a) { $("#lbl_baslik").html('').html(a) }, 147);

                    $("#txt_vergidaire").html('');
                    $("#txt_vergino").html('');
                    $("#txt_tcno").html('');
                    $("#txt_tcno").removeAttr("disabled", "disabled");
                    $("#txt_vergidaire").attr("disabled", "disabled");
                    $("#txt_vergino").attr("disabled", "disabled");
                }
                else {
                    GetTextJS(function (a) { $("#lbl_baslik").html('').html(a) }, 146);

                    $("#txt_vergidaire").html('');
                    $("#txt_vergino").html('');
                    $("#txt_tcno").html('');
                    $("#txt_tcno").attr("disabled", "disabled");
                    $("#txt_vergidaire").removeAttr("disabled");
                    $("#txt_vergino").removeAttr("disabled");
                }
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
                <div id="aloading" style="width: 100%; text-align: center;">
                </div>
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
                                <asp:DropDownList ID="ddl_faturaadres" Width="100%" runat="server" onChange="Git(this.options[this.selectedIndex].value)"
                                    name="ddl_faturaadres" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top">
                                <asp:DropDownList ID="ddl_teslimatadres" Width="100%" runat="server" onChange="Git(this.options[this.selectedIndex].value)"
                                    name="ddl_teslimatadres" />
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
                                <asp:Panel runat="server" ID="div_yenifaturaadres" Visible="false">
                                    <table summary="">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(145));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="txt_faturatip" Width="100%" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <div id="lbl_baslik" runat="server">
                                                        </div>
                                                    </strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_baslik" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(148));%></strong>
                                                </td>
                                                <td valign="top">
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_adres" TextMode="MultiLine" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(149));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_postakodu" onkeypress="return SadeceRakam(event);"
                                                        onblur="SadeceRakam(event,false)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(150));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="txt_ulke_id" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(151));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="txt_il" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(152));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="txt_ilce" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(154));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_vergidaire" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(155));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_vergino" Enabled="False" onkeypress="return SadeceRakam(event);"
                                                        onblur="SadeceRakam(event,false)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(156));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_tcno" onkeypress="return SadeceRakam(event);"
                                                        onblur="SadeceRakam(event,false)"></asp:TextBox>
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
                                                    <asp:Button runat="server" ID="btn_faturaadresekle" OnClick="btn_faturaadresekle_Click" CssClass="main-sprite btn-act-orange sol" />
                                                    <asp:Button ID="btn_faturaadresduzenle" runat="server" OnClick="btn_faturaadresduzenle_Click" CssClass="main-sprite btn-act-orange sol" />
                                                    <asp:Button ID="btn_iptal" runat="server" OnClick="btn_iptal_Click" CssClass="main-sprite btn-act-orange sol" />
                                                    <asp:Button ID="btn_sil" runat="server" OnClick="btn_sil_Click" CssClass="main-sprite btn-act-orange sol" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top">
                                <asp:Panel runat="server" ID="div_yeniteslimatadres" Visible="false">
                                    <table summary="">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(147));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_isim0" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(148));%></strong>
                                                </td>
                                                <td valign="top">
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_adres0" TextMode="MultiLine" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(149));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_postakodu0" onkeypress="return SadeceRakam(event);"
                                                        onblur="SadeceRakam(event,false)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(150));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="txt_ulke_id0" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(151));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="txt_il0" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(152));%></strong>
                                                </td>
                                                <td>
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="txt_ilce0" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <strong>
                                                        <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(153));%></strong>
                                                </td>
                                                <td valign="top">
                                                    <strong>:</strong>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txt_acikadres0" TextMode="MultiLine" />
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
                                                    <asp:Button runat="server" ID="btn_teslimatadresekle" OnClick="btn_teslimatadresekle_Click" CssClass="main-sprite btn-act-orange sol" />
                                                    <asp:Button ID="btn_teslimatadresduzenle" runat="server" OnClick="btn_teslimatadresduzenle_Click" CssClass="main-sprite btn-act-orange sol" />
                                                    <asp:Button ID="btn_iptal0" runat="server" OnClick="btn_iptal_Click" CssClass="main-sprite btn-act-orange sol" />
                                                    <asp:Button ID="btn_sil0" runat="server" OnClick="btn_sil0_Click" CssClass="main-sprite btn-act-orange sol" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="h10">
                </div>
                <div class="sag">
                    <asp:Button ID="btn_sepetegit" runat="server" OnClick="btn_sepetegit_Click" CssClass="main-sprite btn-next" /></div>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>