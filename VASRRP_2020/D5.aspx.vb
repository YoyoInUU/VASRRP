Imports myUtilityv4.LPT



Partial Class D5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Not Session("stem") Is Nothing Then
                Dim stemt As System.Data.DataTable

                stemt = Session("stem")
                ' If stemt.Columns.IndexOf("rnds") = 0 Then
                '   Response.Redirect("Default.aspx")
                'End If

                Dim allpages As Integer
                '  optcounts = Session("optcount")
                allpages = Session("allpage")

                Dim nowpage As Integer = 1

                'If Not Session("nowpage") Is Nothing Then
                '    nowpage = Session("nowpage")
                '    nowpages.Text = nowpage
                'Else
                '    nowpage = 1
                'End If

                nowpage = Request("p")
                nowpage = Session("nowpage")


                ' Try
                loadoption(stemt, nowpage)
                '  Catch ex As Exception
                '  Response.Redirect("Default.aspx")
                ' End Try
            Else
                Response.Redirect("Default.aspx")

            End If

            '   Lanchor.Text = Session("Ltext")
            '    Ranchor.Text = Session("Rtext")



        End If

    End Sub



    Sub loadoption(ByVal stem As System.Data.DataTable, ByVal nowpage As Integer)



        Ltext.Text = stem.Rows((nowpage - 1) * 5 + 0).Item("Questions")
        Lanchor.Text = stem.Rows((nowpage - 1) * 5 + 0).Item("Left anchor")
        Ranchor.Text = stem.Rows((nowpage - 1) * 5 + 0).Item("Right anchor")

        stem.DefaultView.RowFilter = "osn >" & (nowpage - 1) * 5 + 0 & " and osn <=" & (nowpage - 1) * 5 + 5 & ""
        stem.DefaultView.Sort = "rnds asc"
        Dim stem2 As System.Data.DataTable = stem.DefaultView.ToTable()

        stem.DefaultView.RowFilter = ""
        stem.DefaultView.Sort = ""

        Session("stem2") = stem2



        Ln1.Text = stem2.Rows(0).Item("The Content Of Items")
        Ln2.Text = stem2.Rows(1).Item("The Content Of Items")
        Ln3.Text = stem2.Rows(2).Item("The Content Of Items")
        Ln4.Text = stem2.Rows(3).Item("The Content Of Items")
        Ln5.Text = stem2.Rows(4).Item("The Content Of Items")


        HF_osn1.Value = stem2.Rows(0).Item("osn")
        HF_osn2.Value = stem2.Rows(1).Item("osn")
        HF_osn3.Value = stem2.Rows(2).Item("osn")
        HF_osn4.Value = stem2.Rows(3).Item("osn")
        HF_osn5.Value = stem2.Rows(4).Item("osn")


        GridView1.DataSource = Session("stem")
        GridView1.DataBind()


        GridView2.DataSource = stem2
        GridView2.DataBind()



    End Sub

    Protected Sub Bun_submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Bun_submit.Click

        Dim nowpages As Integer = Session("nowpage")
        Dim stemt As System.Data.DataTable = Session("stem")


        Dim checkrow() As Data.DataRow = stemt.Select("osn='" & nowpages * 5 & "'")

        If IsDBNull(checkrow(0)("score")) Then



            Dim CRow1() As Data.DataRow = stemt.Select("osn='" & HF_osn1.Value & "'")
            Dim CRow2() As Data.DataRow = stemt.Select("osn='" & HF_osn2.Value & "'")
            Dim CRow3() As Data.DataRow = stemt.Select("osn='" & HF_osn3.Value & "'")
            Dim CRow4() As Data.DataRow = stemt.Select("osn='" & HF_osn4.Value & "'")
            Dim CRow5() As Data.DataRow = stemt.Select("osn='" & HF_osn5.Value & "'")


            CRow1(0)("score") = xbox1.Text
            CRow2(0)("score") = xbox2.Text
            CRow3(0)("score") = xbox3.Text
            CRow4(0)("score") = xbox4.Text
            CRow5(0)("score") = xbox5.Text

            CRow1(0)("time_stamp") = DateTime.Now
            CRow2(0)("time_stamp") = DateTime.Now
            CRow3(0)("time_stamp") = DateTime.Now
            CRow4(0)("time_stamp") = DateTime.Now
            CRow5(0)("time_stamp") = DateTime.Now

            ' GridView1.DataSource = Session("stem")
            'GridView1.DataBind()


            xbox1.Text = "-1"
            xbox2.Text = "-1"
            xbox3.Text = "-1"
            xbox4.Text = "-1"
            xbox5.Text = "-1"



            If Session("allpage") > nowpages Then
                Session("nowpage") = Session("nowpage") + 1
                Response.Redirect("D5.aspx")
            Else
                Response.Redirect("record.aspx")
            End If
        End If

    End Sub
End Class
