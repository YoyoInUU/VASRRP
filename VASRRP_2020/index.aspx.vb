Imports myUtilityv4.LPT

Partial Class index
    Inherits System.Web.UI.Page
    Protected Sub btn_Click(Object sender, EventArgs e)
    {
        Timer.Enabled = True;//開始計時
        e.Visible = False;//隱藏Button
    }
    End Sub
End Class