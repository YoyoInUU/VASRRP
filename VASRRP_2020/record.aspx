<%@ Page Language="VB" AutoEventWireup="false" CodeFile="record.aspx.vb" Inherits="record" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>




            <hr />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <hr />

            <asp:Button ID="Button2" runat="server" Text="Back to VAS-RRP Home" />

            <asp:Button ID="Button1" runat="server" Text="Save" />

        </div>
    </form>
</body>
</html>
