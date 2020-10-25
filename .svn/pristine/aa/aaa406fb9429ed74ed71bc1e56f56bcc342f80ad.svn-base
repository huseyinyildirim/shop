<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="odeme-havale.ascx.cs" Inherits="SHOP.ascx.odeme_havale" %>
<asp:Literal runat="server" ID="lit_havale_adres" />
<div class="h10">
</div>
<div class="h10">
</div>
<strong>
    <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(278).ToUpper());%></strong><br />
<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(279).Replace("{{FirmaAdi}}", SHOP.Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault()));%>