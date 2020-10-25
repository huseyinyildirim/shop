<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order-tracking.aspx.cs"
    Inherits="SHOP.order_tracking" EnableEventValidation="False" ValidateRequest="false"
    EnableViewState="False" ViewStateMode="Disabled" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
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
            <asp:Literal runat="server" ID="lit_nerdesin" />
        </div>
    </div>
    <div class="clear">
    </div>
    <div class="icerik">
        <div class="icerikcerceve">
            <include:solblok runat="server" ID="solblok" />
            <div id="genisortablok">
                <div class="ortablokbaslik">
                    <asp:Literal runat="server" ID="lit_ortabaslik" />
                </div>
                <div class="h10">
                </div>
                <asp:Literal runat="server" ID="lit_sepetuyari" />
                <div runat="server" id="div_sepeticerik">
                    <asp:GridView ID="grid_sepet" runat="server" Width="100%" CssClass="gridstil" AutoGenerateColumns="false"
                        AllowPaging="true" PageSize="30" DataKeyNames="id" OnRowDataBound="sepet_RowDataBound"
                        OnPageIndexChanging="sepet_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="no" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100" />
                            <asp:BoundField DataField="tarih" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="120"
                                DataFormatString="{0:dd MMM yyyy ddd HH:mm}" HtmlEncode="false" />
                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100">
                                <ItemTemplate>
                                    <%#SHOP.SHOPClass.Finans.Cevirme.ParaFormat(Eval("toplam").ToString())%>
                                    <%#SHOP.SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(Eval("para_birimi_id").ToString())%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="siparis_durum" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="id" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <include:kayanmarkabar runat="server" ID="kayanmarkabar" />
        </div>
    </div>
    <include:alt runat="server" ID="alt" />
    </form>
</body>
</html>