<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditCardPayment.aspx.cs" Inherits="Assignment.CreditCardPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="css/jAlert-v4.css" />
    <script src="js/jAlert-v4.js"></script>
    <script src="js/jAlert-functions.js"></script>
    <style type="text/css">
        body {
            background: url('http://www.demo.amitjakhu.com/login-form/images/bg.png');
        }
        .auto-style3 {
            width: 547px;
        }
        .auto-style4 {
            width: 847px;
        }
        .auto-style6 {
            width: 143px;
        }
        .auto-style7 {
            width: 145px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div>
    
        <h1>Credit Card Transaction</h1>
        <hr />
    
            <table style="width:46%; height: 105px;">
                <tr>
                    <td colspan="2" style="background-color: #333333; color: #FFFFFF;" aria-hidden="True"><b>Destination</b></td>
                    <td style="background-color: #333333; color: #FFFFFF;" aria-hidden="True"><b>Price:&nbsp;&nbsp; </b></td>
                </tr>
                <tr>
                    <td class="auto-style6" style="background-color: #CCCCCC" aria-hidden="True">From:&nbsp; </td>
                    <td style="background-color: #CCCCCC" class="auto-style7" aria-hidden="True">
                        To:
                    </td>
                    <td style="background-color: #CCCCCC" aria-hidden="True">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" aria-hidden="True">
            <asp:Label ID="lblFrom" runat="server" Text="[lblFrom]"></asp:Label>
                    </td>
                    <td class="auto-style7" aria-hidden="True"> <asp:Label ID="lblTo" runat="server" Text="[lblTo]"></asp:Label>
                    </td>
                    <td aria-hidden="True"> RM<asp:Label ID="lblPrice" runat="server" Text="[lblPrice]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #CCCCCC; text-align: right;" colspan="2" aria-hidden="True">Total Amount:</td>
                    <td style="background-color: #CCCCCC;" class="auto-style7" aria-hidden="True"> RM<asp:Label ID="lblTotal" runat="server" Text="[lblTotal]"></asp:Label>
                    </td>
                </tr>
            </table>
        <hr /><br />
        <table style="width:59%; height: 74px;">
            <tr>
                <td class="auto-style3" style="background-color: #66FF66"><b>Card Type:</b>&nbsp;&nbsp;</td>
                <td class="auto-style4" style="background-color: #66FF66"><asp:RadioButtonList ID="rblCardType" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblCardType_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem>Visa</asp:ListItem>
            <asp:ListItem>Master</asp:ListItem>
        </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="background-color: #CCFFCC"><b aria-hidden="False" aria-live="off">Card Number:</b></td>
                <td class="auto-style4" style="background-color: #CCFFCC">
                    <asp:TextBox ID="txtCardNumber" runat="server" Width="167px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FieldValidatorCardNumber" runat="server" ErrorMessage="Card Number is Required" ControlToValidate="txtCardNumber" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorCardNumber" runat="server" ErrorMessage="Card Number must be digit" ControlToValidate="txtCardNumber" Operator="DataTypeCheck" 
                        Type="String" ForeColor="Red"></asp:CompareValidator>
                    <asp:RegularExpressionValidator ID="ExpressionValidatorCardNumber" runat="server" ErrorMessage="Visa first digit must be 4 / Master first digit must be 5" ForeColor="Red" Display="None"
                        ControlToValidate="txtCardNumber"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorCardNumber" runat="server" ErrorMessage="Card Number must be exactly 14 digit" ForeColor="Red" Display="None" ValidationExpression="\d{14}"
                        ControlToValidate="txtCardNumber"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="background-color: #66FF66"><b>Serial Number:</b></td>
                <td class="auto-style4" style="background-color: #66FF66">
                    <asp:TextBox ID="txtSerial" runat="server" Width="48px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FieldValidatorSerial" runat="server" ErrorMessage="Serial Number is required" ControlToValidate="txtSerial" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorSerial" runat="server" ControlToValidate="txtSerial" ErrorMessage="Serial Number must be a digit" ForeColor="Red" Operator="DataTypeCheck" 
                        Type="Integer" Display="None"></asp:CompareValidator>
                    <asp:RegularExpressionValidator ID ="RegularExpressionValidatorSerial" runat="server" ErrorMessage="Must be exactly 3 digit" ControlToValidate="txtSerial" ForeColor="Red"
                        ValidationExpression="\d{3}" Display="None"></asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="background-color: #CCFFCC"><b>Expired Date</b>:</td>
                <td class="auto-style4" style="background-color: #CCFFCC">
                    <asp:DropDownList ID="ddlMonth" runat="server">
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
&nbsp;<asp:DropDownList ID="ddlYear" runat="server">
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                        <asp:ListItem>2022</asp:ListItem>
                        <asp:ListItem>2023</asp:ListItem>
                        <asp:ListItem>2024</asp:ListItem>
                        <asp:ListItem>2025</asp:ListItem>
                        <asp:ListItem>2026</asp:ListItem>
                        <asp:ListItem>2027</asp:ListItem>
                        <asp:ListItem>2028</asp:ListItem>
                        <asp:ListItem>2029</asp:ListItem>
                        <asp:ListItem>2030</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            </table>
        <br />
        <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" />

        <br />
        &nbsp;&nbsp;<asp:Button ID="btnPay" runat="server" Text="Confirm Pay" Width="130px" OnClick="btnPay_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" style="margin-left: 0px" Text="Cancel" Width="130px" OnClick="btnCancel_Click" />
        &nbsp;&nbsp; 
        <br />
        <hr /><br />
        <h1>PalPal Transaction</h1>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://www.paypal.com">Go to PayPal</asp:HyperLink>
        </p>
        </div>
    </form>
</body>
</html>
