Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Configuration

Partial Class Resources
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack() Then
            GridViewBlueBinResource.DataBind()
        End If
    End Sub
    Protected Sub BlueBinResource_RowCommand(ByVal sender As System.Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName = "ResourceInsert" Then
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            Dim ad As New SqlDataAdapter()
            Dim cmd As New SqlCommand()
            Dim txtLastName As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("LastName"), TextBox)
            Dim txtFirstName As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("FirstName"), TextBox)
            Dim txtMiddleName As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("MiddleName"), TextBox)
            Dim txtLogin As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Login"), TextBox)
            Dim txtEmail As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Email"), TextBox)
            Dim txtTitle As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Title"), TextBox)
            Dim txtPhone As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Phone"), TextBox)
            Dim txtCell As TextBox = DirectCast(GridViewBlueBinResource.FooterRow.FindControl("Cell"), TextBox)

            cmd.Connection = conn
            cmd.CommandText = "exec sp_InsertBlueBinResource 
                                '" + txtLastName.Text & "',
                                    '" + txtFirstName.Text & "',
                                        '" + txtMiddleName.Text & "',
                                                    '" + txtLogin.Text & "',
                                                        '" + txtEmail.Text & "',
                                                                    '" + txtPhone.Text & "',
                                                                            '" + txtCell.Text & "',
                                                                                    '" + txtTitle.Text & "'"
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
            GridViewBlueBinResource.DataBind()
        End If
    End Sub



End Class