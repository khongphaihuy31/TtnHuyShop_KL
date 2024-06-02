<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="Bean.GioHangBean"%>
<%@page import="Bean.SanPhamFullBean"%>
<%@page import="Bean.ThuongHieuBean"%>
<%@page import="org.apache.jasper.compiler.TldCache"%>
<%@page import="Bean.LoaiThuocDanhMucBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Ttn-Huy Fashion</title>
<link rel="shortcut icon" href="./assets/img/huy-removebg-preview.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="assets/script/toast.js"></script>
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
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

div#modalDangNhap.modal.fade.in {
	padding-right: 0;
}

.modal-open {
	padding-right: 0;
}

a:hover, a:focus {
	text-decoration: inherit !important;
}

@media (max-width:739px){
	.header-with-search span{
		line-height: 20px;
		top: 20px !important;
    	right: 4px !important;
	}
}

#toast h3 {
	margin: 0;
}

#toast .toast {
	width: 400px;
	max-width: 400px;
	min-width: 350px;
}

#toast {
	top: 90px;
}
.header-nav__item-trademark::before{
    content: "";
    position: absolute;
    width: 100%;
    height: 42px;
    top: 30px;
    /* background-color: red; */
}
.header-nav__item-men::before{
    content: "";
    position: absolute;
    width: 100%;
    height: 42px;
    top: 30px;
    /* background-color: red; */
}
.header-nav__item-women::before{
    content: "";
    position: absolute;
    width: 100%;
    height: 42px;
    top: 30px;
    /* background-color: red; */
}



/*Khuyến mãi*/

.mySlides {display: none}
/* Slideshow container */
.slideshow-container {
  max-width: 100%;
  position: relative;
  margin: auto;
}

