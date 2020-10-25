<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test-sozlesme2.aspx.cs" Inherits="SHOP.test_sozlesme2" EnableViewState="False" ViewStateMode="Disabled" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="/css/cupertino/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript">

        function GetDialog(a) {
            $(a).dialog({
                autoOpen: false,
                modal: true,
                title: "sss",
                width: 900,
                height: 500,
                overlay: { opacity: 0.5, background: "black" },
                dialogClass: "flora"
            });
        }


        $(function () {
            GetDialog("#Div1");
            GetDialog("#Div2");
            GetDialog("#Div3");

            $("#dialog_link1").click(function () {
                $("#Div1").dialog("open");
                return false;
            });

            $("#dialog_link2").click(function () {
                $("#Div2").dialog("open");
                return false;
            });

            $("#dialog_link3").click(function () {
                $("#Div3").dialog("open");
                return false;
            });
        });
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

        <a href="#" id="dialog_link1">Deneme 1</a>
        <br />
        <br />
        <a href="#" id="dialog_link2">Deneme 2</a>
        <br />
        <br />
        <a href="#" id="dialog_link3">Deneme 3</a> 

<div id="Div1" title="Basic dialog">
	<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(236));%>
</div>

<div id="Div2" title="Basic dialog">
	<%Response.Write(SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(236));%>
</div>

<div id="Div3" title="Basic dialog">
	<asp:Literal runat="server" ID="lit_1" />
</div>
    </div>
    </form>
</body>
</html>

