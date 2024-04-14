<%@page import="Bean.AnhSanPham"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="Bean.GioHangBean"%>
<%@page import="Bean.SanPhamFullBean"%>
<%@page import="Bean.SanPhamBean"%>
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
<link rel="stylesheet" href="assets/css/chi-tiet.css">
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

#white:checked ~ .white {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#black:checked ~ .black {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#kem:checked ~ .kem {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#grey:checked ~ .grey {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#brown:checked ~ .brown {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#M:checked ~ .M {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#L:checked ~ .L {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#X:checked ~ .X {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#XL:checked ~ .XL {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

#XXL:checked ~ .XXL {
	color: var(--text-color);
	background-color: var(--primary-color);
	border: 1px solid var(--primary-color);
}

.product-item__name {
	font-size: 1.4rem;
	color: var(--black-color);
	line-height: 1.6rem;
	margin: 15px 0;
	text-align: center;
	font-weight: 500;
	height: 3.2rem;
	overflow: hidden;
	display: block;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
}

input:checked + label{
    color: var(--text-color);
    background-color: var(--primary-color);
    border: 1px solid var(--primary-color);
}

@media (max-width:739px){
	.header-with-search span{
		line-height: 20px;
		top: 20px !important;
    	right: 4px !important;
	}
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
									class="js-login header__welcome-link"> <span
										style="display: inline-block; width: 25px; line-height: 25px; height: 25px; background-color: green; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 500;"><%=session.getAttribute("taikhoan").toString().toUpperCase().charAt(0)%></span>
										<%=session.getAttribute("taikhoan")%>
								</a>
									<ul class="header__welcome-item__list">
										<li class="header__welcome-item__list-item"><a
											href="HoSoKhachHangController?info=1"
											class="header__welcome-item__list-item-link">Hồ sơ của
												tôi</a></li>
										<li class="header__welcome-item__list-item"><a
											href="HoSoKhachHangController?donmua=1"
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
					<a href="TrangChuController" class="header-with-search__logo-link">
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
											href="TrangChuController?maloai=${tc.getMaloai()}&madanhmuc=0&mathuonghieu=0"
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
								<ul class="header-nav-item-trademark__list">
									<c:forEach items="${dsTenLoaiDMThuongHieu}" var="tt">
										<li class="header-nav-item-trademark__item"><a
											href="TrangChuController?maloai=0&madanhmuc=0&mathuonghieu=${tt.getMathuonghieu()}"
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
								<ul class="header-nav-item-men__list">
									<c:forEach items="${dsTenLoaiDMDoNam}" var="dn">
										<li class="header-nav-item-men__item"><a
											href="TrangChuController?maloai=${dn.getMaloai()}&madanhmuc=${dn.getMadanhmuc()}&mathuonghieu=0"
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
								<ul class="header-nav-item-women__list">
									<c:forEach items="${dsTenLoaiDMDoNu }" var="dnu">
										<li class="header-nav-item-women__item"><a
											href="TrangChuController?maloai=${dnu.getMaloai()}&madanhmuc=${ dnu.getMadanhmuc()}&mathuonghieu=0"
											class="header-nav-item-women__link"> ${dnu.getTenloai()}
										</a></li>
									</c:forEach>
								</ul>
							</div>
							<!-- list đồ trẻ em -->
							<div class="header-nav__item-children">
								<li class="header-nav__item">
									<a href="TrangChuController?maloai=${dsTenLoaiDMTreEm.get(0).getMaloai()}&madanhmuc=${dsTenLoaiDMTreEm.get(0).getMadanhmuc()}&mathuonghieu=0"
									class="header-nav__link"> Design áo
									<!--  <i class="header-nav__icon fa-solid fa-caret-down"></i>-->
								</a></li>
								<!-- list trong list đồ trẻ em -->
								<!--<ul class="header-nav-item-children__list">
									<c:forEach items="${dsTenLoaiDMTreEm }" var="te">
										<li class="header-nav-item-children__item"><a
											href="TrangChuController?maloai=${te.getMaloai()}&madanhmuc=${te.getMadanhmuc()}&mathuonghieu=0"
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
												href="TrangChuController?maloai=${tc.getMaloai()}&madanhmuc=0&mathuonghieu=0"
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
												href="TrangChuController?maloai=0&madanhmuc=0&mathuonghieu=${tt.getMathuonghieu()}"
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
												href="TrangChuController?maloai=${dn.getMaloai()}&madanhmuc=${dn.getMadanhmuc()}&mathuonghieu=0"
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
												href="TrangChuController?maloai=${dnu.getMaloai()}&madanhmuc=${ dnu.getMadanhmuc()}&mathuonghieu=0"
												class="header-nav-item-all-mobile-tablet__link">
													${dnu.getTenloai()} </a></li>
										</c:forEach>
									</ul></li>
								<li id="js-product-children-id"
									class="dropdown header-nav-mobile-tablet__item-children js-product-children">
									<a class="dropdown-toggle header-nav-mobile-tablet__link" href="TrangChuController?maloai=${dsTenLoaiDMTreEm.get(0).getMaloai()}&madanhmuc=${dsTenLoaiDMTreEm.get(0).getMadanhmuc()}&mathuonghieu=0">
									Design áo
									<!--<i class="header-nav-mobile-tablet__icon fa-solid fa-caret-down"></i>-->
								</a>
									<!-- <ul class="dropdown-menu"
										style="position: relative; float: none; border: none; border-radius: 0; box-shadow: none; background-color: var(--primary-color); -webkit-box-shadow: 0;">

										<c:forEach items="${dsTenLoaiDMTreEm }" var="te">
											<li class="header-nav-item-all-mobile-tablet__item"><a
												style="padding: 0 0 0 60px; color: var(--text-color); line-height: 50px;"
												href="TrangChuController?maloai=${te.getMaloai()}&madanhmuc=${te.getMadanhmuc()}&mathuonghieu=0"
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
									action="TrangChuController" method="post">
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
										href="GioHangController"> <i
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
												<a href="GioHangController"
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

					<a href="TrangChuController"
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
									<a href="GioHangController"
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
													<a href="GioHangController"
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

		<!-- Container -->
		<div class="container">
			<div class="grid wide">
				<div class="row container__row">
					<div class="container__col col l-5 c-12 m-12">
						<img src="${anh }" alt="" class="container__col-img detail-img-js">
					</div>
					<div class="container__col container__col--info col l-7 c-12 m-12">
						<h4
							style="text-align: left; font-size: 2.4rem; margin: 15px 0 10px 0; line-height: 3rem; font-weight: 500; height: 6rem; overflow: hidden; display: block; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;"
							class="product-item__name detail-name-product-js">
							<c:out value="${tensanpham }"></c:out>
						</h4>
						<div class="product-item__action-detail">
							<span class="product-item__rating"> <i
								class="product-item__start-gold fa-solid fa-star"></i> <i
								class="product-item__start-gold fa-solid fa-star"></i> <i
								class="product-item__start-gold fa-solid fa-star"></i> <i
								class="product-item__start-gold fa-solid fa-star"></i> <i
								class="fa-solid fa-star"></i>
							</span> <span class="product-item__review-count">(20)</span>
						</div>
						<div class="product-sold">
							<c:out value="${ soluongdaban}"></c:out>
							<span class="product-sold-text">Đã bán</span>
						</div>
						<div class="product-item__price-detail" style="display: flex; align-items: center;">
							<c:choose>
								<c:when test="${giagiam ==0 }">
									<span
										class="product-item__price-current product-item__price-current-detail detail-price-current-js">
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${giaban }" type="currency"/>
										</span>
								</c:when>
								
								<c:otherwise>
									<span style="width: 25%; display: inline-block;margin: 0;"
										class="product-item__price-current product-item__price-current-detail detail-price-current-js">
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${giagiam }" type="currency"/>
										</span>
									<span style="width: 40%;display: inline-block;margin: 0 0 0 20px; font-size: 25px;"
										class="product-item__price-old product-item__price-old-detail detail-price-old-js">
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${giaban }" type="currency"/>
										</span>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="container__row-info row">
							<div class="container__col--info-left col l-4 m-4 c-4">
								<span class="container__col--info-left-text">Vận Chuyển</span>
							</div>
							<div class="container__col--info-right col l-8 m-8 c-8">
								<img
									src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/74f3e9ac01da8565c3baead996ed6e2a.png"
									height="17" alt="" class="container__col--info-right-img">
								<span class="container__col--info-right-info-text">Miễn
									phí vận chuyển</span>
							</div>
						</div>

						<div class="container__row-info row">
							<div class="container__col--info-left col l-4 m-4 c-4">
								<span class="container__col--info-left-text">Màu</span>
							</div>
							<div style="line-height: 2rem;"
								class="container__col--info-right container__col--info-rightMau col l-8 m-8 c-8">
								<c:choose>
									<c:when test="${listAnhVaMau.size() ==0 }">
										<input hidden form="soluongmua" id="white" type="radio"
											name="mau" value="Trắng" required> <label
											style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info white" for="white">Trắng</label>
										<input hidden form="soluongmua" id="black" type="radio"
											name="mau" value="Đen"> <label
											style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info black" for="black">Đen</label>
										<input hidden form="soluongmua" id="kem" type="radio" name="mau"
											value="Kem"> <label style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info kem" for="kem">Kem</label>
										<input hidden form="soluongmua" id="grey" type="radio"
											name="mau" value="Xám"> <label
											style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info grey" for="grey">Xám</label>
										<input hidden form="soluongmua" id="brown" type="radio"
											name="mau" value="Nâu"> <label
											style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info brown" for="brown">Nâu</label>
									</c:when>
									<c:otherwise>
										<c:forEach items="${listAnhVaMau }" var="m">
											<input hidden form="soluongmua" id="mau${m.getMauString()}"
								            type="radio" name="mau" value="${m.getMauString()}"required> <label
								            style="font-weight: 500; margin-bottom: 5px"
								            class="container__col--info-right-info mau${m.getMauString()}" for="mau${m.getMauString()}">${m.getMauString()}</label>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="container__row-info row">
							<div class="container__col--info-left col l-4 m-4 c-4">
								<span class="container__col--info-left-text">Size</span>
							</div>
							<div style="line-height: 2rem;"
								class="container__col--info-right col l-8 m-8 c-8">
								<c:choose>
									<c:when test="${listSize.size() ==0 }">
										<input hidden form="soluongmua" id="M" type="radio" name="size"
											value="M" required> <label style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info M" for="M">M</label> <input
											hidden form="soluongmua" id="L" type="radio" name="size"
											value="L"> <label style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info L" for="L">L</label> <input
											hidden form="soluongmua" id="X" type="radio" name="size"
											value="X"> <label style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info X" for="X">X</label> <input
											hidden form="soluongmua" id="XL" type="radio" name="size"
											value="XL"> <label style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info XL" for="XL">XL</label>
										<input hidden form="soluongmua" id="XXL" type="radio"
											name="size" value="XXL"> <label
											style="font-weight: 500; margin-bottom: 5px"
											class="container__col--info-right-info XXL" for="XXL">XXL</label>
									</c:when>
									<c:otherwise>
										<c:forEach items="${listSize }" var="s">
											<input hidden form="soluongmua" id="size${s}"
								            type="radio" name="size" value="${s}"required> <label
								            style="font-weight: 500; margin-bottom: 5px"
								            class="container__col--info-right-info size${s}" for="size${s}">${s}</label>
										</c:forEach>
									</c:otherwise>
								</c:choose>

							</div>
						</div>

						<form id="soluongmua"
							action="GioHangController?ht=1&msp=${masanpham }&tsp=${tensanpham }&anh=${anh }&gb=${giaban }&gg=${giagiam }&sldb=${soluongdaban }&mtsp=${motasanpham }&ml=${maloai }&mth=${mathuonghieu }&mdm=${madanhmuc}&acs=${anhchonsize}"
							method="post"></form>
						<div class="container__row-info row">
							<div class="container__col--info-left col l-4 m-4 c-4">
								<span class="container__col--info-left-text">Số lượng</span>
							</div>
							<div class="container__col--info-right col l-8 m-8 c-8">
								<div class="input--quantity">
									<button class="input--quantity__down down-js">
										<i class="input--quantity__down-icon fa-solid fa-minus"></i>
									</button>
									<input form="soluongmua" type="text"
										class="input--quantity__show input--quantity__show-js"
										name="soluongmua" value="1" role="spinbutton"
										aria-valuenow="1">
									<button class="input--quantity__up up-js">
										<i class="input--quantity__up-icon fa-solid fa-plus"></i>
									</button>
									<span style="color: var(--primary-color); margin-left: 10px" class="soluongsp"></span>
									<p class="thongbaosp" style="color: red;font-size: 14px;line-height: 1.42857143"></p>
								</div>
							</div>
						</div>
						
						<script type="text/javascript">
							const listCT = ${listCT};
						    var tongSpTrongKho = 0;
							for(var i=0;i<listCT.length;i++){
					            mang = listCT[i].split("/");
					            tongSpTrongKho += parseInt(mang[2],10) 
					        }
					        const soluongsp =  document.querySelector('.soluongsp');
					        soluongsp.innerHTML = tongSpTrongKho + ' sản phẩm sẵn có.'
						</script>
						<script type="text/javascript">
							var thuoctinhmau = false;
						    var thuoctinhsize = false;
						    var mauchon;
						    var sizechon;
						    
						    document.querySelectorAll('input[name="mau"]').forEach((e)=>{
						        e.onclick = function(e){
						        if (this.checked){
						            thuoctinhmau = false
						            if(thuoctinhmau == false){
						                thuoctinhmau = true;
						                mauchon = this.value;
						                var listAnhVaMau = ${listAnhVaMauJs};
						                for(var i=0;i<listAnhVaMau.length;i++){
								            mang = listAnhVaMau[i].split("<");
								            if(mauchon === mang[0]){
								            	var detailImgJs =  document.querySelector('.detail-img-js');
								            	detailImgJs.src = mang[1];
								            }
								        }
						            }
						            if(thuoctinhmau == true && thuoctinhsize == true){
						                for(var i=0;i<listCT.length;i++){
						                    mang = listCT[i].split("/");
						                        if(mang[0]===mauchon && mang[1]=== sizechon){
						                            tongSpTrongKho = parseInt(mang[2],10) 
						                            break;
						                        }else{
						                            tongSpTrongKho = 0
						                        }
						                }
						                const soluongsp =  document.querySelector('.soluongsp');
						                if(tongSpTrongKho ==0){
	
						                    soluongsp.innerHTML = "Hết hàng"
						                }else{
						                    soluongsp.innerHTML = tongSpTrongKho + ' sản phẩm sẵn có.'
						                    
						                }
						            }
						        }
						    };
						    })
						    
						    document.querySelectorAll('input[name="size"]').forEach((e)=>{
						        e.onclick = function(e){
						        if (this.checked){
						            thuoctinhsize = false
						            if(thuoctinhsize == false){
						                thuoctinhsize = true;
						                sizechon = this.value
						            }
						            if(thuoctinhmau == true && thuoctinhsize == true){
						                for(var i=0;i<listCT.length;i++){
						                    mang = listCT[i].split("/");
						                        if(mang[0]===mauchon && mang[1]=== sizechon){
						                            tongSpTrongKho = parseInt(mang[2],10) 
						                            break;
						                        }else{
						                            tongSpTrongKho = 0
						                        }
						                }
						                const soluongsp =  document.querySelector('.soluongsp');
						                if(tongSpTrongKho ==0){
	
						                    soluongsp.innerHTML = "Hết hàng"
						                }else{
						                    soluongsp.innerHTML = tongSpTrongKho + ' sản phẩm sẵn có.'
	
						                }
						            }
						        }
						    };
						    })
						    
						    
						    
						     // tăng giảm số lượng sản phẩm mua
								const down = document.querySelector(".down-js");
								const up = document.querySelector(".up-js");
								const showUpDown = document.querySelector(".input--quantity__show-js");
								const thongbaosp =  document.querySelector('.thongbaosp');
								
								function Up(){
								    var kq ;
								    kq = Number(showUpDown.getAttribute("value"));
								    kq++;
								    if(tongSpTrongKho < kq){
								    	thongbaosp.innerHTML = 'Số lượng bạn chọn đã đạt mức tối đa của sản phẩm này.'
								    }else{
								    	showUpDown.setAttribute('value', kq + '');
								    	thongbaosp.innerHTML = ''
								    }
								}
								up.addEventListener('click',Up);
								
								
								function Down(){
								    var kq;
								    kq = Number(showUpDown.getAttribute("value"));
								    if(tongSpTrongKho < kq){
								    	thongbaosp.innerHTML = 'Số lượng bạn chọn đã đạt mức tối đa của sản phẩm này.'
								    }else{
									    if(kq > 1){
									        kq--;
									        showUpDown.setAttribute('value', kq + '');
									    }else{
									        showUpDown.setAttribute('value', kq + '');
									    }
									    thongbaosp.innerHTML = ''
								    }
								}
								down.addEventListener('click' , Down);
						</script>
						<div class="container__buy">
							<c:choose>
								<c:when test="${dn != null }">
									<button name="addCart" form="soluongmua"
										class="container__buy-add" value="Thêm vào giỏ hàng">
										<i class="container__buy-add-icon fa-solid fa-cart-plus"></i>
										Thêm vào giỏ hàng
									</button>
		
									<button name="buyNow" form="soluongmua"
										class="container__buy-add-now" value="Mua ngay">Mua
										ngay</button>
								</c:when>
								<c:otherwise>
									<button name="addCart" data-toggle="modal"
										data-target="#modalDangNhap" class="container__buy-add"
										value="Thêm vào giỏ hàng">
										<i class="container__buy-add-icon fa-solid fa-cart-plus"></i>
										Thêm vào giỏ hàng
									</button>
		
									<button name="buyNow" data-toggle="modal"
										data-target="#modalDangNhap" class="container__buy-add-now"
										value="Mua ngay">Mua ngay</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="container-bottom container-bottom__pc">
					<h3 class="container-bottom__nav container-bottom__detail">Mô tả sản phẩm</h3>
					<h3 class="container-bottom__nav container-bottom__describe">Hướng dẫn chọn size</h3>
					<!-- container bottom boby detail -->
					<div class="container-bottom__body-detail">
						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Thương hiệu</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Kappa</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Phong cách</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Hàn Quốc</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Xuất xứ</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Việt Nam</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Chất liệu</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Thun</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Loại</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Áo thun tay ngắn</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Mẫu</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Có hình Logo Kappa</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Giới tính</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Nữ</div>
						</div>
					</div>

					<!-- container bottom boby describe -->
					<div  class="container-bottom__body-describe">
						<!--<p class="body-describe__delivery-time">
							- Áo thun dáng suông Staple, thuộc bộ sưu tập Open Air, mang hơi
							thở đường phố Mỹ với các gam màu rất nổi bật. <br> - Chất
							liệu 100% cotton, mỏng nhẹ, thoáng mát. <br> - Thời gian
							giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày.
						</p>
						<table class="body-describe__size-table">
							<h3 class="body-describe__size-table-title">*Bảng quy đổi
								size theo cân nặng:</h3>
							<thead>
								<th>Size</th>
								<th>Cân Nặng</th>
							</thead>
							<tbody>
								<tr>
									<td>M</td>
									<td>40kg - 50kg</td>
								</tr>
								<tr>
									<td>L</td>
									<td>50kg - 60kg</td>
								</tr>
								<tr>
									<td>X</td>
									<td>60kg - 70kg</td>
								</tr>
								<tr>
									<td>XL</td>
									<td>70kg - 80kg</td>
								</tr>
								<tr>
									<td>XXL</td>
									<td>> 80kg</td>
								</tr>
							</tbody>
						</table>
						<ul class="body-describe__node-list">
							<p class="body-describe__node-list-title">*LƯU Ý:</p>
							<li class="body-describe__node-item">- Do màn hình khác nhau
								và hiệu ứng ánh sáng, màu sắc sản phẩm thực tế sẽ khác so với
								hình ảnh, vui lòng lấy Sản phẩm thật làm tiêu chuẩn.</li>
							<li class="body-describe__node-item">- Kích thước chỉ là để
								tham khảo, Xin vui lòng cho phép sai số từ 1-3cm do đo lường thủ
								công, vui lòng kiểm tra xem kích thước Sản phẩm có phù hợp với
								bạn không trước khi mua.</li>
							<li class="body-describe__node-item">- Gợi ý chọn size phù
								hợp: Sử dụng quần áo tương tự để lấy size.</li>
						</ul>  -->
						<img style="width: 80%;" alt="" src="${anhchonsize}">
					</div>
				</div>

				<!-- container bottom mobile -->
				<div class="container-bottom container-bottom__mobile">
					<h3 class="container-bottom__nav container-bottom__detail">Chi
						tiết sản phẩm</h3>

					<!-- container bottom boby detail -->
					<div class="container-bottom__body-detail">
						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Thương hiệu</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Kappa</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Phong cách</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Hàn Quốc</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Xuất xứ</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Việt Nam</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Chất liệu</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Thun</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Loại</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Áo thun tay ngắn</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Mẫu</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Có hình Logo Kappa</div>
						</div>

						<div class="row">
							<div class="container-bottom__body-left col l-2 m-6 c-6">
								Giới tính</div>
							<div class="container-bottom__body-right col l-10 m-6 c-6">
								Nữ</div>
						</div>
					</div>

					<!-- container bottom boby describe -->
					<h3 class="container-bottom__nav container-bottom__describe">Mô
						tả sản phẩm</h3>
					<div class="container-bottom__body-describe">
						<p class="body-describe__delivery-time">
							- Áo thun dáng suông Staple, thuộc bộ sưu tập Open Air, mang hơi
							thở đường phố Mỹ với các gam màu rất nổi bật. <br> - Chất
							liệu 100% cotton, mỏng nhẹ, thoáng mát. <br> - Thời gian
							giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày.
						</p>
						<table class="body-describe__size-table">
							<h3 class="body-describe__size-table-title">*Bảng quy đổi
								size theo cân nặng:</h3>
							<thead>
								<th>Size</th>
								<th>Cân Nặng</th>
							</thead>
							<tbody>
								<tr>
									<td>M</td>
									<td>40kg - 50kg</td>
								</tr>
								<tr>
									<td>L</td>
									<td>50kg - 60kg</td>
								</tr>
								<tr>
									<td>X</td>
									<td>60kg - 70kg</td>
								</tr>
								<tr>
									<td>XL</td>
									<td>70kg - 80kg</td>
								</tr>
								<tr>
									<td>XXL</td>
									<td>> 80kg</td>
								</tr>
							</tbody>
						</table>
						<ul class="body-describe__node-list">
							<p class="body-describe__node-list-title">*LƯU Ý:</p>
							<li class="body-describe__node-item">- Do màn hình khác nhau
								và hiệu ứng ánh sáng, màu sắc sản phẩm thực tế sẽ khác so với
								hình ảnh, vui lòng lấy Sản phẩm thật làm tiêu chuẩn.</li>
							<li class="body-describe__node-item">- Kích thước chỉ là để
								tham khảo, Xin vui lòng cho phép sai số từ 1-3cm do đo lường thủ
								công, vui lòng kiểm tra xem kích thước Sản phẩm có phù hợp với
								bạn không trước khi mua.</li>
							<li class="body-describe__node-item">- Gợi ý chọn size phù
								hợp: Sử dụng quần áo tương tự để lấy size.</li>
						</ul>
					</div>
				</div>
				
				<script type="text/javascript">
					 // click show chi tiết sản phẩm mô tả sản phẩm
					const containerBottom = document.querySelector('.container-bottom');
					const detail = document.querySelector('.container-bottom__detail');
					const describe = document.querySelector('.container-bottom__describe');
	
					describe.addEventListener('click', () =>{
					    containerBottom.classList.add('open-describe');
					});
	
					detail.addEventListener('click', () =>{
					    containerBottom.classList.remove('open-describe');
					});
				</script>

				<!-- Hiển thị sản phẩm bạn có thể thích -->
				<c:if test="${dsSPUaThich != null }">
					<h3 class="container__heading"
						style="font-weight: 600; margin-top: 30px;">SẢN PHẨM TƯƠNG TỰ</h3>
					<div class="row sm-gutter">
						<c:forEach items="${dsSPUaThich }" var="sp">
							<div class="product-item-col col l-2 m-4 c-6">
								<!-- product item -->
								<a class="product-item"
									href="ChiTietSanPhamController?msp=${sp.getMasanpham()}&tsp=${sp.getTensanpham()}&anh=${sp.getAnh()}&gb=${sp.getGiaban()}&gg=${sp.getGiagiam()}&sldb=${sp.getSoluongdaban()}&mtsp=${sp.getMotasanpham()}&ml=${sp.getMaloai()}&mth=${sp.getMathuonghieu()}&mdm=${sp.getMadanhmuc()}&acs=${sp.getAnhchonsize()}">
									<img src="${sp.getAnh()}" alt="" class="product-item__img">
									<h4 class="product-item__name">${sp.getTensanpham()}</h4>
									<div class="product-item__price">
										<c:choose>
											<c:when test="${sp.getGiagiam() ==0}">
												<span class="product-item__price-current"
													style="font-weight: 600;">
													<fmt:setLocale value="vi_VN"/>
                    								<fmt:formatNumber value="${sp.getGiaban()}" type="currency"/>
													</span>
											</c:when>
											<c:otherwise>
												<span class="product-item__price-old">
													<fmt:setLocale value="vi_VN"/>
                    								<fmt:formatNumber value="${sp.getGiaban()}" type="currency"/>
												</span>
												<span class="product-item__price-current"
													style="font-weight: 600;">
														<fmt:setLocale value="vi_VN"/>
           												<fmt:formatNumber value="${sp.getGiagiam()}" type="currency"/>
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
										id="like-checkbox${sp.getMasanpham()}"
										class="product-item__like-input"> <label
										for="like-checkbox${sp.getMasanpham()}"
										class="product-item__like-empty"> <i
											class="product-item__like-icon-empty fa-regular fa-heart"></i>
									</label> <label for="like-checkbox${sp.getMasanpham()}"
										class="product-item__like-fill"> <i
											class="product-item__like-icon-fill fa-solid fa-heart"></i>
									</label>
								</span>
								</a>
							</div>
						</c:forEach>
				</c:if>
				
				</div>
				<c:if test="${dsSPUaThich != null }">
					<h3 class="container__heading"
						style="font-weight: 600; margin-top: 30px;">SẢN PHẨM GIÁ TỐT</h3>
					<div class="row sm-gutter">
						<c:forEach items="${dsSPUaThich }" var="sp">
							<div class="product-item-col col l-2 m-4 c-6">
								<!-- product item -->
								<a class="product-item"
									href="ChiTietSanPhamController?msp=${sp.getMasanpham()}&tsp=${sp.getTensanpham()}&anh=${sp.getAnh()}&gb=${sp.getGiaban()}&gg=${sp.getGiagiam()}&sldb=${sp.getSoluongdaban()}&mtsp=${sp.getMotasanpham()}&ml=${sp.getMaloai()}&mth=${sp.getMathuonghieu()}&mdm=${sp.getMadanhmuc()}&acs=${sp.getAnhchonsize()}">
									<img src="${sp.getAnh()}" alt="" class="product-item__img">
									<h4 class="product-item__name">${sp.getTensanpham()}</h4>
									<div class="product-item__price">
										<c:choose>
											<c:when test="${sp.getGiagiam() ==0}">
												<span class="product-item__price-current"
													style="font-weight: 600;">
													<fmt:setLocale value="vi_VN"/>
                    								<fmt:formatNumber value="${sp.getGiaban()}" type="currency"/>
													</span>
											</c:when>
											<c:otherwise>
												<span class="product-item__price-old">
													<fmt:setLocale value="vi_VN"/>
                    								<fmt:formatNumber value="${sp.getGiaban()}" type="currency"/>
												</span>
												<span class="product-item__price-current"
													style="font-weight: 600;">
													<fmt:setLocale value="vi_VN"/>
                    								<fmt:formatNumber value="${sp.getGiagiam()}" type="currency"/>
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
										id="like-checkbox${sp.getMasanpham()}"
										class="product-item__like-input"> <label
										for="like-checkbox${sp.getMasanpham()}"
										class="product-item__like-empty"> <i
											class="product-item__like-icon-empty fa-regular fa-heart"></i>
									</label> <label for="like-checkbox${sp.getMasanpham()}"
										class="product-item__like-fill"> <i
											class="product-item__like-icon-fill fa-solid fa-heart"></i>
									</label>
								</span>
								</a>
							</div>
						</c:forEach>
				</c:if>
				</div>
			</div>
		</div>
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
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Tài
									khoản</h1>
								<input id="auth-form__input-taikhoan"
									style="margin-bottom: 4px;"
									class="auth-form__input form-control" type="text"
									name="taikhoan" placeholder="Nhập tài khoản"> <span
									class="form-message"></span>
							</div>

							<div style="position: relative;" class="form-group">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Mật
									khẩu</h1>
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
								const input = document
										.getElementById("password1");
								const show = document
										.getElementById("input-eye-show");

								show.onchange = function(e) {
									input.type = show.checked ? "text"
											: "password";
								};
							</script>

							<%
							if (session.getAttribute("solanloi") != null) {
								if ((int) session.getAttribute("solanloi") >= 3) {
							%>

							<div style="margin: 0" class="form-group">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
									mã:</h1>
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

							<%
							}
							}
							%>
							<input class="auth-form__btn"
								style="border: none; margin-top: 0px;" type="submit"
								name="btnDangNhap" value="Đăng nhập"> <a href=""
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
									<a href="" class="auth-form__policy-link">Điều khoản dịch
										vụ </a>& <a href="" class="auth-form__policy-link">Chính sách
										bảo mật </a>
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
												'Bạn vui lòng nhập tài khoản.'),
										Validator.isRequired('#password1',
												'Bạn vui lòng nhập mật khẩu.'),
										Validator
												.isRequired('#auth-form__input-capcha')
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
												'Bạn vui lòng nhập tài khoản.'),
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
										'Bạn vui lòng nhập tài khoản.'),
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
										họ tên:</h1>
									<input id="auth-form__input-ht"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="text" name="hoten"
										placeholder="Nhập họ tên (*)"> <span
										class="form-message"></span>
								</div>
								<div class="form-group" style="width: 48%">
									<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
										số điện thoại:</h1>
									<input id="auth-form__input-sdt"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="text"
										name="sodienthoai" placeholder="Nhập số điện thoại (*)">
									<span class="form-message"></span>
								</div>

							</div>
							<div style="display: flex; justify-content: space-between;">
								<div class="form-group" style="width: 48%">
									<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
										địa chỉ:</h1>
									<input id="auth-form__input-dc"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="text"
										name="diachi" placeholder="Nhập địa chỉ (*)"> <span
										class="form-message"></span>
								</div>
								<div class="form-group" style="width: 48%">
									<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
										email:</h1>
									<input id="auth-form__input-email"
										style="width: 100%; margin-bottom: 4px"
										class="auth-form__input form-control" type="email"
										name="email" placeholder="Nhập email (*)"> <span
										class="form-message"></span>
								</div>
							</div>
							<div class="form-group" style="width: 100%">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
									tài khoản:</h1>
								<input id="auth-form__input-tk"
									style="width: 100%; margin-bottom: 4px"
									class="auth-form__input form-control" type="text"
									name="taikhoan" placeholder="Nhập tài khoản (*)"> <span
									class="form-message"></span>
							</div>

							<div style="position: relative;" class="form-group">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
									mật khẩu:</h1>
								<input id="password2" style="margin-bottom: 4px;"
									class="auth-form__input form-control" type="password"
									name="matkhau1" placeholder="Nhập mật khẩu (*)"> <input
									hidden="" id="input-eye-show1" type="checkbox"> <label
									for="input-eye-show1" id="eye-show"
									style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
									class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
									class="form-message"></span>
							</div>
							<script type="text/javascript">
								const input2 = document
										.getElementById("password2");
								const show2 = document
										.getElementById("input-eye-show1");

								show2.onchange = function(e) {
									input2.type = show2.checked ? "text"
											: "password";
								};
							</script>

							<div style="position: relative;" class="form-group">
								<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
									lại mật khẩu:</h1>
								<input id="password3" style="margin-bottom: 4px;"
									class="auth-form__input form-control" type="password"
									name="matkhau2" placeholder="Nhập lại mật khẩu (*)"> <input
									hidden="" id="input-eye-show2" type="checkbox"> <label
									for="input-eye-show2" id="eye-show"
									style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
									class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
									class="form-message"></span>
							</div>

							<script type="text/javascript">
								const input3 = document
										.getElementById("password3");
								const show3 = document
										.getElementById("input-eye-show2");

								show3.onchange = function(e) {
									input3.type = show3.checked ? "text"
											: "password";
								};
							</script>

							<input class="auth-form__btn" style="border: none;" type="submit"
								name="btnDangNhap" value="Đăng kí"> <a
								style="display: none" href="" class="auth-form__forget-pass">Quên
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
									<a href="" class="auth-form__policy-link">Điều khoản dịch
										vụ </a>& <a href="" class="auth-form__policy-link">Chính sách
										bảo mật </a>
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
						Validator.isRequired('#auth-form__input-dc',
								'Bạn vui lòng nhập địa chỉ.'),
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
						Validator.isRequired('#auth-form__input-tk',
								'Bạn vui lòng nhập tài khoản.'),
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

		<script type="text/javascript" src="assets/script/chi-tiet.js"></script>
		
		<c:if test="${not empty loi}">
			<script type="text/javascript">
				//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
				var el = document.querySelector("#dnweb");
				el.click();
				function showErrorToastDangNhap() {
					toast({
						title : 'Error',
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
						title : 'Error',
						message : 'Đăng kí không thành công, vui lòng kiểm tra lại thông tin.',
						type : 'error',
						duration : 5000
					})
				}
				showErrorToastDangKi();
			</script>
		</c:if>
</body>
</html>