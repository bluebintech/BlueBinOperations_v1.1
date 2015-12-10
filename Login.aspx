<%@ Page Title="Login Page" Language="VB" AutoEventWireup="true" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BlueBin Login Page</title>


    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="https://bootswatch.com/cerulean/bootstrap.min.css">

</head>

    <body>
    <div style="width: auto; margin: 0 10%;">
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a href="" runat="server" class="navbar-brand" onClick="switchView('Home')">&nbsp;<asp:Image style="display:inline;" ID="Image1" runat="server" Height="20px" ImageUrl="~/img/BlueBin_icon.png" Width="20px" />&nbsp;BlueBin Operations</a>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                </div>
                <div class="navbar-collapse collapse">
                    
                </div>
            </div>
        </div>
<div class="container body-content">


<h2>BlueBin Login</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="LoginForm">
                <div class="form-horizontal">
                        <h4>Please Enter Credentials</h4>
                        <hr />
                        <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="Literal1" />
                            </p>
                        </asp:PlaceHolder>
                        
                    <asp:Login ID = "Login1" runat = "server" OnAuthenticate= "ValidateUser" BorderPadding="5" TitleText=" " TitleTextStyle-HorizontalAlign="Left" DisplayRememberMe="False">
                        <LayoutTemplate>
                            <asp:Table runat="server">
                                            <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server" AssociatedControlID="UserName" ID="UserNameLabel">User Name:</asp:Label>

                                                    </asp:TableCell>
                                               
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" ID="UserName"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="Login1" ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                <asp:TableRow Height="10px"></asp:TableRow>
                                             <asp:TableRow>
                                                    <asp:TableCell><asp:Label runat="server" AssociatedControlID="Password" ID="PasswordLabel">Password:</asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                    <asp:TextBox runat="server" TextMode="Password" ID="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ValidationGroup="Login1" ToolTip="Password is required." ID="PasswordRequired">*</asp:RequiredFieldValidator>
                                                    </asp:TableCell>
                                                 </asp:TableRow>
                                <asp:TableRow Height="10px"></asp:TableRow>
                                            <asp:TableRow>
                                                                                                        <asp:TableCell></asp:TableCell>
                                                <asp:TableCell ForeColor="Red">
                                                    <asp:Literal runat="server" ID="FailureText" EnableViewState="False" ValidateRequestMode="Inherit"></asp:Literal>
                                               </asp:TableCell>
                                             </asp:TableRow>
                                    <asp:TableRow Height="10px"></asp:TableRow>        
                                            <asp:TableRow>

                                                <asp:TableCell>
                                                    <asp:Button runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" ID="LoginButton"></asp:Button>
                                                </asp:TableCell>
                                            </asp:TableRow>
                             </asp:Table>                   
                        </LayoutTemplate>

                    </asp:Login>

                </div>
                
            </section>
        </div>
     </div>
            <hr />
            <footer>
                <p>&copy; <%: DateTime.Now.Year %> - BlueBin.com <br /><span class="version">Version 1.1.20151110</span></p>
            </footer>
</div>
</form>
</div>

    </body>

</html>



      
