<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TotalBookReport.aspx.cs" Inherits="Assignment.Report.TotalBookReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/fonts/fontAwesome/font-awesome.css" rel="stylesheet" />
    <title></title>
    <style>
        @import url(../css/font/rye/Rye.css);

        body {
            background: #eee;
            margin: 0;
            padding: 0;
        }

        .banner {
            display: block;
            width: 80%;
            margin-left: 100px;
            height: 60px;
            border: 1px solid #8a1;
            font: normal 30px/60px 'Rye';
            text-align: center;
            color: #451;
            background: #9b2;
            box-shadow: 0 0 30px rgba(0,0,0,.15) inset, 0 6px 10px rgba(0,0,0,.15);
        }
        .gridview td, .gridview th {
            padding: 10px;
        }
        #cancel {
           cursor:pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <span class="fa fa-close fg-red fa-2x" id="cancel" onclick="window.location.href='../Maintenance/CreateNewDriver.aspx'"></span>
        <h1 class="banner">Total Book Report</h1>
        <div style="padding: 0px 100px 100px 300px; position: fixed">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4"
                ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" DataKeyNames="MemberID" AllowPaging="True" CssClass="gridview">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:TemplateField HeaderText="Count Of Cancel" SortExpression="Column1">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Column1") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Column1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Member.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient"
            SelectCommand="Select * from Booking Where MemberID=@MemberID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="MemberID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div style="padding: 0px 0px 0px 650px;">
            <asp:DataList ID="DataList1" runat="server" BackColor="White"
                CssClass="gridview" BorderColor="black" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" DataKeyField="MemberID" DataSourceID="SqlDataSource2">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <ItemStyle BackColor="White" ForeColor="#330099" />
                <ItemTemplate>
                    Origin Address:
                    <br />
                    <asp:Label ID="originLocation" runat="server" Text='<%# Eval("OriginName") %>' ForeColor="Black" />
                    <br />
                    Destination Address:
                    <br />
                    <asp:Label ID="destinationLocation" runat="server" Text='<%# Eval("DestinationName") %>' ForeColor="Black" />
                    <br />
                    Booking Date:
                    <br />
                    <asp:Label ID="bookingDate" runat="server" Text='<%#String.Format("{0:dd MMM yyyy,t}",Eval("BookingDate")) %>' ForeColor="Black" />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Member.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="Select Booking.MemberID,Name, Count(BookingId) From Member INNER JOIN Booking On Booking.MemberID=Member.MemberID where BookingStatus='Paid' Group By Name,Booking.MemberID"></asp:SqlDataSource>
    </form>
</body>
</html>
