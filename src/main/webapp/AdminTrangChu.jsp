<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Ttn-Huy Fashion</title>
<link rel="stylesheet" href="assets/css/base.css">
<link rel="stylesheet" href="assets/css/grid.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<link rel="shortcut icon" href="./assets/img/huy-removebg-preview.png"
	type="image/x-icon">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
	href="assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}
</style>
</head>
<body class="w3-light-grey">
	<!-- Top container -->
    <div class="w3-bar w3-top w3-large" style="z-index:4; background-color: var(--primary-color); color: white; height: 72px;">
        <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey"
            onclick="w3_open();"><i class="fa fa-bars"></i></button>
        <span class="w3-bar-item w3-left" style="line-height: 56px;">Website Admin Ttn-Huy Fashion</span>
        <span class="w3-bar-item w3-right" style="padding: 0 !important;">
            <img alt="" src="assets/img/huy-removebg-preview.png" style="height: 72px;">
        </span>
    </div>

    <!-- Sidebar/menu -->
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;margin-top: 10px;" id="mySidebar"><br>
        <div class="w3-container w3-row">
            <div class="w3-col s4">
                <img src="https://www.w3schools.com/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
            </div>
            <div class="w3-col s8 w3-bar">
                <!-- <ul class="header__welcome-list" style="margin: 0px;">
                    <li class="header__welcome-item" style="display: inline-block;"><a href="#"
                            class="js-login header__welcome-link"> <span
                                style="display: inline-block; width: 25px;  background-color: green; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 500;">hình</span>
                            tên</a>
                </ul> -->
                <span>Xin chào, <strong>Mike</strong></span><br>
                    <a href="dangXuatController" class="js-register header__welcome-link w3-bar-item w3-button"> <span class="glyphicon glyphicon-log-out"></span> Đăng
                    xuất
                    </a>
            </div>
        </div>
        <hr>
        <div class="w3-container">
            <h5>DANH MỤC QUẢN LÝ</h5>
        </div>
        <div class="w3-bar-block">
            <!--<a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>-->
            <a href="#" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa-solid fa-house"></i>  Trang chủ</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Xác nhận đơn hàng</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  Quản lý loại sản phẩm</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  Quản lý loại trong danh mục</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-diamond fa-fw"></i>  Quản lý sản phẩm</a>
            <!--<a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell fa-fw"></i>  News</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bank fa-fw"></i>  General</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i>  History</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a>--><br><br>
        </div>
    </nav>


    <!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
        title="close side menu" id="myOverlay"></div>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:63px;">

        <!-- Header -->
        <header class="w3-container" style="padding-top:22px">
            <h2><b><i class="fa-solid fa-house"></i>  Trang chủ</b></h2>
        </header>

        <div class="w3-row-padding w3-margin-bottom">
            <div class="w3-quarter">
                <div class="w3-container w3-red w3-padding-16">
                    <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3>52</h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4 style="height: 60px;">Sản phẩm</h4>
                </div>
            </div>
            <div class="w3-quarter">
                <div class="w3-container w3-blue w3-padding-16">
                    <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3>99</h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4 style="height: 60px;">Số đơn hàng mới</h4>
                </div>
            </div>
            <div class="w3-quarter">
                <div class="w3-container w3-teal w3-padding-16">
                    <div class="w3-left"><i class="fa fa-share-alt w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3>23</h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4 style="height: 60px;">Doanh thu hôm nay</h4>
                </div>
            </div>
            <div class="w3-quarter">
                <div class="w3-container w3-orange w3-text-white w3-padding-16">
                    <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3>50</h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4 style="height: 60px;">Số lượng khách hàng</h4>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <!-- <footer class="w3-container w3-padding-16 w3-light-grey">
            <h4>FOOTER</h4>
            <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
        </footer> -->

        <!-- End page content -->
    </div>

    <script>
        // Get the Sidebar
        var mySidebar = document.getElementById("mySidebar");

        // Get the DIV with overlay effect
        var overlayBg = document.getElementById("myOverlay");

        // Toggle between showing and hiding the sidebar, and add overlay effect
        function w3_open() {
            if (mySidebar.style.display === 'block') {
                mySidebar.style.display = 'none';
                overlayBg.style.display = "none";
            } else {
                mySidebar.style.display = 'block';
                overlayBg.style.display = "block";
            }
        }

        // Close the sidebar with the close button
        function w3_close() {
            mySidebar.style.display = "none";
            overlayBg.style.display = "none";
        }
    </script>
</body>
</html>