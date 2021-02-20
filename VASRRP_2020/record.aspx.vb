Imports myUtilityv4.LPT


Partial Class record
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If Not Session("stem") Is Nothing Then


            Dim sqlgo As New sqlprocess

            Dim ms As System.IO.MemoryStream = sqlgo.RenderDataTableToExcel(Session("stem"), "record")
            Response.AddHeader("Content-Disposition", String.Format("attachment; filename=vasrrp.xls"))
            Response.BinaryWrite(ms.ToArray())
            ms.Close()
            ms.Dispose()
        End If


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Not Session("stem") Is Nothing Then

                Dim sem As System.Data.DataTable = Session("stem")

                If sem.Columns.IndexOf("rnds") > 0 Then
                    sem.Columns.Remove("rnds")
                End If


                GridView1.DataSource = sem
                GridView1.DataBind()


            End If

        End If


    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("default.aspx")
    End Sub
End Class
