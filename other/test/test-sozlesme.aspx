<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test-sozlesme.aspx.cs" Inherits="SHOP.test_sozlesme" EnableViewState="False" ViewStateMode="Disabled" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="/css/cupertino/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            GetDialog("#dialog", "#dialog_link", "#dialog_link2", "Satış Sözleşmesi", "evet", "hayır", 800, 500, false);
            GetDialog("#Div1", "#Button1", "#A1", "Satış Sözleşmesi", "evet", "hayır", 800, 500, false);
        });

        function GetLink(a) {
            $(a).bind('click', function () { //getdialog bla bla});
        }

        function GetDialog(a, b, c, d, t, k, w, h, au) {
            $(a).dialog({
                autoOpen: au,
                modal: true,
                title: d,
                width: w,
                height: h,
                overlay: { opacity: 0.5, background: "black" },
                dialogClass: "flora",
                buttons: [{
                    text: t,
                    click: function () { alert('evet'); $(this).dialog("close"); }
                }, {
                    text: k,
                    click: function () { alert('hayır'); $(this).dialog("close"); }
                }]
            });

            $(b).click(function () {
                $(a).dialog("open");
                return false;
            });

            $(c).click(function () {
                $(a).dialog("open");
                return false;
            });
        }
    </script>
    <style>
        body
        {
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="dialog_link" runat="server" Text="Alışverişi Tamamla" />
        <br />
        <br />
        <a href="#" id="dialog_link2">Deneme</a>
        <div id="dialog" title="Dialog Title">
            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(236));%>
        </div>
    </div>

    <div>
        <asp:Button ID="Button1" runat="server" Text="Alışverişi Tamamla" />
        <br />
        <br />
        <a href="#" id="A1">Deneme</a>
        <div id="Div1" title="Dialog Title">
            <%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(236));%>
        </div>
    </div>
    </form>
</body>
</html>
