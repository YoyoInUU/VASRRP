<%@ Page Language="VB" AutoEventWireup="false" CodeFile="D2.aspx.vb" Inherits="D6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>VASRRP</title>

    <script src="js/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.easydrag.handler.beta2.js"></script>

    <script src="Js/jquery-impromptu.3.1.min.js" type="text/javascript"></script>
    <link href="css/impromptu.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
<!--
    $(function () {
        document.onselectstart = new Function("event.returnValue=false;"); //禁止選取

        if ($.UrlParam("a") == null) { } else { $("#span1").html($.UrlParam('a')); }
        if ($.UrlParam("b") == null) { } else { $("#span2").html($.UrlParam('b')); }
        //  if ($.UrlParam("c") == null) { } else { $("#span3").html($.UrlParam("c")); }
        //  if ($.UrlParam("d") == null) { } else { $("#span4").html($.UrlParam("d")); }
        // if ($.UrlParam("e") == null) { } else { $("#span5").html($.UrlParam("e")); }
        // if ($.UrlParam("f") == null) { } else { $("#span6").html($.UrlParam("f")); }

        if ($.UrlParam("t") == null) { } else { $("#ptext").html($.UrlParam("t")); }


        $(".dragitem").easydrag().ondrop(function (e, element) {
            //開始拖曳---取出拖曳物件座標,大小
            var xx = $(element).offset().left;
            var yy = $(element).offset().top;
            var ww = $(element).width();   //55
            var hh = $(element).height();  //60 (90)
            //取出bar座標  $("#Panelbar")寬度 920 bar長 882-18
            var xx1 = $("#Panelbar").offset().left;  //18
            var yy1 = $("#Panelbar").offset().top;   //639

            // $("#xxx1").val(xx1);
            //  $("#xxx2").val(yy1);


            // alert($(element).attr("src"));

            $(element).attr("src", "./VASRRP_files/arr" + element.id + ".gif");

            var xpoint = 0;
            //拖曳選項
            if (yy - yy1 > -120) {

                hh = $(element).height();
                hh = 90;
                $(element).css("top", yy1 - hh + 6);      //拖曳物件y座標 = bar(y) + 物件高度 
                $("#q" + element.id).css("display", "block");

                if (xx < xx1) {
                    //bat_start 且 小於拖曳物件一半寬度
                    $(element).css("left", xx1); //下面圖案左移一半大小
                    $("#x" + element.id).val(0);





                } else if (xx > xx1 + 864) {
                    //bar_end
                    $(element).css("left", xx1 + 864); //下面圖案左移一半大小
                    $("#x" + element.id).val(1);


                    $("#xxx1").val(xx);
                    $("#xxx2").val(xx1);

                } else {
                    //bar_middle
                    $(element).css("left", xx);
                    xpoint = (xx - xx1) / (864);

                    $("#xxx1").val(xx);
                    $("#xxx2").val(xx1);

                    $("#x" + element.id).val(xpoint.toFixed(4));
                    //   $("#" + element.id + "text").css("display", "block");
                }
            } else {

                $(element).attr("src", "./VASRRP_files/sarr" + element.id + ".gif");


                $(element).css("left", $("#b" + element.id).offset().left + 8);
                $(element).css("top", $("#b" + element.id).offset().top + 8);
                $("#x" + element.id).val(-1);
                $("#q" + element.id).css("display", "none");
            }

            if ($("#x" + element.id).val() != -1) {
                for (var i = 1; i <= 2; i++) {
                    if (element.id != "box" + i) {

                        if ($("#x" + element.id).val() != "-1") {
                            if (Math.abs($("#x" + element.id).val() - $("#xbox" + i).val()) < 0.01) {
                                $.prompt(" " + getchar(i) + " and " + getchar(element.id.toString().charAt(3)) + " overlap", { show: 'slideDown', prefix: 'jqismooth' });
                                $(element).css("left", $("#b" + element.id).offset().left + 8);
                                $(element).css("top", $("#b" + element.id).offset().top + 8);
                                $("#x" + element.id).val(-1);
                                $(element).attr("src", "./VASRRP_files/sarr" + element.id + ".gif");
                                $("#q" + element.id).css("display", "none");
                            }
                        }
                    }
                }
            }
            //拖曳完成
        });


        for (var i = 1; i <= 2; i++) {
            //設定初始位置
            $('#box' + i).css("left", $("#bbox" + i).offset().left + 8);
            $('#box' + i).css("top", $("#bbox" + i).offset().top + 8);
            $('#qbox' + i).css("left", $("#bbox" + i).offset().left + 8);
            $('#qbox' + i).css("top", $("#bbox" + i).offset().top + 8);
        }

        //數字回傳字母
        function getchar(ch) {
            if (ch == 1) return "A";
            if (ch == 2) return "B";
            if (ch == 3) return "C";
            if (ch == 4) return "D";
            if (ch == 5) return "E";
            if (ch == 6) return "F";
        }

        //檢查作答
        $("#Bun_submit").click(function () {
            var x1 = $("#xbox1").val();
            var x2 = $("#xbox2").val();
            //  var x3 = $("#xbox3").val();
            //  var x4 = $("#xbox4").val();
            //  var x5 = $("#xbox5").val();
            //  var x6 = $("#xbox6").val();
            if (x1 == -1 || x2 == -1) {
                $.prompt("Please complete answering all of the items", { show: 'slideDown', prefix: 'jqismooth' });
                return false;
            } else {

                // $.prompt("A:" + x1 + "<br/>B:" + x2 + "<br/>C:" + x3 + "<br/>D:" + x4 + "<br/>E:" + x5 + "<br/>F:" + x6 + "<br/>", { show: 'slideDown', prefix: 'jqismooth' });
            }
        });

    });






    $.UrlParam = function (name) {
        //宣告正規表達式
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);




        //如果取出的參數存在則取出參數的值否則回穿null
        //if (r != null) return unescape(r[2]); return null;
        if (r != null) return decodeURIComponent(r[2]); return null;
    }



    -->
    </script>
    <style>
        .boxtd {
            height: 65px;
            width: 60px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="header" style="border: 0px solid red;">
        </div>

        <div id="content" style="border: 0px solid green;">

            <p>
                <asp:Label ID="Ltext" runat="server" Text="000" Style="font-size: 30px;" />

            </p>

            <div style="padding: 10px; border: 00px solid black">
                <table border="0" cellpadding="4" cellspacing="0">
                    <tr>
                        <td class="boxtd" id="bbox1">
                            <img src="VASRRP_files/sarrbox1.gif" alt="" class="dragitem" id="box1" style="position: absolute" />
                            <img src="VASRRP_files/sarrqbox1.gif" alt="" id="qbox1" style="display: none; position: absolute" />
                        </td>
                        <td style="width: 600px;">
                            <asp:Label ID="Ln1" runat="server" Text="111" />

                        </td>
                    </tr>
                    <tr>
                        <td class="boxtd" id="bbox2">
                            <img src="VASRRP_files/sarrbox2.gif" alt="" class="dragitem" id="box2" style="position: absolute" />
                            <img src="VASRRP_files/sarrqbox2.gif" alt="" id="qbox2" style="display: none; position: absolute" />
                        </td>
                        <td>
                            <asp:Label ID="Ln2" runat="server" Text="111" /></td>
                    </tr>

                </table>

            </div>
            <div align="left" style="border: 0px solid green; padding-top: 90px; padding-left: 10px; width: 922px;">
                <img src="VASRRP_files/downa.jpg" id="Panelbar" alt="" />
            </div>
            <div style="width: 930px; border: 0px solid red;">
                <table width="100%" border="0">
                    <tr>
                        <td width="50%" align="center">
                            <asp:Label ID="Lanchor" runat="server" Text="1" Style="font-size: 24px;"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="Ranchor" runat="server" Text="2" Style="font-size: 24px;"></asp:Label>
                        </td>

                    </tr>
                </table>
            </div>



        </div>

        <img src="VASRRP_files/arrbox1.gif" width="1" alt="" id="Img1" />
        <img src="VASRRP_files/arrbox2.gif" width="1" alt="" id="Img2" />


        <hr />
        <asp:Button ID="Bun_submit" runat="server" Text="Submit" Style="width: 80px; height: 30px;" />



        <asp:GridView ID="GridView1" runat="server" Visible="false">
        </asp:GridView>

        <asp:GridView ID="GridView2" runat="server" Visible="false">
        </asp:GridView>

        <div style="display: none">
            <br />
            A:
            <asp:TextBox ID="xbox1" runat="server" Text="-1" Width="50"></asp:TextBox>
            B:
            <asp:TextBox ID="xbox2" runat="server" Text="-1" Width="50"></asp:TextBox>


        </div>
        <asp:HiddenField ID="HF_osn1" runat="server" />
        <asp:HiddenField ID="HF_osn2" runat="server" />


    </form>
</body>
</html>
