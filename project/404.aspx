<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="SHOP._404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nothing found for 404</title>
    <style>
		body {margin: 0; padding: 20px; text-align:center; font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#666666;}
		.error_page {width: 600px; padding: 50px; margin: auto;}
		.error_page h1 {margin: 20px 0 0;}
		.error_page p {margin: 10px 0; padding: 0;}		
		a {color: #9caa6d; text-decoration:none;}
		a:hover {color: #9caa6d; text-decoration:underline;}
		</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="error_page">
    <img src="/images/404.jpg" />
    <h1>We're sorry...</h1>
    <p>The page or journal you are looking for cannot be found.</p>
    <p><a href="/">Return to the homepage</a></p>
  </div>
    </form>
</body>
</html>