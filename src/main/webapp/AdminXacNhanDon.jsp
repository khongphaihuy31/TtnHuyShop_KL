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
table,th, td, tr, thead, tbody {
  border: 1px solid var(--primary-color);
}
a:focus, a:hover {
    text-decoration: none;
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
	top: 75px;
}
</style>
</head>
<body class="w3-light-grey">
	<div style="z-index: 9999999999999999" id="toast"></div>
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
                    <a style="color: red;margin-left: 25px; font-size: 18px;" href="dangXuatController" class="js-register header__welcome-link">Đăng
                    xuất <i class="fa-solid fa-right-from-bracket"></i>
                    </a>
            </div>
        </div>
        <hr>
        <div class="w3-container">
            <h5 style="text-align: center; font-weight: bold; margin-top: 0; font-size: 18px;">DANH MỤC QUẢN LÝ</h5>
        </div>
        <div class="w3-bar-block">
            <!--<a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>-->
            <a href="AdminTrangChuController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-house"></i>  Trang chủ</a>
            <a href="AdminXacNhanController" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa-solid fa-truck-ramp-box"></i>  Xác nhận đơn hàng</a>
            <a href="AdminLoaiSanPhamController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-layer-group"></i>  Quản lý loại sản phẩm</a>
            <a href="AdminLoaiTrongDanhMucController" class="w3-bar-item w3-button w3-padding"><i class="fa-brands fa-docker"></i>  Quản lý loại trong danh mục</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-boxes-stacked"></i>  Quản lý sản phẩm</a>
            <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users"></i>  Quản lý khách hàng</a>
            <a href="AdminThuongHieuController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-shirt"></i>  Quản lý thương hiệu</a>
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
            <h2><b><i class="fa-solid fa-truck-ramp-box"></i>  Xác nhận đơn hàng</b></h2>
        </header>
        <div class="w3-row-padding">
        	<div class="timKiem" style="text-align: center;">
				<p style="display: inline-block; font-size: 20px; margin: 0"> <b>Tìm kiếm</b> </p>
				<form action="AdminXacNhanController" method="get" style="display: inline-block;">
					<select name="mahoadon" style="display: inline-block; margin-left: 10px; height: 100%; font-size: 20px; width: 250px;">
						<option value="All">Tất cả</option>
						<c:if test="${dshoadon.size() !=0 }">
							<c:forEach items="${dshoadon }" var="mhd">
								<option value="${mhd}">Mã hóa đơn: ${mhd}</option>
							</c:forEach>
						</c:if>
					</select>
					<button style="display: inline-block; height: 25px; position: relative; top: 0px; width: 40px;"><i style="height: 26px; line-height: 26px; color: var(--primary-color)" class="fa-solid fa-magnifying-glass"></i></button>
				</form>
			</div>
			
			<div class="w3-section" style="margin-bottom: -16px !important;">
				<c:choose>
					<c:when test="${param.donDesign!= null }">
						<a href="AdminXacNhanController" class="w3-button w3-white w3-hide-small" style="background-color: var(--primary-color); color: #fff"><i class="fa-solid fa-box"></i> Đơn hàng bình thường</a>
				    	<a href="AdminXacNhanController?donDesign=1" class="w3-button" style="background-color: var(--primary-color); color: #fff"><i class="fa-solid fa-box"></i> Đơn hàng design</a>
					</c:when>
					<c:otherwise>
				    	<a href="AdminXacNhanController" class="w3-button" style="background-color: var(--primary-color); color: #fff"><i class="fa-solid fa-box"></i> Đơn hàng bình thường</a>
				    	<a href="AdminXacNhanController?donDesign=1" class="w3-button w3-white w3-hide-small"><i class="fa-solid fa-box"></i> Đơn hàng design</a>
					</c:otherwise>
				</c:choose>
		    </div>
        </div>
        <div class="w3-row-padding w3-margin-bottom">
        	<c:choose>
        		<c:when test="${param.mahoadon != null && param.mahoadon.equals('All')== false}">
		        	<c:choose>
						<c:when test="${dsSPChoXacNhan.size()!=0 }">
							<c:forEach items="${dshdchoxacnhan }" var="hdcb">
						        <c:if test="${hdcb.getMahoadon().toString().equals( param.mahoadon )}">
						        	<c:forEach items="${dskhachhang }" var="kh">
										<c:if test="${kh.getMakhachhang() ==  hdcb.getMakhachhang()}">
											<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px; background-color: #fff;">
										        <div style="display: flex; width: 100%; justify-content: space-around;">
										            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Mã hóa đơn: <span style="color: black; font-weight: 500;">${hdcb.getMahoadon() }</span></span> 
										            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Tổng tiền: <span style="color: black; font-weight: 500;"><fmt:setLocale value="vi_VN" />
													<fmt:formatNumber value="${hdcb.getTongdongia() }"
														type="currency" /></span></span>
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
										            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Họ tên: <span style="color: black; font-weight: 500;">${kh.getHoten() }</span></span> 
										            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Số điện thoại: <span style="color: black; font-weight: 500;">${kh.getSodienthoai() }</span></span> 
										        	<span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Email: <span style="color: black; font-weight: 500;">${kh.getEmail() }</span></span>
										        </div>
										        <div style="display: flex; width: 100%; justify-content: space-around;">
										            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Địa chỉ nhận hàng: <span style="color: black; font-weight: 500;">${hdcb.getDiachinhanhang() }</span></span> 
										            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Ngày đặt: <span style="color: black; font-weight: 500;">${hdcb.getNgaydat() }</span></span> 
										        </div>
										        <table class="table" style="width: 100%; margin-top: 10px; margin-bottom: 0;"  cellpadding="2" cellspacing="2">
										            <thead>
										                <tr>
										                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);" colspan="3">Tên sản phẩm</th>
										                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">Giá</th>
										                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">SL</th>
										                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">Thành tiền</th>
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
																						<img style="width: 100%" class="previewImgDesign"
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
										        <div class="w3-row-padding w3-margin-top">
										        	<c:if test="${hdcb.getMatrangthai() ==1 }">
											           <div class="w3-quarter">
												        <a href="AdminXacNhanController?xacNhanDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
											                <div style="text-align: center;border-radius: 10px;" class="w3-container w3-orange w3-text-white">
											                    <h4>Xác nhận đơn</h4>
											                </div>
												        </a>
											           </div>
										        	</c:if>
										        	<c:if test="${hdcb.getMatrangthai() ==2 }">
											           <div class="w3-quarter">
											            <a href="AdminXacNhanController?dangGiaoDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
											                <div style="text-align: center;border-radius: 10px;" class="w3-container w3-blue">
											                    <h4>Chuẩn bị xong</h4>
											                </div>
												        </a>
											           </div>
										        	</c:if>
										           <c:if test="${hdcb.getMatrangthai() ==3 }">
											           <div class="w3-quarter">
											            <a href="AdminXacNhanController?daGiaoDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
											                <div style="text-align: center; border-radius: 10px;" class="w3-container w3-teal">
											                    <h4>Đã giao</h4>
											                </div>
												        </a>
											           </div>
										        	</c:if>
										           <div class="w3-quarter">
										            <a href="AdminXacNhanController?huyDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
										                <div style="text-align: center; border-radius: 10px;" class="w3-container w3-red w3-text-white">
										                    <h4>Hủy đơn</h4>
										                </div>
											        </a>
										           </div>
										       </div>
										    </div>
										</c:if>
									</c:forEach>
						        </c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="row" style="margin-top: 10px;">
								<h3>Chưa có đơn hàng</h3>
							</div>
						</c:otherwise>
					</c:choose>
        		</c:when>
        		<c:when test="${param.donDesign != null }">
        			<c:choose>
						<c:when test="${dsSPChoXacNhan.size()!=0 }">
							<c:forEach items="${dsSPChoXacNhan }" var="ktraDesign">
								<c:if test="${ktraDesign.getAnhthietke() != null }">
									<c:forEach items="${dshdchoxacnhan }" var="hdcb">
										<c:if test="${hdcb.getMahoadon()==ktraDesign.getMahoadon()  }">
											<c:forEach items="${dskhachhang }" var="kh">
												<c:if test="${kh.getMakhachhang() ==  hdcb.getMakhachhang()}">
													<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px; background-color: #fff;">
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Mã hóa đơn: <span style="color: black; font-weight: 500;">${hdcb.getMahoadon() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Tổng tiền: <span style="color: black; font-weight: 500;">
													            <fmt:setLocale value="vi_VN" />
																<fmt:formatNumber value="${hdcb.getTongdongia() }"
																	type="currency" />
												            </span></span>
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
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Họ tên: <span style="color: black; font-weight: 500;">${kh.getHoten() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Số điện thoại: <span style="color: black; font-weight: 500;">${kh.getSodienthoai() }</span></span> 
												        	<span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Email: <span style="color: black; font-weight: 500;">${kh.getEmail() }</span></span>
												        </div>
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Địa chỉ nhận hàng: <span style="color: black; font-weight: 500;">${hdcb.getDiachinhanhang() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Ngày đặt: <span style="color: black; font-weight: 500;">${hdcb.getNgaydat() }</span></span> 
												        </div>
												        <table class="table" style="width: 100%; margin-top: 10px;margin-bottom: 0;"  cellpadding="2" cellspacing="2">
												            <thead>
												                <tr>
												                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);" colspan="3">Tên sản phẩm</th>
												                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">Giá</th>
												                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">SL</th>
												                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">Thành tiền</th>
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
																							style="position: relative; height: fit-content; text-align: center;box-shadow: 2px 1px 5px #ccc">
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																							<div
																								style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); display: flex; justify-content: center; align-items: center; "
																								class="preview-img">
																								<img style="width: 100%" class="previewImgDesign"
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
												        <div class="w3-row-padding w3-margin-top">
												        	<c:if test="${hdcb.getMatrangthai() ==1 }">
													           <div class="w3-quarter">
														        <a href="AdminXacNhanController?xacNhanDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
													                <div style="text-align: center;border-radius: 10px;" class="w3-container w3-orange w3-text-white">
													                    <h4>Xác nhận đơn</h4>
													                </div>
														        </a>
													           </div>
												        	</c:if>
												        	<c:if test="${hdcb.getMatrangthai() ==2 }">
													           <div class="w3-quarter">
													            <a href="AdminXacNhanController?dangGiaoDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
													                <div style="text-align: center;border-radius: 10px;" class="w3-container w3-blue">
													                    <h4>Chuẩn bị xong</h4>
													                </div>
														        </a>
													           </div>
												        	</c:if>
												           <c:if test="${hdcb.getMatrangthai() ==3 }">
													           <div class="w3-quarter">
													            <a href="AdminXacNhanController?daGiaoDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
													                <div style="text-align: center; border-radius: 10px;" class="w3-container w3-teal">
													                    <h4>Đã giao</h4>
													                </div>
														        </a>
													           </div>
												        	</c:if>
												           <div class="w3-quarter">
												            <a href="AdminXacNhanController?huyDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
												                <div style="text-align: center; border-radius: 10px;" class="w3-container w3-red w3-text-white">
												                    <h4>Hủy đơn</h4>
												                </div>
													        </a>
												           </div>
												       </div>
												    </div>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
								</c:if>
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
							<c:forEach items="${dsSPChoXacNhan }" var="ktraDesign">
								<c:if test="${ktraDesign.getAnhthietke() == null }">
									<c:forEach items="${dshdchoxacnhan }" var="hdcb">
										<c:if test="${hdcb.getMahoadon()==ktraDesign.getMahoadon()  }">
											<c:forEach items="${dskhachhang }" var="kh">
												<c:if test="${kh.getMakhachhang() ==  hdcb.getMakhachhang()}">
													<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px; background-color: #fff;">
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Mã hóa đơn: <span style="color: black; font-weight: 500;">${hdcb.getMahoadon() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold;">Tổng tiền: <span style="color: black; font-weight: 500;">
													            <fmt:setLocale value="vi_VN" />
																<fmt:formatNumber value="${hdcb.getTongdongia() }"
																	type="currency" />
												            </span></span>
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
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Họ tên: <span style="color: black; font-weight: 500;">${kh.getHoten() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Số điện thoại: <span style="color: black; font-weight: 500;">${kh.getSodienthoai() }</span></span> 
												        	<span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Email: <span style="color: black; font-weight: 500;">${kh.getEmail() }</span></span>
												        </div>
												        <div style="display: flex; width: 100%; justify-content: space-around;">
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; ">Địa chỉ nhận hàng: <span style="color: black; font-weight: 500;">${hdcb.getDiachinhanhang() }</span></span> 
												            <span style="color: #4dcdcf; font-size: 15px; font-weight: bold; width: 30%;">Ngày đặt: <span style="color: black; font-weight: 500;">${hdcb.getNgaydat() }</span></span> 
												        </div>
												        <table class="table" style="width: 100%; margin-top: 10px;margin-bottom: 0;"  cellpadding="2" cellspacing="2">
												            <thead>
												                <tr>
												                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);" colspan="3">Tên sản phẩm</th>
												                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">Giá</th>
												                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">SL</th>
												                   <th style="text-align: center; border-bottom: 2px solid var(--primary-color);">Thành tiền</th>
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
																							style="position: relative; height: fit-content; text-align: center;box-shadow: 1px 2px 2px #000">
																							<img style="width: 100%; display: inline-block;"
																								alt="" src="${dm.getAnhsanpham()}">
																							<div
																								style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); display: flex; justify-content: center; align-items: center; "
																								class="preview-img">
																								<img style="width: 100%" class="previewImgDesign"
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
												        <div class="w3-row-padding w3-margin-top">
												        	<c:if test="${hdcb.getMatrangthai() ==1 }">
													           <div class="w3-quarter">
														        <a href="AdminXacNhanController?xacNhanDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
													                <div style="text-align: center;border-radius: 10px;" class="w3-container w3-orange w3-text-white">
													                    <h4>Xác nhận đơn</h4>
													                </div>
														        </a>
													           </div>
												        	</c:if>
												        	<c:if test="${hdcb.getMatrangthai() ==2 }">
													           <div class="w3-quarter">
													            <a href="AdminXacNhanController?dangGiaoDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
													                <div style="text-align: center;border-radius: 10px;" class="w3-container w3-blue">
													                    <h4>Chuẩn bị xong</h4>
													                </div>
														        </a>
													           </div>
												        	</c:if>
												           <c:if test="${hdcb.getMatrangthai() ==3 }">
													           <div class="w3-quarter">
													            <a href="AdminXacNhanController?daGiaoDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
													                <div style="text-align: center; border-radius: 10px;" class="w3-container w3-teal">
													                    <h4>Đã giao</h4>
													                </div>
														        </a>
													           </div>
												        	</c:if>
												           <div class="w3-quarter">
												            <a href="AdminXacNhanController?huyDon=${hdcb.getMahoadon() }" style="text-decoration: none;">
												                <div style="text-align: center; border-radius: 10px;" class="w3-container w3-red w3-text-white">
												                    <h4>Hủy đơn</h4>
												                </div>
													        </a>
												           </div>
												       </div>
												    </div>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
								</c:if>
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
    
    <c:if test="${param.xacNhanTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastXacNhanDon() {
				toast({
			        title :'Thành công',
			        message : 'Xác nhận đơn hàng thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastXacNhanDon();
		</script>
	</c:if>
	
	<c:if test="${param.dangGiaoTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastDangGiaoDon() {
				toast({
			        title :'Thành công',
			        message : 'Xác nhận đơn hàng đang giao thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastDangGiaoDon();
		</script>
	</c:if>
	
	<c:if test="${param.daGiaoTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastDaGiao() {
				toast({
			        title :'Thành công',
			        message : 'Xác nhận đơn hàng đã được giao thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastDaGiao();
		</script>
	</c:if>
	
	<c:if test="${param.huyDonTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastHuyDon() {
				toast({
			        title :'Thành công',
			        message : 'Hủy đơn thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastHuyDon();
		</script>
	</c:if>
</body>
</html>