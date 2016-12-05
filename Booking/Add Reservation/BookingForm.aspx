<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingForm.aspx.cs" Inherits="Map.BookingForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/fonts/metro/metro-icons.css" rel="stylesheet" />
    <link href="../css/fonts/fontAwesome/font-awesome.css" rel="stylesheet" />
    <link href="../css/fonts/rye/Rye.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.min.css" />
    <link href="../css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script src="../js/moment-with-locales.js"></script>
    <script src="../js/bootstrap-datetimepicker.js"></script>
    <link rel="stylesheet" href="../css/jAlert-v4.css" />
    <script src="../js/jAlert-v4.js"></script>
    <script src="../js/jAlert-functions.js"></script>
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

        #Logo {
            margin-left: 45%;
            width: 10%;
            margin-top: 10px;
        }

        #header {
            font: normal 30px/60px 'Rye';
            padding: 0 0 0 10px;
            margin: 0px;
        }

        .directionInputs {
            padding: 10px 0 0 15px;
        }

        .button {
            padding: 3px 12px;
            background: #3e8e41;
            color: white;
            border-radius: 4px;
            border: 0;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
            box-shadow: 0px 1px 4px rgba(0,0,0,0.3);
        }

            .button:hover {
                background-color: #4CAF50;
            }

            .button:active {
                background-color: #4CAF50;
                box-shadow: 0 5px #666;
                transform: translateY(1px);
            }

        #directionsPanel {
            background-color: #4285F4;
            width: 330px;
            left: 0px;
            height: 100%;
            box-shadow: 0px 1px 4px rgba(0,0,0,0.3);
            position: fixed;
            margin-left: 37px;
            top: 0px;
            z-index: 1;
        }

        #origin_input,
        #destination_input {
            background-color: #fff;
            font-family: Verdana;
            font-size: 15px;
            font-weight: 300;
            margin-left: 23px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 250px;
            position: fixed;
        }

            #origin_input:focus, #datetimepicker4:focus,
            #destination_input:focus {
                border-color: #4d90fe;
            }

        #datetimepicker4 {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 250px;
            border: 1px solid transparent;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            height: 32px;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        .controls {
            border: 1px solid transparent;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            height: 32px;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        #reverse {
            cursor: pointer;
            position: fixed;
            margin: 30px 0px 0px 280px;
        }

        .location_icon {
            width: 10px;
            position: fixed;
        }

        #paneToggle {
            width: 23px;
            height: 48px;
            cursor: pointer;
            background: rgba(255,255,255,0.9) url('../img/out.png') 7px center/7px 10px no-repeat;
            border: none;
            border-left: 1px solid #D4D4D4;
            box-shadow: 0px 1px 4px rgba(0,0,0,0.3);
            right: -24px;
            margin-left: 315px;
        }

        #directionsPanel.active {
            left: -520px;
        }

        #paneToggle.in {
            background: rgba(255,255,255,0.9) url('../img/in.png') 7px center/7px 10px no-repeat;
            margin-left: 505px;
        }

        #directionsPanel.move {
            margin-left: 257px;
        }

        #map {
            height: 100%;
            width: 100%;
        }

        .container {
            z-index: 1;
            position: absolute;
        }

        .dateTimeContainer {
            position: fixed;
            margin: 100px 0 0 9px;
            padding: 0;
        }

        .hide {
            display: none;
        }

        .show {
            display: normal;
        }

        #favHis_panel {
            margin-top: 15px;
        }

        .wrap {
            width: 350px;
        }

            .wrap .FavAndHis.content {
                width: 330px;
                background: white;
            }

        .FavAndHis.content tr td {
            padding: 5px;
            border-bottom: 1px solid #eee;
            width: 100px;
            word-wrap: break-word;
            cursor: pointer;
        }

        .FavouriteAndHistory.head th {
            background: #77cfdc;
            border-bottom: 1px solid #eee;
            width: 330px;
            text-align: center;
        }

        .inner_table {
            height: 315px;
            overflow-y: auto;
        }

        .favouriteData, .historyData {
            padding: 0px 0px 0px 6px;
            width: 300px;
            font-size: medium;
            display: -moz-inline-stack;
        }

        .normal {
            margin: 100px 0 0 220px;
        }

        .move {
            margin: 0px 0 0 220px;
        }

        .gridview td, .gridview th {
            padding: 10px;
        }

        #myModal3 .modal-dialog {
            width: 64%;
        }

        #destination_input {
            margin-top: 50px;
        }

        .fa.fa-calendar {
            margin-top: 109px;
            position: fixed;
            margin-left: 1px;
        }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.24&key=AIzaSyDKHt209oQ6plzVrvA8886OUld4gEdtqhs&libraries=places&callback=initMap" async defer></script>
    <script>
        function openModal() {
            $(document).ready(function () {
                $("#myModal3").modal({ backdrop: "static" });
            });
        }
        function initMap() {
            var travel_mode = 'DRIVING';
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var directionsService = new google.maps.DirectionsService;
            var map = new google.maps.Map(document.getElementById('map'), {
                mapTypeControl: false,
                center: { lat: 3.139, lng: 101.6869 },
                zoom: 13
            });
            directionsDisplay.setMap(map);

            var origin_input = document.getElementById('origin_input');
            var destination_input = document.getElementById('destination_input');

            var origin_autocomplete = new google.maps.places.Autocomplete(origin_input);
            origin_autocomplete.bindTo('bounds', map);
            var destination_autocomplete =
                new google.maps.places.Autocomplete(destination_input);
            destination_autocomplete.bindTo('bounds', map);

            calculateAndDisplayRoute(directionsService, directionsDisplay);
            function expandViewportToFitPlace(map, place) {
                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);
                }
            }
            origin_autocomplete.addListener('place_changed', function () {
                var place = origin_autocomplete.getPlace();
                if (!place.geometry) {
                    errorAlert('Please fix these error', 'Autocomplete\'s returned place contains no geometry');
                    return;
                }
                expandViewportToFitPlace(map, place);
                calculateAndDisplayRoute(directionsService, directionsDisplay);
            });

            destination_autocomplete.addListener('place_changed', function () {
                var place = destination_autocomplete.getPlace();
                if (!place.geometry) {
                    errorAlert('Please fix these error', 'Autocomplete\'s returned place contains no geometry');
                    return;
                }
                expandViewportToFitPlace(map, place);
                calculateAndDisplayRoute(directionsService, directionsDisplay);
            });
            $(document).ready(function () {
                $('#reverse').click(function () {
                    var origin_location = document.getElementById("origin_input").value;
                    var destination_location = document.getElementById("destination_input").value;
                    document.getElementById("origin_input").value = destination_location;
                    document.getElementById("destination_input").value = origin_location;
                    calculateAndDisplayRoute(directionsService, directionsDisplay);
                });
            });
            function calculateAndDisplayRoute(directionsService, directionsDisplay) {
                if (document.getElementById("origin_input").value != "" && document.getElementById("destination_input").value != "") {
                    directionsService.route({
                        origin: document.getElementById("origin_input").value,
                        destination: document.getElementById("destination_input").value,
                        travelMode: 'DRIVING'
                    }, function (response, status) {
                        if (status === 'OK') {
                            directionsDisplay.setDirections(response);
                            var point = response.routes[0].legs[0];
                            $('#travel_cost').html('RM ' + (((1.2 / 1000) * (parseInt(point.distance.text) * 1000)) + 3).toFixed(2));
                            $('#travel_data').html(point.duration.text + ' (' + point.distance.text + ')');
                            $(".travel_estimate").removeClass('hide').addClass('show');
                            $(".button").removeClass('normal').addClass('move');
                            $('#travel_cost_txt').val((((1.2 / 1000) * (parseInt(point.distance.text) * 1000)) + 3).toFixed(2));
                        } else {
                            errorAlert('Please fix these error', 'Directions request failed due to ' + status);
                        }
                    });
                }
            }
            $(document).ready(function () {
                $('.favHisData').click(function () {
                    if ($("#favHis_panel").hasClass("destination")) {
                        document.getElementById("destination_input").value = $(this).attr('itemid');
                    } else {
                        document.getElementById("origin_input").value = $(this).attr('itemid');
                    }
                    calculateAndDisplayRoute(directionsService, directionsDisplay);
                });
            });
        }
        $(document).ready(function () {
            $('#datetimepicker4').datetimepicker({
                minDate: moment().subtract(1, 'd'),
                disabledDates: [moment().subtract(1, 'd')],
                format: 'DD/MM/YYYY hh:mm a',
                showClose: true
            });
        });
        $(document).ready(function () {
            $('#nav-icon1').click(function () {
                $(this).toggleClass('open');
                $("#sideBar").toggleClass('active');
                $('#directionsPanel').toggleClass("move");
            });
            $("#destination-input").keyup(function () {
                $("#favHis_panel").removeClass('show').addClass('hide');
                var value = $.trim($("#destination-input").val());
                if (value.length == 0) {
                    $(".button").removeClass('move').addClass('normal');
                    $(".travel_estimate").removeClass('show').addClass('hide');
                    $("#favHis_panel").removeClass('hide').addClass('show');
                    $("#favHis_panel").removeClass('origin').addClass('destination');
                }
            });
            $("#origin_input").keyup(function () {
                $("#favHis_panel").removeClass('show').addClass('hide');
                var value = $.trim($("#origin_input").val());
                if (value.length == 0) {
                    $(".button").removeClass('move').addClass('normal');
                    $(".travel_estimate").removeClass('show').addClass('hide');
                    $("#favHis_panel").removeClass('hide').addClass('show');
                    $("#favHis_panel").removeClass('destination').addClass('origin');
                }
            });
            $(document).click(function (event) {
                var clickover = $(event.target);
                if (!clickover.is('#origin_input') && !clickover.is('#destination_input') && !clickover.is('.favHisData')
                    && !clickover.is('.fa.fa-star') && !clickover.is('.fa.fa-clock-o') && !clickover.is('.historyData')
                    && !clickover.is('.favouriteData') && !clickover.is('.favHisTitle') && !clickover.is('.favHisTitle')
                    && !clickover.is('.title')) {
                    $("#favHis_panel").removeClass('show').addClass('hide');
                } else {
                    $("#favHis_panel").removeClass('hide').addClass('show');
                    if (clickover.is('#origin_input')) {
                        $("#favHis_panel").removeClass('destination').addClass('origin');
                    } else if (clickover.is('#destination_input')) {
                        $("#favHis_panel").removeClass('origin').addClass('destination');
                    }
                }
            });
            $(document).click(function (event) {
                var clickover = $(event.target);
                var _opened = $(".nav-icon1").hasClass("open");
                var _actived = $(".sideBar").hasClass("active");
                if (_opened == true && _actived == true && !clickover.is('#nav-icon1') && !clickover.is('#sideBar')
                    && !clickover.is('#paneToggle') && !clickover.is(".panel-group a")
                    && !clickover.is(".col-sm-3.col-md-3") && !clickover.is(".panel-heading")) {
                    $('.nav-icon1').removeClass("open");
                    $('.sideBar').removeClass("active");
                    $('#directionsPanel').removeClass("move");
                } else {
                    $(window).keydown(function (event) {
                        if (event.keyCode == 13) {
                            event.preventDefault();
                            return false;
                        }
                    });
                }
            });
            $('#paneToggle').click(function () {
                $(this).toggleClass('in');
                $("#directionsPanel").toggleClass('active');
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
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
            <div class="" id="directionsPanel">
                <h1 id="header">Booking Taxi</h1>
                <div class="directionInputs">
                    <div class="location_icon">
                        <span class="mif-location fg-darkGreen fa-lg" style="margin-top: 8px;"></span>
                        <span style="margin-top: 6px; margin-left: 2px" class="mif-more-vert"></span>
                        <span class="mif-location fg-darkRed  fa-lg" style="margin-top: 12px;"></span>
                    </div>
                    <input id="origin_input" class="controls" placeholder="Enter an origin location" type="text" runat="server" />
                    <span class="fa fa-exchange fg-lighterGray fa-2x fa-rotate-90" id="reverse" runat="server"></span>
                    <input id="destination_input" class="controls" placeholder="Enter a destination location" type="text" runat="server" />
                    <span class="fa fa-calendar fg-lighterGray fa-lg"></span>
                    <div class="dateTimeContainer">
                        <div>
                            <div class="col-sm-6">
                                <input id="datetimepicker4" type="text" runat="server" />
                            </div>
                        </div>
                    </div>
                    <button class="" id="paneToggle" onclick="return false"></button>
                    <div class="travel_estimate hide" style="margin: 100px 0px 0px 1px;">
                        <span class="fa fa-calculator fa-lg"></span>
                        <span style="margin-left: 5px;" id="travel_data"></span>
                        <br />
                        <span class="fa fa-money fa-lg" style="margin: 14px 0px;"></span>
                        <span id="travel_cost" style="margin-left: 5px;"></span>
                    </div>
                    <asp:CustomValidator ID="CustomValidator1" runat="server"
                        OnServerValidate="ValidateInput"></asp:CustomValidator>
                </div>
                <div>
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button normal" OnClick="submit_Click" />
                </div>
                <div id="favHis_panel" class="hide">
                    <div class="wrap">
                        <table class="FavouriteAndHistory head">
                            <tr>
                                <th class="favHisTitle">
                                    <span class="title">Favourite And History</span>
                                </th>
                            </tr>
                        </table>
                        <div class="inner_table">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <HeaderTemplate>
                                    <table class="FavAndHis content">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td itemid="<%#Eval("FavouriteAddress") %>" class="favHisData">
                                            <span class="fa fa-star fg-grayLight" id="icon-left"></span>
                                            <span class="favouriteData"><%#Eval("FavouriteName") %></span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                <HeaderTemplate>
                                    <table class="FavAndHis content">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td itemid="<%#Eval("DestinationName") %>" class="favHisData">
                                            <span class="fa fa-clock-o fg-grayLight"></span>
                                            <span class="historyData"><%#Eval("DestinationName") %></span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="display: none">
            <asp:TextBox ID="travel_cost_txt" runat="server"></asp:TextBox>
        </div>
        <!-- Modal -->
        <div class="modal fade bd-example-modal-lg" id="myModal3" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">Please select taxi:</h4>
                    </div>
                    <div class="modal-body">
                        <asp:GridView ID="driverSelect" runat="server" CellPadding="4" ForeColor="#333333"
                            GridLines="None" AutoGenerateColumns="False" CssClass="gridview">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"
                                            OnCommand="LinkButton1_Command"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Taxi Company" SortExpression="TaxiCompany">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TaxiCompany") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaxiCompany" runat="server" Text='<%# Bind("TaxiCompany") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Taxi Type" SortExpression="TaxiType">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TaxiType") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaxiType" runat="server" Text='<%# Bind("TaxiType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plate Number" SortExpression="PlateNumber">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PlateNumber") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblPlateNumber" runat="server" Text='<%# Bind("PlateNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Driver Name" SortExpression="DriverName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DriverName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDriverName" runat="server" Text='<%# Bind("DriverName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone Number" SortExpression="PhoneNumber">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Duration") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDuration" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Distance" SortExpression="Distance">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Distance") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDistance" runat="server" Text='<%# Bind("Distance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"
            SelectCommand="SELECT * FROM Favourites"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"
            SelectCommand="SELECT distinct DestinationName FROM Booking"></asp:SqlDataSource>
        <div id="map"></div>
    </form>
</body>
</html>
