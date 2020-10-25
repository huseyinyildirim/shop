<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="odeme-kredikarti.ascx.cs" Inherits="SHOP.ascx.odeme_kredikarti" %>

<div id="aloading" runat="server" style="width:100%; text-align:center;"></div>
    <table summary="">
        <tbody>
            <tr>
                <td><strong><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(169));%></strong></td>
                <td><strong>:</strong></td>
                <td>
                    <asp:TextBox ID="txt_kart_isim" runat="server" MaxLength="30" Width="250px">Test TEST</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><strong><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(172));%></strong></td>
                <td><strong>:</strong></td>
                <td>
                    <asp:TextBox ID="txt_kart_no_1" runat="server" MaxLength="4" Width="40px" onkeypress="return SadeceRakam(event);" onblur="SadeceRakam(event,false)">4912</asp:TextBox>&nbsp;- <asp:TextBox ID="txt_kart_no_2" runat="server" MaxLength="4" Width="40px" onkeypress="return SadeceRakam(event);" onblur="SadeceRakam(event,false)">0650</asp:TextBox>&nbsp;-&nbsp;<asp:TextBox ID="txt_kart_no_3" runat="server" MaxLength="4" Width="40px" onkeypress="return SadeceRakam(event);" onblur="SadeceRakam(event,false)">0052</asp:TextBox>&nbsp;-&nbsp;<asp:TextBox ID="txt_kart_no_4" runat="server" MaxLength="4" Width="40px" onkeypress="return SadeceRakam(event);" onblur="SadeceRakam(event,false)">3292</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><strong><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(171));%></strong></td>
                <td><strong>:</strong></td>
                <td>
                    <asp:DropDownList ID="ddl_son_tarih_ay" runat="server">
                    </asp:DropDownList>
                    &nbsp;/
                    <asp:DropDownList ID="ddl_son_tarih_yil" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><strong><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(173));%></strong></td>
                <td><strong>:</strong></td>
                <td>
                    <asp:TextBox ID="txt_guvenlik_kodu" runat="server" MaxLength="3" Width="40px" onkeypress="return SadeceRakam(event);" onblur="SadeceRakam(event,false)">XXX</asp:TextBox> <a alt="tipsyimg" title="<img src='/images/cvv.jpg' />"><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(179));%></a>
                </td>
            </tr>
            <tr>
                <td><strong><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(170));%></strong></td>
                <td><strong>:</strong></td>
                <td>
                    <asp:DropDownList ID="ddl_kart_tip" runat="server" />
                </td>
            </tr>
            <tr>
                <td><strong><%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(174));%></strong></td>
                <td><strong>:</strong></td>
                <td>
                    <asp:DropDownList ID="ddl_banka" runat="server"></asp:DropDownList>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="h10"></div>
    <asp:Literal runat="server" ID="lit_aciklama" />