<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Assignment.HomePage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/homePageJs.js" type="text/javascript"></script>
    <style type="text/css">
        @import url(css/fonts/fontAwesome/font-awesome.css);

        @font-face {
            font-family: ralewayRegular;
            src: url(css/fonts/raleway/Raleway-Regular.ttf);
        }

        @font-face {
            font-family: ralewayBold;
            src: url(css/fonts/raleway/Raleway-Boldr.ttf);
        }

        @font-face {
            font-family: ralewayMedium;
            src: url(css/fonts/raleway/Raleway-Medium.ttf);
        }

        @font-face {
            font-family: arvoregular;
            src: url(css/fonts/arvo/Arvo-Regular.ttf);
        }

        @font-face {
            font-family: pacificoregular;
            src: url(css/fonts/pacifico/Pacifico.ttf);
        }

        @font-face {
            font-family: ralewaysemibold;
            src: url(css/fonts/raleway/Raleway-SemiBold.ttf);
        }

        body, html {
            font-family: ralewayRegular, arial, verdana, sans-serif;
            padding: 0;
            margin: 0;
        }

        #header {
            display: block;
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 9999;
            -webkit-transition: all .3s linear;
            transition: all .3s linear;
        }

            #header ul li:not(.login-btn) {
                list-style: none;
                display: inline;
                padding: 10px;
            }

            #header a:not(.login-btn) {
                display: inline-block;
                font: 17px/34px ralewaysemibold;
                text-transform: uppercase;
                color: #fff;
                height: 32px;
                white-space: nowrap;
                text-decoration: none;
            }

            #header ul li a:hover:not(.login-btn) {
                border-bottom: 5px solid #459fed;
            }

        #flash1 {
            height: 659px;
            position: relative;
            background: url(img/flash_1.jpg);
            background-size: cover;
            border-bottom: 1px solid rgb(210, 208, 209);
        }

        #flash2 {
            padding: 24px 0px 50px;
            height: 700px;
            position: relative;
            background: url(img/flash_2.jpg);
            background-size: cover;
            border-bottom: 1px solid rgb(210, 208, 209);
        }

        #flash3 {
            padding: 24px 0px 50px;
            height: 500px;
            position: relative;
            background: url(img/flash_3.jpg);
            background-size: cover;
            border-bottom: 1px solid rgb(210, 208, 209);
        }

        #flash4 {
            padding: 60px 0px;
            border-bottom: 1px solid rgb(210, 208, 209);
            background-color: rgb(225, 229, 232);
        }

        #flash5 {
            padding: 24px 0 30px 0;
            border-bottom: 1px #d2d0d1 solid;
        }

        #flash6 {
            padding: 18px 0 18px 0;
            border-bottom: 1px #edeced solid;
            background-color: #999999;
        }

        #flash7 {
            padding-top:10px;
            height:30px;
            text-align: center;
        }

        .fa {
            width: 60px;
            display: block;
            text-align: center;
            color: #990000;
            font: normal 45px 'FontAwesome';
            line-height: 60px;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
        }

        .fa-angle-double-down:before {
            content: "\f103";
        }

        .bounce {
            cursor: pointer;
            position: absolute;
            bottom: 30px;
            left: 50%;
            width: 60px;
            height: 60px;
            margin-left: -30px;
            border: 2px solid #990000;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -ms-border-radius: 50%;
            border-radius: 50%;
            animation: bounce 2s infinite;
            -webkit-animation: bounce 2s infinite;
            -moz-animation: bounce 2s infinite;
            -o-animation: bounce 2s infinite;
        }

        @-webkit-keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                -webkit-transform: translateY(0);
            }

            40% {
                -webkit-transform: translateY(-30px);
            }

            60% {
                -webkit-transform: translateY(-15px);
            }
        }

        @-moz-keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                -moz-transform: translateY(0);
            }

            40% {
                -moz-transform: translateY(-30px);
            }

            60% {
                -moz-transform: translateY(-15px);
            }
        }

        @-o-keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                -o-transform: translateY(0);
            }

            40% {
                -o-transform: translateY(-30px);
            }

            60% {
                -o-transform: translateY(-15px);
            }
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }

            40% {
                transform: translateY(-30px);
            }

            60% {
                transform: translateY(-15px);
            }
        }

        .maintit {
            text-align: center;
            text-shadow: 1px 1px 1px #000;
            font: 92px/92px pacificoregular;
            color: #fff;
            text-align: center;
            padding-top: 170px;
        }

            .maintit span {
                color: #459fed;
            }

        .con17 {
            font: 24px/34px ralewayMedium;
            padding-left: 20px;
            margin: 10px 0 20px;
            color: #F9F1F1;
            text-align: center;
            padding-top: 40px;
        }

        .bd-button {
            background: url(img/bd-button.png) no-repeat;
            width: 180px;
            height: 47px;
            color: #fff;
            text-align: center;
            font: 15px/47px ralewaybold;
            display: inline-block;
            text-transform: uppercase;
            position: relative;
            margin-top: 20px;
        }

            .bd-button span.hover {
                background: url(img/bd-button.png) no-repeat;
                position: absolute;
                right: 0;
                top: 0;
                display: block;
                background-position: 0 -47px;
                width: 180px;
                height: 47px;
                cursor: pointer;
            }

            .bd-button:active, .bd-button:hover, .bd-button:visited {
                background-position: center bottom;
            }

        #logo #image {
            width: 140px;
            height: 73px;
            padding: 6px 0 0 35px;
        }

        #header ul {
            float: right;
            padding-top: 10px;
            padding-right: 80px;
        }


        @-webkit-keyframes login-btn {
            100% {
                top: -12px;
                right: -12px;
                bottom: -12px;
                left: -12px;
                opacity: 0;
            }
        }

        @keyframes login-btn {
            100% {
                top: -12px;
                right: -12px;
                bottom: -12px;
                left: -12px;
                opacity: 0;
            }
        }

        .login-btn {
            font: ralewayMedium;
            top: -3px;
            color: #f0f2f5;
            background-color: #459fed;
            border: 1px solid #459fed;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            padding: 6px 25px 7px;
            border-radius: 50px;
            display: inline-block;
            vertical-align: middle;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0, 0, 0, 0);
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            -moz-osx-font-smoothing: grayscale;
            position: relative;
        }

            .login-btn:before {
                content: '';
                position: absolute;
                border-radius: 50px;
                border: #459fed solid 6px;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
            }

            .login-btn:hover:before, .login-btn:focus:before, .login-btn:active:before {
                -webkit-animation-name: login-btn;
                animation-name: login-btn;
            }

        .changeBg {
            background-color: white;
        }

        .changeColor {
            color: #000;
        }

        .maintit_1 {
            font-family: arvoregular, arial;
            font-size: 38px;
            font-style: normal;
            line-height: 45px;
            font-weight: normal;
            color: #42484d;
        }

        .subtit_1 {
            font-family: ralewayMedium, arial;
            font-size: 24px;
            font-style: normal;
            line-height: 32px;
            font-weight: normal;
            color: #525252;
        }

        .subtit2 {
            font-family: arvoregular, arial;
            font-size: 20px;
            font-style: normal;
            line-height: 25px;
            font-weight: normal;
            color: #525252;
        }

        .con17_1 {
            font-size: 17px;
            font-style: normal;
            line-height: 25px;
            font-weight: normal;
            color: #525252;
        }

        .con15 {
            font-size: 15px;
            font-style: normal;
            line-height: 21px;
            font-weight: normal;
            color: #525252;
        }

        .con17_2 {
            font-size: 17px;
            font-style: normal;
            line-height: 25px;
            font-weight: normal;
            color: #dfdfdf;
        }

        .maintit_2 {
            font-family: arvoregular, arial;
            font-size: 38px;
            font-style: normal;
            line-height: 45px;
            font-weight: normal;
            color: #dfdfdf;
        }

        .maintit_3 {
            font-family: arvoregular, arial;
            font-size: 38px;
            font-style: normal;
            line-height: 45px;
            font-weight: normal;
            color: #42484d;
        }

        .con17_3 {
            font-size: 17px;
            font-style: normal;
            line-height: 25px;
            font-weight: normal;
            color: #525252;
        }

        .con12 {
            font-size: 12px;
            font-style: normal;
            line-height: 18px;
            font-weight: normal;
            color: #525252;
        }

        .subtit3 {
            font-family: arvoregular, arial;
            font-size: 22px;
            font-style: normal;
            line-height: 28px;
            font-weight: normal;
            color: #42484d;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header id="header" class="">
            <div id="logo" style="float: left">
                <asp:ImageButton ID="image" runat="server" ImageUrl="~/img/logo-new.png" OnClick="image_Click" />
            </div>
            <ul class="nav">
                <li><a href="#" class="home">Home</a></li>
                <li><a href="#" class="features">Features</a></li>
                <li><a href="#" class="about">About Us</a></li>
                <li><a href="#" class="contact">Contact Us</a></li>
                <li><a href="LoginForm.aspx" class="login-btn">Login</a></li>
            </ul>
        </header>
        <div id="flash1">
            <div class="maintit">Taxi Booking Made <span>Easy</span></div>
            <h1 class="con17">With EzCab, transport is just a click away!</h1>
            <div style="text-align: center">
                <a class="bd-button" style="top: 0; opacity: 1;text-decoration:none" href="LoginForm.aspx">Book Now
                    <span style="opacity: 0;" class="hover">Book Now</span>
                </a>
            </div>
            <div class="bounce">
                <i class="fa fa-angle-double-down"></i>
            </div>
        </div>
        <div id="flash2">
            <table style="width: 960px;" align="center" cellspacing="0">
                <tbody>
                    <tr>
                        <td style="text-align: center; padding: 30px 0 10px 0">
                            <span class="maintit_1">Features Overview</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; padding: 0 0 30px 0">
                            <span class="subtit_1">Support all major features</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%" cellpadding="8" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="text-align: center; width: 33%">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/icon-easy.png" Height="124" Width="124" />
                                        </td>
                                        <td style="text-align: center; width: 34%">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/img/icon-map.png" Height="124" Width="124" />
                                        </td>
                                        <td style="text-align: center; width: 33%">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/img/icon-notify.png" Height="124" Width="124" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center; width: 33%; padding-bottom: 20px">
                                            <span class="subtit2">Easy To Use</span><br />
                                            <span class="con15">With Few Taps and some basic 
						information, your booking is Set.</span></td>
                                        <td style="text-align: center; width: 34%; padding-bottom: 20px">
                                            <span class="subtit2">Real-Time Map</span><br />
                                            <span class="con15">View your pick up location from our 
						real-time map</span></td>
                                        <td style="text-align: center; width: 33%; padding-bottom: 20px">
                                            <span class="subtit2">Notify</span><br />
                                            <span class="con15">Notify your loved one while you on 
						board with your Taxi info.</span></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center; width: 33%">
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/img/icon-booking-history.png" Height="124" Width="124" />
                                        </td>
                                        <td style="text-align: center; width: 34%">
                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/img/icon-fav.png" Height="124" Width="124" />
                                        </td>
                                        <td style="text-align: center; width: 33%">
                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/img/icon-support.png" Height="124" Width="124" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center; width: 33%" valign="top">
                                            <span class="subtit2">Booking History</span><br />
                                            <span class="con15">View your order history</span></td>
                                        <td style="text-align: center; width: 34%">
                                            <span class="subtit2">My Favourite</span><br />
                                            <span class="con15">Setup your favourite location to 
						save your time on future booking</span></td>
                                        <td style="text-align: center; width: 33%">
                                            <span class="subtit2">Call us on our call centre</span><br />
                                            <span class="con15">24 hours a day, 365 days in a year</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; padding-top: 45px">
                            <span class="con17_1">We guarantee you quick response within few minutes, so no more waiting for taxis that pass you by!
                            </span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="flash3">
            <table style="width: 960px" align="center" cellspacing="0">
                <tbody>
                    <tr>
                        <td style="text-align: center; padding-top: 15px">
                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table style="width: 100%" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="text-align: center; padding: 30px 0 30px 0">
                                                            <span class="maintit_2">About EzCab</span>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left">
                                                            <span class="con17_2">EzCab is a free 
								taxi-booking app for smartphone user that&nbsp;allows 
								you to book taxis anywhere anytime. With just a 
								few clicks, you can save&nbsp;the hassle of calling 
								up hotlines and make your journey a safer, 
								easier one. Our budget taxis currently serve you 
								within Kuala Lumpur and Klang Valley. We will 
								soon expand our services in other major cities 
								for your further convenience.<br>
                                                                <br>
                                                                Ez Cab Sdn Bhd works in partnership with various 
								Taxi Company to provide you with reliable public 
								transport and we are grateful to secure Public 
								Cab Sdn Bhd as our first Strategic Partner. With 
								a fleet over 1000 taxis in its operations, 
								Public Cab taxis are all less than five years 
								old and are fueled by either Liquid Natural Gas 
								(LNG) for Natural Gas Vehicle or Unleaded Petrol 
								for environmental benefit. Our customers' safety 
								and privacy is our priority!</span>&nbsp;&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/img/ezcab-icon.png" Style="margin-top: 80px" Height="360" Width="326" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="flash4">
            <table style="width: 960px" align="center" cellspacing="0">
                <tbody>
                    <tr>
                        <td>
                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 100%">
                                            <table style="width: 94%" align="right" cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="text-align: center; padding: 30px 0 30px 0">
                                                            <span class="maintit_3">Contact Us</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center; padding: 0 0 30px 0">
                                                            <span class="con17_3"><strong>EzCab Sdn Bhd</strong>
                                                                <span class="con12">(company no. 197870-T)</span><br />
                                                                19-1 Jalan 1/46A, Off Jalan Selingsing 7,<br />
                                                                Taman Niaga Waris, 51200 Kuala Lumpur.
                                                                <br />
                                                                <br />
                                                                Tel : +60 (3) 6259 2929<br />
                                                                Email : <a href="mailto:enquiry@ezcab.com.my">enquiry@ezcab.com.my</a><br />
                                                                Support : <a href="mailto:support@ezcab.com.my">support@ezcab.com.my</a> </span></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 50px; text-align: center;">
                                                            <span class="con17_3"><b>Call us now if you need assistance.</b></span></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/img/contact.png" Style="height: 401px; width: 300px" Height="575" Width="430" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="flash5">
            <table style="width: 960px" align="center" cellspacing="0">
                <tbody>
                    <tr>
                        <td style="text-align: center">
                            <span class="subtit3">EzCab :
                                <span style="color: #8a8a8a">The most easy &amp; preferred Taxi Booking App 
				in Malaysia</span></span></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="flash6">
            <table style="width: 960px" align="center" cellpadding="0" cellspacing="0">
                <tbody>
                    <tr>
                        <td style="width: 25%">
                            <table style="width: 100%" cellpadding="5" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image9" runat="server" ImageUrl="~/img/ico-taxi.png" Height="52" Width="52" /></td>
                                        <td style="width: 100%"><span class="tool1">1,000+</span><br />
                                            <span class="tool2">Cabs</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="width: 25%">
                            <table style="width: 100%" cellpadding="5" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image10" runat="server" ImageUrl="~/img/ico-trip.png" Height="52" Width="52" /></td>
                                        <td style="width: 100%"><span class="tool1">4,000+</span><br />
                                            <span class="tool2">Trips Daily</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="width: 25%">
                            <table style="width: 100%" cellpadding="5" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image11" runat="server" ImageUrl="~/img/ico-5min.png" Height="52" Width="52" /></td>
                                        <td style="width: 100%"><span class="tool1">&lt; 5 Mins</span><br />
                                            <span class="tool2">Real-time Reponses</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="width: 25%">
                            <table style="width: 100%" cellpadding="5" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image12" runat="server" ImageUrl="~/img/ico-register-customer3.png" Height="52" Width="52" /></td>
                                        <td style="width: 100%"><span class="tool1">24/7 Support</span><br />
                                            <span class="tool2">Hotline Call Centre</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="flash7">
        <span class="con12">Copyright © EzCab Sdn Bhd (company no. 197870-T). All Rights Reserved.</span></div>
    </form>
</body>
</html>
