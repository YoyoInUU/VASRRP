<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VAS-RRP Generator 2020</title>
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>


    <script type="text/javascript">
<!--
    $(function () {




        $("#DD_nums").change(function (e, element) {


            var aa = $("#DD_nums option:selected").text();

            // alert(aa);


            if (aa < 6) { $("#op6").css("display", "none"); }
            if (aa < 5) { $("#op5").css("display", "none"); }
            if (aa < 4) { $("#op4").css("display", "none"); }
            if (aa < 3) { $("#op3").css("display", "none"); }
            if (aa < 2) { $("#op2").css("display", "none"); }



            if (aa > 1) { $("#op2").css("display", "block"); }
            if (aa > 2) { $("#op3").css("display", "block"); }
            if (aa > 3) { $("#op4").css("display", "block"); }
            if (aa > 4) { $("#op5").css("display", "block"); }
            if (aa > 5) { $("#op6").css("display", "block"); }



        });




    });




    -->
    </script>
</head>
<body>





    <form id="form1" runat="server">

        <asp:LoginView runat="server">
            <AnonymousTemplate>
                <asp:Login ID="Login1" runat="server"></asp:Login>
            </AnonymousTemplate>
            <LoggedInTemplate>
            </LoggedInTemplate>
        </asp:LoginView>
        <h1 style="padding-left: 20px;">VAS-RRP Generator 2020</h1>
        <div style="width: 900px; padding-left: 20px">



            <p>
                This tool is to design VAS-RRP that can be used in online studies (e.g., Sung, Cheng, & Wu, 2015). Just follow the 4 steps below to create a VAS-RRP for your own online survey. This service is free of charge. We are working on it.
            </p>

            <h3>1. The Number Of Options：</h3>

            Select the number of options：
    <asp:DropDownList ID="DD_nums2" runat="server">


        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
    </asp:DropDownList>
            <br />

            <hr style="width: 850px;" />




            <h3>2. Select the excel format file (Only available .xls)  ex:
          <a href="ex1.xls" target="_blank">ex1</a>
                <a href="ex2.xls" target="_blank">ex2</a>
                <a href="ex3.xls" target="_blank">ex3</a>
                <a href="ex4.xls" target="_blank">ex4</a>
                <a href="ex5.xls" target="_blank">ex5</a>
                <a href="ex6.xls" target="_blank">ex6</a>

            </h3>

            <asp:FileUpload ID="fuUpload" runat="server" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="fuUpload" Display="Dynamic" ForeColor="Red" ErrorMessage="Only .XLS format" ValidationExpression="^.+\.(((x|X)(l|L)(s|S)))$" />

            <hr style="width: 850px;" />

            <h3>3. Select the txt format file (Only available .txt)  ex:
            <a href="ex1.txt" target="_blank">ex1</a>


            </h3>

            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="fuUpload" Display="Dynamic" ForeColor="Red" ErrorMessage="Only .TXT format" ValidationExpression="^.+\.(((x|X)(l|L)(s|S)))$" />



            <hr />


            <asp:Button ID="Button2" runat="server" Text="Start Test" />





        </div>




    </form>
</body>
</html>
