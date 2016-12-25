<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverInformation.aspx.cs" Inherits="Assignment.DriverInformation" %>

<%@ Register TagPrefix="Navigation" TagName="navCtr" Src="~/VerticalNavigation.ascx" %>
<!DOCTYPE html>
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
        <h2 style="margin:10px 0 10px 220px;">Driver Information</h2>
        <div style="margin-left:220px;width: 966px;height:500px;overflow-y:auto">
        <div class="row uniform">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                CellPadding="10" CellSpacing="5" DataKeyNames="DriverId" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="DriverId" HeaderText="Driver Id" InsertVisible="False" ReadOnly="True" SortExpression="DriverId" />
                    <asp:BoundField DataField="DriverName" HeaderText="Driver Name" SortExpression="DriverName" />
                    <asp:BoundField DataField="DriverEmail" HeaderText="Driver Email" SortExpression="DriverEmail" />
                    <asp:BoundField DataField="DriverIC" HeaderText="Driver IC" SortExpression="DriverIC" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Driver Contact" SortExpression="DriverContact" />
                    <asp:BoundField DataField="ExpiredLicence" HeaderText="Expired Licence" SortExpression="ExpiredLicence" />
                    <asp:BoundField DataField="TaxiCompany" HeaderText="Taxi Company" SortExpression="TaxiCompany" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT [DriverId], [DriverName], [DriverEmail], [DriverIC], [PhoneNumber], [ExpiredLicence], [TaxiCompany], [Gender] FROM [Driver]"></asp:SqlDataSource>
        </div>
        <div class="row uniform" id="updateDriverDetails" runat="server">
            <div class="4u 12u(xsmall)">
                <asp:TextBox ID="txtNewDriverName" runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div class="4u 12u(xsmall)">
                <asp:TextBox ID="txtNewLicence" runat="server" placeholder="Expiry Date of Driving Licence (xx-xx-xxxx)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtNewLicence" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" ErrorMessage="*Date invalid" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row uniform" id="updateDriverDetails2" runat="server">
            <div class="4u 12u(xsmall)" style="margin-top: -2em">
                <asp:TextBox ID="txtNewContact" runat="server" placeholder="New Contact Number (xxx-xxxxxxx)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtNewContact" ValidationExpression="\d{3}-\d{7}" ErrorMessage="Contact Number invalid" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="4u 12u(xsmall)" style="margin-top: -2em">
                <asp:TextBox ID="txtNewTaxiCompany" runat="server" placeholder="New Taxi Company"></asp:TextBox>
            </div>
        </div>
        <div class="row uniform" id="updateDriverDetails3" runat="server">
            <div class="12u" style="margin-top: -2em">
                <asp:Button ID="UpdateDriver" runat="server" CssClass="btn btn-primary" Text="Update Driver" OnClick="UpdateDriver_Click" />
            </div>
        </div>
        </div>
    </form>
</body>
</html>
