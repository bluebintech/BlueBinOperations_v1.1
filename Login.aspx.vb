Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security

Partial Public Class Login
    Inherits Page
    Protected Sub ValidateUser(sender As Object, e As EventArgs)
        Dim BlueBinUserID As Integer

        Dim constr As String = ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("sp_ValidateBlueBinUser")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UserLogin", Login1.UserName)
                cmd.Parameters.AddWithValue("@Password", Login1.Password)
                cmd.Connection = con
                con.Open()
                BlueBinUserID = Convert.ToInt32(cmd.ExecuteScalar())
                con.Close()
            End Using
            Select Case BlueBinUserID
                Case -1
                    Login1.FailureText = "UserLogin and/or password is incorrect."
                    Exit Select
                Case -2
                    Login1.FailureText = "Account is currently disabled  Please contact BlueBin Support to reactivate."
                    Exit Select
                Case Else
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet)
                    Exit Select
            End Select
        End Using
    End Sub
End Class


