<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="Assignment.RegisterForm" %>
<%@ Register TagPrefix="Login" TagName="Header" Src="SignupAndLogin.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Form</title>
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800' rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/styleRegister.css" rel="stylesheet" type="text/css" />
    <link href="css/fonts/fontAwesome/font-awesome.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/jAlert-v4.css" />
    <script src="js/jAlert-v4.js"></script>
    <script src="js/jAlert-functions.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <Login:Header ID="ctlHeader" runat="server"/>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="margin: 100px 0px 0px 320px;">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Registration Form <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="lblusername" runat="server" Text="Username" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtpassword" ValidationExpression="^[a-zA-Z0-9\s]{6,20}$" ErrorMessage="*Minimum Password length : 6" ForeColor="Red"></asp:RegularExpressionValidator>                   
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirmpassword" ErrorMessage="*Comfirm Password must be same as Password" ForeColor="Red"></asp:CompareValidator>                   
                            </div>
                        </div>                    
                        <div class="form-group">
                            <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example:abc@hotmail.com"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*E-mail address invalid" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblName" runat="server" Text="Name" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblIC" runat="server" Text="IC Number" CssClass="col-lg-2 control-label" ></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtIC" runat="server" CssClass="form-control" placeholder="example:xxxxxx-xx-xxxx"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtIC" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtIC" ValidationExpression="([0-9][0-9])((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\-([0-9][0-9])\-([0-9][0-9][0-9][0-9])" ErrorMessage="IC Number invalid" ForeColor="Red"></asp:RegularExpressionValidator>                            
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblContact" runat="server" Text="Contact" CssClass="col-lg-2 control-label"></asp:Label>                          
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="example:xxx-xxxxxxx"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContact" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtContact" ValidationExpression="\d{3}-\d{7}" ErrorMessage="*Contact Number invalid" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>                       
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rbtnGender" runat="server">
                                            <asp:ListItem Selected="True">Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblDOB" runat="server" Text="Date of Birth" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:Calendar ID="calDOB" runat="server" BackColor="White" BorderColor="#999999" 
                                     CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                    <NextPrevStyle VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#808080" />
                                    <SelectedDayStyle BackColor="#6699FF" Font-Bold="True" ForeColor="White" />
                                    <SelectorStyle BackColor="#0066FF" />
                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                    <TodayDayStyle BackColor="#666666" ForeColor="Black" />
                                    <WeekendDayStyle BackColor="#CCFFFF" />
                                </asp:Calendar>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="col-lg-2 control-label"></asp:Label>
                                               
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:HyperLink ID="Cancel" runat="server" CssClass="btn btn-warning" NavigateUrl="~/LoginForm.aspx">Cancel</asp:HyperLink>                              
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
