<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="solblok.ascx.cs" Inherits="SHOP.ascx.solblok"
    EnableViewState="False" ViewStateMode="Disabled" %>
<div id="solblok">
    <div class="bloklar">
        <div class="ust">
            <div class="baslik">
                <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(75));%></div>
        </div>
        <div class="orta">
            <asp:Literal runat="server" ID="kategorimenu" /></div>
        <div class="alt">
        </div>
    </div>
    <div class="h10">
    </div>

    <asp:PlaceHolder runat="server" ID="solbloklar"></asp:PlaceHolder>
</div>
