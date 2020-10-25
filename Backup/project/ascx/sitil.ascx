<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sitil.ascx.cs" Inherits="SHOP.ascx.sitil"
    EnableViewState="False" ViewStateMode="Disabled" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    
    <asp:Literal ID="ContentType" runat="server" />
    <!--
        MY 26.08.2012 13:41
        Sistemin modern standartlarla çalışmasını sağlama amacıyla ie uyumluluk modu kapatılmıştır.
     -->
    <!--<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />-->
    <asp:Literal ID="ContentLanguage" runat="server" />
    <asp:Literal ID="Charset" runat="server" />
    <meta http-equiv="Imagetoolbar" content="no" />
    <asp:Literal ID="description" runat="server" />
    <asp:Literal ID="keywords" runat="server" />
    <asp:Literal ID="GoogleDogrulamaKodu" runat="server" Visible="false" />
    <meta name="Robots" content="ALL" />
    <asp:Literal ID="Title" runat="server" />
    <!--[if IE 6]>
    <script type="text/javascript" language="javascript" src="/js/DD_belatedPNG.js"></script>
    <script type="text/javascript" language="javascript" >
    DD_belatedPNG.fix('#rribbon img,#htop ul li img,#hri,#cma,.pro .h3,.icon,#lribbon img,#logo a img,#cleft,#mbleft img,.product,#lribbon_image,#mright p img,#socialmedia ul li a img');
    </script>
    <![endif]-->
    <!--[if lt IE 6]>
    <script type="text/javascript">window.location="tarayici.aspx"</script>
    <![endif]-->
    <link href="/favicon.ico" rel="shortcut icon" />
    <link href="/css/sitil.css?1410" rel="stylesheet" type="text/css" />
    <link href="/css/jcarousel.css" rel="stylesheet" type="text/css" />
    <link href="/css/colorbox.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="/css/cupertino/jquery-ui.css" rel="stylesheet" />
    <script src="/js/jquery.js" type="text/javascript"></script>
    <script src="/js/jquery-ui.js" type="text/javascript"></script>
    <script src="/js/colorbox.js" type="text/javascript"></script>
    <script src="/js/cufon.js" type="text/javascript"></script>
    <script src="/js/bree.cufon.js" type="text/javascript"></script>
    <script src="/js/jcarousel.js" type="text/javascript"></script>
    <script src="/js/idTabs.js" type="text/javascript"></script>
    <script src="/js/tipsy.js" type="text/javascript"></script>
    <script src="/js/seekattention.js" type="text/javascript"></script>

    <!-- JSSHARE -->
    <script src="/js/jsShare.js" type="text/javascript"></script>
    <link href="/css/jsShare.css" rel="stylesheet" type="text/css" />
    <!-- JSSHARE -->

    <script src="/js/default.js" type="text/javascript"></script>
    <asp:Literal ID="GoogleAnalytics" runat="server" Visible="false" />
    <script type="text/javascript">

    <!--
        function NoError() {
            //alert("Sayfada JS hatası oluştu.\nLütfen tarayıcıyı kapatıp açarak, yeniden deneyiniz");
            return (true);
        }
        onerror = NoError;
    //-->
    </script>
    <!--SCRIPTS-->
    <!--[if IE 6]>
<style type="text/css">
html{overflow-x:hidden}
</style>
<script type="text/javascript">
var IE6UPDATE_OPTIONS =
{
icons_path: "http://static.ie6update.com/hosted/ie6update/images/",
message: "Internet Explorer versiyonunuz çok düşük. Güncellemek için tıklayınız.",url: "http://www.microsoft.com/turkiye/windows/internet-explorer"
}
</script>
<script type="text/javascript" src="http://static.ie6update.com/hosted/ie6update/ie6update.js"></script>
<![endif]-->
</head>