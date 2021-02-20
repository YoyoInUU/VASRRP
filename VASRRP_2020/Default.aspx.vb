
Imports System.Data
Imports myUtilityv4.LPT
Imports System
Imports System.Text

Partial Class _Default
    Inherits System.Web.UI.Page

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Dim ddstr As String = ""


    '    ddstr = String.Format("d{9}.htm?a={0}&b={1}&c={2}&d={3}&e={4}&f={5}&l={6}&r={7}&t={8}", bcont1.Text, bcont2.Text, bcont3.Text, bcont4.Text, bcont5.Text, bcont6.Text, Lanchor.Text, Ranchor.Text, TB_content.Text, DD_nums.SelectedValue)

    '    Response.Redirect(ddstr)

    'End Sub


    Protected Sub Login1_Authenticate(sender As Object, e As AuthenticateEventArgs)
        e.Authenticated = False
        If sender.UserName = "weifone4122121@gmail.com" & sender.Password = "hay3654518" Then
            e.Authenticated = True
        End If
    End Sub


    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click


        'Session("Ltext") = Lanchor2.Text
        'Session("Rtext") = Ranchor2.Text


        If (fuUpload.HasFile) Then
            ' Dim table As DataTable = NPOI.DataTableRenderToExcel.RenderDataTableFromExcel(fuUpload.FileContent, 1, 0)

            Dim sqlgo As New sqlprocess

            Dim table1 As DataTable = sqlgo.RenderDataTableFromExcel(fuUpload.FileContent, 0, 0)


            Dim p1, p2 As Integer


            p1 = table1.Rows.Count
            p2 = p1 / DD_nums2.SelectedValue


            Session("optcount") = p1
            Session("allpage") = p2


            table1.Columns.Add("score")

            table1.Columns.Add("osn")

            table1.Columns.Add("rnds")

            table1.Columns.Add("time_stamp")


            For i As Integer = 1 To table1.Rows.Count
                table1.Rows(i - 1).Item("osn") = i

                table1.Rows(i - 1).Item("rnds") = Rnd()
            Next


            Session("stem") = table1

            Session("nowpage") = 1

            'Label1.Text = String.Format("p1={0},p2={1},optcoun={2}", p1, p2, DD_nums.SelectedValue)



            ' Response.Redirect("D6.aspx")

            Dim ddstr As String = ""
            ddstr = String.Format("D{0}.aspx", DD_nums2.SelectedValue)

            Response.Redirect(ddstr)

        End If







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
