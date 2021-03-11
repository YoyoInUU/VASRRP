
Imports System.Data
Imports myUtilityv4.LPT
Imports System
Imports System.Text
Imports System.IO

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub NextPage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NextPage.Click
        form1.Visible = False
        form2.Visible = True

    End Sub

    Protected Sub StartTest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles StartTest.Click
        Dim sqlgo As New sqlprocess

        Dim fs As FileStream = New FileStream(AppDomain.CurrentDomain.BaseDirectory + "\ex4.xls", FileMode.Open)

        Dim table1 As DataTable = sqlgo.RenderDataTableFromExcel(fs, 0, 0)


        ' optcount = number of options in .xls
        Session("optcount") = table1.Rows.Count
        ' allpage (i.e., total number of pages) = optcount / [number of options per page]
        Session("allpage") = table1.Rows.Count / 4


        table1.Columns.Add("score")

        table1.Columns.Add("osn")

        table1.Columns.Add("subject_data")

        table1.Columns.Add("rnds")

        table1.Columns.Add("time_stamp")

        If BoyRadio.Checked Then
            table1.Rows(0).Item("subject_data") = "男"

        ElseIf GirlRadio.Checked Then
            table1.Rows(0).Item("subject_data") = "女"

        ElseIf OtherRadio.Checked Then
            table1.Rows(0).Item("subject_data") = "其他"

        End If

        If HighScoolRadio.Checked Then
            table1.Rows(1).Item("subject_data") = "高中"

        ElseIf ColledgeRadio.Checked Then
            table1.Rows(1).Item("subject_data") = "大學"

        ElseIf GraduateRadio.Checked Then
            table1.Rows(1).Item("subject_data") = "研究生"

        End If

        For i As Integer = 1 To table1.Rows.Count
            table1.Rows(i - 1).Item("osn") = i

            table1.Rows(i - 1).Item("rnds") = Rnd()
        Next


        Session("stem") = table1

        Session("nowpage") = 1

        Response.Redirect("D4.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Session("Ltext") = Nothing
            Session("Rtext") = Nothing
            Session("stem") = Nothing

            Session("nowpage") = Nothing
            Session("optcount") = Nothing
            Session("allpage") = Nothing

        End If
    End Sub
End Class