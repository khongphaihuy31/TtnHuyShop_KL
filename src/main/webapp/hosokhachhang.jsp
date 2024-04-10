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
<link rel="stylesheet" href="assets/css/base.css">
<link rel="stylesheet" href="assets/css/grid.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/responsive.css">
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
</style>
</head>
<body>
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
								<li class="header-nav__item"><a href=""
									class="header-nav__link"> Trẻ em <i
										class="header-nav__icon fa-solid fa-caret-down"></i>
								</a></li>
								<!-- list trong list đồ trẻ em -->
								<ul class="header-nav-item-children__list">
									<c:forEach items="${dsTenLoaiDMTreEm }" var="te">
										<li class="header-nav-item-children__item"><a
											href="TrangChuController?maloai=${te.getMaloai()}&madanhmuc=${te.getMadanhmuc()}&mathuonghieu=0"
											class="header-nav-item-children__link">
												${te.getTenloai()} </a></li>
									</c:forEach>
								</ul>
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
							<span class="header-nav-mobile-tablet__heading">DANH MỤC
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
									<a class="dropdown-toggle header-nav-mobile-tablet__link"
									data-toggle="dropdown" href="#">Trẻ em <i
										class="header-nav-mobile-tablet__icon fa-solid fa-caret-down"></i>
								</a>
									<ul class="dropdown-menu"
										style="position: relative; float: none; border: none; border-radius: 0; box-shadow: none; background-color: var(--primary-color); -webkit-box-shadow: 0;">

										<c:forEach items="${dsTenLoaiDMTreEm }" var="te">
											<li class="header-nav-item-all-mobile-tablet__item"><a
												style="padding: 0 0 0 60px; color: var(--text-color); line-height: 50px;"
												href="TrangChuController?maloai=${te.getMaloai()}&madanhmuc=${te.getMadanhmuc()}&mathuonghieu=0"
												class="header-nav-item-all-mobile-tablet__link">
													${te.getTenloai()} </a></li>
										</c:forEach>
									</ul>
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
										<c:when test="${giohang.size() ==0 || giohang== null}">
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

		<div class="container" style="margin-top: var(--header-height);">
			<div class="grid wide">
				<div class="row" style="margin-top: 30px;">
					<div class="col l-2">
						<div class="row"
							style="padding-bottom: 15px; padding-top: 15px; border-bottom: 1px solid var(--primary-color);">
							<div class="col l-4">
								<span
									style="display: block; width: 100%; line-height: 40px; height: 40px; background-color: green; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 500; font-size: 30px;"><%=session.getAttribute("taikhoan").toString().toUpperCase().charAt(0)%></span>
							</div>
							<div class="col l-8">
								<b style="font-size: 18px; line-height: 40px;"><%=session.getAttribute("taikhoan")%></b>
							</div>
						</div>

						<c:if test="${param.info != null }">
							<a href="HoSoKhachHangController?info=1" class="row"
								style="margin-top: 10px; cursor: pointer;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										style="color: var(--primary-color);" class="fa-solid fa-user"></i>
										Thông tin</span>
								</div>
							</a>
							<a href="HoSoKhachHangController?location=1" class="row"
								style="margin-top: 10px; cursor: pointer; color: black;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										class="fa-solid fa-location-dot"></i> Địa chỉ nhận hàng</span>
								</div>
							</a>
							<a href="HoSoKhachHangController?donmua=1" class="row"
								style="margin-top: 10px; cursor: pointer; color: black;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										class="fa-solid fa-box"></i> Đơn hàng</span>
								</div>
							</a>
						</c:if>

						<c:if test="${param.location != null }">
							<a href="HoSoKhachHangController?info=1" class="row"
								style="margin-top: 10px; cursor: pointer; color: black;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										class="fa-solid fa-user"></i> Thông tin</span>
								</div>
							</a>
							<a href="HoSoKhachHangController?location=1" class="row"
								style="margin-top: 10px; cursor: pointer;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										style="color: var(--primary-color);"
										class="fa-solid fa-location-dot"></i> Địa chỉ nhận hàng</span>
								</div>
							</a>
							<a href="HoSoKhachHangController?donmua=1" class="row"
								style="margin-top: 10px; cursor: pointer; color: black;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										class="fa-solid fa-box"></i> Đơn hàng</span>
								</div>
							</a>
						</c:if>

						<c:if test="${param.donmua != null }">
							<a href="HoSoKhachHangController?info=1" class="row"
								style="margin-top: 10px; cursor: pointer; color: black;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										class="fa-solid fa-user"></i> Thông tin</span>
								</div>
							</a>
							<a href="HoSoKhachHangController?location=1" class="row"
								style="margin-top: 10px; cursor: pointer; color: black;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										class="fa-solid fa-location-dot"></i> Địa chỉ nhận hàng</span>
								</div>
							</a>
							<a href="HoSoKhachHangController?donmua=1" class="row"
								style="margin-top: 10px; cursor: pointer;">
								<div class="col l-12">
									<span style="font-size: 1.8rem;"><i
										style="color: var(--primary-color);" class="fa-solid fa-box"></i>
										Đơn hàng</span>
								</div>
							</a>
						</c:if>
					</div>
					<div class="col l-1"></div>
					<div class="col l-9" style="padding: 5px 10px;">

						<c:if test="${param.info != null }">
							<div class="row"
								style="padding-bottom: 15px; padding-top: 15px; border-bottom: 1px solid var(--primary-color);">
								<div class="col l-12">
									<h2
										style="margin: 0; padding-bottom: 1px; color: var(--primary-color);">
										<b>Thông tin của tôi</b>
									</h2>
								</div>
							</div>
							<%
							KhachHangBean khbean = (KhachHangBean) session.getAttribute("dn");
							%>
							<form id="suathongtin" action="HoSoKhachHangController"></form>
							<div class="row" style="margin-top: 20px;">
								<table class="table table-hover table-striped table-bordered">
									<tr>
										<td width="500">Tên đăng nhập</td>
										<td width="500">${ dn.getTendangnhap()}</td>
									</tr>
									<tr>
										<td width="500">Họ tên</td>
										<td width="500"><input form="suathongtin" type="text"
											name="hoten" value="${ dn.getHoten()}"></td>
									</tr>
									<tr>
										<td width="500">Địa chỉ</td>
										<td width="500"><input form="suathongtin" type="text"
											name="diachi" value="${ dn.getDiachi()}"></td>
									</tr>
									<tr>
										<td width="500">Số điện thoại</td>
										<td width="500"><input form="suathongtin" type="text"
											name="sodienthoai" value="${ dn.getSodienthoai()}"></td>
									</tr>
									<tr>
										<td width="500">Email</td>
										<td width="500"><input form="suathongtin" type="email"
											name="email" value="${ dn.getEmail()}"></td>
									</tr>
									<tr>
										<td width="500"></td>
										<td width="500"><input
											style="width: 80px; color: var(--text-color); background-color: var(--primary-color); height: 40px; line-height: 40px; border: none; font-size: 16px;"
											form="suathongtin" type="submit" name="btnluu" value="Lưu"></td>
									</tr>
								</table>
							</div>
						</c:if>
						<c:if test="${param.location != null }">
							<div class="row"
								style="padding-bottom: 15px; padding-top: 15px; border-bottom: 1px solid var(--primary-color);">
								<div class="col l-12">
									<h2
										style="margin: 0; padding-bottom: 1px; color: var(--primary-color);">
										<b>Địa chỉ nhận hàng</b>
									</h2>
								</div>
							</div>
							<form id="noinhan" action="HoSoKhachHangController"></form>

							<c:choose>
								<c:when test="${noinhan!= null }">
									<div class="row" style="margin-top: 20px;">
										<table class="table table-hover table-striped table-bordered">
											<tr>
												<td width="500">Thành phố</td>
												<td width="500"><input form="noinhan" type="text"
													name="thanhpho" value="${noinhan.getThanhpho()}"></td>
											</tr>
											<tr>
												<td width="500">Quận</td>
												<td width="500"><input form="noinhan" type="text"
													name="quan" value="${noinhan.getQuan()}"></td>
											</tr>
											<tr>
												<td width="500">Phường</td>
												<td width="500"><input form="noinhan" type="text"
													name="phuong" value="${noinhan.getPhuong()}"></td>
											</tr>
											<tr>
												<td width="500">Địa chỉ chi tiết</td>
												<td width="500"><input form="noinhan" type="text"
													name="sonha" value="${noinhan.getSonha()}"></td>
											</tr>
											<tr>
												<td width="500"></td>
												<td width="500"><input
													style="width: 80px; color: black; background-color: #ccc; height: 40px; line-height: 40px; border: none; font-size: 16px;"
													type="submit" name="btnlocationthem" value="Thêm">
													<input
													style="width: 80px; color: var(--text-color); background-color: var(--primary-color); height: 40px; line-height: 40px; border: none; font-size: 16px; margin-left: 10px;"
													form="noinhan" type="submit" name="btnlocationluu"
													value="Lưu"></td>
											</tr>
										</table>
									</div>
								</c:when>
								<c:otherwise>
									<div class="row" style="margin-top: 20px;">
										<table class="table table-hover table-striped table-bordered">
											<tr>
												<td width="500">Thành phố</td>
												<td width="500"><input form="noinhan" type="text"
													name="thanhpho" value=""></td>
											</tr>
											<tr>
												<td width="500">Quận</td>
												<td width="500"><input form="noinhan" type="text"
													name="quan" value=""></td>
											</tr>
											<tr>
												<td width="500">Phường</td>
												<td width="500"><input form="noinhan" type="text"
													name="phuong" value=""></td>
											</tr>
											<tr>
												<td width="500">Địa chỉ chi tiết</td>
												<td width="500"><input form="noinhan" type="text"
													name="sonha" value=""></td>
											</tr>
											<tr>
												<td width="500"></td>
												<td width="500"><input
													style="width: 80px; color: var(--text-color); background-color: var(--primary-color); height: 40px; line-height: 40px; border: none; font-size: 16px;"
													form="noinhan" type="submit" name="btnlocationthem"
													value="Thêm"> <input
													style="width: 80px; color: var(--text-color); background-color: var(--primary-color); height: 40px; line-height: 40px; border: none; font-size: 16px; margin-left: 10px;"
													form="noinhan" type="submit" name="btnlocationluu"
													value="Lưu"></td>
											</tr>
										</table>
									</div>
								</c:otherwise>
							</c:choose>
						</c:if>

						<c:if test="${param.donmua != null }">
							<div class="row"
								style="padding-bottom: 15px; padding-top: 15px; border-bottom: 1px solid var(--primary-color);">
								<c:choose>
									<c:when test="${param.btndagiao != null }">
										<div class="col l-4">
											<a href="HoSoKhachHangController?donmua=1&btnchoxacnhan=1"
												style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
												<b>Chờ xác nhận</b>
											</a>
										</div>
										<div class="col l-5">
											<a href="HoSoKhachHangController?donmua=1&btndagiao=1"
												style="margin: 0; padding-bottom: 1px; color: var(--primary-color); font-size: 25px;">
												<b>Đã giao</b>
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col l-4">
											<a href="HoSoKhachHangController?donmua=1&btnchoxacnhan=1"
												style="margin: 0; padding-bottom: 1px; color: var(--primary-color); font-size: 25px;">
												<b>Chờ xác nhận</b>
											</a>
										</div>
										<div class="col l-5">
											<a href="HoSoKhachHangController?donmua=1&btndagiao=1"
												style="margin: 0; padding-bottom: 1px; color: black; font-size: 25px;">
												<b>Đã giao</b>
											</a>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<c:choose>
								<c:when test="${param.btndagiao != null }">
									<c:choose>
										<c:when test="${dsSPDaGiao.size() != 0 }">
											<div class="row text-center"
												style="border-radius: 10px; padding: 10px 0; background-color: var(--primary-color); color: var(--text-color); margin-top: 20px;">
												<div class="col l-6">
													<b style="font-size: 18px;">Sản phẩm</b>
												</div>
												<div class="col l-2">
													<b style="font-size: 18px;">Đơn giá</b>
												</div>
												<div class="col l-2">
													<b style="font-size: 18px;">Số lượng</b>
												</div>
												<div class="col l-2">
													<b style="font-size: 18px;">Thành tiền</b>
												</div>
											</div>
	
											<c:forEach items="${dsSPDaGiao }" var="dm">
												<div class="row"
													style="margin-top: 10px; padding-bottom: 10px; border-bottom: 1px solid var(--primary-color);">
													<div class="col l-6">
														<div class="row">
	
															<!-- Sửa design khi có ảnh thiết kế -->
															<div class="col l-3">
																<img style="width: 80px; display: inline-block;" alt=""
																	src="${dm.Anhsanpham()}">
															</div>
															<div class="col l-9">
																<h4
																	style="font-size: 2rem; line-height: 2.5rem; font-weight: 500; height: 5rem; overflow: hidden; display: block; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">${dm.getTensanpham() }</h4>
																<div class="row">
																	<div class="col l-4">
																		<p style="font-size: 1.6rem;">
																			Màu: <b style="font-size: 1.8rem;">${dm.getMausanpham()}</b>
																		</p>
																	</div>
																	<div class="col l-8">
																		<p style="font-size: 1.6rem;">
																			Size: <b style="font-size: 1.8rem;">${dm.getSizesanpham() }</b>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col l-2 text-center">
														<h4 style="font-size: 20px;">
															<fmt:setLocale value="vi_VN" />
															<fmt:formatNumber value="${dm.getGiasanpham()}"
																type="currency" />
														</h4>
													</div>
													<div class="col l-2 text-center">
														<h4 style="font-size: 20px;">${dm.getSoluongmua() }</h4>
													</div>
													<div class="col l-2 text-center">
														<h4 style="font-size: 20px;">
															<fmt:setLocale value="vi_VN" />
															<fmt:formatNumber value="${dm.getThanhtien()}"
																type="currency" />
														</h4>
													</div>
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
											<div class="row text-center"
												style="border-radius: 10px; padding: 10px 0; background-color: var(--primary-color); color: var(--text-color); margin-top: 20px;">
												<div class="col l-6">
													<b style="font-size: 18px;">Sản phẩm</b>
												</div>
												<div class="col l-2">
													<b style="font-size: 18px;">Đơn giá</b>
												</div>
												<div class="col l-2">
													<b style="font-size: 18px;">Số lượng</b>
												</div>
												<div class="col l-2">
													<b style="font-size: 18px;">Thành tiền</b>
												</div>
											</div>

											<c:forEach items="${dsSPChoXacNhan }" var="dm">
												<div class="row"
													style="margin-top: 10px; padding-bottom: 10px; border-bottom: 1px solid var(--primary-color);">
													<div class="col l-6">
														<div class="row">
															<div class="col l-3">
																<img style="width: 80px; display: inline-block;" alt=""
																	src="${dm.getAnhsanpham()}">
															</div>
															<div class="col l-9">
																<h4
																	style="font-size: 2rem; line-height: 2.5rem; font-weight: 500; height: 5rem; overflow: hidden; display: block; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">${dm.getTensanpham()}</h4>
																<div class="row">
																	<div class="col l-4">
																		<p style="font-size: 1.6rem;">
																			Màu: <b style="font-size: 1.8rem;">${dm.getMausanpham()}</b>
																		</p>
																	</div>
																	<div class="col l-8">
																		<p style="font-size: 1.6rem;">
																			Size: <b style="font-size: 1.8rem;">${dm.getSizesanpham() }</b>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col l-2 text-center">
														<h4 style="font-size: 20px;">
															<fmt:setLocale value="vi_VN" />
															<fmt:formatNumber value="${dm.getGiasanpham()}"
																type="currency" />
														</h4>
													</div>
													<div class="col l-2 text-center">
														<h4 style="font-size: 20px;">${dm.getSoluongmua() }</h4>
													</div>
													<div class="col l-2 text-center">
														<h4 style="font-size: 20px;">
															<fmt:setLocale value="vi_VN" />
															<fmt:formatNumber value="${dm.getThanhtien()}"
																type="currency" />
														</h4>
													</div>
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
						</c:if>
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
</body>
</html>