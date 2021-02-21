
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





    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        ' Response.Redirect("Default2.aspx")

        form1.Visible = False
        form2.Visible = True

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
