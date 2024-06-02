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

  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>

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
        <a href="AdminTrangChu" class="w3-bar-item w3-right" style="padding: 0 !important;">
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
            <a href="AdminTrangChu" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-house"></i>  Trang chủ</a>
            <a href="AdminXacNhan" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-truck-ramp-box"></i>  Xác nhận đơn hàng</a>
            <a href="AdminLoaiSanPham" class="w3-bar-item w3-button w3-padding "><i class="fa-solid fa-layer-group"></i>  Quản lý loại sản phẩm</a>
            <a href="AdminLoaiTrongDanhMuc" class="w3-bar-item w3-button w3-padding"><i class="fa-brands fa-docker"></i>  Quản lý loại trong danh mục</a>
            <a href="AdminSanPham" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa-solid fa-boxes-stacked"></i>  Quản lý sản phẩm</a>
            <a href="AdminKhachHang" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users"></i>  Quản lý khách hàng</a>
            <a href="AdminThuongHieu" class="w3-bar-item w3-button w3-padding "><i class="fa-solid fa-shirt"></i>  Quản lý thương hiệu</a>
            <a href="AdminBanner" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-image"></i>  Quản lý banner</a>
            <a href="AdminKhuyenMai" class="w3-bar-item w3-button w3-padding "><i class="fa-solid fa-gift"></i>  Quản lý khuyến mãi</a>
            <a href="AdminTichDiem" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-star"></i>  Quản lý tích điểm</a>
            <a href="AdminThongKe" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-chart-pie"></i>  Thống kê doanh thu</a><br><br>
        </div>
    </nav>


    <!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
        title="close side menu" id="myOverlay"></div>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:63px;">

        <!-- Header -->
        <header class="w3-container" style="padding-top:22px;color:var(--primary-color); margin-bottom: 16px;">
            <c:choose>
            	<c:when test="${param.btnnhapcu == null }">
		            <h2 style="display: inline-block;"><b><i class="fa-solid fa-truck-fast"></i>  Nhập sản phẩm mới</b></h2>
            	</c:when>
            	<c:otherwise>
            		<h2 style="display: inline-block;"><b><i class="fa-solid fa-truck-fast"></i>  Nhập sản phẩm</b></h2>
            	</c:otherwise>
            </c:choose>
        </header>
        <div class="w3-panel" style="margin-bottom: 100px">
        	<c:choose>
        		<c:when test="${param.btnnhapcu == null }">
			        <form id="formNhapHang" action="AdminThemSanPhamController" enctype="multipart/form-data" method="post">
				    	<div class="w3-row-padding" style="border: 2px solid #4dcdcf; border-radius: 10px;background-color: #fff;">
					    	<div class="w3-row-padding" style="margin:0 -16px;">
						      <div class="w3-twothird">
						        	<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;" for="tensanpham">
											Tên Sản phẩm <span style="color: red;">*</span>
										</label>
										<div style="margin-top: 10px;" class="control">
											<input form="formNhapHang"
											style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
											type="text" id="tensanpham" name="tensanpham"
											placeholder="Nhập tên sản phẩm"
											class="input-text required-entry form-control">
											<span class="form-message"></span> 
										</div>
									</div>
									<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;" for="gianhap">
											Giá nhập <span style="color: red;">*</span>
										</label>
										<div style="margin-top: 10px;" class="control">
											<input form="formNhapHang"
											style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
											type="number" id="gianhap" name="gianhap"
											placeholder="Nhập giá nhập"
											class="input-text required-entry form-control">
											<span class="form-message"></span> 
										</div>
									</div>
									<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;" for="giaban">
											Giá bán <span style="color: red;">*</span>
										</label>
										<div style="margin-top: 10px;" class="control">
											<input form="formNhapHang"
											style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
											type="number" id="giaban" name="giaban"
											placeholder="Nhập giá bán"
											class="input-text required-entry form-control">
											<span class="form-message"></span> 
										</div>
									</div>
									<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;" for="loai">
											Loại <span style="color: red;">*</span>
										</label> 
										<select style="margin-top: 10px; height:41px; font-size: 18px; padding: 2px 10px; border-radius: 10px; border: 1px solid #ccc;"
											form="formNhapHang" name="loai"
											class="form-control" id="loai">
											<option style="color: #555;" value="" selected>Chọn loại</option>
											<c:forEach items="${dsloai }" var="l">
												<option style="color: #555;" value="${l.getMaloai() }">${l.getTenloai() }</option>
											</c:forEach>
										</select>
										<span class="form-message"></span>
									</div>
									<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;" for="thuonghieu">
											Thương hiệu <span style="color: red;">*</span>
										</label> 
										<select style="margin-top: 10px; height:41px; font-size: 18px; padding: 2px 10px; border-radius: 10px; border: 1px solid #ccc;"
											form="formNhapHang" name="thuonghieu"
											class="form-control" id="thuonghieu">
											<option style="color: #555;" value="" selected>Chọn thương hiệu</option>
											<c:forEach items="${dsthuonghieu }" var="l">
												<option style="color: #555;" value="${l.getMathuonghieu() }">${l.getTenthuonghieu() }</option>
											</c:forEach>
										</select>
										<span class="form-message"></span>
									</div>
									<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;" for="danhmuc">
											Danh mục <span style="color: red;">*</span>
										</label> 
										<select style="margin-top: 10px; height:41px; font-size: 18px; padding: 2px 10px; border-radius: 10px; border: 1px solid #ccc;"
											form="formNhapHang" name="danhmuc"
											class="form-control" id="danhmuc">
											<option style="color: #555;" value="" selected>Chọn danh mục</option>
											<c:forEach items="${dsdanhmuc }" var="l">
												<option style="color: #555;" value="${l.getMadanhmuc() }">${l.getTendanhmuc() }</option>
											</c:forEach>
										</select>
										<span class="form-message"></span>
									</div>
					      		</div>
						      <div class="w3-third">
						      	<div style="margin-top: 20px;" class="form-group">
									<label style="font-size: 20px; margin-bottom: 0;" for="anh">
										Ảnh sản phẩm <span style="color: red;">*</span>
									</label>
									<div style="margin-top: 10px;" class="control">
										<input form="formNhapHang"
										style="width: 100%; height: 41px; font-size: 18px;border: none; box-shadow: none;"
										type="file" id="anh" name="anh"
										class="input-text required-entry form-control" accept="image/*">
										<span class="form-message"></span> 
									</div>
								</div>
								<div style="margin-top: 20px;" class="form-group">
									<label style="font-size: 20px; margin-bottom: 0;" for="anhchonsize">
										Ảnh HD chọn size <span style="color: red;">*</span>
									</label>
									<div style="margin-top: 10px;" class="control">
										<input form="formNhapHang"
										style="width: 100%; height: 42px; font-size: 18px;border: none; box-shadow: none;"
										type="file" id="anhchonsize" name="anhchonsize"
										class="input-text required-entry form-control" accept="image/*">
										<span class="form-message"></span> 
									</div>
								</div>
								<div style="margin-top: 20px;" class="form-group">
									<label style="font-size: 20px; margin-bottom: 0;">
										Size <span style="color: red;">*</span>
										<a style="margin-left: 20px;font-size:25px; cursor: pointer;" class="btnAddSize"><i class="fa-solid fa-circle-plus"></i></a>
						               <a style="margin-left: 20px;font-size:25px; cursor: pointer; display: none;" class="btnDeleteSize"><i class="fa-solid fa-circle-minus"></i></a> <br>
									</label>
									<div style="margin-top: 10px;" class="control warpper-lsize1">
										<input form="formNhapHang"
											style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
											type="text" id="lsize1" name="lsize1"
											placeholder="Nhập size"
											class="input-text required-entry form-control">
										<span class="form-message"></span> 
									</div>
								</div>
									<c:forEach var = "i" begin = "2" end = "5">
										<div style="margin-top: 10px;width: 100%; display: none;" class="control warpper-lsize${i } form-group">
											<input form="formNhapHang"
												style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
												type="text" id="lsize${i }" name="lsize${i }"
												placeholder="Nhập size"
												class="input-text required-entry form-control">
											<span class="form-message"></span> 
										</div>
									</c:forEach>
								<div style="margin-top: 20px;" class="form-group">
									<label style="font-size: 20px; margin-bottom: 0;">
										Màu - Ảnh <span style="color: red;">*</span>
										<a style="margin-left: 20px; font-size:25px; cursor: pointer;" class="btnAddColor"><i class="fa-solid fa-circle-plus"></i></a>
						               <a style="margin-left: 20px;font-size:25px; cursor: pointer; display: none;" class="btnDeleteColor"><i class="fa-solid fa-circle-minus"></i></a> <br>
									</label>
									<div style="margin-top: 10px;" class="control warpper-lmau1">
											<input form="formNhapHang"
												style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
												type="text" id="lmau1" name="lmau1"
												placeholder="Nhập màu"
												class="input-text required-entry form-control">
											<input form="formNhapHang"
												style="width: 100%; height: 41px; font-size: 18px;border: none; box-shadow: none; margin-top: 10px; border-radius: 10px;"
												type="file" id="anhmau1" name="anhmau1"
												class="input-text required-entry form-control" accept="image/*">
											<span class="form-message"></span> 
										</div>
									</div>
									<c:forEach var = "i" begin = "2" end = "5">
										<div style="margin-top: 10px; display: none;" class="control warpper-lmau${i } form-group">
											<div>
											</div>
											<input form="formNhapHang"
												style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
												type="text" id="lmau${i }" name="lmau${i }"
												placeholder="Nhập màu"
												class="input-text required-entry form-control">
											<input form="formNhapHang"
												style="width: 100%; height: 41px; font-size: 18px;border: none; box-shadow: none; margin-top: 10px; border-radius: 10px;"
												type="file" id="anhmau${i }" name="anhmau${i }"
												class="input-text required-entry form-control" accept="image/*">
											<span class="form-message"></span> 
										</div>
									</c:forEach>
						      </div>
				    		</div>
				    		<div class="w3-third" style="width: 100%; text-align: center;margin-bottom: 20px">
						      <button form="formNhapHang" class="w3-button" style="padding: 15px 20px; background-color: var(--primary-color); color: var(--text-color); font-size: 25px; border-radius: 10px; width: 40%;">Nhập chi tiết số lượng</button>
				    		</div>
				    	</div>
			        </form>
			        <script type="text/javascript">
				    const btnAddSize = document.querySelector('.btnAddSize');
				    var soSize = 2;
				    btnAddSize.addEventListener('click',()=>{
				        if(soSize<=5){
				            lsize = document.querySelector('.warpper-lsize'+soSize);
				            lsize.style.display= "inline-block"
				            btnDeleteSize.style.display= "inline-block"
				            soSize +=1;
				        }else{
				        	function showInfoToastSizeToiDa(){
							    toast({
							        title :'Thông báo',
							        message : 'Bạn chỉ được thêm tối đa 5 size.',
							        type  : 'info',
							        duration : 5000
							    })
							}
				        	showInfoToastSizeToiDa();
				        }
				    })
				
				    const btnDeleteSize = document.querySelector('.btnDeleteSize');
				    btnDeleteSize.addEventListener('click',()=>{
				        if(soSize>2){
				            soSize -=1;
				            lsize = document.querySelector('.warpper-lsize'+soSize);
				            input = document.querySelector('.warpper-lsize'+soSize +' input[name = lsize'+soSize+']');
				            // controllerSize = document.querySelector('.controllerSize');
				            input.value ='';
				            lsize.style.display= "none";
				            if(soSize ==2){
				                btnDeleteSize.style.display= "none";
				            }
				        }
				    })
				    
				    
				    
			    const btnAddColor = document.querySelector('.btnAddColor');
			    var soMau = 2;
			    btnAddColor.addEventListener('click',()=>{
			        if(soMau<=5){
			            lmau = document.querySelector('.warpper-lmau'+soMau);
			            lmau.style.display= "inline-block"
			            btnDeleteColor.style.display= "inline-block"
			            soMau +=1;
			        }else{
			        	function showInfoToastMauToiDa(){
						    toast({
						        title :'Thông báo',
						        message : 'Bạn chỉ được thêm tối đa 5 màu.',
						        type  : 'info',
						        duration : 5000
						    })
						}
			        	showInfoToastMauToiDa();
			        }
			    })
			
			    const btnDeleteColor = document.querySelector('.btnDeleteColor');
			    btnDeleteColor.addEventListener('click',()=>{
			        if(soMau>2){
			            soMau -=1;
			            lmau = document.querySelector('.warpper-lmau'+soMau);
			            input = document.querySelector('.warpper-lmau'+soMau+ ' input[name = lmau'+soMau+']');
			            // controllerMau = document.querySelector('.controllerMau');
			            lmau.style.display= "none";
			            input.value=''
			            if(soMau ==2){
			                btnDeleteColor.style.display= "none";
			            }
			        }
			    })
			    </script>
        		</c:when>
        		<c:otherwise>
        			<c:if test="${spnhapdacotrongcuahang != null }">
				        <form id="formNhapHangDaCo" action="AdminNhapSanPhamDaCoController" enctype="multipart/form-data" method="post">
					    	<div class="w3-row-padding" style="border: 2px solid #4dcdcf; border-radius: 10px;background-color: #fff;">
						    	<div class="w3-row-padding" style="margin:0 -16px;">
							      <div class="w3-twothird">
							        	<div style="margin-top: 20px;" class="form-group">
											<label style="font-size: 20px; margin-bottom: 0;" for="tensanpham">
												Tên Sản phẩm <span style="color: red;">*</span>
											</label>
											<div style="margin-top: 10px;" class="control">
												<input form="formNhapHangDaCo"
												style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
												type="text" id="tensanpham" name="tensanpham"
												placeholder="Nhập tên sản phẩm"
												class="input-text required-entry form-control" value="${spnhapdacotrongcuahang.getTensanpham() }" disabled="disabled">
												<span class="form-message"></span> 
											</div>
										</div>
										<div style="margin-top: 20px;" class="form-group">
											<label style="font-size: 20px; margin-bottom: 0;" for="gianhap">
												Giá nhập <span style="color: red;">*</span>
											</label>
											<div style="margin-top: 10px;" class="control">
												<input form="formNhapHangDaCo"
												style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
												type="number" id="gianhapspcu" name="gianhap"
												placeholder="Nhập giá nhập"
												class="input-text required-entry form-control">
												<span class="form-message"></span> 
											</div>
										</div>
										<div style="margin-top: 20px;" class="form-group">
											<label style="font-size: 20px; margin-bottom: 0;" for="giaban">
												Giá bán <span style="color: red;">*</span>
											</label>
											<c:if test="">
											</c:if>
											<c:choose>
												<c:when test="${spnhapdacotrongcuahang.getGiagiam() ==0 }">
													<div style="margin-top: 10px;" class="control">
														<input form="formNhapHangDaCo"
														style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
														type="number" id="giaban" name="giaban"
														placeholder="Nhập giá bán"
														class="input-text required-entry form-control" value="${spnhapdacotrongcuahang.getGiaban() }" disabled="disabled">
														<span class="form-message"></span> 
													</div>
												</c:when>
												<c:otherwise>
													<div style="margin-top: 10px;" class="control">
														<input form="formNhapHangDaCo"
														style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
														type="number" id="giaban" name="giaban"
														placeholder="Nhập giá bán"
														class="input-text required-entry form-control" value="${spnhapdacotrongcuahang.getGiagiam() }" disabled="disabled">
														<span class="form-message"></span> 
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<div style="margin-top: 20px;" class="form-group">
											<label style="font-size: 20px; margin-bottom: 0;" for="loai">
												Loại <span style="color: red;">*</span>
											</label> 
											<select style="margin-top: 10px; height:41px; font-size: 18px; padding: 2px 10px; border-radius: 10px; border: 1px solid #ccc;"
												form="formNhapHangDaCo" name="loai"
												class="form-control" id="loai" disabled="disabled">
												<c:forEach items="${dsloai }" var="l">
													<c:if test="${l.getMaloai() == spnhapdacotrongcuahang.getMaloai() }">
														<option style="color: #555;" value="${spnhapdacotrongcuahang.getMaloai() }" selected>${l.getTenloai() }</option>
													</c:if>
												</c:forEach>
											</select>
											<span class="form-message"></span>
										</div>
										<div style="margin-top: 20px;" class="form-group">
											<label style="font-size: 20px; margin-bottom: 0;" for="thuonghieu">
												Thương hiệu <span style="color: red;">*</span>
											</label> 
											<select style="margin-top: 10px; height:41px; font-size: 18px; padding: 2px 10px; border-radius: 10px; border: 1px solid #ccc;"
												form="formNhapHangDaCo" name="thuonghieu"
												class="form-control" id="thuonghieu" disabled="disabled">
												<c:forEach items="${dsthuonghieu }" var="l">
													<c:if test="${l.getMathuonghieu() == spnhapdacotrongcuahang.getMathuonghieu() }">
														<option style="color: #555;" value="${spnhapdacotrongcuahang.getMathuonghieu() }" selected>${l.getTenthuonghieu() }</option>
													</c:if>
												</c:forEach>
											</select>
											<span class="form-message"></span>
										</div>
										<div style="margin-top: 20px;" class="form-group">
											<label style="font-size: 20px; margin-bottom: 0;" for="danhmuc">
												Danh mục <span style="color: red;">*</span>
											</label> 
											<select style="margin-top: 10px; height:41px; font-size: 18px; padding: 2px 10px; border-radius: 10px; border: 1px solid #ccc;"
												form="formNhapHangDaCo" name="danhmuc"
												class="form-control" id="danhmuc" disabled="disabled">
												<c:forEach items="${dsdanhmuc }" var="l">
													<c:if test="${l.getMadanhmuc() == spnhapdacotrongcuahang.getMadanhmuc() }">
														<option style="color: #555;" value="${spnhapdacotrongcuahang.getMadanhmuc() }" selected>${l.getTendanhmuc() }</option>
													</c:if>
												</c:forEach>
											</select>
											<span class="form-message"></span>
										</div>
						      		</div>
							      <div class="w3-third">
							      	<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;" for="anh">
											Ảnh sản phẩm <span style="color: red;">*</span>
										</label>
										<div style="margin-top: 10px; text-align: center;" class="control">
											<img class="choose-img" style="width: 20%;"
													src="${spnhapdacotrongcuahang.getAnh() }" alt="preview-img">
											<!--<input form="formNhapHang"
											style="width: 100%; height: 41px; font-size: 18px;border: none; box-shadow: none; display: none;"
											type="file" id="anh" name="anh"
											class="input-text required-entry form-control" accept="image/*" value="">
											<span class="form-message"></span> -->
										</div>
									</div>
									<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;" for="anhchonsize">
											Ảnh HD chọn size <span style="color: red;">*</span>
										</label>
										<div style="margin-top: 10px; text-align: center;" class="control">
											<img class="choose-img" style="width: 20%;"
													src="${spnhapdacotrongcuahang.getAnhchonsize() }" alt="preview-img">
											<!--<input form="formNhapHang"
											style="width: 100%; height: 42px; font-size: 18px;border: none; box-shadow: none;"
											type="file" id="anhchonsize" name="anhchonsize"
											class="input-text required-entry form-control" accept="image/*">
											<span class="form-message"></span> -->
										</div>
									</div>
									<!-- Sửa ngang đoạn này rồi, tối cố sửa tiếp nha -->
									<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;">
											Size <span style="color: red;">*</span>
											<a style="margin-left: 20px;font-size:25px; cursor: pointer;" class="btnAddSize"><i class="fa-solid fa-circle-plus"></i></a>
							               <a style="margin-left: 20px;font-size:25px; cursor: pointer; display: none;" class="btnDeleteSize"><i class="fa-solid fa-circle-minus"></i></a> <br>
										</label>
										<c:forEach items="${dsSizeSanPham }" var="s" varStatus="index">
											<div style="margin-top: 10px;" class="control warpper-lsize${index.index+1 }">
												<input form="formNhapHangDaCo"
													style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
													type="text" id="lsize${index.index+1 }" name="lsize${index.index+1 }"
													placeholder="Nhập size"
													class="input-text required-entry form-control" value="${s.getSize() }" disabled="disabled">
												<span class="form-message"></span> 
											</div>
										</c:forEach>
										<c:forEach var = "i" begin = "${dsSizeSanPham.size()+1 }" end = "5">
											<div style="margin-top: 10px;width: 100%; display: none;" class="control warpper-lsize${i } form-group">
												<input form="formNhapHangDaCo"
													style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
													type="text" id="lsize${i }" name="lsize${i }"
													placeholder="Nhập size"
													class="input-text required-entry form-control">
												<span class="form-message"></span> 
											</div>
										</c:forEach>
									</div>
									<div style="margin-top: 20px;" class="form-group">
										<label style="font-size: 20px; margin-bottom: 0;">
											Màu - Ảnh <span style="color: red;">*</span>
											<a style="margin-left: 20px; font-size:25px; cursor: pointer;" class="btnAddColor"><i class="fa-solid fa-circle-plus"></i></a>
							               <a style="margin-left: 20px;font-size:25px; cursor: pointer; display: none;" class="btnDeleteColor"><i class="fa-solid fa-circle-minus"></i></a> <br>
										</label>
										<c:forEach items="${dsAnhSanPham }" var="am" varStatus="index">
											<div style="margin-top: 10px;text-align: center;" class="control warpper-lmau${index.index+1 }">
													<img class="choose-img" style="width: 20%; margin-bottom: 5px;"
														src="${am.getSrcanh() }" alt="preview-img">
													<input form="formNhapHangDaCo"
														style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
														type="text" id="lmau${index.index+1 }" name="lmau${index.index+1 }"
														placeholder="Nhập màu"
														class="input-text required-entry form-control" value="${am.getMauString() }" disabled="disabled">
													
													<!--<input form="formNhapHang"
														style="width: 100%; height: 41px; font-size: 18px;border: none; box-shadow: none; margin-top: 10px; border-radius: 10px;"
														type="file" id="anhmau1" name="anhmau1"
														class="input-text required-entry form-control" accept="image/*">
													<span class="form-message"></span>--> 
												</div>
										</c:forEach>
										</div>
										<c:forEach var = "i" begin = "${dsAnhSanPham.size()+1 }" end = "5">
											<div style="margin-top: 10px; display: none;" class="control warpper-lmau${i } form-group">
												<div>
												</div>
												<input form="formNhapHangDaCo"
													style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;"
													type="text" id="lmau${i }" name="lmau${i }"
													placeholder="Nhập màu"
													class="input-text required-entry form-control">
												<input form="formNhapHangDaCo"
													style="width: 100%; height: 41px; font-size: 18px;border: none; box-shadow: none; margin-top: 10px; border-radius: 10px;"
													type="file" id="anhmau${i }" name="anhmau${i }"
													class="input-text required-entry form-control" accept="image/*">
												<span class="form-message"></span> 
											</div>
										</c:forEach>
									
							      </div>
					    		</div>
					    		<div class="w3-third" style="width: 100%; text-align: center;margin-bottom: 20px">
					    		<input form="formNhapHangDaCo" type="text" style="display: none;" name="btnnhapcu" value="${param.msp }">
							      <button form="formNhapHangDaCo" class="w3-button" style="padding: 15px 20px; background-color: var(--primary-color); color: var(--text-color); font-size: 25px; border-radius: 10px; width: 40%;">Nhập chi tiết số lượng</button>
					    		</div>
					    	</div>
				        </form>
				        <script type="text/javascript">
					    const btnAddSize = document.querySelector('.btnAddSize');
					    var soSize = ${dsSizeSanPham.size()+1};
					    btnAddSize.addEventListener('click',()=>{
					        if(soSize<=5){
					            lsize = document.querySelector('.warpper-lsize'+soSize);
					            lsize.style.display= "inline-block"
					            btnDeleteSize.style.display= "inline-block"
					            soSize +=1;
					        }else{
					        	function showInfoToastSizeToiDa(){
								    toast({
								        title :'Thông báo',
								        message : 'Bạn chỉ được thêm tối đa 5 size.',
								        type  : 'info',
								        duration : 5000
								    })
								}
					        	showInfoToastSizeToiDa();
					        }
					    })
					
					    const btnDeleteSize = document.querySelector('.btnDeleteSize');
					    btnDeleteSize.addEventListener('click',()=>{
					        if(soSize>${dsSizeSanPham.size()+1}){
					            soSize -=1;
					            lsize = document.querySelector('.warpper-lsize'+soSize);
					            input = document.querySelector('.warpper-lsize'+soSize +' input[name = lsize'+soSize+']');
					            // controllerSize = document.querySelector('.controllerSize');
					            input.value ='';
					            lsize.style.display= "none";
					            if(soSize ==${dsSizeSanPham.size()+1}){
					                btnDeleteSize.style.display= "none";
					            }
					        }
					    })
					    
					    
					    
				    const btnAddColor = document.querySelector('.btnAddColor');
				    var soMau = ${dsAnhSanPham.size()+1};
				    btnAddColor.addEventListener('click',()=>{
				        if(soMau<=5){
				            lmau = document.querySelector('.warpper-lmau'+soMau);
				            lmau.style.display= "inline-block"
				            btnDeleteColor.style.display= "inline-block"
				            soMau +=1;
				        }else{
				        	function showInfoToastMauToiDa(){
							    toast({
							        title :'Thông báo',
							        message : 'Bạn chỉ được thêm tối đa 5 màu.',
							        type  : 'info',
							        duration : 5000
							    })
							}
				        	showInfoToastMauToiDa();
				        }
				    })
				
				    const btnDeleteColor = document.querySelector('.btnDeleteColor');
				    btnDeleteColor.addEventListener('click',()=>{
				        if(soMau>${dsAnhSanPham.size()+1}){
				            soMau -=1;
				            lmau = document.querySelector('.warpper-lmau'+soMau);
				            input = document.querySelector('.warpper-lmau'+soMau+ ' input[name = lmau'+soMau+']');
				            // controllerMau = document.querySelector('.controllerMau');
				            lmau.style.display= "none";
				            input.value=''
				            if(soMau ==${dsAnhSanPham.size()+1}){
				                btnDeleteColor.style.display= "none";
				            }
				        }
				    })
				    </script>
        			</c:if>
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
    
    <script lang="javascript" type="text/javascript">
		Validator({
			form : '#formNhapHang',
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
					Validator.isRequired('#tensanpham','Bạn vui lòng nhập trường này.'),
					Validator.isRequired('#gianhap','Bạn vui lòng nhập trường này.'),
					Validator.isRequired('#giaban','Bạn vui lòng nhập trường này.'),
					Validator.isRequired('#loai','Bạn vui lòng chọn trường này.'),
					Validator.isRequired('#thuonghieu','Bạn vui lòng chọn trường này.'),
					Validator.isRequired('#danhmuc','Bạn vui lòng chọn trường này.'),
					
					
					Validator.isRequired('#anh','Bạn vui lòng chọn trường này.'),
					Validator.isRequired('#anhchonsize','Bạn vui lòng chọn trường này.'),
					Validator.isRequired('#lsize1','Bạn vui lòng nhập trường này.'),
					//Validator.isRequired('#lsize2','Bạn vui lòng nhập trường này.'),
					//Validator.isRequired('#lsize3','Bạn vui lòng nhập trường này.'),
					//Validator.isRequired('#lsize4','Bạn vui lòng nhập trường này.'),
					//Validator.isRequired('#lsize5','Bạn vui lòng nhập trường này.'),
					Validator.isRequired('#lmau1','Bạn vui lòng nhập và chọn trường này.'),
					//Validator.isRequired('#lmau2','Bạn vui lòng nhập và chọn trường này.'),
					//Validator.isRequired('#lmau3','Bạn vui lòng nhập và chọn trường này.'),
					//Validator.isRequired('#lmau4','Bạn vui lòng nhập và chọn trường này.'),
					//Validator.isRequired('#lmau5','Bạn vui lòng nhập và chọn trường này.'),
					//Validator.isRequired('#password6','Bạn vui lòng nhập trường này.'),
			],
		});
	</script>
	<script lang="javascript" type="text/javascript">
		Validator({
			form : '#formNhapHangDaCo',
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
					Validator.isRequired('#gianhapspcu','Bạn vui lòng nhập trường này.'),
			],
		});
	</script>
   
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
     
    
	
	<c:if test="${param.tkmTB != null }">
			<script type="text/javascript">
				//window.alert("Đăng kí không thành công!");
				//var el = document.querySelector("#dkweb");
				//el.click();
				function showErrorToastThemLoaiTC() {
					toast({
						title : 'Thất bại',
						message : 'Thêm không thành công.',
						type : 'error',
						duration : 5000
					})
				}
				showErrorToastThemLoaiTC();
			</script>
		</c:if>
	<c:if test="${param.tkmTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastThemLoaiTB() {
				toast({
			        title :'Thành công',
			        message : 'Thêm thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastThemLoaiTB();
		</script>
	</c:if>
	<c:if test="${param.skmTB != null }">
			<script type="text/javascript">
				//window.alert("Đăng kí không thành công!");
				//var el = document.querySelector("#dkweb");
				//el.click();
				function showErrorToastSuaLoaiTC() {
					toast({
						title : 'Thất bại',
						message : 'Sửa không thành công.',
						type : 'error',
						duration : 5000
					})
				}
				showErrorToastSuaLoaiTC();
			</script>
		</c:if>
	<c:if test="${param.skmTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastSuaLoaiTB() {
				toast({
			        title :'Thành công',
			        message : 'Sửa thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastSuaLoaiTB();
		</script>
	</c:if>
	
	<c:if test="${param.ssphot != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastSuaSpHotTC() {
				toast({
			        title :'Thành công',
			        message : 'Cập nhật sản phẩm hot thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastSuaSpHotTC();
		</script>
	</c:if>
	
	<c:if test="${param.xspTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastXoaLoaiTC() {
				toast({
			        title :'Thành công',
			        message : 'Xóa thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastXoaLoaiTC();
		</script>
	</c:if>
</body>
</html>