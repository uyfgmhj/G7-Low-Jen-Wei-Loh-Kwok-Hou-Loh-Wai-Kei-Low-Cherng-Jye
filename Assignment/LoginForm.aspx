<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Assignment.LoginForm" %>
<%@ Register TagPrefix="Login" TagName="Header" Src="SignupAndLogin.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/styleLogin.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body style="background: url('http://www.demo.amitjakhu.com/login-form/images/bg.png');">
    <Login:Header ID="ctlHeader" runat="server"/>
    <form id="form1" runat="server" class="login-form" style="margin: 120px 0px 0px 530px;">
        <div>
            <asp:Login ID="Login1" runat="server" OnLoggedIn="login" ForeColor="Red">
                <LayoutTemplate>
                    <div class="header">
                        <h1>Login</h1>
                        <span>All field are required</span>
                    </div>
                    <div class="content">
                        <asp:TextBox class="input username" ID="UserName" runat="server" placeholder="Username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                        <div class="user-icon"></div>
                        <asp:TextBox class="input password" ID="Password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                        <div class="pass-icon"></div>
                    </div>
                    <div class="footer">
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        <asp:Button class="button" ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RegisterForm.aspx" CssClass="signup">Sign Up</asp:HyperLink>
                    </div>
                    </div>
    </div>                           
                </LayoutTemplate>
            </asp:Login>
        </div>
    </form>
</body>
</html>
