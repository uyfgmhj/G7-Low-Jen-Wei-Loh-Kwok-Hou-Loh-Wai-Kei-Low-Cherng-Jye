<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignupAndLogin.ascx.cs" Inherits="Assignment.SignupAndLogin" %>
    <style>
        @font-face {
            font-family: ralewaysemibold;
            src: url(css/fonts/raleway/Raleway-SemiBold.ttf);
        }
        body, html {
            padding: 0;
            margin: 0;
        }

        #head {
            background-color: white;
            display: block;
            width: 100%;
            position:absolute;
            top: 0;
            z-index: 9999;
            -webkit-transition: all .3s linear;
            transition: all .3s linear;
        }
        #head ul {
            float: right;
            padding-top: 10px;
            padding-right: 80px;
        }
            #head ul li{
                list-style: none;
                display: inline;
                padding: 10px;
            }

            #head a{
                display: inline-block;
                font: 17px/34px ralewaysemibold;
                text-transform: uppercase;
                color: #000;
                height: 32px;
                white-space: nowrap;
                text-decoration: none;
            }

            #head ul li a:hover{
                border-bottom: 5px solid #459fed;
            }
        .image {
            cursor:pointer;
            background-color:transparent;
        }
        #logo{
    padding: 6px 0 0 35px;
}
    </style>
    <script>
        $(document).ready(function () {
            $(".features").click(function () {
                window.location.href = 'HomePage.aspx#flash2';
            });
            $(".about").click(function () {
                window.location.href = 'HomePage.aspx#flash3';
            });
            $(".contact").click(function () {
                window.location.href = 'HomePage.aspx#flash4';
            });
            $(".home").click(function () {
                window.location.href = 'HomePage.aspx#flash1';
            });
            
        });
    </script>
<header id="head" class="">
    <div id="logo" style="float: left">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/HomePage.aspx">
            <asp:Image ID="image" ImageUrl="~/img/logo-new.png" runat="server" CssClass="image"/>
        </asp:HyperLink>
    </div>
    <ul class="navigation">
        <li><a class="home" href="#">Home</a></li>
        <li><a class="features" href="#">Features</a></li>
        <li><a class="about" href="#">About Us</a></li>
        <li><a class="contact" href="#">Contact Us</a></li>
    </ul>
</header>

