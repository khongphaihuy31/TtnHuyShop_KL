<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="Bean.NoiNhanBean"%>
<%@page import="Bean.KhachHangBean"%>
<%@page import="Bean.GioHangBean"%>
<%@page import="Bo.GioHangBo"%>
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
<link rel="shortcut icon" href="./assets/img/huy-removebg-preview.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="assets/css/base.css">
<link rel="stylesheet" href="assets/css/grid.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/chi-tiet.css">
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

#nganhang:checked ~ .nganhang{
	background-color: var(--primary-color);
	color: var(--text-color);
}

#tienmat:checked ~ .tienmat{
	background-color: var(--primary-color);
	color: var(--text-color);
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
<%if(request.getParameter("nn")!=null){ %>
	<script type="text/javascript">
		window.alert("Thông tin nơi nhận của bạn đang trống! Vui lòng click vào (Thay đổi nơi nhận để điền nơi nhận). Cảm ơn!");
	</script>
<%} %>
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
		<div style="top: var(--header-height);" class="container">
			<div class="grid wide">
				<h1 style="font-weight: 600; color: var(--primary-color);"
					class="container-title">
					<i class="fa-solid fa-credit-card"></i> Thanh toán
				</h1>
				<c:choose>
					<c:when test="${dn != null }">
						<c:choose>
							<c:when test="${giohang.size() !=0 }">
								<div class="row">
									<div class="col l-12">
										<div class="row text-center" style="border-radius: 10px; padding: 10px 0; background-color: var(--primary-color); color: var(--text-color);">
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
										<form id="xoachon"action="GioHangController" method="get">
				        				</form>
				        				<c:forEach items="${dsHangMua }" var="sp">
											<div style="margin-top: 10px; padding-bottom: 10px;border-bottom: 1px solid var(--primary-color);" class="row">
												<div class="col l-6">
													<div class="row">
														<div class="col l-3">
															<img style="width: 80px; display: inline-block;" alt="" src="${sp.getAnhTheoMau()}">
														</div>
														<div class="col l-9">
															<h4 style="font-size: 2rem;line-height: 2.5rem;font-weight: 500;height: 5rem;overflow: hidden;display: block;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 2;">${sp.getTensanpham()}</h4>
															<div class="row">
																<div class="col l-4">
																	<p style="font-size: 1.6rem;">Màu: <b style="font-size: 1.8rem; color: var(--primary-color); font-weight: bold;">${sp.getMausanpham()}</b></p>
																</div>
																<div class="col l-8">
																	<p style="font-size: 1.6rem;">Size: <b style="font-size: 1.8rem; color: var(--primary-color); font-weight: bold;">${sp.getSize() }</b></p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col l-2 text-center">
													<c:choose>
														<c:when test="${sp.getGiagiam() == 0}">
															<h4 style="font-size: 20px; color: var(--primary-color); font-weight: bold;">
																<fmt:setLocale value="vi_VN"/>
																<fmt:formatNumber value="${sp.getGiaban()}" type="currency"/>
															</h4>
														</c:when>
														<c:otherwise>
															<h4 style="font-size: 20px; color: var(--primary-color); font-weight: bold;">
																<fmt:setLocale value="vi_VN"/>
																<fmt:formatNumber value="${sp.getGiagiam()}" type="currency"/>
															</h4>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="col l-2 text-center">
													<h4 style="font-size: 20px;">${sp.getSoluongmua()}</h4>
												</div>
												<div class="col l-2 text-center">
													<h4 style="font-size: 20px; color: var(--primary-color); font-weight: bold;">
														<fmt:setLocale value="vi_VN"/>
														<fmt:formatNumber value="${sp.getThanhtien()}" type="currency"/>
													</h4>
												</div>
											</div>
				        				</c:forEach>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<h3 style="color: var(--primary-color);">Không có sản phẩm cần thanh toán!</h3>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<h3 style="color: var(--primary-color);">Không có sản phẩm cần thanh toán!</h3>
					</c:otherwise>
				</c:choose>
					
				<h4 style="margin: 30px 0 10px 0"> <span style="color: red;">(*)</span> Lưu ý: kiểm tra kỹ các thông tin sau </h4>
				
				<div style="border: 1px solid var(--primary-color); padding: 15px; border-radius: 20px">
				<h3 style="margin-top: 10px;border-bottom: 1px solid var(--primary-color); padding-bottom: 25px; font-weight: bold; color: var(--primary-color);">THÔNG TIN GIAO HÀNG & THANH TOÁN</h3>
				<form id="thanhtoan" action="XacNhanThanhToanController" method="get"></form>
				<h3 style="margin-left: 15px; display: inline-block;"> <b>Thông tin khách hàng</b></h3> <a href="HoSoKhachHangController?info=1" style="display: inline-block; cursor: pointer; margin-left: 20px; font-size: 1.4rem;"> <b>Thay đổi thông tin</b> </a>
				<div class="row">
					<div class="col l-6" style="width: 50%;">
						<h4 style="font-size: 20px;">Họ tên:</h4>
						<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="hoten" value="${dn.getHoten()}" disabled>
						<h4 style="font-size: 20px;">Địa chỉ:</h4>
						<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="diachi" value="${dn.getDiachi()}" disabled>
					</div>
					<div class="col l-6" style="width: 50%;">
						<h4 style="font-size: 20px;">Số điện thoại:</h4>
						<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="sodienthoai" value="${dn.getSodienthoai()}" disabled>
						<h4 style="font-size: 20px;">Email:</h4>
						<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem; border-radius: 5px;"  type="text" name="email" value="${dn.getEmail()}" disabled>
					</div>
				</div>
				<h3 style="margin-left: 15px; display: inline-block;"> <b>Địa chỉ giao hàng</b></h3> <a href="HoSoKhachHangController?location=1" style="display: inline-block; cursor: pointer; margin-left: 20px; font-size: 1.4rem;"> <b>Thêm / Thay đổi nơi giao hàng</b> </a>
				<c:choose>
					<c:when test="${noinhan == null}">
						<div class="row">
							<div class="col l-6" style="width: 50%;">
								<h4 style="font-size: 20px;">Thành phố:</h4>
								<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="thanhpho" value="" disabled required>
								<h4 style="font-size: 20px;">Phường:</h4>
								<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="phuong" value="" disabled required>
							</div>
							<div class="col l-6" style="width: 50%;">
								<h4 style="font-size: 20px;">Quận:</h4>
								<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="quan" value="" disabled required>
								<h4 style="font-size: 20px;">Địa chỉ cụ thể:</h4>
								<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="sonha" value="" disabled required>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col l-6" style="width: 50%;">
								<h4 style="font-size: 20px;">Thành phố:</h4>
								<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="thanhpho" value="${ noinhan.getThanhpho() }" disabled required>
								<h4 style="font-size: 20px;">Phường:</h4>
								<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="phuong" value="${ noinhan.getPhuong() }" disabled required>
							</div>
							<div class="col l-6" style="width: 50%;">
								<h4 style="font-size: 20px;">Quận:</h4>
								<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem; border-radius: 5px;"  type="text" name="quan" value="${ noinhan.getQuan()}" disabled required>
								<h4 style="font-size: 20px;">Địa chỉ cụ thể:</h4>
								<input form="thanhtoan" style="width: 100%; margin-bottom: 10px; height: 35px; padding-left: 10px; font-size: 1.6rem;border-radius: 5px;"  type="text" name="sonha" value="${ noinhan.getSonha() }" disabled required>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				
				<h3 style="margin-left: 15px; display: inline-block;"> <b>Phương thức thanh toán</b></h3>
				<div class="row">
					<div class="col l-5" id="ttOnline">
						<input style="position: relative; top: -8px;" form="thanhtoan" id="nganhang" type="radio" name="thanhtoan" value="chuyenkhoan" required> 
						<label style="font-weight: 500; width: 90%; font-size: 1.6rem;border-radius: 10px;" class="container__col--info-right-info nganhang" for="nganhang">
							<b>Thanh toán online</b><br>
							Thanh toán chuyển khoản qua QRCODE
						</label>
					</div>
					<div class="col l-2">
					</div>
					<div class="col l-5" id="ttTiemMat">
						<input style="position: relative; top: -8px; " form="thanhtoan" id="tienmat" type="radio" name="thanhtoan" value="tienmat" required> 
						<label style="font-weight: 500; width: 90%; font-size: 1.6rem;border-radius: 10px;" class="container__col--info-right-info tienmat" for="tienmat">
							<b>Trả tiền mặt</b><br>
							Thanh toán khi nhận hàng
						</label>
					</div>
				</div>
				<p class="ms-ttOnline" style="display:none;font-size: 25px; color: red; margin: 10px 0 0 20px; font-weight: bold;">Chú ý: <span style="color: var(--primary-color); font-size: 20px;">Không thoát khỏi trang trong quá trình thanh toán đến khi thanh toán thành công.</span></p>
				<script type="text/javascript">
					var ttOn = document.querySelector('#ttOnline');
					var msOn = document.querySelector('.ms-ttOnline');
					var ttTiemMat = document.querySelector('#ttTiemMat');
					ttOn.addEventListener('click',()=>{
						msOn.style = "display: block;font-size: 25px; color: red; margin: 10px 0 0 20px; font-weight: bold;";
					    })
					ttTiemMat.addEventListener('click',()=>{
						msOn.style = "display: none;";
					    })
				</script>
				<c:if test="${giohang != null }">
					<div class="row" style="margin-top: 30px; border-top: 1px solid var(--primary-color); padding-top: 20px; margin-left: 20px; margin-right: 20px;">
						<div class="col l-2">
						</div>
						<div style="font-size: 2.2rem;" class="col l-4">
							<span>Tạm tính (${giohang.size()} sản phẩm)</span> <br>
							<span>Phí giao hàng</span> <br>
							<span>Giảm giá</span><br>
							<c:if test="${dn.getTichdiem() != 0}">
								<input style="" form="thanhtoan" id="diem" type="checkbox" name="diem"> 
								<label style=" font-weight: 500; margin-bottom: 0px" class="" for="diem">
									<span style="color: orange;">Đổi ${diemKhachHang} điểm của bạn</span>
								</label> <br>
							</c:if>
							<span> <b>Tổng giá trị đơn hàng</b> </span><br>
						</div>
						<div style="font-size: 2.2rem; text-align: right;" class="col l-4">
							<span style="font-weight: bold;">
								<fmt:setLocale value="vi_VN"/>
								<fmt:formatNumber value="${tongtien}" type="currency"/>
							</span><br>
							<span style="font-weight: bold;">
								<fmt:setLocale value="vi_VN"/>
								<fmt:formatNumber value="0" type="currency"/>
							</span><br>
							<c:choose>
								<c:when test="${tiensaukhigiamgia != null}">
									<span style="font-weight: bold;">
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${giamgia}" type="currency"/>
									</span><br>
								</c:when>
								<c:otherwise>
									<span style="font-weight: bold;">
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="0" type="currency"/>
									</span><br>
								</c:otherwise>
							</c:choose>
							
							<c:if test="${dn.getTichdiem() != 0}">
								<span class="tichdiem" style="font-weight: bold;">
									<fmt:setLocale value="vi_VN"/>
									<fmt:formatNumber value="0" type="currency"/>
								</span><br>
							</c:if>
							
							
							<c:choose>
								<c:when test="${tiensaukhigiamgia != null}">
									<span > <b class="tonggia" style="color: red; ">
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${tiensaukhigiamgia}" type="currency"/></b> 
									</span><br>
									<input name="tienthanhtoan" form="thanhtoan" type="text" hidden="" value="${tiensaukhigiamgia }">
								</c:when>
								<c:otherwise>
									<span > <b class="tonggia" style="color: red; ">
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${tongtien}" type="currency"/></b> 
									</span><br>
									<input name="tienthanhtoan" form="thanhtoan" type="text" hidden="" value="${tongtien }">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col l-2">
						</div>
					</div>
				</c:if>
				<c:choose>
					<c:when test="${tiensaukhigiamgia != null }">
						<script type="text/javascript">
							const td =  document.querySelector('.tichdiem');
							const tg =  document.querySelector('.tonggia');
								document.querySelectorAll('input[id="diem"]').forEach((e)=>{
							        e.onclick = function(e){
							        if (this.checked){
							        	td.innerHTML = "<fmt:setLocale value='vi_VN'/><fmt:formatNumber value='-${diemKhachHang}000' type='currency'/>"
						        		tg.innerHTML = "<fmt:setLocale value='vi_VN'/><fmt:formatNumber value='${tiengiamdiem1}' type='currency'/>"
							        }else{
							        	td.innerHTML = "<fmt:setLocale value='vi_VN'/><fmt:formatNumber value='0' type='currency'/>"
							        	tg.innerHTML = "<fmt:setLocale value='vi_VN'/><fmt:formatNumber value='${tiensaukhigiamgia}' type='currency'/>"
							        }
							    };
							    })
						</script>
					</c:when>
					<c:otherwise>
						<script type="text/javascript">
							const td =  document.querySelector('.tichdiem');
							const tg =  document.querySelector('.tonggia');
								document.querySelectorAll('input[id="diem"]').forEach((e)=>{
							        e.onclick = function(e){
							        if (this.checked){
							        	td.innerHTML = "<fmt:setLocale value='vi_VN'/><fmt:formatNumber value='-${diemKhachHang}000' type='currency'/>"
						        		tg.innerHTML = "<fmt:setLocale value='vi_VN'/><fmt:formatNumber value='${tiengiamdiem}' type='currency'/>"
							        }else{
							        	td.innerHTML = "<fmt:setLocale value='vi_VN'/><fmt:formatNumber value='0' type='currency'/>"
							        	tg.innerHTML = "<fmt:setLocale value='vi_VN'/><fmt:formatNumber value='${tongtien}' type='currency'/>"
							        }
							    };
							    })
						</script>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${noinhan != null }">
						<div style="margin-top: 20px;" class="row">
							<div class="col l-4 text-center">
							</div>
							<div class="col l-4 text-center">
								<input form="thanhtoan" type="text" hidden="" name="donmua" value="1">
								<input form="thanhtoan" type="text" hidden="" name="dsMaGioChon" value="${dsMaGioChon }">
								<button form="thanhtoan" style="padding: 15px 5px; color: var(--text-color); background-color: var(--primary-color); width: 100%; display: block; font-size: 2rem; border: none;" ><b>Xác nhận thanh toán</b> </button>
							</div>
							<div class="col l-4 text-center">
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div style="margin-top: 20px;" class="row">
							<div class="col l-4 text-center">
							</div>
							<div class="col l-4 text-center">
								<a href="ThanhToanController?nn=null" style="padding: 15px 5px; color: var(--text-color); background-color: var(--primary-color); width: 100%; display: block; font-size: 2rem; border: none;" ><b>Xác nhận thanh toán</b> </a>
							</div>
							<div class="col l-4 text-center">
							</div>
						</div>
					</c:otherwise>
				</c:choose>
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
	</div>
</body>
</html>