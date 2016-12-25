<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateNewDriver.aspx.cs" Inherits="Assignment.CreateNewDriver" %>

<%@ Register TagPrefix="Navigation" TagName="navCtr" Src="~/VerticalNavigation.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../css/main.css" />
    <link href="../css/styleLogin.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/jAlert-v4.css" />
    <script src="../js/jAlert-v4.js"></script>
    <script src="../js/jAlert-functions.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <Navigation:navCtr ID="ctlNav" runat="server" />
        <div style="margin:80px 0px 0px 280px;width: 1000px">
        <h3>Create New Driver</h3>
        <div class="row uniform">
            <div class="5u 12u(xsmall)">
                <asp:TextBox ID="txtDriverName" runat="server" placeholder="Driver's Name"></asp:TextBox>
            </div>
            <div class="5u 12u(xsmall)">
                <asp:TextBox ID="txtDriverContact" runat="server" placeholder="Contact Number (xxx-xxxxxxx)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDriverContact" ValidationExpression="\d{3}-\d{7}" ErrorMessage="*Contact Number invalid" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row uniform">
            <div class="5u 12u(xsmall)" style="margin-top: -2em">
                <asp:TextBox ID="txtDriverIC" runat="server" placeholder="IC Number (xxxxxx-xx-xxxx)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDriverIC" ValidationExpression="([0-9][0-9])((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\-([0-9][0-9])\-([0-9][0-9][0-9][0-9])" ErrorMessage="IC Number invalid" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="5u 12u(xsmall)" style="margin-top: -2em">
                <asp:TextBox ID="txtExpiredLicence" runat="server" placeholder="Expiry Date of Driving Licence (xx-xx-xxxx)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtExpiredLicence" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" ErrorMessage="*Date invalid" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row uniform">
            <div class="5u 12u(xsmall)" style="margin-top: -2em">
                <asp:TextBox ID="txtDriverEmail" runat="server" placeholder="Email Address (xxx@xxx.xxx)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtDriverEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*E-mail address invalid" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="5u 12u(xsmall)" style="margin-top: -2em">
                <asp:TextBox ID="txtTaxiCompany" runat="server" placeholder="Taxi Company"></asp:TextBox>
            </div>
        </div>
        <div class="row uniform">
            <div class="5u 12u(xsmall)" style="margin-top: -2em">
                <asp:TextBox ID="txtGender" runat="server" placeholder="Male/Female"></asp:TextBox>
            </div>
            <div class="5u 12u(xsmall)" style="margin-top: -2em">
                <asp:TextBox ID="txtDOB" runat="server" placeholder="Date of Birth (xx-xx-xxxx)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDOB" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" ErrorMessage="*Date invalid" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row uniform">
            <div class="12u" style="margin-top: -2em">
                <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-primary" Text="Create" OnClick="btnCreate_Click" />
            </div>
        </div></div>
    </form>
</body>
</html>
