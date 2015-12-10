Imports System.Data
Imports System.Data.SqlClient

Partial Class HardwareOrder
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles NewHardware.Click
        Response.Redirect("~/HardwareOrderNew")
        GridView1.DataBind()
    End Sub


End Class