<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistoryForm.aspx.cs" Inherits="Map.HistoryForm" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/fonts/metro/metro-icons.css" rel="stylesheet" />
    <link href="../css/fonts/fontAwesome/font-awesome.css" rel="stylesheet" />
    <link href="../css/fonts/rye/Rye.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.min.css" />
    <script src="../js/jqueryAlert.js" type="text/javascript"></script>
    <script src="../js/jqueryAlertFunction.js" type="text/javascript"></script>
    <script src="../js/jquery.ui.draggable.js" type="text/javascript"></script>
    <link href="../css/jqueryAlerts.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.24&key=AIzaSyDKHt209oQ6plzVrvA8886OUld4gEdtqhs&libraries=places&callback=initMap" async defer></script>
    <title></title>
    <style>
        html, body, form {
            height: 100%;
            margin: 0;
            padding: 0;
        }
       
        .panel-body {
            padding: 0px;
        }

            .panel-body table tr td {
                padding-left: 15px;
            }

            .panel-body .table {
                margin-bottom: 0px;
            }
        #sideBar {
            background-color: #151718;
            width: 257px;
            height: 100%;
            display: block;
            position: fixed;
            left: -220px;
            top: 0px;
            z-index: 1;
        }

            #sideBar.visible {
                left: 10px;
            }

            #sideBar.active {
                left: 0;
            }
        /* Icon 1 */

        #nav-icon1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: transparent;
            width: 29px;
            height: 35px;
            position: relative;
            margin: 315px 0px 0px -5px;
            -webkit-transform: rotate(0deg);
            -moz-transform: rotate(0deg);
            -o-transform: rotate(0deg);
            transform: rotate(0deg);
            -webkit-transition: .5s ease-in-out;
            -moz-transition: .5s ease-in-out;
            -o-transition: .5s ease-in-out;
            transition: .5s ease-in-out;
            cursor: pointer;
            padding-bottom: 34px;
            top: 0px;
            left: 0px;
        }

            #nav-icon1 span {
                display: block;
                position: absolute;
                width: 5px;
                height: 35px;
                background: #d3531a;
                border-radius: 9px;
                opacity: 1;
                left: 0;
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                transform: rotate(0deg);
                -webkit-transition: .25s ease-in-out;
                -moz-transition: .25s ease-in-out;
                -o-transition: .25s ease-in-out;
                transition: .25s ease-in-out;
            }

                #nav-icon1 span:nth-child(1) {
                    left: 0px;
                }

                #nav-icon1 span:nth-child(2) {
                    left: 10px;
                }

                #nav-icon1 span:nth-child(3) {
                    left: 20px;
                }

            #nav-icon1.open span:nth-child(1) {
                left: 10px;
                -webkit-transform: rotate(135deg);
                -moz-transform: rotate(135deg);
                -o-transform: rotate(135deg);
                transform: rotate(135deg);
            }

            #nav-icon1.open span:nth-child(2) {
                opacity: 0;
                top: -40px;
            }

            #nav-icon1.open span:nth-child(3) {
                left: 10px;
                -webkit-transform: rotate(-135deg);
                -moz-transform: rotate(-135deg);
                -o-transform: rotate(-135deg);
                transform: rotate(-135deg);
            }
        #historyPanel {
            background-color: #4285F4;
            width: 350px;
            left: 0px;
            height: 100%;
            box-shadow: 0px 1px 4px rgba(0,0,0,0.3);
            position: fixed;
            margin-left: 37px;
            z-index: 1;
        }

        #title {
            font: normal 30px/60px 'Rye';
            padding: 0 0 0 10px;
            margin: 0px;
            position: fixed;
        }

        #header {
            height: 55px;
            box-shadow: 0px 1px 4px rgba(0,0,0,0.3);
        }

        #delete {
            margin: 12px 0 0 310px;
            cursor: pointer;
        }

        #displayPanel {
            margin-top: 5px;
            box-shadow: 0px 1px 4px rgba(0,0,0,0.3);
        }

        .location_icon {
            width: 10px;
            float: left;
        }

        .HistoryData.OriginName {
            margin-top: 1px;
            padding-left: 20px;
            word-wrap: break-word;
            display: -moz-inline-stack;
            width: 275px;
        }

        .HistoryData.DestinationName {
            padding-left: 20px;
            word-wrap: break-word;
            width: 275px;
            display: -moz-inline-stack;
        }

        .wrap {
            margin-top: 10px;
            width: 370px;
        }

            .wrap .editHistory {
                width: 350px;
                background: white;
            }

        .inner_table {
            height: 469px;
            overflow-y: auto;
        }

        #map {
            height: 100%;
            width: 100%;
        }

        .fa.fa-eye {
            margin-left: 295px;
            cursor: pointer;
        }
        #historyPanel.move {
            margin-left: 257px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#nav-icon1').click(function () {
                $(this).toggleClass('open');
                $("#sideBar").toggleClass('active');
                $('#historyPanel').toggleClass("move");
            });
        });
        $(document).click(function (event) {
            var clickover = $(event.target);
            var _opened = $(".nav-icon1").hasClass("open");
            var _actived = $(".sideBar").hasClass("active");
            if (_opened == true && _actived == true && !clickover.is('#nav-icon1') && !clickover.is('#sideBar')
                 && !clickover.is(".panel-group a")
                && !clickover.is(".col-sm-3.col-md-3") && !clickover.is(".panel-heading")) {
                $('.nav-icon1').removeClass("open");
                $('.sideBar').removeClass("active");
                $('#historyPanel').removeClass("move");
            } else {
                $(window).keydown(function (event) {
                    if (event.keyCode == 13) {
                        event.preventDefault();
                        return false;
                    }
                });
            }
        });
        function initMap() {
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var directionsService = new google.maps.DirectionsService;
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 3.139, lng: 101.6869 },
                zoom: 13,
                mapTypeControl: false
            });
            directionsDisplay.setMap(map);
            $(document).ready(function () {
                $(".fa.fa-eye").click(function () {
                    var origin_place_Name = $(this).parents('.viewHistory').find('.originName').attr("itemid");
                    var destination_place_Name = $(this).parents('.viewHistory').find('.destinationName').attr("itemid");
                    calculateAndDisplayRoute(origin_place_Name, destination_place_Name);
                });
                $('#delete').click(function () {
                    $("#<%=btnDeleteAll.ClientID%>").click();
                });
                $('.btn-sm').click(function () {
                    $("#<%=historyId.ClientID%>").val($(this).parents('.viewHistory').attr('itemid'));
                    $("#<%=btnDelete.ClientID%>").click();
                });
            });
            function calculateAndDisplayRoute(origin_place_Name, destination_place_Name) {
                directionsService.route({
                    origin: origin_place_Name ,
                    destination: destination_place_Name,
                    travelMode: 'DRIVING'
                }, function (response, status) {
                    if (status === 'OK') {
                        directionsDisplay.setDirections(response);
                    } else {
                        window.alert('Directions request failed due to ' + status);
                    }
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <div id="sideBar" class="sideBar">
            <button id="nav-icon1" class="nav-icon1" onclick="return false">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <div class="col-sm-3 col-md-3" style="width: 230px; margin-top: 10px; float: left">
                <div class="panel-group" id="accordion">
                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SiteMapDataSource1">
                        <ItemTemplate>
                            <asp:Repeater runat="server" DataSource='<%# ((SiteMapNode) Container.DataItem).ChildNodes %>'>
                                <ItemTemplate>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#<%# Eval("Description") %>"><%# Eval("Title") %></a>
                                            </h4>
                                        </div>
                                        <div id="<%# Eval("Description") %>" class="panel-collapse collapse">
                                            <asp:Repeater runat="server" DataSource='<%# ((SiteMapNode) Container.DataItem).ChildNodes %>'>
                                                <HeaderTemplate>
                                                    <div class="panel-body">
                                                        <table class="table">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <a href="<%# Eval("Url") %>"><%# Eval("Title") %></a>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                            </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            </div>
                        </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
            </div>
        <div class="" id="historyPanel">
            <div class="editHistoryPanel">
                <div id="header">
                    <h2 id="title">Booking History</h2>
                    <span class="fa fa-trash-o fg-red fa-2x" id="delete"></span>
                </div>
                <div id="displayPanel">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <div class="wrap">
                                <div class="inner_table">
                                    <table class="editHistory">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="border-bottom: 1px solid black">
                                    <table style="width: 100%; border-bottom: 1px solid #eee">
                                        <tr>
                                            <th style="float: left; padding: 5px; font-style: italic;"><%#Eval("BookingStatus") %></th>
                                            <th style="float: right; padding: 5px;"><%#String.Format("{0:dd MMM yyyy,t}",Eval("BookingDate")) %></th>
                                        </tr>
                                    </table>
                                    <table class="viewHistory" itemid="<%#Eval("BookingId")%>">
                                        <tr class="originName" itemid="<%#Eval("OriginName")%>">
                                            <td>
                                                <span class="mif-location fg-darkGreen"></span>
                                            </td>
                                            <td>
                                                <span class="HistoryData OriginName"><%#Eval("OriginName")%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="mif-more-vert"></span>
                                            </td>
                                            <td>
                                                <span class="fa fa-eye"></span>
                                            </td>
                                        </tr>
                                        <tr class="destinationName" itemid="<%#Eval("DestinationName")%>">
                                            <td>
                                                <span class="mif-location fg-darkRed"></span>
                                            </td>
                                            <td>
                                                <span class="HistoryData DestinationName"><%#Eval("DestinationName")%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td style="border-top: 1px solid rgb(238, 238, 238); padding: 5px 0px 5px 255px;">
                                                <a class="btn-sm btn-danger" href="#"><i class="fa fa-trash-o fa-lg"></i>Delete</a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                    </div>
                    </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT * FROM [Booking] where MemberID=@memberId">
            <SelectParameters>
                <asp:SessionParameter Name="memberId" SessionField="MemberID"/>
            </SelectParameters>
        </asp:SqlDataSource>
        <div id="map">
        </div>
        <div style="display: none">
            <asp:Button ID="btnDeleteAll" runat="server" Text="Button" OnClick="btnDeleteAll_Click"/>
            <asp:Button ID="btnDelete" runat="server" Text="Button" OnClick="btnDelete_Click"/>
            <asp:TextBox ID="historyId" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
