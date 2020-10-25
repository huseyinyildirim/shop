<%@ Page Language="C#" AutoEventWireup="true" CodeFile="normal.aspx.cs" Inherits="POSTesti" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 100%; border: 1px solid black">
        <asp:DropDownList ID="DropDownKartlar" runat="server" />
        <br />
        <asp:DropDownList ID="DropDownIslemler" runat="server" OnSelectedIndexChanged="DropDownIslemler_SelectedIndexChanged"
            AutoPostBack="True" />
    </div>
    <br />
        <div style="float: left; width: 100%; border: 1px solid red">
        <asp:Literal ID="LiteralIslemTipi" runat="server" />
    </div>
    <br />
    <div style="float: left; width: 100%; border: 1px solid red">
        <asp:Literal ID="LiteralPosIslem" runat="server" />
    </div>
    <br />
    <div style="float: left; width: 100%; border: 1px solid red">
        <asp:Literal ID="LiteralMesaj" runat="server" />
    </div>
    </form>
</body>
</html>
