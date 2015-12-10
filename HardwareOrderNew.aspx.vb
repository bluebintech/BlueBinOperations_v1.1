
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net.Mail

Partial Class HardwareOrderNew
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CurrentTimeTB.Text = DateTime.Now.ToString("MM/dd/yyyy")
    End Sub

    Protected Sub HardwareOrderCancel_Click(sender As Object, e As EventArgs) Handles HardwareOrderCancel.Click
        Response.Redirect("~/HardwareOrder")
    End Sub

    Dim mail As New MailMessage()

    Private Sub HardwareOrderSubmitEmail_Click(ByVal sender As System.Object,
        ByVal e As System.EventArgs) Handles HardwareOrderSubmitEmail.Click
        Dim SmtpServer As New SmtpClient()
        SmtpServer.Credentials = New Net.NetworkCredential("BlueBinHardware@gmail.com", "BBT2015!")
        SmtpServer.Port = 587
        SmtpServer.Host = "smtp.gmail.com"
        SmtpServer.EnableSsl = True

        mail = New MailMessage()
        Dim addr() As String = EmailTB.Text.Split(",")
        Try
            mail.From = New MailAddress(EmailTB.Text,
                "BlueBin Hardware Order - " & CustomerTB.Text, System.Text.Encoding.UTF8)
            Dim i As Byte
            For i = 0 To addr.Length - 1

            Next
            'mail.[To].Add(New MailAddress("gbutler@bluebin.com"))
            mail.[To].Add(New MailAddress("dhagan@bluebin.com"))
            mail.CC.Add(New MailAddress("gbutler@bluebin.com"))
            mail.Subject = "New Hardware Order - " & CustomerTB.Text
            mail.IsBodyHtml = True
            mail.Body = "<html>
                            <head>
                                <style>
                                    table {
                                              width: 40%;
                                              border: 1px solid #000;
                                            }

                                            th, td {
                                              width: 50%;
                                              text-align: left; 
                                              vertical-align: top; 
                                              border: 1px solid #000;
                                              border-collapse: collapse;
                                              padding: 0.5em;
                                            }
                                            th {
                                              background: #eee;
                                            }
                                            .qty th td {
                                               width: 10px;
                                </style>    
                            </head>
                            <body>
                            <b>Date:</b> " & CurrentTimeTB.Text.ToString() &
                            "<br /><b>Customer:</b> " & CustomerTB.Text &
                            "<br /><b>From:</b> " & NameTB.Text &
                            "<br /><b>Phone:</b> " & PhoneTB.Text &
                            "<br /><b>Email:</b> " & EmailTB.Text &
                                "<br /><br />
                                <table>
                                <tr>
                                    <th>Item</th>
                                    <th class=""qty"">QTY</th>
                                </tr>" &
                                "<tr><td>" & Item1DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item1DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item2DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item2DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item3DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item3DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item4DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item4DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item5DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item5DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item6DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item6DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item7DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item7DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item8DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item8DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item9DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item9DDL.SelectedValue.ToString() & "</td></tr>" &
                                "<tr><td>" & Item10DD.SelectedValue.ToString() & "</td><td class=""qty"">" & Item10DDL.SelectedValue.ToString() & "</td></tr></table>" &
                                "<br /><b>Additional Details:</b> " & DetailsTB.Text &
                        "</body></html>"
            'mail.Body = "Date: " & CurrentTimeTB.Text & ", From: " & NameTB.Text
            mail.DeliveryNotificationOptions =
                    DeliveryNotificationOptions.OnFailure
            mail.ReplyToList.Add(EmailTB.Text)
            SmtpServer.Send(mail)
        Catch ex As Exception
            MsgBox(ex.ToString())
        End Try
        Response.Redirect("~/HardwareOrderConfirm")
    End Sub


End Class