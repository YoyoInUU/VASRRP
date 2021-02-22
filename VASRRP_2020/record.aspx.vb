Imports System.IO
Imports myUtilityv4.LPT
'Imports Microsoft.Office.Interop

Partial Class record
    Inherits System.Web.UI.Page

    Protected Sub Save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Save.Click

        If Not Session("stem") Is Nothing Then


            '  Dim app As New Excel.Application 'app 是操作 Excel 的變數
            ' Dim worksheet As Excel.Worksheet 'Worksheet 代表的是 Excel 工作表
            ' Dim workbook As Excel.Workbook 'Workbook 代表的是一個 Excel 本體


            ' workbook = app.Workbooks.Open("檔案路徑") '開啟一張已存在的 Excel 檔案


            '  workbook.Save() '儲存動作
            '  workbook.Close() '關閉檔案
            '  app.Quit() '結束操作



            Dim sqlgo As New sqlprocess

            Dim ms As IO.MemoryStream = sqlgo.RenderDataTableToExcel(Session("stem"), "record")
            Dim milliseconds = DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss")


            System.Diagnostics.Debug.WriteLine(milliseconds)

            Dim fs As FileStream = New FileStream(AppDomain.CurrentDomain.BaseDirectory + "\Records_files\" + milliseconds + ".xls", FileMode.OpenOrCreate)


            ms.WriteTo(fs)

            ms.Close()
            fs.Close()
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


End Class
