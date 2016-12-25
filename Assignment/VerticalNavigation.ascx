<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VerticalNavigation.ascx.cs" Inherits="Assignment.VerticalNavigation" %>
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
        body {
            margin: 0px;
            padding: 0px;
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
    </style>
    <script>
        $(document).ready(function () {
            $('#nav-icon1').click(function () {
                $(this).toggleClass('open');
                $("#sideBar").toggleClass('active');
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
    </script>
<div id="sideBar" class="sideBar">
            <button id="nav-icon1" class="nav-icon1" onclick="return false">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <div class="col-sm-3 col-md-3" style="width: 230px; margin-top: 10px; float: left">
                <div class="panel-group" id="accordion">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SiteMapDataSource1">
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