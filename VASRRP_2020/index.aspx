<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="_index" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VAS-RRP Generator 2020</title>
    <script src="js/jquery-1.4.1.min.js" type="text/javascript">

        $(function() {
        if(page2=1)
        {
        
        }
        });

    </script>



</head>
<body>
<form id="form1" runat="server">



    <asp:hiddenfield id="ValueHiddenField"
              onvaluechanged="ValueHiddenField_ValueChanged"
              value="" 
              runat="server"/>

    <asp:Button ID="Button1" runat="server" OnClick="btn_Click" Text="Button" />
    <asp:View ID="View1" runat="server">
    </asp:View>
    <asp:PageCatalogPart ID="PageCatalogPart1" runat="server" />
    </form>

    </body>

</html>
