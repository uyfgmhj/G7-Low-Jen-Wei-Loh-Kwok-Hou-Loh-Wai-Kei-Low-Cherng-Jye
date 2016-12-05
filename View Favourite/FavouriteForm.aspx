<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FavouriteForm.aspx.cs" Inherits="Map.FavouriteForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        #favouritePanel {
            background-color: #4285F4;
            width: 350px;
            left: 0px;
            height: 100%;
            box-shadow: 0px 1px 4px rgba(0,0,0,0.3);
            position: absolute;
            margin-left: 37px;
            z-index: 1;
        }

        #title, #titleAdd {
            font: normal 30px/60px 'Rye';
            padding: 0 0 0 10px;
            margin: 0px;
            position: fixed;
        }

        #header, #headerAdd {
            height: 55px;
            box-shadow: 0px 1px 4px rgba(0,0,0,0.3);
        }

        #delete, #cancel {
            margin: 12px 0 0 310px;
            cursor: pointer;
        }

        #displayPanel, #searchPanel {
            margin-top: 5px;
        }

        .favouritesData {
            width: 200px;
            font-size: large;
            display: -moz-inline-stack;
            padding-top: 5px;
        }

        .historyData {
            padding: 0px 0px 0px 6px;
            width: 245px;
            font-size: medium;
            display: -moz-inline-stack;
        }

        #add {
            padding: 6px 0px 10px 0px;
            font-size: large;
            float: left;
            cursor: pointer;
        }

        #search {
            -webkit-border-radius: 30px;
            -moz-border-radius: 30px;
            -ms-border-radius: 30px;
            -o-border-radius: 30px;
            border-radius: 30px;
            -webkit-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
            -moz-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
            -ms-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
            -o-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
            box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
            border: 1px solid #D69E31;
            margin: 10px;
            border-radius: 5px;
            font-size: 15px;
            background-color: white;
            background-image: url('../img/searchicon.png');
            background-position: 10px 10px;
            background-repeat: no-repeat;
            padding: 12px 20px 12px 40px;
            -webkit-transition: width 0.4s ease-in-out;
            transition: width 0.4s ease-in-out;
            font-family: Verdana;
            width: 265px;
        }

            #search:focus {
                -webkit-box-shadow: 0 0 2px #ed1c24 inset;
                -moz-box-shadow: 0 0 2px #ed1c24 inset;
                -ms-box-shadow: 0 0 2px #ed1c24 inset;
                -o-box-shadow: 0 0 2px #ed1c24 inset;
                box-shadow: 0 0 2px #ed1c24 inset;
                background-color: #fff;
                border: 1px solid #ed1c24;
                outline: none;
            }

        #icon-left {
            padding: 10px;
            float: left;
        }

        .fa.fa-trash,.fa.fa-eye.editFav {
            float: right;
            margin: 8px 5px 0px 0px;
            cursor: pointer;
        }
        .show {
            display: normal;
        }

        .hide {
            display: none;
        }

        #map {
            height: 100%;
            width: 100%;
        }

        .wrap {
            margin-top: 10px;
            width: 370px;
        }

           .wrap .editFavourite {
                width: 350px;
                background: white;
            }

        .editFavourite tr td {
            padding: 5px;
            border-bottom: 1px solid #eee;
            width: 100px;
            word-wrap: break-word;
        }

        .editFavourite tr {
            padding: 5px;
        }


        .editFavourite.head th {
            background: #77cfdc;
            border-bottom: 1px solid #eee;
            width: 350px;
        }

        .inner_table {
            height: 400px;
            overflow-y: auto;
        }
        #favouritePanel.move {
            margin-left: 257px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#add').click(function () {
                $(".addFavouritePanel").removeClass('hide').addClass('show');
                $(".editFavouritePanel").removeClass('show').addClass('hide');
            });
            $('#cancel').click(function () {
                document.getElementById('search').value = "";
                $(".addFavouritePanel").removeClass('show').addClass('hide');
                $(".editFavouritePanel").removeClass('hide').addClass('show');
            });
            $('#nav-icon1').click(function () {
                $(this).toggleClass('open');
                $("#sideBar").toggleClass('active');
                $('#favouritePanel').toggleClass("move");
            });
            $(document).click(function (event) {
                var clickover = $(event.target);
                var _opened = $(".nav-icon1").hasClass("open");
                var _actived = $(".sideBar").hasClass("active");
                if (_opened == true && _actived == true && !clickover.is('#nav-icon1') && !clickover.is('#sideBar')
                    && !clickover.is(".panel-group a")&& !clickover.is(".col-sm-3.col-md-3") && !clickover.is(".panel-heading")) {
                    $('.nav-icon1').removeClass("open");
                    $('.sideBar').removeClass("active");
                    $('#favouritePanel').removeClass("move");
                } else {
                    $(window).keydown(function (event) {
                        if (event.keyCode == 13) {
                            event.preventDefault();
                            return false;
                        }
                    });
                }
            });
        });
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                mapTypeControl: false,
                center: { lat: 3.139, lng: 101.6869 },
                zoom: 13
            });
            var input = document.getElementById('search');

            var autocomplete = new google.maps.places.Autocomplete(input);
            autocomplete.bindTo('bounds', map);

            var infowindow = new google.maps.InfoWindow();
            var marker;
            var place;
            autocomplete.addListener('place_changed', function () {
                infowindow.close();
                place = autocomplete.getPlace();
                if (!place.geometry) {
                    return;
                }
                if (marker) {
                    marker.setPosition(place.geometry.location);
                } else {
                    marker = new google.maps.Marker({
                        map: map,
                        position: place.geometry.location
                    });
                }
                marker.addListener('click', function () {
                    infowindow.open(map, marker);
                });

                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);
                }

                // Set the position of the marker using the place ID and location.
                marker.setVisible(true);

                infowindow.setContent(place.formatted_address);
                //infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
                //    'Place ID: ' + place.place_id + '<br>' +
                //    place.formatted_address);
                infowindow.open(map, marker);
                callPromptDialog();
            });
            function callPromptDialog() {
                jPrompt('Name favourite', place.name, 'Set Name', function (r) {
                    if (r) {
                        $("#<%=name.ClientID%>").val(r);
                        $("#<%=placeId.ClientID%>").val(place.place_id);
                        $("#<%=address.ClientID%>").val(place.formatted_address);
                        $("#<%=btnAddFavourite.ClientID%>").click();
                    }
                });
            }
            function setMarkers(placeid) {
                infowindow.close();
                infowindow = new google.maps.InfoWindow();
                var service = new google.maps.places.PlacesService(map);
                service.getDetails({
                    placeId: placeid
                }, function (place, status) {
                    if (status === google.maps.places.PlacesServiceStatus.OK) {
                        if (marker) {
                            marker.setPosition(place.geometry.location);
                        } else {
                            marker = new google.maps.Marker({
                                map: map,
                                position: place.geometry.location
                            });
                        }
                        infowindow.setContent(place.formatted_address);
                        infowindow.open(map, marker);
                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(map, this);
                        });
                        if (place.geometry.viewport) {
                            map.fitBounds(place.geometry.viewport);
                        } else {
                            map.setCenter(place.geometry.location);
                            map.setZoom(17);
                        }
                    }
                });
            }
            $(document).ready(function () {
                $('.fa.fa-trash').click(function () {
                    $("#<%=favouriteId.ClientID%>").val($(this).parent('td').attr('itemid'));
                    $("#<%=btnDelete.ClientID%>").click();
                });
                $('.fa.fa-eye.editFav').click(function () {
                    setMarkers($(this).attr('itemid'));
                });
                $('#delete').click(function () {
                    $("#<%=btnDeleteAll.ClientID%>").click();
                });
            });
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
        <div class="" id="favouritePanel">
            <div class="editFavouritePanel show">
                <div id="header">
                    <h2 id="title">Favourites</h2>
                    <span class="fa fa-trash-o fg-red fa-2x" id="delete"></span>
                </div>
                <div id="displayPanel">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <div class="wrap">
                                <table class="editFavourite head">
                                    <th>
                                        <span class="fa fa-plus-circle fg-lightBlue" id="icon-left"></span>
                                        <span id="add">Add new favourite</span>
                                    </th>
                                </table>
                                <div class="inner_table">
                                    <table class="editFavourite ">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td itemid="<%#Eval("FavouriteId")%>">
                                    <span class="fa fa-star fg-grayLight" id="icon-left"></span>
                                    <span class="favouritesData"><%#Eval("FavouriteName")%></span>
                                    <span class="fa fa-trash"></span>
                                    <span class="fa fa-eye editFav" itemid="<%#Eval("PlaceId")%>"></span>
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
            <div class="addFavouritePanel hide">
                <div id="headerAdd">
                    <h2 id="titleAdd">Add Favourite</h2>
                    <span class="fa fa-close fg-red fa-2x" id="cancel"></span>
                </div>
                <input id="search" placeholder="Search" type="text" />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT * FROM [Favourites] where MemberID=@memberId">
            <SelectParameters>
                <asp:SessionParameter Name="memberId" SessionField="MemberID"/>
            </SelectParameters>
        </asp:SqlDataSource>
        <div id="map">
        </div>
        <div style="display:none">
            <asp:Button ID="btnDeleteAll" runat="server" Text="Button" OnClick="btnDeleteAll_Click"/>
            <asp:Button ID="btnDelete" runat="server" Text="Button" OnClick="btnDelete_Click"/>
            <asp:Button ID="btnAddFavourite" runat="server" Text="Button" OnClick="btnAddFavourite_Click"/>
            <asp:TextBox ID="placeId" runat="server"></asp:TextBox>
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <asp:TextBox ID="favouriteId" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