.mySlides1 {display: none}
/* Slideshow container */
.slideshow-container1 {
  max-width: 100%;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: var(--primary-color);
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

.prev1, .next1 {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: var(--primary-color);
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

.next1 {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: #ccc;
}

.prev1:hover, .next1:hover {
  background-color: #ccc;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: var(--primary-color);
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 10px;
}
/* Number text (1/3 etc) */
.numbertext1 {
  color: var(--primary-color);
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 10px;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}


/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

.khuyen-mai-hb {
	margin-bottom:2px;
	margin-top:2px;
	background:white;
	padding:10px;
	border-radius:5px;
	border:2px solid var(--primary-color);
	font-size:15px;
	width:100%;
}
.khuyen-mai-hb .tieu-de {
	background:var(--primary-color);
	padding:2px 20px;
	margin-top:-24px;
	font-size:18px;
	font-weight:500;
	color:#ffffff;
	display:block;
	border-radius:99px;
    width: 45%;
    text-align: center;
}
 
.khuyen-mai-hb ul {
   margin-top: 20px;
   margin-left:50px;
   margin-bottom:4px;
   list-style-image:url(tick.png);	
}

.product-item__price-old{
	margin-bottom: 10px;
	margin-left: 5px;
}

.product-item__price{
	flex-direction: row-reverse;
    justify-content: center;
}
</style>
</head>
<body>
	<div style="z-index: 9999999999999999" id="toast"></div>
	<div class="app">
		<header class="header">
			<div class="grid wide">
				<div class="header__welcome hide-on-mobile-tablet">
					<h3 class="header__welcome-text">Chào mừng các bạn đã đến với
						shop Ttn Huy - Shop bán hàng thời trang uy tín tại Việt Nam</h3>
						<a id="butQuen" style="display: none;" data-dismiss="modal" data-toggle="modal"
									data-target="#modalQuenPass"
							class="auth-form__forget-pass">Quên mật khẩu?</a>
						<a id="butCode" style="display: none;" data-dismiss="modal" data-toggle="modal"
								data-target="#modalCode"
						class="auth-form__forget-pass">code</a>
						<a id="butPassMoi" style="display: none;" data-dismiss="modal" data-toggle="modal"
								data-target="#modalPassMoi"
						class="auth-form__forget-pass">pass mới</a>
					<c:choose>
						<c:when test="${dn == null}">
							<ul class="header__welcome-list">
								<li class="header__welcome-item"><a id="dnweb" href="#"
									class="js-login header__welcome-link" data-toggle="modal"
									data-target="#modalDangNhap"> <span
										class="glyphicon glyphicon-log-in"></span> Đăng nhập
								</a></li>
								<li class="header__welcome-item"><a id="dkweb" href="#"
									class="js-register header__welcome-link" data-toggle="modal"
									data-target="#modalDangKi"> <span
										class="glyphicon glyphicon-user"></span> Đăng kí
								</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="header__welcome-list">
								<li class="header__welcome-item"><a href="#"
									class="js-login header__welcome-link"> 
									<span style="display: inline-block; width: 25px; line-height: 25px; height: 25px; background-color: green; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 500;"><%=session.getAttribute("taikhoan").toString().toUpperCase().charAt(0)%></span>
										<%=session.getAttribute("taikhoan")%>
								</a>
									<ul class="header__welcome-item__list">
										<li class="header__welcome-item__list-item"><a
											href="HoSoKhachHang?info=1"
											class="header__welcome-item__list-item-link">Hồ sơ của
												tôi</a></li>
										<li class="header__welcome-item__list-item"><a
											href="HoSoKhachHang?donmua=1"
											class="header__welcome-item__list-item-link">Đơn mua</a></li>
									</ul></li>
								<li class="header__welcome-item"><a
									href="dangXuatController"
									class="js-register header__welcome-link"> <span
										class="glyphicon glyphicon-log-out"></span> Đăng xuất
								</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="header-with-search">
					<a href="TrangChu" class="header-with-search__logo-link">
						<img src="assets/img/huy-removebg-preview.png" alt=""
						class="header-with-search__logo hide-on-mobile">
					</a>

					<!-- header navigation -->
					<div class="header-nav hide-on-mobile-tablet">
						<ul class="header-nav__list">
							<!-- list tất cả sản phẩm -->
							<div class="header-nav__item-all">
								<li class="header-nav__item"><a href=""
									class="header-nav__link"> Tất cả sản phẩm <i
										class="header-nav__icon fa-solid fa-caret-down"></i>
								</a></li>
								<!-- list trong list tất cả sản phẩm -->
								<ul class="header-nav-item-all__list">
									<c:forEach items="${dsTenLoaiDMTatCa}" var="tc">
										<li class="header-nav-item-all__item"><a
											href="TrangChu?maloai=${tc.getMaloai()}&madanhmuc=0&mathuonghieu=0"
											class="header-nav-item-all__link"> ${tc.getTenloai()} </a></li>
									</c:forEach>
								</ul>
							</div>
							<!-- list thương hiệu -->
							<div class="header-nav__item-trademark">
								<li class="header-nav__item"><a href=""
									class="header-nav__link"> Thương hiệu <i
										class="header-nav__icon fa-solid fa-caret-down"></i>
								</a></li>
								<!-- list trong list thương hiệu -->
								<ul style="max-height: 30vh;overflow-y: auto;" class="header-nav-item-trademark__list">
									<c:forEach items="${dsTenLoaiDMThuongHieu}" var="tt">
										<li class="header-nav-item-trademark__item"><a
											href="TrangChu?maloai=0&madanhmuc=0&mathuonghieu=${tt.getMathuonghieu()}"
											class="header-nav-item-trademark__link">${tt.getTenthuonghieu()}
										</a></li>
									</c:forEach>
								</ul>
							</div>
							<!-- list đồ nam -->
							<div class="header-nav__item-men">
								<li class="header-nav__item"><a href=""
									class="header-nav__link"> Đồ nam <i
										class="header-nav__icon fa-solid fa-caret-down"></i>
								</a></li>
								<!-- list trong list đồ nam -->
								<ul style="max-height: 30vh;overflow-y: auto;" class="header-nav-item-men__list">
									<c:forEach items="${dsTenLoaiDMDoNam}" var="dn">
										<li class="header-nav-item-men__item"><a
											href="TrangChu?maloai=${dn.getMaloai()}&madanhmuc=${dn.getMadanhmuc()}&mathuonghieu=0"
											class="header-nav-item-men__link"> ${dn.getTenloai()} </a></li>
									</c:forEach>
								</ul>
							</div>
							<!-- list đồ nữ -->
							<div class="header-nav__item-women">
								<li class="header-nav__item"><a href=""
									class="header-nav__link"> Đồ nữ <i
										class="header-nav__icon fa-solid fa-caret-down"></i>
								</a></li>
								<!-- list trong list đồ nữ -->
								<ul style="max-height: 30vh;overflow-y: auto;" class="header-nav-item-women__list">
									<c:forEach items="${dsTenLoaiDMDoNu }" var="dnu">
										<li class="header-nav-item-women__item"><a
											href="TrangChu?maloai=${dnu.getMaloai()}&madanhmuc=${ dnu.getMadanhmuc()}&mathuonghieu=0"
											class="header-nav-item-women__link"> ${dnu.getTenloai()}
										</a></li>
									</c:forEach>
								</ul>
							</div>
							<!-- list đồ trẻ em -->
							<div class="header-nav__item-children">
								<li class="header-nav__item">
									<a href="TrangChu?maloai=${dsTenLoaiDMTreEm.get(0).getMaloai()}&madanhmuc=${dsTenLoaiDMTreEm.get(0).getMadanhmuc()}&mathuonghieu=0"
									class="header-nav__link"> Design áo
									<!--  <i class="header-nav__icon fa-solid fa-caret-down"></i>-->
								</a></li>
								<!-- list trong list đồ trẻ em -->
								<!--<ul class="header-nav-item-children__list">
									<c:forEach items="${dsTenLoaiDMTreEm }" var="te">
										<li class="header-nav-item-children__item"><a
											href="TrangChu?maloai=${te.getMaloai()}&madanhmuc=${te.getMadanhmuc()}&mathuonghieu=0"
											class="header-nav-item-children__link">
												${te.getTenloai()} </a></li>
									</c:forEach>
								</ul>-->
							</div>
						</ul>
					</div>

					<!-- header mobile left -->
					<div class="header-mobile-left">
						<!-- header navigation mobile tablet -->
						<input type="checkbox" hidden
							id="header-nav-mobile-tablet__checkbox"
							class="header-nav-mobile-tablet__input"> <label
							for="header-nav-mobile-tablet__checkbox"
							class="header-nav-mobile-tablet__label"> <i
							class="header-nav-mobile-tablet__icon fa-solid fa-bars"></i>
						</label> <label for="header-nav-mobile-tablet__checkbox"
							class="header-nav-mobile-tablet__overlay"></label>

						<div class="header-nav-mobile-tablet">
							<span style="line-height: 95px" class="header-nav-mobile-tablet__heading">DANH MỤC
								SẢN PHẨM <label for="header-nav-mobile-tablet__checkbox"
								class="header-nav-mobile-tablet__icon-close"> <i
									class="fa-solid fa-xmark"></i>
							</label>
							</span>
							<ul class="header-nav-mobile-tablet__list">
								<!-- list tất cả sản phẩm -->
								<!-- <div class="header-nav__item-all"> -->
								<li class="dropdown header-nav-mobile-tablet__item-all"><a
									class="dropdown-toggle header-nav-mobile-tablet__link"
									data-toggle="dropdown" href="#">Tất cả sản phẩm <i
										class="header-nav-mobile-tablet__icon fa-solid fa-caret-down"></i>
								</a>
									<ul class="dropdown-menu"
										style="position: relative; float: none; border: none; border-radius: 0; box-shadow: none; background-color: var(--primary-color); -webkit-box-shadow: 0;">
										<c:forEach items="${dsTenLoaiDMTatCa}" var="tc">
											<li class="header-nav-item-all-mobile-tablet__item"><a
												style="padding: 0 0 0 60px; color: var(--text-color); line-height: 50px;"
												href="TrangChu?maloai=${tc.getMaloai()}&madanhmuc=0&mathuonghieu=0"
												class="header-nav-item-all-mobile-tablet__link">${tc.getTenloai()}</a>
											</li>
										</c:forEach>
									</ul></li>

								<!-- </div> -->
								<!-- list thương hiệu -->
								<!-- <div class="header-nav__item-trademark"> -->
								<li class="dropdown header-nav-mobile-tablet__item-trademark">
									<a class="dropdown-toggle header-nav-mobile-tablet__link"
									data-toggle="dropdown" href="#">Thương hiệu <i
										class="header-nav-mobile-tablet__icon fa-solid fa-caret-down"></i>
								</a>
									<ul class="dropdown-menu"
										style="position: relative; float: none; border: none; border-radius: 0; box-shadow: none; background-color: var(--primary-color); -webkit-box-shadow: 0;">

										<c:forEach items="${dsTenLoaiDMThuongHieu}" var="tt">
											<li class="header-nav-item-all-mobile-tablet__item"><a
												style="padding: 0 0 0 60px; color: var(--text-color); line-height: 50px;"
												href="TrangChumaloai=0&madanhmuc=0&mathuonghieu=${tt.getMathuonghieu()}"
												class="header-nav-item-all-mobile-tablet__link">${tt.getTenthuonghieu()}</a>
											</li>
										</c:forEach>
									</ul>
								</li>
								<li class="dropdown"><a
									class="dropdown-toggle header-nav-mobile-tablet__link"
									data-toggle="dropdown" href="#">Đồ nam <i
										class="header-nav-mobile-tablet__icon fa-solid fa-caret-down"></i>
								</a>
									<ul class="dropdown-menu"
										style="position: relative; float: none; border: none; border-radius: 0; box-shadow: none; background-color: var(--primary-color); -webkit-box-shadow: 0;">

										<c:forEach items="${dsTenLoaiDMDoNam}" var="dn">
											<li class="header-nav-item-all-mobile-tablet__item"><a
												style="padding: 0 0 0 60px; color: var(--text-color); line-height: 50px;"
												href="TrangChu?maloai=${dn.getMaloai()}&madanhmuc=${dn.getMadanhmuc()}&mathuonghieu=0"
												class="header-nav-item-all-mobile-tablet__link">
													${dn.getTenloai()} </a></li>
										</c:forEach>
									</ul></li>
								<li class="dropdown"><a
									class="dropdown-toggle header-nav-mobile-tablet__link"
									data-toggle="dropdown" href="#">Đồ nữ <i
										class="header-nav-mobile-tablet__icon fa-solid fa-caret-down"></i>
								</a>
									<ul class="dropdown-menu"
										style="position: relative; float: none; border: none; border-radius: 0; box-shadow: none; background-color: var(--primary-color); -webkit-box-shadow: 0;">

										<c:forEach items="${dsTenLoaiDMDoNu }" var="dnu">
											<li class="header-nav-item-all-mobile-tablet__item"><a
												style="padding: 0 0 0 60px; color: var(--text-color); line-height: 50px;"
												href="TrangChu?maloai=${dnu.getMaloai()}&madanhmuc=${ dnu.getMadanhmuc()}&mathuonghieu=0"
												class="header-nav-item-all-mobile-tablet__link">
													${dnu.getTenloai()} </a></li>
										</c:forEach>
									</ul></li>
								<li id="js-product-children-id"
									class="dropdown header-nav-mobile-tablet__item-children js-product-children">
									<a class="dropdown-toggle header-nav-mobile-tablet__link" href="TrangChu?maloai=${dsTenLoaiDMTreEm.get(0).getMaloai()}&madanhmuc=${dsTenLoaiDMTreEm.get(0).getMadanhmuc()}&mathuonghieu=0">
									Design áo
									<!--<i class="header-nav-mobile-tablet__icon fa-solid fa-caret-down"></i>-->
								</a>
									<!-- <ul class="dropdown-menu"
										style="position: relative; float: none; border: none; border-radius: 0; box-shadow: none; background-color: var(--primary-color); -webkit-box-shadow: 0;">

										<c:forEach items="${dsTenLoaiDMTreEm }" var="te">
											<li class="header-nav-item-all-mobile-tablet__item"><a
												style="padding: 0 0 0 60px; color: var(--text-color); line-height: 50px;"
												href="TrangChu?maloai=${te.getMaloai()}&madanhmuc=${te.getMadanhmuc()}&mathuonghieu=0"
												class="header-nav-item-all-mobile-tablet__link">
													${te.getTenloai()} </a></li>
										</c:forEach>
									</ul>-->
								</li>
								<!-- </div> -->
							</ul>
						</div>

						<!-- header search mobile -->
						<input type="checkbox" hidden id="header-search-mobile__checkbox"
							class="header-search-mobile__input"> <label
							for="header-search-mobile__checkbox"
							class="header-search-mobile__label"> <i
							class="header-search-mobile__icon fa-sharp fa-solid fa-magnifying-glass"></i>
						</label>

						<!-- header search -->
						<div class="header-search hide-on-mobile">
							<div class="header-search__input-wrap">
								<form style="width: 100%;" id="timKiem"
									action="TrangChu" method="post">
									<input style="width: 100%; display: block;" type="text"
										class="header-search__input" name="keyTimKiem"
										placeholder="Nhập sản phẩm bạn cần tìm kiếm" required>
								</form>

								<!-- history search -->
								<div class="header__search-history">
									<h3 class="header__search-history__heading">Lịch sử tìm
										kiếm</h3>
									<ul class="header__search-history__list">
										<li class="header__search-history__item"><a href="">Áo
												thun</a></li>
										<li class="header__search-history__item"><a href="">Quần
												jean</a></li>
										<li class="header__search-history__item"><a href="">Chân
												váy</a></li>
									</ul>
								</div>

							</div>
							<button form="timKiem" name="btnTimKiem"
								class="header-search__btn">
								<i class="fa-sharp fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>


					<div class="header__cart hide-on-mobile-tablet">
						<div style="position: relative;" class="header__cart-wrap">
							<c:choose>
								<c:when test="${dn != null}">
									<a
										style="display: block; width: 44px; position: relative; z-index: 2;"
										href="GioHang"> <i
										class="header__cart-icon fa-sharp fa-solid fa-cart-shopping"></i></a>

									<c:choose>
										<c:when test="${giohang.size() ==0}">
											<div class="header__cart-list">
												<img src="./assets/img/no-cart.png" alt=""
													class="header__cart-img">
												<p class="header__cart-text">Chưa có sản phẩm</p>
											</div>
										</c:when>
										<c:otherwise>
											<span
												style="position: absolute; top: -10px; right: 0; background-color: var(--text-color); color: var(--primary-color); width: 20px; display: block; border-radius: 50%; border: 1px solid var(--primary-color); z-index: 3;">${giohang.size()}</span>
											<div class="header__cart-list">
												<h4 style="opacity: 0.8;">Sản phẩm mới thêm</h4>
												<table style="margin-bottom: 10px;"
													class="table table-hover">

													<c:forEach items="${giohang }" var="gh">
														<tr style="border-bottom: 1px solid #ccc;">
															<td width="60"><img
																style="display: block; width: 100%;" alt=""
																src="${gh.getAnhTheoMau()}"></td>
															<td style="font-size: 1.4rem;" class="">${gh.getTensanpham()}</td>
															<c:choose>
																<c:when test="${gh.getGiagiam()==0}">
																	<td width="100"
																		style="font-size: 1.4rem; color: var(--primary-color);"><b>
																			<fmt:setLocale value="vi_VN"/>
																			<fmt:formatNumber value="${gh.getGiaban()}" type="currency"/>
																		</b>
																	</td>
																</c:when>
																<c:otherwise>
																	<td width="100"
																		style="font-size: 1.4rem; color: var(--primary-color);"><b>
																			<fmt:setLocale value="vi_VN"/>
																			<fmt:formatNumber value="${gh.getGiagiam()}" type="currency"/>
																		</b>
																	</td>
																</c:otherwise>
															</c:choose>
														</tr>
													</c:forEach>
												</table>
												<a href="GioHang"
													style="display: block; width: 150px; background-color: var(--primary-color); color: var(--text-color); padding: 8px 5px; float: right; margin-right: 10px; margin-bottom: 5px; font-size: 1.4rem;">
													<b>Xem giỏ hàng</b>
												</a>
											</div>
										</c:otherwise>
									</c:choose>

								</c:when>
								<c:otherwise>
									<a
										style="display: block; width: 44px; position: relative; z-index: 2;"
										data-toggle="modal" data-target="#modalDangNhap"><i
										class="header__cart-icon fa-sharp fa-solid fa-cart-shopping"></i></a>
									<div class="header__cart-list">
										<img src="./assets/img/no-cart.png" alt=""
											class="header__cart-img">
										<p class="header__cart-text">Chưa có sản phẩm</p>
									</div>
								</c:otherwise>
							</c:choose>


						</div>
					</div>

					<a href="TrangChu"
						class="header-with-search__logo-mobile-link"> <img
						src="./assets/img/huy-removebg-preview.png" alt=""
						class="header-with-search__logo-mobile">
					</a>

					<!-- header mobile right -->
					<div class="header-mobile-right">
						<input type="checkbox" hidden id="header__checkbox-cart"
							class="header__cart-mobile-tablet-checkbox"> <label
							for="header__checkbox-cart"
							class="header__label-cart-mobile-tablet"> <c:choose>
								<c:when test="${dn !=null }">
									<a href="GioHang"
										style="display: block; position: relative;"> <i
										class="header__cart-icon fa-sharp fa-solid fa-cart-shopping"></i>
										<c:if test="${giohang.size() !=0}">
											<span
												style="position: absolute; top: -10px; right: 15px; background-color: var(--text-color); color: var(--primary-color); width: 20px; display: block; border-radius: 50%; border: 1px solid var(--primary-color); z-index: 3;">${giohang.size()}</span></a>
									</c:if>
								</c:when>
								<c:otherwise>
									<a style="display: block; position: relative; z-index: 2;"
										data-toggle="modal" data-target="#modalDangNhap"><i
										class="header__cart-icon fa-sharp fa-solid fa-cart-shopping"></i></a>
								</c:otherwise>
							</c:choose>
						</label>

						<div class="header__cart-mobile-tablet">
							<div class="header__cart-wrap-mobile-tablet">
								<c:choose>
									<c:when test="${dn != null }">
										<c:choose>
											<c:when test="${giohang.size() ==0 }">
												<div class="header__cart-list-mobile-tablet">
													<img src="./assets/img/no-cart.png" alt=""
														class="header__cart-img-mobile-tablet">
													<p class="header__cart-text-mobile-tablet">Chưa có sản
														phẩm</p>
												</div>
											</c:when>
											<c:otherwise>
												<div class="header__cart-list-mobile-tablet">
													<h4 style="opacity: 0.8;">Sản phẩm mới thêm</h4>
													<table style="margin-bottom: 10px;"
														class="table table-hover">

														<c:forEach items="${giohang }" var="gh">
															<tr style="border-bottom: 1px solid #ccc;">
																<td width="60"><img
																	style="display: block; width: 100%;" alt=""
																	src="${gh.getAnh()}"></td>
																<td style="font-size: 1.4rem;" class="">${gh.getTensanpham()}</td>
																<td width="100"
																	style="font-size: 1.4rem; color: var(--primary-color);"><b>${gh.getGiagiam()}
																		VNĐ</b></td>
															</tr>
														</c:forEach>
													</table>
													<a href="GioHang"
														style="display: block; width: 150px; background-color: var(--primary-color); color: var(--text-color); padding: 8px 5px; float: right; margin-right: 10px; margin-bottom: 5px; font-size: 1.4rem;">
														<b>Xem giỏ hàng</b>
													</a>
												</div>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<div class="header__cart-list">
											<img src="./assets/img/no-cart.png" alt=""
												class="header__cart-img">
											<p class="header__cart-text">Chưa có sản phẩm</p>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<input type="checkbox" hidden id="header__checkbox-user"
							class="header__checkbox-mobile-tablet">
						<c:choose>
							<c:when test="${dn == null }">
								<label for="header__checkbox-user" class="header__user-mobile">
									<i class="header__user-icon fa-solid fa-user"></i>
								</label>
							</c:when>
							<c:otherwise>
								<label for="header__checkbox-user" class="header__user-mobile"
									style="margin-right: 20px;"> <span
									style="display: inline-block; width: 25px; line-height: 25px; height: 25px; background-color: green; color: white; border-radius: 50%; text-align: center; margin-right: 0; font-weight: 500;"><%=session.getAttribute("taikhoan").toString().toUpperCase().charAt(0)%></span>

								</label>
							</c:otherwise>
						</c:choose>
						<div class="header__user">
							<div class="header__user-wrap">

								<ul style="right: -6px;" class="header__user-list">
									<c:choose>
										<c:when test="${dn == null }">
											<li class="header__user-item"><a href="#"
												class="js-register header__user-link" data-toggle="modal"
												data-target="#modalDangNhap"> Đăng nhập </a></li>
											<li class="header__user-item"><a href="#"
												class="js-login header__user-link" data-toggle="modal"
												data-target="#modalDangKi"> Đăng kí </a></li>
										</c:when>
										<c:otherwise>
											<li class="header__user-item"><a href="#"
												class="js-register header__user-link"> Hồ sơ của tôi </a></li>
											<li class="header__user-item"><a href="#"
												class="js-login header__user-link"> Đơn mua </a></li>
											<li class="header__user-item"><a
												href="dangXuatController" class="js-login header__user-link">
													Đăng xuất </a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
					<!-- header cart mobile tablet -->
				</div>
			</div>
		</header>

		<!-- Slider -->
		<div style="margin: var(--header-height) 0 10px 0;" id="myCarousel"
			class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<!--<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>-->

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="${dsbanner.get(0).getSrcbanner() }" alt="">
				</div>
				<c:forEach items="${dsbanner }" var="bn" varStatus="index">
					<c:if test="${index.index !=0 }">
						<div class="item">
							<img src="${bn.getSrcbanner() }" alt="">
						</div>
					</c:if>
				</c:forEach>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<!-- Container -->
		<div class="container1">
			<div class="grid wide">
				
				<!-- Slide khuyến mãi -->
				<c:if test="${param.maloai == null && param.madanhmuc == null && param.mathuonghieu == null && param.btnTimKiem == null }">
					<div class="container__top-selling" style="margin-bottom: 0;">
						<h3 class="container__heading" style="font-weight: 600;">Khuyến mãi khi mua tại Ttn-Huy</h3>
						<div class="row sm-gutter">
							<c:if test="${dsGiamGia.size()!=0 }">
								<div class="product-item-col col l-6 m-12 c-12" style="margin-bottom: 0;margin-top: 10px;">
									<div class="slideshow-container">
										<c:forEach items="${dsGiamGia }" var="gg" varStatus="index">
											<div class="mySlides fade" style="opacity: 1;">
											  <div class="numbertext">${index.index+1 } / ${dsGiamGia.size() }</div>
											  <div class="khuyen-mai-hb"> 
											  	<span class="tieu-de"><i class="fa-solid fa-gift"></i>  Khuyến mãi giảm giá</span> 
											     <ul>
											      <li style="font-size: 18px;">${gg.getTengiamgia() }</li>
											      <li style="font-size: 18px;">Khi tổng giá trị đơn hàng từ 
											      	<fmt:setLocale value="vi_VN"/>
		       										<fmt:formatNumber value="${gg.getDieukien() }" type="currency"/>
											      </li>
											      <li style="font-size: 18px;">${gg.getMota() }</li>
											     </ul>
											  </div>
											</div>
										</c:forEach>
										
										<a class="prev" onclick="plusSlides(-1)">❮</a>
										<a class="next" onclick="plusSlides(1)">❯</a>
										
										</div>
										
										<script type="text/javascript">
										let slideIndex = 1;
										showSlides(slideIndex);
										
										function plusSlides(n) {
										  showSlides(slideIndex += n);
										}
										
										function currentSlide(n) {
										  showSlides(slideIndex = n);
										}
										
										function showSlides(n) {
										  let i;
										  let slides = document.getElementsByClassName("mySlides");
										  if (n > slides.length) {slideIndex = 1}    
										  if (n < 1) {slideIndex = slides.length}
										  for (i = 0; i < slides.length; i++) {
										    slides[i].style.display = "none";  
										  }
										  slides[slideIndex-1].style.display = "block";
										}
										</script>
								</div>
							</c:if>
							<c:if test="${dsTichDiem.size()!=0 }">
								<div class="product-item-col col l-6 m-12 c-12" style="height: 100%; margin-bottom: 0; margin-top: 10px;">
									<div class="slideshow-container1">
										<c:forEach items="${dsTichDiem }" var="gg" varStatus="index">
											<div class="mySlides1 fade " style="opacity: 1;">
											  <div class="numbertext1">${index.index+1 } / ${dsTichDiem.size() }</div>
											  <div class="khuyen-mai-hb" style="min-height: 130px;"> 
											  	<span class="tieu-de"><i class="fa-solid fa-gift"></i>  Khuyến mãi điểm cộng</span> 
											     <ul>
											      <li style="font-size: 18px;">Tích được ${gg.getDiemcong() } điểm</li>
											      <li style="font-size: 18px;">Khi tổng giá trị đơn hàng từ 
											      	<fmt:setLocale value="vi_VN"/>
		       										<fmt:formatNumber value="${gg.getDieukien() }" type="currency"/>
											      </li>
											     </ul>
											  </div>
											</div>
										</c:forEach>
										
										<a class="prev1" onclick="plusSlides1(-1)">❮</a>
										<a class="next1" onclick="plusSlides1(1)">❯</a>
										
										</div>
										
										<script type="text/javascript">
										let slideIndex1 = 1;
										showSlides1(slideIndex1);
										
										function plusSlides1(n) {
										  showSlides1(slideIndex1 += n);
										}
										
										function currentSlide(n) {
										  showSlides1(slideIndex1 = n);
										}
										
										function showSlides1(n) {
										  let i;
										  let slides = document.getElementsByClassName("mySlides1");
										  if (n > slides.length) {slideIndex1 = 1}    
										  if (n < 1) {slideIndex1 = slides.length}
										  for (i = 0; i < slides.length; i++) {
										    slides[i].style.display = "none";  
										  }
										  slides[slideIndex1-1].style.display = "block";
										}
										</script>
								</div>
							</c:if>
						</div>
					</div>
				</c:if>
				<!-- sản phẩm bán chạy -->
				<c:if test="${dsSanPhamLoaiTrongDanhMuc == null && dsSanPhamTimKiem == null }">
					<div class="container__top-selling" style="margin-bottom: 0;">
						<c:choose>
							<c:when test="${dsSpGoiYMua !=null }">
								<h3 class="container__heading" style="font-weight: 600;">Sản
									phẩm bạn có thể thích</h3>
								<div class="row sm-gutter">
									<c:forEach items="${dsSpGoiYMua }" var="sphot">
										<div class="product-item-col col l-2 m-4 c-6">
											<!-- product item -->
											<a class="product-item"
												href="ChiTietSanPham?msp=${sphot.getMasanpham()}&tsp=${sphot.getTensanpham()}&anh=${sphot.getAnh()}&gb=${sphot.getGiaban()}&gg=${sphot.getGiagiam()}&sldb=${sphot.getSoluongdaban()}&mtsp=${sphot.getMotasanpham()}&ml=${sphot.getMaloai()}&mth=${sphot.getMathuonghieu()}&mdm=${sphot.getMadanhmuc()}&acs=${sphot.getAnhchonsize()}">
												<img src="${sphot.getAnh()}" alt="" class="product-item__img">
												<h4 class="product-item__name">${sphot.getTensanpham()}</h4>
												<div class="product-item__price">
													<c:choose>
														<c:when test="${sphot.getGiagiam() ==0}">
															<span class="product-item__price-current"
																style="font-weight: 600;"><fmt:setLocale value="vi_VN"/>
	                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/></span>
														</c:when>
														<c:otherwise>
															<span class="product-item__price-old">
																<fmt:setLocale value="vi_VN"/>
	                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/>
																</span>
															<span class="product-item__price-current"
																style="font-weight: 600;">
																<fmt:setLocale value="vi_VN"/>
	                    										<fmt:formatNumber value="${sphot.getGiagiam()}" type="currency"/>
																</span>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="product-item__action">
													<span class="product-item__rating"> <i
														class="product-item__start-gold fa-solid fa-star"></i> <i
														class="product-item__start-gold fa-solid fa-star"></i> <i
														class="product-item__start-gold fa-solid fa-star"></i> <i
														class="product-item__start-gold fa-solid fa-star"></i> <i
														class="fa-solid fa-star"></i>
													</span> <span class="product-item__review-count">(20)</span>
												</div> <span class="product-item__like"> <!-- product-item__liked -->
													<input type="checkbox" hidden
													id="like-checkbox${sphot.getMasanpham()}"
													class="product-item__like-input"> <label
													for="like-checkbox${sphot.getMasanpham()}"
													class="product-item__like-empty"> <i
														class="product-item__like-icon-empty fa-regular fa-heart"></i>
												</label> <label for="like-checkbox${sphot.getMasanpham()}"
													class="product-item__like-fill"> <i
														class="product-item__like-icon-fill fa-solid fa-heart"></i>
												</label>
											</span>
											</a>
										</div>
									</c:forEach>
								</div>
							</c:when>
						</c:choose>
					</div>
				</c:if>
				
				<!-- sản phẩm bán chạy -->
				<div class="container__top-selling">
					<c:choose>
						<c:when test="${dsSanPhamHot != null }">
							<h3 class="container__heading" style="font-weight: 600;">Sản
								phẩm bán chạy nhất</h3>
							<div class="row sm-gutter">
								<c:forEach items="${dsSanPhamHot }" var="sphot">
									<div class="product-item-col col l-2 m-4 c-6">
										<!-- product item -->
										<a class="product-item"
											href="ChiTietSanPham?msp=${sphot.getMasanpham()}">
											<img src="${sphot.getAnh()}" alt="" class="product-item__img">
											<h4 class="product-item__name">${sphot.getTensanpham()}</h4>
											<div class="product-item__price">
												<c:choose>
													<c:when test="${sphot.getGiagiam() ==0}">
														<span class="product-item__price-current"
															style="font-weight: 600;"><fmt:setLocale value="vi_VN"/>
                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/></span>
													</c:when>
													<c:otherwise>
														<span class="product-item__price-old">
															<fmt:setLocale value="vi_VN"/>
                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/>
															</span>
														<span class="product-item__price-current"
															style="font-weight: 600;">
															<fmt:setLocale value="vi_VN"/>
                    										<fmt:formatNumber value="${sphot.getGiagiam()}" type="currency"/>
															</span>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="product-item__action">
												<span class="product-item__rating"> <i
													class="product-item__start-gold fa-solid fa-star"></i> <i
													class="product-item__start-gold fa-solid fa-star"></i> <i
													class="product-item__start-gold fa-solid fa-star"></i> <i
													class="product-item__start-gold fa-solid fa-star"></i> <i
													class="fa-solid fa-star"></i>
												</span> <span class="product-item__review-count">(20)</span>
											</div> <span class="product-item__like"> <!-- product-item__liked -->
												<input type="checkbox" hidden
												id="like-checkbox${sphot.getMasanpham()}"
												class="product-item__like-input"> <label
												for="like-checkbox${sphot.getMasanpham()}"
												class="product-item__like-empty"> <i
													class="product-item__like-icon-empty fa-regular fa-heart"></i>
											</label> <label for="like-checkbox${sphot.getMasanpham()}"
												class="product-item__like-fill"> <i
													class="product-item__like-icon-fill fa-solid fa-heart"></i>
											</label>
										</span>
										</a>
									</div>
								</c:forEach>
								<h3 class="container__heading" style="font-weight: 600;">Sản
								phẩm khuyến mãi</h3>
								<div class="row sm-gutter">
								<c:forEach items="${dsSanPhamKhuyenMai }" var="sphot">
									<div class="product-item-col col l-2 m-4 c-6">
										<!-- product item -->
										<a class="product-item"
											href="ChiTietSanPham?msp=${sphot.getMasanpham()}">
											<img src="${sphot.getAnh()}" alt="" class="product-item__img">
											<h4 class="product-item__name">${sphot.getTensanpham()}</h4>
											<div class="product-item__price">
												<c:choose>
													<c:when test="${sphot.getGiagiam() ==0}">
														<span class="product-item__price-current"
															style="font-weight: 600;"><fmt:setLocale value="vi_VN"/>
                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/></span>
													</c:when>
													<c:otherwise>
														<span class="product-item__price-old">
															<fmt:setLocale value="vi_VN"/>
                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/>
															</span>
														<span class="product-item__price-current"
															style="font-weight: 600;">
															<fmt:setLocale value="vi_VN"/>
                    										<fmt:formatNumber value="${sphot.getGiagiam()}" type="currency"/>
															</span>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="product-item__action">
												<span class="product-item__rating"> <i
													class="product-item__start-gold fa-solid fa-star"></i> <i
													class="product-item__start-gold fa-solid fa-star"></i> <i
													class="product-item__start-gold fa-solid fa-star"></i> <i
													class="product-item__start-gold fa-solid fa-star"></i> <i
													class="fa-solid fa-star"></i>
												</span> <span class="product-item__review-count">(20)</span>
											</div> <span class="product-item__like"> <!-- product-item__liked -->
												<input type="checkbox" hidden
												id="like-checkbox${sphot.getMasanpham()}"
												class="product-item__like-input"> <label
												for="like-checkbox${sphot.getMasanpham()}"
												class="product-item__like-empty"> <i
													class="product-item__like-icon-empty fa-regular fa-heart"></i>
											</label> <label for="like-checkbox${sphot.getMasanpham()}"
												class="product-item__like-fill"> <i
													class="product-item__like-icon-fill fa-solid fa-heart"></i>
											</label>
										</span>
										</a>
									</div>
								</c:forEach>
						</c:when>
						<c:when test="${dsSanPhamLoaiTrongDanhMuc != null}">
							<c:choose>
								<c:when test="${param.mathuonghieu == 0}">
									<c:forEach items="${dsLoai }" var="l">
										<c:if test="${param.maloai == l.getMaloai() && param.maloai == 8}">
											<h3 class="container__heading" style="font-weight: 600;">
											Sản phẩm tự thiết kế</h3>
										</c:if>
										<c:if test="${param.maloai == l.getMaloai() && param.maloai != 8}">
											<h3 class="container__heading" style="font-weight: 600;">
											${l.getTenloai() } thời trang</h3>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach items="${dsTenLoaiDMThuongHieu }" var="th">
										<c:if test="${param.mathuonghieu == th.getMathuonghieu()}">
											<h3 class="container__heading" style="font-weight: 600;">
											${th.getTenthuonghieu() } thời trang</h3>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<div class="row sm-gutter">
								<c:forEach items="${dsSanPhamLoaiTrongDanhMuc }" var="sphot">
									<c:choose>
										<c:when test="${param.maloai != 8 }">
											<div class="product-item-col col l-2 m-4 c-6">
												<!-- product item -->
												<a class="product-item"
													href="ChiTietSanPham?msp=${sphot.getMasanpham()}">
													<img src="${sphot.getAnh()}" alt="" class="product-item__img">
													<h4 class="product-item__name">${sphot.getTensanpham()}</h4>
													<div class="product-item__price">
														<c:choose>
															<c:when test="${sphot.getGiagiam() ==0}">
																<span class="product-item__price-current"
																	style="font-weight: 600;"><fmt:setLocale value="vi_VN"/>
		                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/></span>
															</c:when>
															<c:otherwise>
																<span class="product-item__price-old"><fmt:setLocale value="vi_VN"/>
		                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/></span>
																<span class="product-item__price-current"
																	style="font-weight: 600;">
																	<fmt:setLocale value="vi_VN"/>
		                    										<fmt:formatNumber value="${sphot.getGiagiam()}" type="currency"/>
																	</span>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="product-item__action">
														<span class="product-item__rating"> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="fa-solid fa-star"></i>
														</span> <span class="product-item__review-count">(20)</span>
													</div> <span class="product-item__like"> <!-- product-item__liked -->
														<input type="checkbox" hidden
														id="like-checkbox${sphot.getMasanpham()}"
														class="product-item__like-input"> <label
														for="like-checkbox${sphot.getMasanpham()}"
														class="product-item__like-empty"> <i
															class="product-item__like-icon-empty fa-regular fa-heart"></i>
													</label> <label for="like-checkbox${sphot.getMasanpham()}"
														class="product-item__like-fill"> <i
															class="product-item__like-icon-fill fa-solid fa-heart"></i>
													</label>
												</span>
												</a>
											</div>
										</c:when>
										<c:otherwise>
											<div class="product-item-col col l-2 m-4 c-6">
												<!-- product item -->
												<a class="product-item"
													href="ThietKeAo?msp=${sphot.getMasanpham()}">
													<img src="${sphot.getAnh()}" alt="" class="product-item__img">
													<h4 class="product-item__name">${sphot.getTensanpham()}</h4>
													<div class="product-item__price">
														<c:choose>
															<c:when test="${sphot.getGiagiam() ==0}">
																<span class="product-item__price-current"
																	style="font-weight: 600;"><fmt:setLocale value="vi_VN"/>
		                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/></span>
															</c:when>
															<c:otherwise>
																<span class="product-item__price-old"><fmt:setLocale value="vi_VN"/>
		                    										<fmt:formatNumber value="${sphot.getGiaban()}" type="currency"/></span>
																<span class="product-item__price-current"
																	style="font-weight: 600;">
																	<fmt:setLocale value="vi_VN"/>
		                    										<fmt:formatNumber value="${sphot.getGiagiam()}" type="currency"/>
																	</span>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="product-item__action">
														<span class="product-item__rating"> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="fa-solid fa-star"></i>
														</span> <span class="product-item__review-count">(20)</span>
													</div> <span class="product-item__like"> <!-- product-item__liked -->
														<input type="checkbox" hidden
														id="like-checkbox${sphot.getMasanpham()}"
														class="product-item__like-input"> <label
														for="like-checkbox${sphot.getMasanpham()}"
														class="product-item__like-empty"> <i
															class="product-item__like-icon-empty fa-regular fa-heart"></i>
													</label> <label for="like-checkbox${sphot.getMasanpham()}"
														class="product-item__like-fill"> <i
															class="product-item__like-icon-fill fa-solid fa-heart"></i>
													</label>
												</span>
												</a>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</div>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${dsSanPhamTimKiem.size() !=0 }">
									<h3 class="container__heading" style="font-weight: 600;">Sản
										phẩm bạn muốn tìm kiếm</h3>
									<div class="row sm-gutter">
										<c:forEach items="${dsSanPhamTimKiem }" var="spTimKiem">
											<div class="product-item-col col l-2 m-4 c-6">
												<!-- product item -->
												<a class="product-item"
													href="ChiTietSanPham?msp=${spTimKiem.getMasanpham()}&tsp=${spTimKiem.getTensanpham()}&anh=${spTimKiem.getAnh()}&gb=${spTimKiem.getGiaban()}&gg=${spTimKiem.getGiagiam()}&sldb=${spTimKiem.getSoluongdaban()}&mtsp=${spTimKiem.getMotasanpham()}&ml=${spTimKiem.getMaloai()}&mth=${spTimKiem.getMathuonghieu()}&mdm=${spTimKiem.getMadanhmuc()}&acs=${spTimKiem.getAnhchonsize()}">
													<img src="${spTimKiem.getAnh()}" alt=""
													class="product-item__img">
													<h4 class="product-item__name">${spTimKiem.getTensanpham()}</h4>
													<div class="product-item__price">
														<c:choose>
															<c:when test="${spTimKiem.getGiagiam() ==0}">
																<span class="product-item__price-current"
																	style="font-weight: 600;">
																	<fmt:setLocale value="vi_VN"/>
                    												<fmt:formatNumber value="${spTimKiem.getGiaban()}" type="currency"/>
																	</span>
															</c:when>
															<c:otherwise>
																<span class="product-item__price-old">
																	<fmt:setLocale value="vi_VN"/>
                    												<fmt:formatNumber value="${spTimKiem.getGiaban()}" type="currency"/>
																</span>
																<span class="product-item__price-current"
																	style="font-weight: 600;">
																		<fmt:setLocale value="vi_VN"/>
	                    												<fmt:formatNumber value="${spTimKiem.getGiagiam()}" type="currency"/>
																	</span>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="product-item__action">
														<span class="product-item__rating"> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="product-item__start-gold fa-solid fa-star"></i> <i
															class="fa-solid fa-star"></i>
														</span> <span class="product-item__review-count">(20)</span>
													</div> <span class="product-item__like"> <!-- product-item__liked -->
														<input type="checkbox" hidden
														id="like-checkbox${spTimKiem.getMasanpham()}"
														class="product-item__like-input"> <label
														for="like-checkbox${spTimKiem.getMasanpham()}"
														class="product-item__like-empty"> <i
															class="product-item__like-icon-empty fa-regular fa-heart"></i>
													</label> <label for="like-checkbox${spTimKiem.getMasanpham()}"
														class="product-item__like-fill"> <i
															class="product-item__like-icon-fill fa-solid fa-heart"></i>
													</label>
												</span>
												</a>
											</div>
										</c:forEach>
								</c:when>
								<c:otherwise>
									<h3 class="container__heading" style="font-weight: 600;">Không
										tìm thấy sản phẩm bạn muốn tìm</h3>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="grid wide">
			<div class="row footer-top">
				<div class="col l-3 m-6 c-6">
					<h3 class="footer-top__heading">Về shop Ttn-Huy</h3>
					<ul class="footer-top__list">
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> Giới thiệu </a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> Liên hệ </a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> Tuyển dụng </a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> Chính sách bảo mật </a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> Điệu kiện & Điều khoản </a></li>
					</ul>
				</div>
				<div class="col l-3 m-6 c-6">
					<h3 class="footer-top__heading">Hỗ trợ khách hàng</h3>
					<ul class="footer-top__list">
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> Chính sách đổi hàng </a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> Chính sách chất lượng </a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> Trung tâm dịch vụ bảo hành </a></li>
					</ul>
				</div>
				<div class="col l-3 m-6 c-6">
					<h3 class="footer-top__heading">Phương thức thanh toán</h3>
					<ul class="footer-top__list">
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> <img
								src="./assets/img/Logo-MoMo-Square.png" alt="momo"
								class="footer-top__icon-momo"> Momo
						</a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> <img
								src="./assets/img/Visa_Inc._logo.svg.png" alt=""
								class="footer-top__icon-visa"> Visa
						</a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> <img
								src="./assets/img/logo-mastercard-da-thay-doi-nhu-the-nao-trong-hon-50-nam-3.webp"
								alt="" class="footer-top__icon-masterCard"> MasterCard
						</a></li>
					</ul>
				</div>
				<div class="col l-3 m-6 c-6">
					<h3 class="footer-top__heading">Theo dõi chúng tôi trên</h3>
					<ul class="footer-top__list">
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> <i
								class="footer-top__link-icon fa-brands fa-facebook"></i>
								Facebook
						</a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> <i
								class="footer-top__link-icon fa-brands fa-instagram"></i>
								Instagram
						</a></li>
						<li class="footer-top__item"><a href="#"
							class="footer-top__link"> <i
								class="footer-top__link-icon fa-brands fa-linkedin"></i>
								LinkedIn
						</a></li>
					</ul>
				</div>
			</div>
			<div class="row footer__bottom">
				<a href="#" class="footer__bottom-img-logo-link"> <img
					src="./assets/img/huy-removebg-preview.png" alt="logo"
					class="footer__bottom-img-logo">
				</a> <span class="footer__bottom-copyright">CopyRight 2023© by
					shop Ttn Huy.</span>
			</div>
		</div>
	</footer>
	</div>
	<!-- Modal đăng nhập -->
	<div class="modal fade" id="modalDangNhap" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 style="color: var(--primary-color); font-weight: bold;"
						class="modal-title">Đăng nhập</h3>
				</div>
				<div style="display: flex; justify-content: center;"
					class="modal-body">

					<form style="width: 90%; position: relative;"
						action="DangNhapController" method="post" id="form-1">
						<div class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Số điện thoại / Email <span style="color: red;">*</span></h1>
							<input id="auth-form__input-taikhoan" style="margin-bottom: 4px;"
								class="auth-form__input form-control" type="text"
								name="taikhoan" placeholder="Nhập tài khoản"> <span
								class="form-message"></span>
						</div>

						<div style="position: relative;" class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Mật
								khẩu <span style="color: red;">*</span></h1>
							<input id="password1" style="margin-bottom: 4px;"
								class="auth-form__input form-control" type="password"
								name="matkhau" placeholder="Nhập mật khẩu"> <input
								hidden="" id="input-eye-show" type="checkbox"> <label
								for="input-eye-show" id="eye-show"
								style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
								class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
								class="form-message"></span>
						</div>

						<script type="text/javascript">
							const input = document.getElementById("password1");
							const show = document
									.getElementById("input-eye-show");

							show.onchange = function(e) {
								input.type = show.checked ? "text" : "password";
							};
						</script>
						<c:if test="${solanloi !=null }">
							<c:if test="${solanloi >=3 }">
								<div style="margin: 0" class="form-group">
									<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
										mã <span style="color: red;">*</span></h1>
									<div class="auth-form__input-wrap"
										style="margin-bottom: 4px; display: flex;">
										<input id="auth-form__input-capcha"
											class="auth-form__input form-control" type="text"
											name="answer" placeholder="Nhập mã capcha"
											style="margin-right: 20px; margin-bottom: 0px;"> <img
											style="display: block; height: 42px" src="simpleCaptcha.jpg">
									</div>
									<span style="margin-bottom: 5px" class="form-message"></span> <br>

								</div>
							</c:if>
						</c:if>
						<input class="auth-form__btn"
							style="border: none; margin-top: 0px;" type="submit"
							name="btnDangNhap" value="Đăng nhập"> <a href="" data-dismiss="modal" data-toggle="modal"
									data-target="#modalQuenPass"
							class="auth-form__forget-pass">Quên mật khẩu?</a>
						<div style="display: none" class="auth-form__or">
							<div class="auth-form__or-line"></div>
							<span class="auth-form__or-text">HOẶC</span>
							<div class="auth-form__or-line"></div>
						</div>
						<div style="display: none" class="auth-form__socials">
							<a href="" class="auth-form__socials-facebook"> <i
								class="fa-brands fa-facebook"></i> Facebook
							</a> <a href="" class="auth-form__socials-google"> <i
								class="fa-brands fa-google"></i> Google
							</a>
						</div>
						<div style="display: none" class="auth-form__aside">
							<p class="auth-form__policy-text">Bằng việc đăng kí, bạn đã
								đồng ý với Shop về</p>
							<div class="auth-form__policy-links">
								<a href="" class="auth-form__policy-link">Điều khoản dịch vụ
								</a>& <a href="" class="auth-form__policy-link">Chính sách bảo
									mật </a>
							</div>
						</div>
						<div style="margin-top: 20px;" class="auth-form__footer">
							<p class="auth-form__footer-text">
								Bạn mới biết đến Shop TtnHuy? <a href="#"
									class="auth-form__footer-link js-registerInLogin"
									data-dismiss="modal" data-toggle="modal"
									data-target="#modalDangKi">Đăng kí</a>
							</p>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<script src="assets/script/validator.js"></script>

	<c:choose>
		<c:when test="${solanloi != null }">
			<c:choose>
				<c:when test="${solanloi >= 3 }">
					<script lang="javascript" type="text/javascript">
						Validator({
							form : '#form-1',
							formGroupSelector : '.form-group',
							errorElement : '.form-message',
							rules : [
									Validator.isRequired(
											'#auth-form__input-taikhoan',
											'Bạn vui lòng số điện thoại/email.'),
									Validator.isRequired('#password1',
											'Bạn vui lòng nhập mật khẩu.'),
									Validator
											.isRequired('#auth-form__input-capcha'),
							Validator.minLength('#auth-form__input-capcha', 4)
							// Validator.isEmail('#email'),
							//Validator.isRequired('#avata'),
							// Validator.isRequired('#password'),
							// Validator.minLength('#password', 6),
							// Validator.isRequired('#password_confirmation'),
							// Validator.isConFirmed('#password_confirmation', function() {
							//      return document.querySelector('#form-1 #password').value
							//     }, 'Vui lòng nhập lại mật khẩu.'),
							// Validator.isRequired('input[name="gender"]'),
							// Validator.isRequired('#province')
							],
						});
					</script>
				</c:when>
				<c:otherwise>
					<script lang="javascript" type="text/javascript">
						Validator({
							form : '#form-1',
							formGroupSelector : '.form-group',
							errorElement : '.form-message',
							rules : [
									Validator.isRequired(
											'#auth-form__input-taikhoan',
											'Bạn vui lòng nhập số điện thoại/email.'),
									Validator.isRequired('#password1',
											'Bạn vui lòng nhập mật khẩu.')
							//Validator.isRequired('#auth-form__input-capcha')
							//Validator.minLength('#auth-form__input-capcha', 4,'Capcha chưa đúng.')
							// Validator.isEmail('#email'),
							//Validator.isRequired('#avata'),
							// Validator.isRequired('#password'),
							// Validator.minLength('#password', 6),
							// Validator.isRequired('#password_confirmation'),
							// Validator.isConFirmed('#password_confirmation', function() {
							//      return document.querySelector('#form-1 #password').value
							//     }, 'Vui lòng nhập lại mật khẩu.'),
							// Validator.isRequired('input[name="gender"]'),
							// Validator.isRequired('#province')
							],
						});
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<script lang="javascript" type="text/javascript">
				Validator({
					form : '#form-1',
					formGroupSelector : '.form-group',
					errorElement : '.form-message',
					rules : [
							Validator.isRequired('#auth-form__input-taikhoan',
									'Bạn vui lòng nhập số điện thoại/email.'),
							Validator.isRequired('#password1',
									'Bạn vui lòng nhập mật khẩu.')
					//Validator.isRequired('#auth-form__input-capcha')
					//Validator.minLength('#auth-form__input-capcha', 4,'Capcha chưa đúng.')
					// Validator.isEmail('#email'),
					//Validator.isRequired('#avata'),
					// Validator.isRequired('#password'),
					// Validator.minLength('#password', 6),
					// Validator.isRequired('#password_confirmation'),
					// Validator.isConFirmed('#password_confirmation', function() {
					//      return document.querySelector('#form-1 #password').value
					//     }, 'Vui lòng nhập lại mật khẩu.'),
					// Validator.isRequired('input[name="gender"]'),
					// Validator.isRequired('#province')
					],
				});
			</script>
		</c:otherwise>
	</c:choose>


	<!-- Modal đăng kí -->
	<div class="modal fade" id="modalDangKi" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 style="color: var(--primary-color); font-weight: bold;"
						class="modal-title">Đăng kí</h3>
				</div>
				<div style="display: flex; justify-content: center;"
					class="modal-body">
					<form id="form-2" style="width: 90%; position: relative;"
						action="DangKiController" method="post">

						<div style="display: flex; justify-content: space-between;">
							<div class="form-group" style="width: 48%">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
									họ tên <span style="color: red;">*</span></h1>
									<c:if test="${param.hotendk !=null }">
										<input id="auth-form__input-ht"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="text" name="hoten"
										placeholder="Nhập họ tên (*)" value="${param.hotendk }"> <span
										class="form-message"></span>
									</c:if>
									<c:if test="${param.hotendk ==null }">
										<input id="auth-form__input-ht"
											style="width: 100%; margin-bottom: 4px"
											class="auth-form__input form-control" type="text" name="hoten"
											placeholder="Nhập họ tên (*)"> <span
											class="form-message"></span>
									</c:if>
							</div>
							<div class="form-group" style="width: 48%">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
									số điện thoại <span style="color: red;">*</span></h1>
								<c:if test="${param.hotendk ==null }">
									<input id="auth-form__input-sdt"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="text"
										name="sodienthoai" placeholder="Nhập số điện thoại (*)">
									<span class="form-message"></span>
								</c:if>
								<c:if test="${param.hotendk !=null }">
									<input id="auth-form__input-sdt"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="text"
										name="sodienthoai" placeholder="Nhập số điện thoại (*)" value="${param.sodienthoaidk }">
									<span class="form-message"></span>
								</c:if>
							</div>

						</div>
						<!--<div style="display: flex; justify-content: space-between;">
							<div class="form-group" style="width: 48%">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
									địa chỉ:</h1>
								<input id="auth-form__input-dc"
									style="width: 100%; margin-bottom: 4px"
									class="auth-form__input form-control" type="text" name="diachi"
									placeholder="Nhập địa chỉ (*)"> <span
									class="form-message"></span>
							</div>-->
							<div class="form-group" >
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
									email <span style="color: red;">*</span>
									</h1>
								<c:if test="${param.hotendk !=null }">
									<input id="auth-form__input-email"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="email" name="email"
										placeholder="Nhập email (*)" value="${param.emaildk }"> <span
										class="form-message"></span>
								</c:if>
								<c:if test="${param.hotendk ==null }">
									<input id="auth-form__input-email"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="email" name="email"
										placeholder="Nhập email (*)"> <span
										class="form-message"></span>
								</c:if>
							</div>
							<input id="auth-form__input-codeDkiEmail"
									style="width: 100%; margin-bottom: 4px; display: none;"
									class="auth-form__input form-control" type="text"
									name="codeDkiEmail">
							<div style="position: relative;" class="form-group">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Mã xác nhận
									<span style="color: red;">*</span>
									<a onclick="clickBtnDangKi()" style="cursor: pointer; margin-left: 10px; font-size: 15px; font-weight: bold;">
										Gửi mã</a>
								</h1>
								<input id="auth-form__input-codeDki"
									style="width: 100%; margin-bottom: 4px"
									class="auth-form__input form-control" type="text"
									name="code" placeholder="Nhập mã xác nhận (*)">
								<span class="form-message"></span>
							</div>
						<!--</div>
						<div class="form-group" style="width: 100%">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
								tài khoản:</h1>
							<input id="auth-form__input-tk"
								style="width: 100%; margin-bottom: 4px"
								class="auth-form__input form-control" type="text"
								name="taikhoan" placeholder="Nhập tài khoản (*)"> <span
								class="form-message"></span>
						</div>-->

						<div style="position: relative;" class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
								mật khẩu <span style="color: red;">*</span></h1>
								<c:if test="${param.hotendk ==null }">
									<input id="password2" style="margin-bottom: 4px;"
										class="auth-form__input form-control" type="password"
										name="matkhau1" placeholder="Nhập mật khẩu (*)"> <input
										hidden="" id="input-eye-show1" type="checkbox"> <label
										for="input-eye-show1" id="eye-show"
										style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
										class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
										class="form-message"></span>
								</c:if>
								<c:if test="${param.hotendk !=null }">
									<input id="password2" style="margin-bottom: 4px;"
										class="auth-form__input form-control" type="password"
										name="matkhau1" placeholder="Nhập mật khẩu (*)" value="${param.matkhau1dk }"> <input
										hidden="" id="input-eye-show1" type="checkbox"> <label
										for="input-eye-show1" id="eye-show"
										style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
										class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
										class="form-message"></span>
								</c:if>
						</div>
						<script type="text/javascript">
							const input2 = document.getElementById("password2");
							const show2 = document
									.getElementById("input-eye-show1");

							show2.onchange = function(e) {
								input2.type = show2.checked ? "text"
										: "password";
							};
						</script>

						<div style="position: relative;" class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
								lại mật khẩu <span style="color: red;">*</span></h1>
							<c:if test="${param.hotendk ==null }">
								<input id="password3" style="margin-bottom: 4px;"
									class="auth-form__input form-control" type="password"
									name="matkhau2" placeholder="Nhập lại mật khẩu (*)"> <input
									hidden="" id="input-eye-show2" type="checkbox"> <label
									for="input-eye-show2" id="eye-show"
									style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
									class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
									class="form-message"></span>
							</c:if>
							<c:if test="${param.hotendk !=null }">
								<input id="password3" style="margin-bottom: 4px;"
									class="auth-form__input form-control" type="password"
									name="matkhau2" placeholder="Nhập lại mật khẩu (*)" value="${param.matkhau2dk}"> <input
									hidden="" id="input-eye-show2" type="checkbox"> <label
									for="input-eye-show2" id="eye-show"
									style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
									class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
									class="form-message"></span>
							</c:if>
						</div>

						<script type="text/javascript">
							const input3 = document.getElementById("password3");
							const show3 = document
									.getElementById("input-eye-show2");

							show3.onchange = function(e) {
								input3.type = show3.checked ? "text"
										: "password";
							};
						</script>

						<input id="btnDangKi" class="auth-form__btn" style="border: none;" type="submit"
							name="btnDangNhap" value="Đăng kí"> 
							
						<script type="text/javascript">
						function clickBtnDangKi() {
								var inputEmail = document.getElementById('auth-form__input-email');
								var inputSoDienThoai = document.getElementById('auth-form__input-sdt');
								var dsSoDienThoai = `${dsSoDienThoai}`;
								var dsEmail =`${dsEmail}`;
								var coSdt = false;
								var listEmail = dsEmail.split('>');
								var listSoDienThoai = dsSoDienThoai.split('>');
								
								for(let i =0; i<listSoDienThoai.length; i++){
									if(inputSoDienThoai.value === listSoDienThoai[i]){
										coSdt = true;
										break;
									}
								}
								if(coSdt == false){
									for(let i =0; i<listEmail.length; i++){
										if(inputEmail.value === listEmail[i]){
											coSdt = true;
											break;
										}
									}
								}
								
								if(coSdt){
									function showErrorToastKtraEmailSdt() {
										toast({
											title : 'Thất bại',
											message : 'Số điện thoại hoặc email đã tồn tại.',
											type : 'error',
											duration : 5000
										})
									}
									showErrorToastKtraEmailSdt();
								}else{
									var emaildk1 = inputEmail.value;
									sendEmailDangKi(emaildk1);
									async function sendEmailDangKi(emaildk) {
								      const response = await fetch(
								        "https://script.google.com/macros/s/AKfycbynR90KY5lHgJee2iEip-lAr6Xk05JzFmNKwrFNI71KlNHI6QWP0cgJrzkNvDDqlBduKg/exec?email="+emaildk
								      );
								      const data = await response.json();
								      //console.log(data.data.status);
								      if(data.data.status ==='true'){
										//var el = document.getElementById('btnDangKi');
										//el.click();
							    	  function showInfoToastKiemTraEmail(){
							    		    toast({
							    		        title :'Đã gửi mã xác nhận',
							    		        message : 'Vui lòng kiểm tra email.',
							    		        type  : 'info',
							    		        duration : 5000
							    		    })
							    		}
							    	  showInfoToastKiemTraEmail();
										var codeDkiEmail = document.getElementById('auth-form__input-codeDkiEmail');
										codeDkiEmail.value = data.data.code;
								      }else{
								    	  function showErrorToastKtraGuiEmailThatBai() {
												toast({
													title : 'Thất bại',
													message : 'Email không tồn tại.',
													type : 'error',
													duration : 5000
												})
											}
								    	  showErrorToastKtraGuiEmailThatBai();
								      }
								    }
								}
								//console.log(listSoDienThoai);
								
							}
						</script>
						
							<a style="display: none" href="" class="auth-form__forget-pass">Quên
							mật khẩu?</a>
						<div style="display: none" class="auth-form__or">
							<div class="auth-form__or-line"></div>
							<span class="auth-form__or-text">HOẶC</span>
							<div class="auth-form__or-line"></div>
						</div>
						<div style="display: none" class="auth-form__socials">
							<a href="" class="auth-form__socials-facebook"> <i
								class="fa-brands fa-facebook"></i> Facebook
							</a> <a href="" class="auth-form__socials-google"> <i
								class="fa-brands fa-google"></i> Google
							</a>
						</div>
						<div style="display: none" class="auth-form__aside">
							<p class="auth-form__policy-text">Bằng việc đăng kí, bạn đã
								đồng ý với Shop về</p>
							<div class="auth-form__policy-links">
								<a href="" class="auth-form__policy-link">Điều khoản dịch vụ
								</a>& <a href="" class="auth-form__policy-link">Chính sách bảo
									mật </a>
							</div>
						</div>
						<div style="margin-top: 16px" class="auth-form__footer">
							<p class="auth-form__footer-text">
								Bạn đã có tài khoản? <a href="#"
									class="auth-form__footer-link js-registerInLogin"
									data-dismiss="modal" data-toggle="modal"
									data-target="#modalDangNhap">Đăng nhập</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		Validator({
			form : '#form-2',
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
					Validator.isRequired('#auth-form__input-ht',
							'Bạn vui lòng nhập họ tên.'),
					Validator.isRequired('#auth-form__input-sdt',
							'Bạn vui lòng nhập số điện thoại.'),
					Validator.minLength('#auth-form__input-sdt',10),
					//Validator.isRequired('#auth-form__input-dc','Bạn vui lòng nhập địa chỉ.'),
					Validator.isRequired('#auth-form__input-email',
							'Bạn vui lòng nhập email.'),
					Validator.isEmail('#auth-form__input-email',
							'Email không hợp lệ.'),
					Validator.isRequired('#password2',
							'Bạn vui lòng nhập mật khẩu.'),
					Validator.isRequired('#password3',
							'Bạn vui lòng nhập mật khẩu.'),
					Validator
							.isConFirmed(
									'#password3',
									function() {
										return document
												.querySelector('#form-2 #password2').value
									}, 'Nhập lại mật khẩu chưa chính xác.'),
					Validator.isRequired('#auth-form__input-codeDki',
					'Bạn vui lòng nhập mã xác nhận.'),
					Validator.minLength('#auth-form__input-codeDki',6),
					Validator.isConFirmed(
							'#auth-form__input-codeDki',
							function() {
								return document
										.querySelector('#form-2 #auth-form__input-codeDkiEmail').value
							}, 'Mã xác nhận không chính xác.'),
					//Validator.isRequired('#auth-form__input-tk','Bạn vui lòng nhập tài khoản.'),
					
					
			//Validator.minLength('#auth-form__input-sdt', 10, 'Vui lòng nhập đúng 10 số.')
			// Validator.isEmail('#email'),
			//Validator.isRequired('#avata'),
			// Validator.isRequired('#password'),
			// Validator.minLength('#password', 6),
			// Validator.isRequired('#password_confirmation'),
			// Validator.isConFirmed('#password_confirmation', function() {
			//      return document.querySelector('#form-1 #password').value
			//     }, 'Vui lòng nhập lại mật khẩu.'),
			// Validator.isRequired('input[name="gender"]'),
			// Validator.isRequired('#province')
			],
		});
	</script>
	
	<!-- Modal quên mật khẩu mật khẩu -->
	<div class="modal fade" id="modalQuenPass" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 style="color: var(--primary-color); font-weight: bold;"
						class="modal-title">Quên mật khẩu</h3>
				</div>
				<div style="display: flex; justify-content: center;"
					class="modal-body">

					<form style="width: 90%; position: relative;"
						action="QuenMatKhauController" method="get" id="form-3">
						
						<div style="position: relative;" class="form-group">
						<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Số điện thoại
							<span style="color: red;">*</span>
						</h1>
						<input id="auth-form__input-sdt1"
							style="width: 100%; margin-bottom: 4px"
							class="auth-form__input form-control" type="text"
							name="sodienthoai" placeholder="Nhập số điện thoại (*)">
						<span class="form-message"></span>
						</div>
						<div style="position: relative;" class="form-group">
						<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Email
							<span style="color: red;">*</span>
						</h1>
						<input id="auth-form__input-email1"
							style="width: 100%; margin-bottom: 4px"
							class="auth-form__input form-control" type="email" name="email"
							placeholder="Nhập email (*)"> <span
							class="form-message"></span>
							</div>
						<input style="display: none;" name="btnQuenPass" type="text" value="quenmatkhau">
						<input class="auth-form__btn" style="border: none; margin-top: 0px;" type="submit"
							name="btnQuenPass" value="Đặt lại mật khẩu">
					</form>
				</div>
			</div>

		</div>
	</div>
	<script lang="javascript" type="text/javascript">
		Validator({
			form : '#form-3',
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
				Validator.isRequired('#auth-form__input-sdt1',
				'Bạn vui lòng nhập số điện thoại.'),
				Validator.minLength('#auth-form__input-sdt1',10),
		//Validator.isRequired('#auth-form__input-dc','Bạn vui lòng nhập địa chỉ.'),
		Validator.isRequired('#auth-form__input-email1',
				'Bạn vui lòng nhập email.'),
				Validator.isEmail('#auth-form__input-email1',
				'Email không hợp lệ.'),
			],
		});
	</script>
	
	<!-- Modal xác nhận mã code -->
	<div class="modal fade" id="modalCode" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 style="color: var(--primary-color); font-weight: bold;"
						class="modal-title">Mã xác nhận</h3>
				</div>
				<div style="display: flex; justify-content: center;"
					class="modal-body">

					<form style="width: 90%; position: relative;"
						action="QuenMatKhauController" method="get" id="form-4">
						
						<div style="position: relative;" class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Mã xác nhận
								<span style="color: red;">*</span>
							</h1>
							<input id="auth-form__input-code"
								style="width: 100%; margin-bottom: 4px"
								class="auth-form__input form-control" type="text"
								name="code" placeholder="Nhập mã xác nhận (*)">
							<span class="form-message"></span>
						</div>
						<input id="btnCodeEmail" style="display: none;" name="btnCodeEmail" type="text" value="btnCodeEmail">
						<input id="btnCode" style="display: none;" name="btnCode" type="text" value="btnCode">
						<input class="auth-form__btn" style="border: none; margin-top: 0px; " type="submit"
							name="btnQuenPass" value="Đặt lại mật khẩu">
					</form>
				</div>
			</div>

		</div>
	</div>
	<script lang="javascript" type="text/javascript">
		Validator({
			form : '#form-4',
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
				Validator.isRequired('#auth-form__input-code',
				'Bạn vui lòng nhập mã xác nhận.'),
				Validator.minLength('#auth-form__input-code',6),
			],
		});
	</script>
	
	
	<!-- Modal đổi mật khẩu khi quên -->
	<div class="modal fade" id="modalPassMoi" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 style="color: var(--primary-color); font-weight: bold;"
						class="modal-title">Đổi mật khẩu mới</h3>
				</div>
				<div style="display: flex; justify-content: center;"
					class="modal-body">

					<form style="width: 90%; position: relative;"
						action="QuenMatKhauController" method="get" id="form-5">
						<div style="position: relative;" class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Mật khẩu mới <span style="color: red;">*</span></h1>
							<input id="password5" style="margin-bottom: 4px;"
								class="auth-form__input form-control" type="password"
								name="matkhau1" placeholder="Nhập mật khẩu"> <input
								hidden="" id="input-eye-show5" type="checkbox"> <label
								for="input-eye-show5" id="eye-show"
								style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
								class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
								class="form-message"></span>
						</div>
						<script type="text/javascript">
							const input5 = document.getElementById("password5");
							const show5 = document
									.getElementById("input-eye-show5");

							show5.onchange = function(e) {
								input5.type = show5.checked ? "text"
										: "password";
							};
						</script>
						
						<div style="position: relative;" class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Xác nhận mật khẩu mới <span style="color: red;">*</span></h1>
							<input id="password6" style="margin-bottom: 4px;"
								class="auth-form__input form-control" type="password"
								name="matkhau2" placeholder="Nhập lại mật khẩu"> <input
								hidden="" id="input-eye-show6" type="checkbox"> <label
								for="input-eye-show6" id="eye-show"
								style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
								class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
								class="form-message"></span>
						</div>

						<script type="text/javascript">
							const input6 = document.getElementById("password6");
							const show6 = document
									.getElementById("input-eye-show6");

							show6.onchange = function(e) {
								input6.type = show6.checked ? "text"
										: "password";
							};
						</script>
						<input id="btnEmailPassMoi" style="display: none;" name="btnDoiPass" type="text" value="doimatkhau">
						<input class="auth-form__btn" style="border: none; margin-top: 0px;" type="submit"
							name="btnDoiPass" value="Đặt lại mật khẩu">
					</form>
				</div>
			</div>

		</div>
	</div>
	<script lang="javascript" type="text/javascript">
		Validator({
			form : '#form-5',
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
					Validator.isRequired('#password5','Bạn vui lòng nhập trường này.'),
					Validator.isRequired('#password6','Bạn vui lòng nhập trường này.'),
					Validator.isConFirmed(
							'#password6',
							function() {
								return document
										.querySelector('#form-5 #password5').value
							}, 'Xác nhận mật khẩu mới chưa chính xác.'),
			],
		});
	</script>
	
	<c:if test="${param.btnQuenPass != null }">
		<script type="text/javascript">
			var el = document.querySelector("#butCode");
			el.click();
			async function sendEmail(email) {
				try {
			      const response = await fetch(
			        "https://script.google.com/macros/s/AKfycbynR90KY5lHgJee2iEip-lAr6Xk05JzFmNKwrFNI71KlNHI6QWP0cgJrzkNvDDqlBduKg/exec?email="+email
			      );
			      const data = await response.json();
			      //console.log(data);
			      const btncode = document.getElementById("btnCode");
			      btncode.value = data.data.code;
			      const btnCodeEmail = document.getElementById("btnCodeEmail");
			      btnCodeEmail.value = `${email}`;
			     // console.log(data.data.code);
			     // console.log(data.data.status);
				}catch (e) {
					console.log(e);
				};
		    }
			//var emailDoiPass = ;
			sendEmail(`${email}`);
		</script>
	</c:if>
	<c:if test="${param.btnDoiPassMoi != null }">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			var el = document.querySelector("#butPassMoi");
			el.click();
			const btnEmailPassMoi = document.getElementById("btnEmailPassMoi");
			btnEmailPassMoi.value = `${email}`;
		</script>
	</c:if>
	<c:if test="${param.btnDoiPassMoiLoi != null }">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			var el = document.querySelector("#butCode");
			el.click();
			const btncode1 = document.getElementById("btnCode");
		      btncode1.value = "ChuaDungLanDau";
		      const btnCodeEmail = document.getElementById("btnCodeEmail");
		      btnCodeEmail.value = `${email}`;
			function showErrorToastQuenPass() {
				toast({
					title : 'Thất bại',
					message : 'Mã xác nhận không đúng. Vui lòng nhập lại.',
					type : 'error',
					duration : 5000
				})
			}
			showErrorToastQuenPass();
		</script>
	</c:if>
	<c:if test="${param.loiQuenPass != null }">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			var el = document.querySelector("#butQuen");
			el.click();
			function showErrorToastQuenPass() {
				toast({
					title : 'Thất bại',
					message : 'Không tìm thấy khách hàng.',
					type : 'error',
					duration : 5000
				})
			}
			showErrorToastQuenPass();
		</script>
	</c:if>
	<c:if test="${param.doiPassQuen != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			var el = document.querySelector("#dnweb");
			el.click();
			function showSuccessToastDatMatKhau() {
				toast({
			        title :'Thành công',
			        message : 'Đặt lại mật khẩu thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastDatMatKhau();
		</script>
	</c:if>
	



	<c:if test="${not empty loi}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			var el = document.querySelector("#dnweb");
			el.click();
			function showErrorToastDangNhap() {
				toast({
					title : 'Đăng nhập thất bại',
					message : 'Đăng nhập không thành công, vui lòng kiểm tra lại thông tin.',
					type : 'error',
					duration : 5000
				})
			}
			showErrorToastDangNhap();
		</script>
	</c:if>
	<c:if test="${loidangki != null }">
		<script type="text/javascript">
			//window.alert("Đăng kí không thành công!");
			var el = document.querySelector("#dkweb");
			el.click();
			function showErrorToastDangKi() {
				toast({
					title : 'Đăng kí thất bại',
					message : 'Số điện thoại hoặc email đã tồn tại.',
					type : 'error',
					duration : 5000
				})
			}
			showErrorToastDangKi();
		</script>
	</c:if>
	
	<c:if test="${param.themsp != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastThemSp() {
				toast({
			        title :'Thành công',
			        message : 'Thêm sản phẩm vào giỏ thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastThemSp();
		</script>
	</c:if>
</body>
</html>