<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="Bean.DonMuaBean"%>
<%@page import="Bean.NoiNhanBean"%>
<%@page import="Bean.KhachHangBean"%>
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

@media ( max-width :739px) {
	.header-with-search span {
		line-height: 20px;
		top: 20px !important;
		right: 4px !important;
	}
}

.preview-img {
	max-width: 37.51%;
	max-height: 42.66%;
	width: 37.51%;
	height: 42.66%;
}

.preview-img img {
	width: 100%;
	height: 100%;
	object-fit: contain;
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

h4{
	margin: 0;
}
p {
	margin: 0;
}
</style>
</head>
<body>
	<div style="z-index: 9999999999999999;" id="toast"></div>
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
								<li class="header-nav__item"><a
									href="TrangChuController?maloai=${dsTenLoaiDMTreEm.get(0).getMaloai()}&madanhmuc=${dsTenLoaiDMTreEm.get(0).getMadanhmuc()}&mathuonghieu=0"
									class="header-nav__link"> Design áo <!--  <i class="header-nav__icon fa-solid fa-caret-down"></i>-->
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
							<span style="line-height: 95px"
								class="header-nav-mobile-tablet__heading">DANH MỤC SẢN
								PHẨM <label for="header-nav-mobile-tablet__checkbox"
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
									<a class="dropdown-toggle header-nav-mobile-tablet__link"
									href="TrangChuController?maloai=${dsTenLoaiDMTreEm.get(0).getMaloai()}&madanhmuc=${dsTenLoaiDMTreEm.get(0).getMadanhmuc()}&mathuonghieu=0">
										Design áo <!--<i class="header-nav-mobile-tablet__icon fa-solid fa-caret-down"></i>-->
								</a> <!-- <ul class="dropdown-menu"
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
																			<fmt:setLocale value="vi_VN" /> <fmt:formatNumber
																				value="${gh.getGiaban()}" type="currency" />
																	</b></td>
																</c:when>
																<c:otherwise>
																	<td width="100"
																		style="font-size: 1.4rem; color: var(--primary-color);"><b>
																			<fmt:setLocale value="vi_VN" /> <fmt:formatNumber
																				value="${gh.getGiagiam()}" type="currency" />
																	</b></td>
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

		<div class="container" style="margin-top: var(--header-height);">
			<div class="grid wide">
				<div class="row" style="margin-top: 30px;">
					<div class="col l-3"
						style="background-color: #9fdbe4; height: 100%; padding-top: 10px; margin-right: 20px; border-radius: 10px; padding-left: 20px; padding-bottom: 20px; margin-top: 54px;">
						<!--  <div class="row"
							style="padding-bottom: 15px; padding-top: 15px; border-bottom: 1px solid var(--primary-color);">
							<div class="col l-4">
								<span
									style="display: block; width: 100%; line-height: 40px; height: 40px; background-color: green; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 500; font-size: 30px;"><%=session.getAttribute("taikhoan").toString().toUpperCase().charAt(0)%></span>
							</div>
							<div class="col l-8">
								<b style="font-size: 18px; line-height: 40px;"><%=session.getAttribute("taikhoan")%></b>
							</div>
						</div>-->

						<c:choose>
							<c:when test="${param.info != null }">
								<!--<a href="HoSoKhachHangController" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-gear"></i> Tài
											khoản của tôi
										</span>
									</div>
								</a>-->
								<a href="HoSoKhachHangController?info=1" class="row"
									style="margin-top: 10px; cursor: pointer; padding: 5px 0;">
									<div class="col l-12">
										<span
											style="font-size: 2rem; font-weight: bold; color: var(--primary-color);">
											<i style="margin-right: 5px;" class="fa-solid fa-user"></i>
											Thông tin
										</span>
									</div>
								</a>
								<a href="HoSoKhachHangController?location=1" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-location-dot"></i>
											Địa chỉ nhận hàng
										</span>
									</div>
								</a>
								<a href="HoSoKhachHangController?donmua=1" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-box"></i> Đơn
											hàng
										</span>
									</div>
								</a>
							</c:when>
							<c:when test="${param.location != null }">
								<!--<a href="HoSoKhachHangController" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-gear"></i> Tài
											khoản của tôi
										</span>
									</div>
								</a>-->
								<a href="HoSoKhachHangController?info=1" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-user"></i>
											Thông tin
										</span>
									</div>
								</a>
								<a href="HoSoKhachHangController?location=1" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span
											style="font-size: 2rem; font-weight: bold; color: var(--primary-color);">
											<i style="margin-right: 5px;"
											class="fa-solid fa-location-dot"></i> Địa chỉ nhận hàng
										</span>
									</div>
								</a>
								<a href="HoSoKhachHangController?donmua=1" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-box"></i> Đơn
											hàng
										</span>
									</div>
								</a>
							</c:when>
							<c:when test="${param.donmua != null }">
								<!--  <a href="HoSoKhachHangController" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-gear"></i> Tài
											khoản của tôi
										</span>
									</div>
								</a>-->
								<a href="HoSoKhachHangController?info=1" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-user"></i>
											Thông tin
										</span>
									</div>
								</a>
								<a href="HoSoKhachHangController?location=1" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span style="font-size: 2rem; font-weight: bold;"> <i
											style="margin-right: 5px;" class="fa-solid fa-location-dot"></i>
											Địa chỉ nhận hàng
										</span>
									</div>
								</a>
								<a href="HoSoKhachHangController?donmua=1" class="row"
									style="margin-top: 10px; cursor: pointer; color: black; padding: 5px 0;">
									<div class="col l-12">
										<span
											style="font-size: 2rem; font-weight: bold; color: var(--primary-color);">
											<i style="margin-right: 5px;" class="fa-solid fa-box"></i>
											Đơn hàng
										</span>
									</div>
								</a>
							</c:when>
						</c:choose>
					</div>
					<div class="col l-9" style="padding: 5px 10px; max-width: 70%">
						<c:choose>
							<c:when test="${param.info != null }">
								<div class="row" style="padding-bottom: 15px;">
									<div class="col l-12">
										<h2
											style="margin: 0; padding-bottom: 1px; color: var(--primary-color);">
											<b>Thông tin của tôi</b>
										</h2>
									</div>
								</div>
								<div class="row"
									style="padding: 10px 30px 20px 20px; border: 2px solid var(--primary-color); border-radius: 10px;">
									
									<div class="col l-3">
										
										<c:choose>
											<c:when test="${dn.getAvatar() == null }">
												<input form="formInfo" name="anhDaiDien" type="file"
												id="file-input" accept="image/*" style="display: none;">
												<img class="choose-img" style="width: 100%; cursor: pointer;"
													src="https://hoang-phuc.com/static/version1713256568/frontend/Hpi/default/vi_VN/Magenest_CustomerAvatar/images/no-profile-photo.svg"
													alt="preview-img">
												<img style="display: none; width: 100%; cursor: pointer;"
													class="previewImgDesign choose-img2" src=""
													alt="preview-img">
											</c:when>
											<c:otherwise>
												<input form="formInfo" name="anhDaiDien" type="file"
												id="file-input" accept="image/*" style="display: none;">
												<input form="formInfo" type="text" name="anhDaiDien1" value="${dn.getAvatar() }" style="display: none;">
												<img class="choose-img" style="width: 100%; cursor: pointer;"
													src="${dn.getAvatar() }" alt="preview-img">
												<img style="display: none; width: 100%; cursor: pointer;"
													class="previewImgDesign choose-img2"
													src="${dn.getAvatar() }" alt="preview-img">
											</c:otherwise>
										</c:choose>
										<h4 style="width: 100%; text-align: center; color: var(--primary-color); font-weight: bold; margin-top: 35px;">Số điểm: <span style="color: red; font-size: 20px;">${dn.getTichdiem() } điểm</span></h4>
									</div>
									<div class="col l-9">
									<form id="formInfo" action="SuaThongTinKhachHangController"
										enctype="multipart/form-data" method="post">
										<div style="margin-top: 20px;"
											class="field field-name-firstname form-group">
											<label style="font-size: 20px;" for="firstname">Họ và
												tên <span style="color: red;">*</span>
											</label>
											<div style="margin-top: 10px;" class="control">
												<input form="formInfo"
													style="width: 100%; height: 20px; font-size: 18px; padding: 25px 15px; border-radius: 10px; border: 1px solid #ccc;"
													type="text" id="firstname" name="hoten"
													value="${dn.getHoten() }" placeholder="Nhập họ và tên"
													class="input-text required-entry form-control">
													<span class="form-message"></span> 
											</div>
										</div>
										<div style="margin-top: 30px;" class="field field-phone form-group">
											<label style="font-size: 20px;" for="phone">Số điện
												thoại <span style="color: red;">*</span>
											</label>
											<div style="margin-top: 10px;" class="control">
												<input form="formInfo"
													style="width: 100%; height: 20px; font-size: 18px; padding: 25px 15px; border-radius: 10px; border: 1px solid #ccc;"
													type="text" id="phone" name="sodienthoai"
													value="${dn.getSodienthoai() }" placeholder="Số điện thoại"
													class="input-text required-entry form-control">
													<span class="form-message"></span>
											</div>
										</div>
										<div style="margin-top: 30px;" class="field field-email form-group">
											<label style="font-size: 20px;" for="email">Email <span
												style="color: red;">*</span>
												<a data-dismiss="modal" data-toggle="modal" data-target="#modalDoiEmail" style="color: #3aa8d0;margin-left: 15px;cursor: pointer;">Đổi email</a>
												</label>
											<div style="margin-top: 10px;" class="control">
												<input form="formInfo"
													style="width: 100%; height: 20px; font-size: 18px; padding: 25px 15px; border-radius: 10px; border: 1px solid #ccc;display: none;"
													type="text" id="emailTruyen" name="email"
													value="${dn.getEmail() }" placeholder="email"
													class="input-text required-entry form-control">
												<input form="formInfo"
													style="width: 100%; height: 20px; font-size: 18px; padding: 25px 15px; border-radius: 10px; border: 1px solid #ccc;"
													type="text" id="email" name="email"
													value="${dn.getEmail() }" placeholder="email"
													class="input-text required-entry form-control" disabled>
												<span class="form-message"></span>
											</div>
										</div>
										<div style="margin-top: 30px;" class="field field-location">
											<label style="font-size: 20px;" for="location">Địa chị
												<span style="color: red;">*</span> <span
												style="margin-left: 15px;"> <c:choose>
														<c:when test="${noinhan!=null }">
															<a style="color: #3aa8d0;"
																href="HoSoKhachHangController?location=1&capnhatdc=sua">Sửa
																địa chỉ</a>
														</c:when>
														<c:otherwise>
															<a style="color: #3aa8d0;"
																href="HoSoKhachHangController?location=1&capnhatdc=them">Thêm
																địa chỉ</a>
														</c:otherwise>
													</c:choose>
											</span>
											</label>
											<div style="margin-top: 10px;" class="control">
												<input form="formInfo"
													style="width: 100%; height: 20px; font-size: 18px; padding: 25px 15px; border-radius: 10px; border: 1px solid #ccc;"
													type="text" id="location" name="diachi"
													value="${dn.getDiachi() }" placeholder="Chưa có địa chỉ"
													class="input-text required-entry form-control" disabled>
											</div>
										</div>
										<div style="margin-top: 30px;" class="formLuu">
											<div style="margin-top: 10px;" class="control">
												<input form="formInfo"
													style="width: 30%; font-size: 20px; padding: 14px 5px; border-radius: 10px; border: 1px solid #3aa8d0; float: right; background-color: var(--primary-color); color: #fff; font-weight: bold;"
													type="submit" name="btnLuu" value="Lưu thông tin"
													class="input-btnLuu">
												<a data-dismiss="modal" data-toggle="modal" data-target="#modalDoiPass" style="width: 30%; font-size: 20px; padding: 11px 5px; border-radius: 10px; border: 1px solid #3aa8d0; background-color: var(--text-color); color: var(--primary-color); font-weight: bold;display: inline-block; text-align: center;cursor: pointer;">
													Đổi mật khẩu
												</a>
											</div>
										</div>
										</form>
									</div>
									
								</div>
								<script lang="javascript" type="text/javascript">
									Validator({
										form : '#formInfo',
										formGroupSelector : '.form-group',
										errorElement : '.form-message',
										rules : [ 
												Validator.isRequired('#firstname','Bạn vui lòng nhập họ tên.'),
												Validator.isRequired('#email','Bạn vui lòng nhập email.'),
												Validator.isRequired('#phone','Bạn vui lòng nhập số điện thoại.'),
										],
									});
								</script>
								
								<script type="text/javascript">
									const chooseImgBtn = document.querySelector(".choose-img");
									const chooseImgBtn2 = document.querySelector(".choose-img2");
								    const fileInput = document.querySelector("#file-input");
								    const previewImgDesign = document.querySelector('.previewImgDesign');
								
								    const loadImage = () => {
								        let file = fileInput.files[0];
								        if(!file) return;
								        previewImgDesign.src = URL.createObjectURL(file);
								        previewImgDesign.style.display = "block";
								        chooseImgBtn.style.display = "none";
								    }
								
								    fileInput.addEventListener("change", loadImage);
								    chooseImgBtn.addEventListener("click", () => fileInput.click());
								    chooseImgBtn2.addEventListener("click", () => fileInput.click());
								</script>
							</c:when>
							<c:when test="${param.location != null }">
								<c:choose>
									<c:when test="${param.capnhatdc != null }">
										<c:choose>
											<c:when test="${param.capnhatdc.equals('sua') }">
												<div class="row" style="padding-bottom: 15px;">
													<div class="col l-12">
														<h2
															style="margin: 0; padding-bottom: 1px; color: var(--primary-color);">
															<b>Cập nhật địa chỉ</b>
														</h2>
													</div>
												</div>
											</c:when>
											<c:when test="${param.capnhatdc.equals('them') }">
												<div class="row" style="padding-bottom: 15px;">
													<div class="col l-12">
														<h2
															style="margin: 0; padding-bottom: 1px; color: var(--primary-color);">
															<b>Thêm địa chỉ</b>
														</h2>
													</div>
												</div>
											</c:when>
										</c:choose>
										<div class="row"
											style="padding: 10px 30px 20px 20px; border: 2px solid var(--primary-color); border-radius: 10px;">
											<form id="formLocation" action="HoSoKhachHangController"
												method="get" style="width: 100%;">
											<div class="col l-12">
												<div style="margin-top: 20px;"
													class="field field-name-firstname">
													<label style="font-size: 20px;" for="firstname">Họ
														và tên <span style="color: red;">*</span>
													</label>
													<div style="margin-top: 10px;" class="control">
														<input form="formLocation"
															style="width: 100%; height: 20px; font-size: 18px; padding: 25px 15px; border-radius: 10px; border: 1px solid #ccc;"
															type="text" id="firstname" name="firstname"
															value="${dn.getHoten() }" placeholder="Nhập họ và tên"
															class="input-text required-entry" disabled>
													</div>
												</div>
												<div style="margin-top: 30px;" class="field field-phone">
													<label style="font-size: 20px;" for="phone">Số điện
														thoại <span style="color: red;">*</span>
													</label>
													<div style="margin-top: 10px;" class="control">
														<input form="formLocation"
															style="width: 100%; height: 20px; font-size: 18px; padding: 25px 15px; border-radius: 10px; border: 1px solid #ccc;"
															type="text" id="phone" name="phone"
															value="${dn.getSodienthoai() }"
															placeholder="Số điện thoại"
															class="input-text required-entry" disabled>
													</div>
												</div>
												<div class="row">
													<div style="margin-top: 30px;" class="col l-4 form-group">
														<label style="font-size: 20px;">Tỉnh/Thành phố <span
															style="color: red;">*</span></label> 
															<input id="tenTinhThanh"
															type="text" form="formLocation" name="tenTinhThanh"
															style="display: none;"> 
															<select
																style="margin-top: 10px; width: 100%; font-size: 18px; padding: 12px 15px; border-radius: 10px; border: 1px solid #ccc; height: 50px;"
																form="formLocation" name="tinhThanh"
																class="form-select form-select-sm mb-3 form-control" id="city"
																aria-label=".form-select-sm">
																<option value="" selected>Chọn Tỉnh/Thành phố</option>
															</select>
														<span class="form-message"></span>
													</div>
													<div style="margin-top: 30px;" class="col l-4 form-group">
														<label style="font-size: 20px;">Quận/Huyện <span
															style="color: red;">*</span></label> <input id="tenQuanHuyen"
															type="text" form="formLocation" name="tenQuanHuyen"
															style="display: none;"> <select
															style="margin-top: 10px; width: 100%;height: 50px; font-size: 18px; padding: 12px 15px; border-radius: 10px; border: 1px solid #ccc;"
															form="formLocation" name="quanHuyen"
															class="form-select form-select-sm mb-3 form-control" id="district"
															aria-label=".form-select-sm">
															<option value="" selected>Chọn Quận/Huyện</option>
														</select>
															<span class="form-message"></span>
													</div>
													<div style="margin-top: 30px;" class="col l-4 form-group">
														<label style="font-size: 20px;">Phường/Xã <span
															style="color: red;">*</span></label> <input id="tenPhuongXa"
															type="text" form="formLocation" name="tenPhuongXa"
															style="display: none;"> <select
															style="margin-top: 10px; width: 100%;height: 50px; font-size: 18px; padding: 12px 15px; border-radius: 10px; border: 1px solid #ccc;"
															form="formLocation" name="phuongXa"
															class="form-select form-select-sm form-control" id="ward"
															aria-label=".form-select-sm">
															<option value="" selected>Chọn Phường/Xã</option>
														</select>
														<span class="form-message"></span>
													</div>
												</div>
												<div style="margin-top: 20px;"
													class="field field-name-locationDetail form-group">
													<label style="font-size: 20px;" for="locationDetail">Số
														nhà <span style="color: red;">*</span>
													</label>
													<div style="margin-top: 10px;" class="control">
														<input id="soNha" form="formLocation"
															style="width: 100%; height: 20px; font-size: 18px; padding: 25px 15px; border-radius: 10px;"
															type="text" id="locationDetail" name="locationDetail"
															value="" placeholder="Địa chỉ chi tiết"
															class="input-text required-entry form-control">
															<span class="form-message"></span>
													</div>
												</div>
												<script lang="javascript" type="text/javascript">
													Validator({
														form : '#formLocation',
														formGroupSelector : '.form-group',
														errorElement : '.form-message',
														rules : [ 
																Validator.isRequired('#soNha','Bạn vui lòng nhập đại chỉ nhà.'),
																Validator.isRequired('#ward','Bạn vui lòng chọn Phường/Xã.'),
																Validator.isRequired('#district','Bạn vui lòng chọn Quận/Huyện.'),
																Validator.isRequired('#city','Bạn vui lòng chọn Tỉnh/Thành phố.'),
														],
													});
												</script>
												<c:choose>
													<c:when test="${param.capnhatdc.equals('sua') }">
														<div class="col l-12">
															<div style="margin-top: 30px;" class="formLuu">
																<div
																	style="width: 30%; font-size: 20px; border-radius: 10px; border: 1px solid var(--primary-color); float: left; background-color: #fff; font-weight: bold; text-align: center; cursor: pointer;"
																	class="control">
																	<a href="HoSoKhachHangController?location=1"
																		style="display: block; color: var(--primary-color); padding: 10px 5px;">Trở
																		lại</a>
																</div>
															</div>
															<input style="display: none;" form="formLocation" name="btnLuuLocation" type="text" value="1">
															<div style="margin-top: 30px;" class="formLuu">
																<div style="margin-top: 10px;" class="control">
																	<input form="formLocation"
																		style="width: 30%; font-size: 20px; padding: 12px 5px; border-radius: 10px; border: 1px solid #3aa8d0; float: right; background-color: var(--primary-color); color: #fff; font-weight: bold;"
																		type="submit" name="btnLuuLocation" value="Lưu địa chỉ"
																		class="input-btnLuu">
																</div>
															</div>
														</div>
													</c:when>
													<c:when test="${param.capnhatdc.equals('them') }">
														<div class="col l-12">
															<div style="margin-top: 30px;" class="formLuu">
																<div
																	style="width: 30%; font-size: 20px; border-radius: 10px; border: 1px solid var(--primary-color); float: left; background-color: #fff; font-weight: bold; text-align: center; cursor: pointer;"
																	class="control">
																	<a href="HoSoKhachHangController?location=1"
																		style="display: block; color: var(--primary-color); padding: 10px 5px;">Trở
																		lại</a>
																</div>
															</div>
															<div style="margin-top: 30px;" class="formLuu">
																<div style="margin-top: 10px;" class="control">
																	<input form="formLocation"
																		style="width: 30%; font-size: 20px; padding: 14px 5px; border-radius: 10px; border: 1px solid #3aa8d0; float: right; background-color: var(--primary-color); color: #fff; font-weight: bold;"
																		type="submit" name="btnThemLocation"
																		value="Thêm địa chỉ" class="input-btnLuu">
																</div>
															</div>
														</div>
													</c:when>
												</c:choose>
											</div>
										</form>
										</div>
										<script
											src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
										<script>
						                    var citis = document.getElementById("city");
						                    var districts = document.getElementById("district");
						                    var wards = document.getElementById("ward");
						
						                    var tenTinhThanh = document.getElementById("tenTinhThanh");
						                    var tenQuanHuyen = document.getElementById("tenQuanHuyen");
						                    var tenPhuongXa = document.getElementById("tenPhuongXa");
						                    
						                    var Parameter = {
						                        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
						                        method: "GET",
						                        responseType: "application/json",
						                    };
						                    var promise = axios(Parameter);
						                    promise.then(function (result) {
						                        renderCity(result.data);
						                    });
						
						                    function renderCity(data) {
						                        for (const x of data) {
						                            citis.options[citis.options.length] = new Option(x.Name, x.Id);
						                        }
						                        citis.onchange = function () {
						                            ward.length = 1;
						                            if (this.value != "") {
						                                const result = data.filter(n => n.Id === this.value);
						                                //console.log(this);
						                                tenTinhThanh.value = result[0].Name;
						                                console.log(result[0].Name); //tên thành phố
						                                //console.log(result[0].Id);// mã thành phố
						                                tenTinhThanh.value = result[0].Name;
						                                for (const k of result[0].Districts) {
						                                    district.options[district.options.length] = new Option(k.Name, k.Id);
						                                }
						                            }
						                        };
						                        district.onchange = function () {
						                            ward.length = 1;
						                            const dataCity = data.filter((n) => n.Id === citis.value);
						                            // console.log(dataCity);
						                            if (this.value != "") {
						                                const quanHuyen = dataCity[0].Districts.filter(n => n.Id === this.value);
						                                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;
						                                tenQuanHuyen.value = quanHuyen[0].Name;
						                                console.log(quanHuyen[0].Name);// tên quận huyện
						                                //console.log(quanHuyen[0].Id);// mã quận huyện
						                                tenQuanHuyen.value = quanHuyen[0].Name;
						                                for (const w of dataWards) {
						                                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
						                                }
						                            }
						                        };
						                        wards.onchange = function () {
						                            const dataCity = data.filter((n) => n.Id === citis.value);
						                            const quanHuyen = dataCity[0].Districts.filter(n => n.Id === district.value);
						                            const dataPhuongXa = quanHuyen[0].Wards.filter(n => n.Id === wards.value);
						                            tenPhuongXa.value = dataPhuongXa[0].Name;
						                            console.log(dataPhuongXa[0].Name);// tên phường xã
						                            //console.log(dataPhuongXa[0].Id);// mã phường xã
						                        }
						                    }
						                </script>
									</c:when>
									<c:otherwise>
										<div class="row" style="padding-bottom: 15px;">
											<div class="col l-12">
												<h2
													style="margin: 0; padding-bottom: 1px; color: var(--primary-color);">
													<b>Địa chỉ nhận hàng</b>
												</h2>
											</div>
										</div>
	
										<c:choose>
											<c:when test="${noinhan!= null }">
												<div class="row"
													style="padding: 10px 30px 20px 20px; border: 2px solid var(--primary-color); border-radius: 10px;">
													<div class="col l-12">
														<div style="margin-top: 20px;">
															<span style="font-size: 20px;">${dn.getHoten() }</span> <span
																style="font-size: 20px;"> - </span> <span
																style="font-size: 20px;">${dn.getSodienthoai() }</span>
														</div>
														<div style="margin-top: 20px;">
															<span style="font-size: 20px; font-weight: bold;">Địa
																chỉ: </span> <span style="font-size: 20px;">${dn.getDiachi() }</span>
														</div>
														<div style="margin-top: 30px;" class="formLuu">
															<div style="margin-top: 10px;" class="control">
																<a
																	href="HoSoKhachHangController?location=1&capnhatdc=sua"
																	style="width: 40%; font-size: 20px; padding: 14px 5px; border-radius: 10px; border: 1px solid #3aa8d0; float: left; background-color: var(--primary-color); color: #fff; font-weight: bold; text-align: center;">
																	<i style="margin-right: 10px;" class="fa-solid fa-pen"></i>Sửa
																	địa chỉ
																</a>
															</div>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="row"
													style="padding: 10px 30px 20px 20px; border: 2px solid var(--primary-color); border-radius: 10px;">
													<div class="col l-12">
														<div style="margin-top: 20px;">
															<span style="font-size: 20px;">Chưa có địa chỉ nhận
																hàng, vui lòng thêm địa chỉ nhận.</span>
														</div>
														<div style="margin-top: 30px;" class="formLuu">
															<div style="margin-top: 10px;" class="control">
																<a
																	href="HoSoKhachHangController?location=1&capnhatdc=them"
																	style="width: 30%; font-size: 20px; padding: 14px 5px; border-radius: 10px; border: 1px solid #3aa8d0; float: left; background-color: var(--primary-color); color: #fff; font-weight: bold; text-align: center;">
																	<i style="margin-right: 10px;"
																	class="fa-solid fa-circle-plus"></i>Thêm địa chỉ
																</a>
															</div>
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${param.donmua != null }">
								<div class="row"
									style="padding-bottom: 15px; border-bottom: 1px solid var(--primary-color);">
									<c:choose>
										<c:when test="${param.btnchuanbi != null }">
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btnchoxacnhan=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Chờ xác nhận</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btnchuanbi=1"
													style="margin: 0; padding-bottom: 1px; color: var(--primary-color); font-size: 25px;">
													<b>Chuẩn bị đơn</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btndanggiao=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Đang giao</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btndagiao=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Đã giao</b>
												</a>
											</div>
										</c:when>
										<c:when test="${param.btndanggiao != null }">
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btnchoxacnhan=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Chờ xác nhận</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btnchuanbi=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Chuẩn bị đơn</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btndanggiao=1"
													style="margin: 0; padding-bottom: 1px; color: var(--primary-color); font-size: 25px;">
													<b>Đang giao</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btndagiao=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Đã giao</b>
												</a>
											</div>
										</c:when>
										<c:when test="${param.btndagiao != null }">
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btnchoxacnhan=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Chờ xác nhận</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btnchuanbi=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Chuẩn bị đơn</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btndanggiao=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Đang giao</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btndagiao=1"
													style="margin: 0; padding-bottom: 1px; color: var(--primary-color); font-size: 25px;">
													<b>Đã giao</b>
												</a>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btnchoxacnhan=1"
													style="margin: 0; padding-bottom: 1px; color: var(--primary-color); font-size: 25px;">
													<b>Chờ xác nhận</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btnchuanbi=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Chuẩn bị đơn</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btndanggiao=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Đang giao</b>
												</a>
											</div>
											<div class="col l-3">
												<a href="HoSoKhachHangController?donmua=1&btndagiao=1"
													style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
													<b>Đã giao</b>
												</a>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<c:choose>
									<c:when test="${param.btnchuanbi != null }">
										<c:choose>
											<c:when test="${dsSPChuanBi.size() != 0 }">
												<c:forEach items="${dshddangchuanbi }" var="hdcb">
													<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px;">
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Mã hóa đơn: <span style="color: black; font-weight: 500;">${hdcb.getMahoadon() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Tổng tiền: <span style="color: black; font-weight: 500;">${hdcb.getTongdongia() } VND</span></span>
												            <div>
													            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Thanh toán: </span> 
													            <c:choose>
													            	<c:when test="${hdcb.isPhuongthucthanhtoan() == true }">
															            <span style="color: black; font-weight: 500;">Thanh toán online </span>
													            	</c:when>
													            	<c:otherwise>
													            		<span style="color: black; font-weight: 500;">Thanh toán tiền mặt </span>
													            	</c:otherwise>
													            </c:choose>
													            <c:choose>
													            	<c:when test="${hdcb.isThanhtoan() == true }">
															            <span style=" color: rgb(65, 200, 65);">(Đã thanh toán)</span>
													            	</c:when>
													            	<c:otherwise>
													            		<span style=" color: red;">(Chưa thanh toán)</span>
													            	</c:otherwise>
													            </c:choose>
													            
												            </div>
												        </div>
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Địa chỉ nhận hàng: <span style="color: black; font-weight: 500;">${hdcb.getDiachinhanhang() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Ngày đặt: <span style="color: black; font-weight: 500;">${hdcb.getNgaydat() }</span></span> 
												        </div>
												        <table class="table table-bordered" style="width: 100%; margin-top: 10px;"  cellpadding="2" cellspacing="2">
												            <thead>
												                <tr>
												                   <th style="text-align: center;" colspan="3">Tên sản phẩm</th>
												                   <th style="text-align: center;">Giá</th>
												                   <th style="text-align: center;">SL</th>
												                   <th style="text-align: center;">Thành tiền</th>
												                </tr>
												            </thead>
												            <tbody>
												            	<c:forEach items="${dsSPChuanBi }" var="dm">
													                <c:if test="${dm.getMahoadon() == hdcb.getMahoadon() }">
														                <tr>
														                    <td rowspan="2" style="width: 80px;">
														                    	<c:choose>
																					<c:when test="${dm.getAnhthietke() == null }">
																						<div>
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																						</div>
																					</c:when>
																					<c:otherwise>
																						<div 
																							style="position: relative; height: fit-content; text-align: center;">
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																							<div
																								style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); display: flex; justify-content: center; align-items: center;"
																								class="preview-img">
																								<img class="previewImgDesign"
																									src="${dm.getAnhthietke() }" alt="preview-img">
																							</div>
																						</div>
																					</c:otherwise>
																				</c:choose>
														                    </td>
														                    <td colspan="2">
														                    	<h4
																		style="font-size: 2rem; line-height: 2.5rem; font-weight: 500; height: 5rem; overflow: hidden; display: block; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">${dm.getTensanpham() }</h4>
														                    </td>
														                   <td rowspan="2">
																		   		<h4 style="font-size: 20px;">
																					<fmt:setLocale value="vi_VN" />
																					<fmt:formatNumber value="${dm.getGiasanpham()}"
																						type="currency" />
																				</h4>
																		   </td>
														                   <td rowspan="2">
														                   		<h4 style="font-size: 20px;">${dm.getSoluongmua() }</h4>
														                   </td>
														                   <td rowspan="2">
														                   		<h4 style="font-size: 20px;">
																					<fmt:setLocale value="vi_VN" />
																					<fmt:formatNumber value="${dm.getThanhtien()}"
																						type="currency" />
																				</h4>
														                   </td>
														                </tr>
														                <tr >
														                    <td> 
														                    	<p style="font-size: 1.6rem;">
																				Màu: <b style="font-size: 1.8rem;">${dm.getMausanpham()}</b>
																				</p>
														                    </td>
														                   <td>
															                   	<p style="font-size: 1.6rem;">
																					Size: <b style="font-size: 1.8rem;">${dm.getSizesanpham() }</b>
																				</p>
														                   </td>
														                </tr>
													                </c:if>
												            	</c:forEach>
												            </tbody>
												        </table>
												    </div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<div class="row" style="margin-top: 10px;">
													<h3>Chưa có đơn hàng</h3>
												</div>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${param.btndanggiao != null }">
										<c:choose>
											<c:when test="${dsSPDangGiao.size() != 0 }">
												<c:forEach items="${dshddanggiao }" var="hdcb">
													<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px;">
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Mã hóa đơn: <span style="color: black; font-weight: 500;">${hdcb.getMahoadon() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Tổng tiền: <span style="color: black; font-weight: 500;">${hdcb.getTongdongia() } VND</span></span>
												            <div>
													            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Thanh toán: </span> 
													            <c:choose>
													            	<c:when test="${hdcb.isPhuongthucthanhtoan() == true }">
															            <span style="color: black; font-weight: 500;">Thanh toán online </span>
													            	</c:when>
													            	<c:otherwise>
													            		<span style="color: black; font-weight: 500;">Thanh toán tiền mặt </span>
													            	</c:otherwise>
													            </c:choose>
													            <c:choose>
													            	<c:when test="${hdcb.isThanhtoan() == true }">
															            <span style=" color: rgb(65, 200, 65);">(Đã thanh toán)</span>
													            	</c:when>
													            	<c:otherwise>
													            		<span style=" color: red;">(Chưa thanh toán)</span>
													            	</c:otherwise>
													            </c:choose>
													            
												            </div>
												        </div>
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Địa chỉ nhận hàng: <span style="color: black; font-weight: 500;">${hdcb.getDiachinhanhang() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Ngày đặt: <span style="color: black; font-weight: 500;">${hdcb.getNgaydat() }</span></span> 
												        </div>
												        <table class="table table-bordered" style="width: 100%; margin-top: 10px;"  cellpadding="2" cellspacing="2">
												            <thead>
												                <tr>
												                   <th style="text-align: center;" colspan="3">Tên sản phẩm</th>
												                   <th style="text-align: center;">Giá</th>
												                   <th style="text-align: center;">SL</th>
												                   <th style="text-align: center;">Thành tiền</th>
												                </tr>
												            </thead>
												            <tbody>
												            	<c:forEach items="${dsSPDangGiao }" var="dm">
													                <c:if test="${dm.getMahoadon() == hdcb.getMahoadon() }">
														                <tr>
														                    <td rowspan="2" style="width: 80px;">
														                    	<c:choose>
																					<c:when test="${dm.getAnhthietke() == null }">
																						<div>
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																						</div>
																					</c:when>
																					<c:otherwise>
																						<div 
																							style="position: relative; height: fit-content; text-align: center;">
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																							<div
																								style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); display: flex; justify-content: center; align-items: center;"
																								class="preview-img">
																								<img class="previewImgDesign"
																									src="${dm.getAnhthietke() }" alt="preview-img">
																							</div>
																						</div>
																					</c:otherwise>
																				</c:choose>
														                    </td>
														                    <td colspan="2">
														                    	<h4
																		style="font-size: 2rem; line-height: 2.5rem; font-weight: 500; height: 5rem; overflow: hidden; display: block; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">${dm.getTensanpham() }</h4>
														                    </td>
														                   <td rowspan="2">
																		   		<h4 style="font-size: 20px;">
																					<fmt:setLocale value="vi_VN" />
																					<fmt:formatNumber value="${dm.getGiasanpham()}"
																						type="currency" />
																				</h4>
																		   </td>
														                   <td rowspan="2">
														                   		<h4 style="font-size: 20px;">${dm.getSoluongmua() }</h4>
														                   </td>
														                   <td rowspan="2">
														                   		<h4 style="font-size: 20px;">
																					<fmt:setLocale value="vi_VN" />
																					<fmt:formatNumber value="${dm.getThanhtien()}"
																						type="currency" />
																				</h4>
														                   </td>
														                </tr>
														                <tr >
														                    <td> 
														                    	<p style="font-size: 1.6rem;">
																				Màu: <b style="font-size: 1.8rem;">${dm.getMausanpham()}</b>
																				</p>
														                    </td>
														                   <td>
															                   	<p style="font-size: 1.6rem;">
																					Size: <b style="font-size: 1.8rem;">${dm.getSizesanpham() }</b>
																				</p>
														                   </td>
														                </tr>
													                </c:if>
												            	</c:forEach>
												            </tbody>
												        </table>
												    </div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<div class="row" style="margin-top: 10px;">
													<h3>Chưa có đơn hàng</h3>
												</div>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${param.btndagiao != null }">
										<c:choose>
											<c:when test="${dsSPDaGiao.size() != 0 }">
												<c:forEach items="${dshddagiao }" var="hdcb">
													<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px;">
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Mã hóa đơn: <span style="color: black; font-weight: 500;">${hdcb.getMahoadon() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Tổng tiền: <span style="color: black; font-weight: 500;">${hdcb.getTongdongia() } VND</span></span>
												            <div>
													            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Thanh toán: </span> 
													            <c:choose>
													            	<c:when test="${hdcb.isPhuongthucthanhtoan() == true }">
															            <span style="color: black; font-weight: 500;">Thanh toán online </span>
													            	</c:when>
													            	<c:otherwise>
													            		<span style="color: black; font-weight: 500;">Thanh toán tiền mặt </span>
													            	</c:otherwise>
													            </c:choose>
													            <c:choose>
													            	<c:when test="${hdcb.isThanhtoan() == true }">
															            <span style=" color: rgb(65, 200, 65);">(Đã thanh toán)</span>
													            	</c:when>
													            	<c:otherwise>
													            		<span style=" color: red;">(Chưa thanh toán)</span>
													            	</c:otherwise>
													            </c:choose>
													            
												            </div>
												        </div>
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Địa chỉ nhận hàng: <span style="color: black; font-weight: 500;">${hdcb.getDiachinhanhang() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Ngày đặt: <span style="color: black; font-weight: 500;">${hdcb.getNgaydat() }</span></span> 
												        </div>
												        <table class="table table-bordered" style="width: 100%; margin-top: 10px;"  cellpadding="2" cellspacing="2">
												            <thead>
												                <tr>
												                   <th style="text-align: center;" colspan="3">Tên sản phẩm</th>
												                   <th style="text-align: center;">Giá</th>
												                   <th style="text-align: center;">SL</th>
												                   <th style="text-align: center;">Thành tiền</th>
												                </tr>
												            </thead>
												            <tbody>
												            	<c:forEach items="${dsSPDaGiao }" var="dm">
													                <c:if test="${dm.getMahoadon() == hdcb.getMahoadon() }">
														                <tr>
														                    <td rowspan="2" style="width: 80px;">
														                    	<c:choose>
																					<c:when test="${dm.getAnhthietke() == null }">
																						<div>
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																						</div>
																					</c:when>
																					<c:otherwise>
																						<div 
																							style="position: relative; height: fit-content; text-align: center;">
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																							<div
																								style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); display: flex; justify-content: center; align-items: center;"
																								class="preview-img">
																								<img class="previewImgDesign"
																									src="${dm.getAnhthietke() }" alt="preview-img">
																							</div>
																						</div>
																					</c:otherwise>
																				</c:choose>
														                    </td>
														                    <td colspan="2">
														                    	<h4
																		style="font-size: 2rem; line-height: 2.5rem; font-weight: 500; height: 5rem; overflow: hidden; display: block; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">${dm.getTensanpham() }</h4>
														                    </td>
														                   <td rowspan="2">
																		   		<h4 style="font-size: 20px;">
																					<fmt:setLocale value="vi_VN" />
																					<fmt:formatNumber value="${dm.getGiasanpham()}"
																						type="currency" />
																				</h4>
																		   </td>
														                   <td rowspan="2">
														                   		<h4 style="font-size: 20px;">${dm.getSoluongmua() }</h4>
														                   </td>
														                   <td rowspan="2">
														                   		<h4 style="font-size: 20px;">
																					<fmt:setLocale value="vi_VN" />
																					<fmt:formatNumber value="${dm.getThanhtien()}"
																						type="currency" />
																				</h4>
														                   </td>
														                </tr>
														                <tr >
														                    <td> 
														                    	<p style="font-size: 1.6rem;">
																				Màu: <b style="font-size: 1.8rem;">${dm.getMausanpham()}</b>
																				</p>
														                    </td>
														                   <td>
															                   	<p style="font-size: 1.6rem;">
																					Size: <b style="font-size: 1.8rem;">${dm.getSizesanpham() }</b>
																				</p>
														                   </td>
														                </tr>
													                </c:if>
												            	</c:forEach>
												            </tbody>
												        </table>
												    </div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<div class="row" style="margin-top: 10px;">
													<h3>Chưa có đơn hàng</h3>
												</div>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${dsSPChoXacNhan.size()!=0 }">
												<c:forEach items="${dshdchoxacnhan }" var="hdcb">
													<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px;">
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Mã hóa đơn: <span style="color: black; font-weight: 500;">${hdcb.getMahoadon() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Tổng tiền: <span style="color: black; font-weight: 500;">${hdcb.getTongdongia() } VND</span></span>
												            <div>
													            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Thanh toán: </span> 
													            <c:choose>
													            	<c:when test="${hdcb.isPhuongthucthanhtoan() == true }">
															            <span style="color: black; font-weight: 500;">Thanh toán online </span>
													            	</c:when>
													            	<c:otherwise>
													            		<span style="color: black; font-weight: 500;">Thanh toán tiền mặt </span>
													            	</c:otherwise>
													            </c:choose>
													            <c:choose>
													            	<c:when test="${hdcb.isThanhtoan() == true }">
															            <span style=" color: rgb(65, 200, 65);">(Đã thanh toán)</span>
													            	</c:when>
													            	<c:otherwise>
													            		<span style=" color: red;">(Chưa thanh toán)</span>
													            	</c:otherwise>
													            </c:choose>
													            
												            </div>
												        </div>
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Địa chỉ nhận hàng: <span style="color: black; font-weight: 500;">${hdcb.getDiachinhanhang() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Ngày đặt: <span style="color: black; font-weight: 500;">${hdcb.getNgaydat() }</span></span> 
												        </div>
												        <table class="table table-bordered" style="width: 100%; margin-top: 10px;"  cellpadding="2" cellspacing="2">
												            <thead>
												                <tr>
												                   <th style="text-align: center;" colspan="3">Tên sản phẩm</th>
												                   <th style="text-align: center;">Giá</th>
												                   <th style="text-align: center;">SL</th>
												                   <th style="text-align: center;">Thành tiền</th>
												                </tr>
												            </thead>
												            <tbody>
												            	<c:forEach items="${dsSPChoXacNhan }" var="dm">
													                <c:if test="${dm.getMahoadon() == hdcb.getMahoadon() }">
														                <tr>
														                    <td rowspan="2" style="width: 80px;">
														                    	<c:choose>
																					<c:when test="${dm.getAnhthietke() == null }">
																						<div>
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																						</div>
																					</c:when>
																					<c:otherwise>
																						<div 
																							style="position: relative; height: fit-content; text-align: center;">
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																							<div
																								style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); display: flex; justify-content: center; align-items: center;"
																								class="preview-img">
																								<img class="previewImgDesign"
																									src="${dm.getAnhthietke() }" alt="preview-img">
																							</div>
																						</div>
																					</c:otherwise>
																				</c:choose>
														                    </td>
														                    <td colspan="2">
														                    	<h4
																		style="font-size: 2rem; line-height: 2.5rem; font-weight: 500; height: 5rem; overflow: hidden; display: block; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">${dm.getTensanpham() }</h4>
														                    </td>
														                   <td rowspan="2">
																		   		<h4 style="font-size: 20px;">
																					<fmt:setLocale value="vi_VN" />
																					<fmt:formatNumber value="${dm.getGiasanpham()}"
																						type="currency" />
																				</h4>
																		   </td>
														                   <td rowspan="2">
														                   		<h4 style="font-size: 20px;">${dm.getSoluongmua() }</h4>
														                   </td>
														                   <td rowspan="2">
														                   		<h4 style="font-size: 20px;">
																					<fmt:setLocale value="vi_VN" />
																					<fmt:formatNumber value="${dm.getThanhtien()}"
																						type="currency" />
																				</h4>
														                   </td>
														                </tr>
														                <tr >
														                    <td> 
														                    	<p style="font-size: 1.6rem;">
																				Màu: <b style="font-size: 1.8rem;">${dm.getMausanpham()}</b>
																				</p>
														                    </td>
														                   <td>
															                   	<p style="font-size: 1.6rem;">
																					Size: <b style="font-size: 1.8rem;">${dm.getSizesanpham() }</b>
																				</p>
														                   </td>
														                </tr>
													                </c:if>
												            	</c:forEach>
												            </tbody>
												        </table>
												    </div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<div class="row" style="margin-top: 10px;">
													<h3>Chưa có đơn hàng</h3>
												</div>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer" style="margin-top: 100px;">
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
	
	<!-- Modal đổi mật khẩu -->
	<div class="modal fade" id="modalDoiPass" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 style="color: var(--primary-color); font-weight: bold;"
						class="modal-title">Đổi mật khẩu</h3>
				</div>
				<div style="display: flex; justify-content: center;"
					class="modal-body">

					<form style="width: 90%; position: relative;"
						action="HoSoKhachHangController" method="get" id="form-1">

						<div style="position: relative;" class="form-group">
							<h1 for="password1" style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Mật
								khẩu hiện tại <span style="color: red;">*</span>
								</h1>
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
						
						<div style="position: relative;" class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
								mật khẩu <span style="color: red;">*</span></h1>
							<input id="password2" style="margin-bottom: 4px;"
								class="auth-form__input form-control" type="password"
								name="matkhau1" placeholder="Nhập mật khẩu"> <input
								hidden="" id="input-eye-show1" type="checkbox"> <label
								for="input-eye-show1" id="eye-show"
								style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
								class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
								class="form-message"></span>
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
							<input id="password3" style="margin-bottom: 4px;"
								class="auth-form__input form-control" type="password"
								name="matkhau2" placeholder="Nhập lại mật khẩu"> <input
								hidden="" id="input-eye-show2" type="checkbox"> <label
								for="input-eye-show2" id="eye-show"
								style="position: absolute; top: 36px; right: 28px; color: var(--primary-color); cursor: pointer;"
								class="eye-show-btn3"><i class="fa-solid fa-eye"></i></label> <span
								class="form-message"></span>
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
						<input style="display: none;" name="btnDoiPass" type="text" value="doimatkhau">
						<input class="auth-form__btn" style="border: none; margin-top: 0px;" type="submit"
							name="btnDoiPass" value="Đổi mật khẩu">
					</form>
				</div>
			</div>

		</div>
	</div>
	<script lang="javascript" type="text/javascript">
		Validator({
			form : '#form-1',
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
					Validator.isRequired('#password1','Bạn vui lòng nhập trường này.'),
					Validator.isRequired('#password2','Bạn vui lòng nhập trường này.'),
					Validator.isRequired('#password3','Bạn vui lòng nhập trường này.'),
					Validator.isConFirmed(
							'#password3',
							function() {
								return document
										.querySelector('#form-1 #password2').value
							}, 'Nhập lại mật khẩu chưa chính xác.'),
			],
		});
	</script>
	
	<!-- Modal đổi email -->
	<div class="modal fade" id="modalDoiEmail" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 style="color: var(--primary-color); font-weight: bold;"
						class="modal-title">Thay đổi email</h3>
				</div>
				<div style="display: flex; justify-content: center;"
					class="modal-body">

					<form style="width: 90%; position: relative;"
						action="HoSoKhachHangController" method="get" id="form-2">

						<div class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Nhập
								email <span style="color: red;">*</span>
								</h1>
							<input id="auth-form__input-emailDoi"
								style="width: 100%; margin-bottom: 4px"
								class="auth-form__input form-control" type="email" name="email"
								placeholder="Nhập email (*)"> <span
								class="form-message"></span>
						</div>
						<div class="form-group" >
							<input id="auth-form__input-codeDoiEmail"
								style="width: 100%; margin-bottom: 4px; display: none;"
								class="auth-form__input form-control" type="text"
								name="codeDoiEmail">
						</div>
						<div style="position: relative;" class="form-group">
							<h1 style="font-size: 18px; margin-bottom: 5px; margin-top: 0;">Mã xác nhận
								<span style="color: red;">*</span>
								<a onclick="clickBtnDangKi()" style="cursor: pointer; margin-left: 10px; font-size: 15px; font-weight: bold;">
									Gửi mã</a>
							</h1>
							<input id="auth-form__input-codeDoi"
								style="width: 100%; margin-bottom: 4px"
								class="auth-form__input form-control" type="text"
								name="code" placeholder="Nhập mã xác nhận (*)">
							<span class="form-message"></span>
						</div>
						<input style="display: none;" name="btnDoiEmail" type="text" value="doimatkhau">
						<input class="auth-form__btn" style="border: none; margin-top: 0px;" type="submit"
							name="btnDoiEmail" value="Thay đổi email">
					</form>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		function clickBtnDangKi() {
				var inputEmail = document.getElementById('auth-form__input-emailDoi');
				var dsEmail =`${dsEmail}`;
				var coEmail = false;
				var listEmail = dsEmail.split('>');
				
				for(let i =0; i<listEmail.length; i++){
					if(inputEmail.value === listEmail[i]){
						coSdt = true;
						break;
					}
				}
				
				
				if(coEmail){
					function showErrorToastKtraEmailSdt() {
						toast({
							title : 'Thất bại',
							message : 'Email đã được đăng kí ở tài khoản khác.',
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
						var codeDkiEmail = document.getElementById('auth-form__input-codeDoiEmail');
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
			}
		</script>
	<script type="text/javascript">
		Validator({
			form : '#form-2',
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
					Validator.isRequired('#auth-form__input-emailDoi','Bạn vui lòng nhập trường này.'),
					Validator.isEmail('#auth-form__input-emailDoi','Email không hợp lệ.'),
					Validator.isRequired('#auth-form__input-codeDoi','Bạn vui lòng nhập trường này.'),
					Validator.minLength('#auth-form__input-codeDoi',6),
					Validator.isConFirmed(
							'#auth-form__input-codeDoi',
							function() {
								return document
										.querySelector('#form-2 #auth-form__input-codeDoiEmail').value
							}, 'Mã xác nhận không chính xác.'),
			],
		});
	</script>

	<c:if test="${param.thanhtoan.equals('thatbai')}">
		<script type="text/javascript">
			//window.alert("Đăng kí không thành công!");
			function showErrorToastDangKi() {
				toast({
					title : 'Thất bại',
					message : 'Thanh toán thất bại (Sẽ khắc phục trong trường hợp hệ thống lỗi).',
					type : 'error',
					duration : 5000
				})
			}
			showErrorToastDangKi();
		</script>
	</c:if>

	<c:if test="${param.thanhtoan.equals('thanhcong')}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastThemSp() {
				toast({
			        title :'Thành công',
			        message : 'Thanh toán thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastThemSp();
		</script>
	</c:if>

	<c:if test="${param.suathongtin != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastCapNhatThongTin() {
				toast({
			        title :'Thành công',
			        message : 'Cập nhật thông tin thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastCapNhatThongTin();
		</script>
	</c:if>
	
	<c:if test="${param.suainfo != null}">
		<script type="text/javascript">
			//window.alert("Đăng kí không thành công!");
			function showErrorToastKtraSuaThongTinKh() {
				toast({
					title : 'Thất bại',
					message : 'Thông tin sửa đã bị trùng với tài khoản khác.',
					type : 'error',
					duration : 5000
				})
			}
			showErrorToastKtraSuaThongTinKh();
		</script>
	</c:if>
	
	<c:if test="${param.capnhatlocation != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastCapNhatThongTin() {
				toast({
			        title :'Thành công',
			        message : 'Cập nhật địa chỉ thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastCapNhatThongTin();
		</script>
	</c:if>
	<c:if test="${param.themlocation != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastCapNhatThongTin() {
				toast({
			        title :'Thành công',
			        message : 'Thêm địa chỉ thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastCapNhatThongTin();
		</script>
	</c:if>

	
</body>
</html>