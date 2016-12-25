<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineReceipt.aspx.cs" Inherits="Assignment.OnlineReceipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background: url('http://www.demo.amitjakhu.com/login-form/images/bg.png');
        }
        .auto-style1 {
            width: 198px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div><b style="font-size: x-large"><center>
    
        Online Receipt<br />
        </center></b><br />
        <center>
    
            <table style="width:42%; height: 84px;">
                <tr>
                    <td colspan="2" style="background-color: #333333; color: #FFFFFF;"><b>Booking Information</b></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: #CCCCCC">Destination From:&nbsp; </td>
                    <td style="background-color: #CCCCCC">
            <asp:Label ID="lblFrom" runat="server" Text="[lblFrom]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Destination To: </td>
                    <td> <asp:Label ID="lblTo" runat="server" Text="[lblTo]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: #CCCCCC">Price:&nbsp;&nbsp; </td>
                    <td style="background-color: #CCCCCC;"> RM<asp:Label ID="lblPrice" runat="server" Text="[lblPrice]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="color: #FFFFFF; background-color: #333333"><b>Taxi Information</b></td>
                </tr>
                <tr>
                    <td style="background-color: #CCCCCC">Taxi Plate Number: </td>
                    <td style="background-color: #CCCCCC">
            <asp:Label ID="lblPlateNumber" runat="server" Text="[lblPlateNumber]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Driver&#39;s Name: </td>
                    <td> <asp:Label ID="lblDriverName" runat="server" Text="[lblDriverName]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #CCCCCC">Estimated Waiting Time:</td>
                    <td style="background-color: #CCCCCC">
            <asp:Label ID="lblWaitingTime" runat="server" Text="[lblWaitingTime]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="color: #FFFFFF; background-color: #333333"><b>Payment Information</b></td>
                </tr>
                <tr>
                    <td style="background-color: #CCCCCC">Payment Date:&nbsp; </td>
                    <td style="background-color: #CCCCCC">
            <asp:Label ID="lblPaymentDate" runat="server" Text="[lblPaymentDate]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Payment Time:</td>
                    <td>
            <asp:Label ID="lblPaymentTime" runat="server" Text="[lblPaymentTime]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #CCCCCC">Total Amount:&nbsp; </td>
                    <td style="background-color: #CCCCCC">
                        RM<asp:Label ID="lblTotalAmount" runat="server" Text="[lblTotalAmount]"></asp:Label>
                    </td>
                </tr>
            </table></center>
        <p><center>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/HomePage.aspx">Logout</asp:HyperLink>
        </center></p>
        </div>
    </form>
</body>
</html>

