<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePersonalForm.aspx.cs" Inherits="Assignment.UpdatePersonalForm" %>
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
        <Navigation:navCtr ID="ctlNav" runat="server"/>
        <table style="margin:130px 0 0 100px;width:1200px">
            <tr style="border-bottom: 2px solid rgb(244, 244, 244); border-top: 2px solid rgb(244, 244, 244);">
                <td  style="width:640px">
                        <h3>Update Personal Information</h3>
                            <div class="row uniform">
			                    <div class="6u">
                                    <asp:TextBox ID="txtContactNumber" runat="server" placeholder="Contact Number (xxx-xxxxxxx)"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContactNumber" ValidationExpression="\d{3}-\d{7}" ErrorMessage="*Contact Number invalid" ForeColor="Red"></asp:RegularExpressionValidator>
			                    </div>
		                    </div>
                            <div class="row uniform">
			                    <div style="margin-top:-1.5em" class="6u">
                                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" CssClass="form-control"></asp:TextBox>
                                </div>
		                    </div>
                            <div class="row uniform">
			                    <div class="12u">
                                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdate_Click" />
                                </div>
		                    </div>
                    </td>
                <td>
                        <h3>Change Password</h3>
                            <asp:ChangePassword ID="ChangePassword2" runat="server" OnContinueButtonClick="ChangePassword2_ContinueButtonClick" >
                                <ChangePasswordTemplate>
                            <div class="row uniform">
			                    <div class="8u" style="margin-top:-1.5em">
                                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" placeholder="Old Password"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="CurrentPassword" ValidationExpression="^[a-zA-Z0-9\s]{6,20}$" ErrorMessage="*Minimum Password length : 6" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
		                    </div>
                                    <div class="row uniform">
			                    <div class="8u" style="margin-top:-1.5em" >
                                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" placeholder="New Password"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="NewPassword" ValidationExpression="^[a-zA-Z0-9\s]{6,20}$" ErrorMessage="*Minimum Password length : 6" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
		                    </div>
                            <div class="row uniform">
			                    <div class="8u" style="margin-top:-1.5em">
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" placeholder="Confirm New Password" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" ErrorMessage="Comfirm Password must be same as Password" ForeColor="Red"></asp:CompareValidator>
			                    </div>
		                    </div>
                            <div class="row uniform">
			                    <div class="12u" style="margin-top:-2em">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    <asp:Button ID="ChangePasswordPushButton" runat="server" CssClass="btn btn-primary" CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword1" />
                                </div>
		                    </div>
                                    </ChangePasswordTemplate>
        </asp:ChangePassword>
                    </td>
            </tr>
        </table>
    </form>
</body>
</html>
