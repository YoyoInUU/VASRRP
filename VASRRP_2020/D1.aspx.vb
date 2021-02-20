Imports myUtilityv4.LPT



Partial Class D6
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Not Session("stem") Is Nothing Then
                Dim stemt As System.Data.DataTable
                stemt = Session("stem")


                If stemt.Columns.IndexOf("rnds") = 0 Then
                    Response.Redirect("default.htm")
                End If

                Dim allpages As Integer
                allpages = Session("allpage")
                Dim nowpage As Integer = 1
                nowpage = Session("nowpage")
                Try
                    loadoption(stemt, nowpage)
                Catch ex As Exception
                    Response.Redirect("default.htm")
                End Try
            Else
                Response.Redirect("default.htm")

            End If

            'Lanchor.Text = Session("Ltext")
            ' Ranchor.Text = Session("Rtext")

        End If
    End Sub


    Sub loadoption(ByVal stem As System.Data.DataTable, ByVal nowpage As Integer)



        Ltext.Text = stem.Rows((nowpage - 1) * 1 + 0).Item("Questions")
        Lanchor.Text = stem.Rows((nowpage - 1) * 1 + 0).Item("Left anchor")
        Ranchor.Text = stem.Rows((nowpage - 1) * 1 + 0).Item("Right anchor")

        stem.DefaultView.RowFilter = "osn >" & (nowpage - 1) * 1 + 0 & " and osn <=" & (nowpage - 1) * 1 + 1 & ""
        stem.DefaultView.Sort = "rnds asc"
        Dim stem2 As System.Data.DataTable = stem.DefaultView.ToTable()

        stem.DefaultView.RowFilter = ""
        stem.DefaultView.Sort = ""

        Session("stem2") = stem2



        Ln1.Text = stem2.Rows(0).Item("The Content Of Items")

        HF_osn1.Value = stem2.Rows(0).Item("osn")

        'GridView1.DataSource = Session("stem")
        'GridView1.DataBind()


        ' GridView2.DataSource = stem2
        ' GridView2.DataBind()



    End Sub

    Protected Sub Bun_submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Bun_submit.Click

        Dim nowpages As Integer = Session("nowpage")
        Dim stemt As System.Data.DataTable = Session("stem")


        Dim checkrow() As Data.DataRow = stemt.Select("osn='" & nowpages * 1 & "'")

        If IsDBNull(checkrow(0)("score")) Then



            Dim CRow1() As Data.DataRow = stemt.Select("osn='" & HF_osn1.Value & "'")


            CRow1(0)("score") = xbox1.Text


            GridView1.DataSource = Session("stem")
            GridView1.DataBind()


            xbox1.Text = "-1"



            If Session("allpage") > nowpages Then
                Session("nowpage") = Session("nowpage") + 1
                Response.Redirect("D1.aspx")
            Else
                Response.Redirect("record.aspx")
            End If
        End If

    End Sub
End Class
