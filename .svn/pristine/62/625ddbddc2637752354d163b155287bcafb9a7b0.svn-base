<%@ Page Language="C#" AutoEventWireup="true" CodeFile="merchant_islem_sonu.aspx.cs" Inherits="PosnetTDSApplication.merchant_islem_sonu" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Üye İşyeri Sayfası</title>
</head>
<body>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody>
		<tr>
			<td width="40" height="39"></td>
			<td height="39" width="641" bgcolor="#d4d0c8"><b>Üye İşyeri Sayfasına Dönülen Parametreler :</b></td>
		</tr>
		<tr>
			<td width="40" height="28"></td>
			<td height="28" width="641">
			<br>
			<% 
				int i = 0;
				for (i = 0; i <= Request.Form.Count - 1; i++)
				{
					Response.Write("<b>" + Request.Form.Keys.Get(i) + "</b> : " + Request.Form.Get(i));
					Response.Write("<br><br>");
				}
			%>
			</td>
		</tr>
	</tbody>
</table>
<p align="center"><a href="merchant.html">merchant.html</a></p>
</body>
</html>
