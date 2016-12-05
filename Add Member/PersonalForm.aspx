<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalForm.aspx.cs" Inherits="Assignment.PersonalForm" %>
<%@ Register TagPrefix="Navigation" TagName="navCtr" Src="~/VerticalNavigation.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery.js" type="text/javascript"></script>
    <link href="../css/styleLogin.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/jAlert-v4.css" />
    <script src="../js/jAlert-v4.js"></script>
    <script src="../js/jAlert-functions.js"></script>
    <style>
	table tbody tr:nth-child(2n + 1) {
		background-color: #fafafa;
	}
        body {
            background-color: rgb(203, 235, 237)
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <Navigation:navCtr ID="ctlNav" runat="server"/>
        <div class="container" style="width: 800px;margin: 70px 0px 0px 300px;">
			<h3>Personal Information</h3>
        <table>
            <tr>
                <td class="auto-style3">Name</td>
                <td>
                    <asp:Label ID="lblName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">IC Number</td>
                <td>
                    <asp:Label ID="lblIC" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Gender</td>
                <td>
                    <asp:Label ID="lblGender" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">E-mail Address</td>
                <td>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Contact Number</td>
                <td>
                    <asp:Label ID="lblContact" runat="server"></asp:Label>
                </td>

            </tr>
            <tr>
                <td class="auto-style3">Date of Birth</td>
                <td>
                    <asp:Label ID="lblDOB" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Address</td>
                <td>
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </td>
            </tr>
        </table>				
        <div class="form-group">
                <div class="col-lg-10">
                    <asp:Button ID="btnSetting" runat="server" CssClass="btn btn-primary" Text="Setting" OnClick="btnSetting_Click" />
                </div>
        </div>
    </div>
    </form>
</body>
</html>
