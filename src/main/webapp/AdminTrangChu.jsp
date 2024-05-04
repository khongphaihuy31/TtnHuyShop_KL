<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Ttn-Huy Fashion</title>
<link rel="shortcut icon" href="./assets/img/huy-removebg-preview.png"
	type="image/x-icon">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="assets/script/toast.js"></script>
<script src="assets/script/validator.js"></script>
<link rel="stylesheet" href="assets/css/validation.css">
<link rel="stylesheet" href="assets/css/base.css">
<link rel="stylesheet" href="assets/css/grid.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<link rel="stylesheet" href="assets/css/toast.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}
a:focus, a:hover {
    text-decoration: none;
}
</style>
</head>
<body class="w3-light-grey">
	<!-- Top container -->
    <div class="w3-bar w3-top w3-large" style="z-index:4;background: linear-gradient(169.68deg, #086a87 19.53%, #75dbd9 128.18%); color: white; height: 72px; padding: 0 20px;">
        <button style="height: 100%;" class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey"
            onclick="w3_open();"><i class="fa fa-bars"></i></button>
        <span class="w3-bar-item w3-left" style="line-height: 56px;">Website Admin Ttn-Huy Fashion</span>
        <a href="AdminTrangChuController" class="w3-bar-item w3-right" style="padding: 0 !important;">
            <img alt="" src="assets/img/huy-removebg-preview.png" style="height: 70px;">
        </a>
    </div>

    <!-- Sidebar/menu -->
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;margin-top: 10px;" id="mySidebar"><br>
        <div class="w3-container w3-row">
            <div class="w3-col s3">
                <img src="https://www.w3schools.com/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
            </div>
            <div class="w3-col s9 w3-bar">
                <!-- <ul class="header__welcome-list" style="margin: 0px;">
                    <li class="header__welcome-item" style="display: inline-block;"><a href="#"
                            class="js-login header__welcome-link"> <span
                                style="display: inline-block; width: 25px;  background-color: green; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 500;">hình</span>
                            tên</a>
                </ul> -->
                <span>Xin chào, <strong>${dn.getHoten() }</strong></span><br>
                    <a style="color: red;margin-left: 25px; font-size: 18px;" href="dangXuatController" class="js-register header__welcome-link"> Đăng
                    xuất <i class="fa-solid fa-right-from-bracket"></i>
                    </a>
            </div>
        </div>
        <hr>
        <div class="w3-container">
            <h5 style="text-align: center; font-weight: bold; margin-top: 0;font-size: 18px;">DANH MỤC QUẢN LÝ</h5>
        </div>
        <div class="w3-bar-block">
            <!--<a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>-->
            <a href="AdminTrangChuController" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa-solid fa-house"></i>  Trang chủ</a>
            <a href="AdminXacNhanController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-truck-ramp-box"></i>  Xác nhận đơn hàng</a>
            <a href="AdminLoaiSanPhamController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-layer-group"></i>  Quản lý loại sản phẩm</a>
            <a href="AdminLoaiTrongDanhMucController" class="w3-bar-item w3-button w3-padding"><i class="fa-brands fa-docker"></i>  Quản lý loại trong danh mục</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-boxes-stacked"></i>  Quản lý sản phẩm</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users"></i>  Quản lý khách hàng</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-shirt"></i>  Quản lý thương hiệu</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-image"></i>  Quản lý banner</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-gift"></i>  Quản lý khuyến mãi</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-star"></i>  Quản lý tích điểm</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-chart-pie"></i>  Thống kê doanh thu</a><br><br>
        </div>
    </nav>


    <!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
        title="close side menu" id="myOverlay"></div>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:63px;">

        <!-- Header -->
        <header class="w3-container" style="padding-top:22px;color:var(--primary-color); margin-bottom: 16px;">
            <h2><b><i class="fa-solid fa-house"></i>  Trang chủ</b></h2>
        </header>

        <div class="w3-row-padding w3-margin-bottom">
            <div class="w3-quarter">
		        <a href="" style="text-decoration: none;">
	                <div class="w3-container w3-red w3-padding-16">
	                    <div class="w3-left"><i style="font-size: 50px;" class="fa-solid fa-boxes-stacked"></i></div>
	                    <div class="w3-right">
	                        <h3>${soluongsanpham }</h3>
	                    </div>
	                    <div class="w3-clear"></div>
	                    <h4 style="height: 60px;">Tổng số sản phẩm</h4>
	                </div>
		        </a>
            </div>
            <div class="w3-quarter">
	            <a href="AdminXacNhanController" style="text-decoration: none;">
	                <div class="w3-container w3-blue w3-padding-16">
	                    <div class="w3-left"><i style="font-size: 50px;" class="fa-solid fa-box"></i></div>
	                    <div class="w3-right">
	                        <h3>${dshoadon.size() }</h3>
	                    </div>
	                    <div class="w3-clear"></div>
	                    <h4 style="height: 60px;">Số đơn hàng mới</h4>
	                </div>
		        </a>
            </div>
            <div class="w3-quarter">
	            <a href="" style="text-decoration: none;">
	                <div class="w3-container w3-teal w3-padding-16">
	                    <div class="w3-left"><i style="font-size: 50px;" class="fa-solid fa-chart-pie"></i></div>
	                    <div class="w3-right">
	                        <h3>
	                        	<fmt:setLocale value="vi_VN"/>
	     						<fmt:formatNumber value="${tongdoanhthutrongngay}" type="currency"/>
	                        </h3>
	                    </div>
	                    <div class="w3-clear"></div>
	                    <h4 style="height: 60px;">Doanh thu hôm nay</h4>
	                </div>
		        </a>
            </div>
            <div class="w3-quarter">
	            <a href="" style="text-decoration: none;">
	                <div class="w3-container w3-orange w3-text-white w3-padding-16">
	                    <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
	                    <div class="w3-right">
	                        <h3>${dskhachhang.size() }</h3>
	                    </div>
	                    <div class="w3-clear"></div>
	                    <h4 style="height: 60px;">Số lượng khách hàng</h4>
	                </div>
		        </a>
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