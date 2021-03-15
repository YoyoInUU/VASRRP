<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>職業興趣探索—受試者 招募</title>

</head>
<body>

    <form id="form1" runat="server" visible="true">
        <h1 style="padding-left: 20px;">職業興趣探索—受試者 招募</h1>

        <div style="width: auto; padding-left: 20px; padding-right: 500px">
            <br>
            <br>
            你了解自我的職業興趣嗎？想在進入職場前了解自我興趣取向嗎？現在是個絕佳的機會！
                <br>
            <br>
            您好，
                <br>
            <br>
            本職業興趣問卷是由<span style="text-decoration: underline">國立台灣師範大學 教育心理與輔導學系 助理教授劉振維</span>所開發。目的是為了幫助您在進入職業市場前，充分了解自我的興趣取向。藉由本問卷提供的多面向職業興趣測驗題目，以及最新的測驗統計模型
                分析，本研究將事後提供您精準的職業興趣分類，幫助您深入了解自我興趣方向！
                <br>
            <br>
            我們正在尋找尚未進入職業市場的你，年齡屆於 16 至 22 歲。如果你對於自身的職業興趣仍未清晰(探索職業興趣)或者你已非常了解自己的興趣(驗證職業興趣)，都歡迎參與本項研究。
                <br>
            <br>
            分析結果將會以電子郵件通知您，以方便您檢視自我的職涯興趣狀態。
                <br>
            <br>
            <span style="font-weight: bold">參加方法：</span>
            <br>
            <br>
            <span style="font-weight: bold">本問卷由線上且匿名的問卷蒐集您的資料，資料和結果皆會嚴格保管於本系</span>，絕不外流。以下問卷將花費您 約 30分鐘 作答。
                <br>
            <br>
            <span style="font-weight: bold">酬謝方式：</span>
            <br>
            完整填答完之後，系統將需要記錄您的電子郵件(不具或暗示個人身分 )，以作為傳送作為酬謝的 7-11電子禮卷。
                <br>
            <br>
            請注意：
                <br>
            1、 若線上作答期間或事後退出研究，將無法提供任何酬謝。
                <br>
            2、 如果電子郵件不具匿名性，將無法參與本研究。如果電子郵件不具匿名性，將無法參與本研究。
                <br>
            <br>
            如果您有任何疑問，請直接聯絡劉振維助理教授cwliu@ntnu.edu.tw或(02)7749-3788
                <br>
            <br>
            我們將謝謝您的熱情參與！
                <br>
            <br>


            <asp:Button ID="NextPage" runat="server" Text="下一頁" />
        </div>
    </form>

    <form id="form2" runat="server" visible="false">
        <div style="width: auto; height: auto; padding-left: 100px">

            <asp:RadioButton ID="BoyRadio" runat="server" Text="男&nbsp" GroupName="gender" Checked="true" />
            <asp:RadioButton ID="GirlRadio" runat="server" Text="女&nbsp" GroupName="gender" />
            <asp:RadioButton ID="OtherRadio" runat="server" Text="其他&nbsp" GroupName="gender" />

            <br />


            年齡:
            <asp:TextBox ID="AgeTextBox" runat="server"></asp:TextBox>
            歲&nbsp;<br />
            電子信箱 (發放電子禮卷用):
            <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
            <br />

            目前教育背景：
            <asp:RadioButton ID="HighScoolRadio" runat="server" Text="高中&nbsp" GroupName="education" Checked="true" />
            <asp:RadioButton ID="ColledgeRadio" runat="server" Text="大學&nbsp" GroupName="education" />
            <asp:RadioButton ID="GraduateRadio" runat="server" Text="研究所&nbsp" GroupName="education" />


            <asp:Button ID="StartTest" runat="server" Text="下一頁" />

        </div>
    </form>
</body>
</html>
