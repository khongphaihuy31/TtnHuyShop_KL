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
            <a href="AdminXacNhanController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-truck-ramp-box"></i>  Xác nhận đơn hàng</a>
            <a href="AdminLoaiSanPhamController" class="w3-bar-item w3-button w3-padding "><i class="fa-solid fa-layer-group"></i>  Quản lý loại sản phẩm</a>
            <a href="AdminLoaiTrongDanhMucController" class="w3-bar-item w3-button w3-padding"><i class="fa-brands fa-docker"></i>  Quản lý loại trong danh mục</a>
            <a href="AdminSanPhamController" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa-solid fa-boxes-stacked"></i>  Quản lý sản phẩm</a>
            <a href="AdminKhachHangController" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users"></i>  Quản lý khách hàng</a>
            <a href="AdminThuongHieuController" class="w3-bar-item w3-button w3-padding "><i class="fa-solid fa-shirt"></i>  Quản lý thương hiệu</a>
            <a href="AdminBannerController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-image"></i>  Quản lý banner</a>
            <a href="AdminKhuyenMaiController" class="w3-bar-item w3-button w3-padding "><i class="fa-solid fa-gift"></i>  Quản lý khuyến mãi</a>
            <a href="AdminTichDiemController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-star"></i>  Quản lý tích điểm</a>
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
            <h2 style="display: inline-block;"><b><i class="fa-solid fa-truck-fast"></i> Nhập chi tiết số lượng</b></h2>
            
        </header>
        <div class="w3-row-padding w3-margin-bottom">
	       	<c:choose>
				<c:when test="${listSize.size()!=0 && listMau.size()!= 0}">
			        <form id="formNhapChiTiet" action="AdminNhapChiTietController">
						<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px; background-color: #fff; display: inline-block;">
					        <table id="example" class="table table-striped table-bordered bangChiTiet" style="width:100%;">
						    </table>
						    <input type="text" style="display: none;" name="anhmau5" value="${param.anhmau5 }">
						    <input type="text" style="display: none;" name="lmau5" value="${param.lmau5 }">
						    <input type="text" style="display: none;" name="anhmau4" value="${param.anhmau4 }">
						    <input type="text" style="display: none;" name="lmau4" value="${param.lmau4 }">
						    <input type="text" style="display: none;" name="anhmau3" value="${param.anhmau3 }">
						    <input type="text" style="display: none;" name="lmau3" value="${param.lmau3 }">
						    <input type="text" style="display: none;" name="anhmau2" value="${param.anhmau2 }">
						    <input type="text" style="display: none;" name="lmau2" value="${param.lmau2 }">
						    <input type="text" style="display: none;" name="anhmau1" value="${param.anhmau1 }">
						    <input type="text" style="display: none;" name="lmau1" value="${param.lmau1 }">
						    <input type="text" style="display: none;" name="lsize5" value="${param.lsize5 }">
						    <input type="text" style="display: none;" name="lsize4" value="${param.lsize4 }">
						    <input type="text" style="display: none;" name="lsize3" value="${param.lsize3 }">
						    <input type="text" style="display: none;" name="lsize2" value="${param.lsize2 }">
						    <input type="text" style="display: none;" name="lsize1" value="${param.lsize1 }">
						    <input type="text" style="display: none;" name="anhchonsize" value="${param.anhchonsize }">
						    <input type="text" style="display: none;" name="anh" value="${param.anh }">
						    <input type="text" style="display: none;" name="motasanpham" value="${param.motasanpham }">
						    <input type="text" style="display: none;" name="madanhmuc" value="${param.madanhmuc }">
						    <input type="text" style="display: none;" name="mathuonghieu" value="${param.mathuonghieu }">
						    <input type="text" style="display: none;" name="maloai" value="${param.maloai }">
						    <input type="text" style="display: none;" name="giaban" value="${param.giaban }">
						    <input type="text" style="display: none;" name="gianhap" value="${param.gianhap }">
						    <input type="text" style="display: none;" name="tensanpham" value="${param.tensanpham }">
						    <div class="w3-third" style="width: 100%; text-align: center;margin-bottom: 20px;">
						      <button name="btnNhapHang" value="1" form="formNhapChiTiet" class="w3-button" style="padding: 15px 20px; background-color: var(--primary-color); color: var(--text-color); font-size: 25px; border-radius: 10px; width: 30%;">Nhập hàng</button>
				    		</div>
					        <script type="text/javascript">
						        var listMau = ${listMau};
						        console.log(listMau);
						        var listSize = ${listSize};
						        console.log(listSize);
						        
					            let content='<thead> <tr> <th style="background-color: var(--primary-color); color: white;">Màu</th> <th style="background-color: var(--primary-color); color: white;">Size</th> <th style="background-color: var(--primary-color); color: white;"> số lượng</th> </tr> </thead><tbody>';
						        for(let i = 0; i < listMau.length; i++){
						            content+='<tr><td style="height: 20px; font-size: 18px;" rowspan='+${listSize.size()}+'>'+listMau[i]+'</td><td style="height: 20px; font-size: 18px;">'+listSize[0]+'</td><td><input style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;" type="number" id="surname" name='+listMau[i]+'/'+listSize[0]+'></td> </td></tr>'
				                    for(let j = 1; j<listSize.length; j++){
				                        content+=  '<tr><td>'+listSize[j]+'</td> <td> <input style="width: 100%; height: 20px; font-size: 18px; padding: 20px 10px; border-radius: 10px; border: 1px solid #ccc;" type="number" id="surname" name='+listMau[i]+'/'+listSize[j]+'></td> </td></tr>'
				                    }
	
						                    
						        }
						        content += '</tbody>'
						        bangChiTiet = document.querySelector('.bangChiTiet');
						        bangChiTiet.innerHTML = content;
							</script>
							
					    </div>
		    		</form>
				</c:when>
				<c:otherwise>
					<div class="row" style="margin-top: 10px;">
						<h3>Không có size hoặc màu.</h3>
					</div>
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
    
	<c:if test="${param.chuacosl != null }">
			<script type="text/javascript">
				//window.alert("Đăng kí không thành công!");
				//var el = document.querySelector("#dkweb");
				//el.click();
				function showErrorToastChuaNhapSL() {
					toast({
						title : 'Thất bại',
						message : 'Vui lòng nhập số lượng cho từng loại.',
						type : 'error',
						duration : 5000
					})
				}
				showErrorToastChuaNhapSL();
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