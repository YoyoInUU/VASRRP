Imports System.IO
Imports myUtilityv4.LPT
'Imports Microsoft.Office.Interop

Partial Class record
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Not Session("stem") Is Nothing Then

                Dim sem As System.Data.DataTable = Session("stem")

                If sem.Columns.IndexOf("rnds") > 0 Then
                    sem.Columns.Remove("rnds")
                End If


                'Save records (Note: this is the original functionality of `save` button))
                Dim sqlgo As New sqlprocess

                Dim ms As IO.MemoryStream = sqlgo.RenderDataTableToExcel(Session("stem"), "record")
                Dim milliseconds = DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss")


                System.Diagnostics.Debug.WriteLine(milliseconds)

                Dim fs As FileStream = New FileStream(AppDomain.CurrentDomain.BaseDirectory + "\Records_files\" + milliseconds + ".xlsx", FileMode.OpenOrCreate)


                ms.WriteTo(fs)

                ms.Close()
                fs.Close()


            End If

        End If


    End Sub


End Class
