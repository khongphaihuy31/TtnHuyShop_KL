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
            <a href="AdminLoaiSanPhamController" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa-solid fa-layer-group"></i>  Quản lý loại sản phẩm</a>
            <a href="AdminLoaiTrongDanhMucController" class="w3-bar-item w3-button w3-padding"><i class="fa-brands fa-docker"></i>  Quản lý loại trong danh mục</a>
            <a href="AdminSanPhamController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-boxes-stacked"></i>  Quản lý sản phẩm</a>
            <a href="AdminKhachHangController" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users"></i>  Quản lý khách hàng</a>
            <a href="AdminThuongHieuController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-shirt"></i>  Quản lý thương hiệu</a>
            <a href="AdminBannerController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-image"></i>  Quản lý banner</a>
            <a href="AdminKhuyenMaiController" class="w3-bar-item w3-button w3-padding"><i class="fa-solid fa-gift"></i>  Quản lý khuyến mãi</a>
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
            <h2 style="display: inline-block;"><b><i class="fa-solid fa-layer-group"></i>  Loại sản phẩm</b></h2>
            <div style="display: inline-block; float: right;margin-top: 18px; cursor: pointer;" class="w3-quarter">
	            <a data-toggle="modal" data-target="#modalThemLoai" style="text-decoration: none;">
	                <div style="text-align: center; border-radius: 10px; background-color: var(--primary-color)" class="w3-container w3-text-white">
	                    <h4><i class="fa-solid fa-circle-plus"></i> Thêm loại</h4>
	                </div>
		        </a>
            </div>
        </header>
        <div class="w3-row-padding w3-margin-bottom">
	       	<c:choose>
				<c:when test="${dsloai.size()!=0 }">
					<div style="border: 2px solid #4dcdcf; border-radius: 10px;width: 100%; padding: 10px 20px; margin-top: 20px; background-color: #fff;">
				        
				        <table id="example" class="table table-striped table-bordered" style="width:100%;">
					        <thead>
					            <tr>
					                <th style="background-color: var(--primary-color); color: white; ">Stt</th>
					                <th style="display:none;background-color: var(--primary-color); color: white; ">Mã loại</th>
					                <th style="background-color: var(--primary-color); color: white; ">Tên loại</th>
					                <th style="background-color: var(--primary-color); color: white; ">Sửa</th>
					                <th style="background-color: var(--primary-color); color: white; ">Xóa</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:forEach items="${dsloai }" var="l" varStatus="index">
						            <tr>
						                <td>${index.index+1 }</td>
						                <td style="display:none;">${l.getMaloai() }</td>
						                <td>${l.getTenloai() }</td>
						                <td>
						                	<a style="font-size: 18px; font-weight: 600; color: var(--primary-color); cursor: pointer;" data-toggle="modal" data-target="#modalsua${l.getMaloai() }"><i class="fa-solid fa-pen-to-square"></i></a>
						                </td>
						                <td>
						                	<a style="font-size: 18px; font-weight: 600; color: var(--primary-color); cursor: pointer;" data-toggle="modal" data-target="#modalxoa${l.getMaloai() }"><i class="fa-solid fa-trash"></i></a>
						                </td>
						            </tr>
									<div class="modal fade" id="modalxoa${l.getMaloai() }" role="dialog">
									  <div class="modal-dialog">
									    <!-- Modal content-->
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal">&times;</button>
									        <h3 class="modal-title" style="font-weight: bold;color: var(--primary-color)">Bạn có muốn xóa loại này không?</h3>
									      </div>
									      <div class="modal-body text-center">
									          <p><span style="color: red;">Lưu ý:</span> Nếu bạn đồng ý xóa, đồng nghĩa với việc các sản phẩm thuộc loại này cũng sẽ bị xóa.</p>
									        <form action="AdminLoaiSanPhamController" style="font-size: 20px;">
									        <p style="width: 120px; display: inline-block;font-weight: bold; font-size: 20px;">Mã loại <span style="color: red;">*</span></p> <input style="width: 260px; height: 30px;" type="text" name="maloai" value="${l.getMaloai() }" required="required" disabled="disabled"> <br>
									          <p style="width: 120px; display: inline-block;font-weight: bold;font-size: 20px;">Tên loại <span style="color: red;">*</span></p> <input style="width: 260px; height: 30px;" type="text" name="tenloai" value="${l.getTenloai() }" required="required" disabled="disabled"> <br>
									          <button class=" btn-lg" name="btnxoa" value="${l.getMaloai() }" style="background-color: var(--primary-color); color: white;font-weight: bold; border: none;">Có</button>
									          <button class="btn-lg" data-dismiss="modal" style="background-color: red; color: white;font-weight: bold; border: none;">Không</button>
									        </form>
									      </div>
									    </div>
									  </div>
									</div>
					        	</c:forEach>
					        </tbody>
					    </table>
				    </div>
				</c:when>
				<c:otherwise>
					<div class="row" style="margin-top: 10px;">
						<h3>Không có loại sản phẩm.</h3>
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
    
    <!-- Modal thêm loại sản phẩm -->
<div class="modal fade" id="modalThemLoai" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class="modal-title" style="font-weight: bold;color: var(--primary-color)">Thêm loại</h3>
      </div>
      <div class="modal-body text-center">
        <form action="AdminLoaiSanPhamController" style="font-size: 20px;" id="form-ThemLoai">
          <div class="form-group" style="display: inline-block;">
	          <h1 style="width: 120px; display: inline-block;font-weight: bold; font-size: 18px;">Tên loại <span style="color: red;">*</span></h1> 
	        <input class="form-control" id="tenLoai" style="width: 260px; height: 30px; display: inline-block;" type="text" name="tenloai">
          	<br><span style="margin-left: 125px; display: block;" class="form-message"></span>
	          <input name="btnthem" value="them" hidden="">
	          <button style="font-weight: bold; background-color: var(--primary-color); border: none; color: white; margin-top: 5px;" class=" btn-lg" name="btnthem" value="them">Thêm</button>
          </div><br>
        </form>
      </div>
    </div>
  </div>
</div>

<script lang="javascript" type="text/javascript">
	Validator({
		form : '#form-ThemLoai',
		formGroupSelector : '.form-group',
		errorElement : '.form-message',
		rules : [
				Validator.isRequired('#tenLoai','Bạn vui lòng nhập trường này.'),
				//Validator.isRequired('#password6','Bạn vui lòng nhập trường này.'),
		],
	});
</script>

<c:forEach items="${dsloai }" var="l" varStatus="index">
	<div class="modal fade" id="modalsua${l.getMaloai() }" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h3 class="modal-title" style="font-weight: bold;color: var(--primary-color)">Sửa loại</h3>
	      </div>
	      <div class="modal-body text-center">
	        <form action="AdminLoaiSanPhamController" style="font-size: 20px;" id="form-SuaLoai${index.index+1 }">
	        	<h1 style="width: 120px; display: inline-block;font-weight: bold; font-size: 18px;">Mã loại <span style="color: red;">*</span></h1>  
	        		<input style="width: 260px; height: 30px;" type="text" name="maloai" value="${l.getMaloai() }" required="required" disabled="disabled"> <br>
		          <div class="form-group" style="display: inline-block;">
			          <h1 style="width: 120px; display: inline-block;font-weight: bold; font-size: 18px;">Tên loại <span style="color: red;">*</span></h1> 
			        <input class="form-control" id="tenLoaiSua${index.index+1 }" style="width: 260px; height: 30px; display: inline-block;" type="text" name="tenloai" value="${l.getTenloai() }">
		          	<br><span style="margin-left: 125px; display: block;" class="form-message"></span>
			          <input name="btnsua" value="${l.getMaloai() }" hidden="">
			          <button style="font-weight: bold; background-color: var(--primary-color); border: none; color: white; margin-top: 5px;" class=" btn-lg" name="btnsua" value="${l.getMaloai() }">Sửa</button>
		          </div><br>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
</c:forEach>

<script lang="javascript" type="text/javascript">
	var lengthDsLoai = ${dsloai.size()}
	for(let i=1; i<=lengthDsLoai; i++){
		Validator({
			form : '#form-SuaLoai'+i,
			formGroupSelector : '.form-group',
			errorElement : '.form-message',
			rules : [
					Validator.isRequired('#tenLoaiSua'+i,'Bạn vui lòng nhập trường này.'),
					//Validator.isRequired('#password6','Bạn vui lòng nhập trường này.'),
			],
		});
	}
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
    
    <script>
	    $(document).ready(function() {
	   
	   // Cấu hình các nhãn phân trang
	   $('#example').dataTable( {
	       "language": {
	       "sProcessing":   "Đang xử lý...",
	       "sLengthMenu":   "Số mục xem_MENU_",
	       "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
	       "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
	       "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
	       "sInfoFiltered": "(được lọc từ _MAX_ mục)",
	       "sInfoPostFix":  "",
	       "sSearch":       "Tìm kiếm loại:",
	       "sUrl":          "",
	       "oPaginate": {
	           "sFirst":    "Đầu",
	           "sPrevious": "Trước",
	           "sNext":     "Tiếp",
	           "sLast":     "Cuối"
	           }
	       },
	       "processing": true, // tiền xử lý trước
	       "aLengthMenu": [[5, 10, 20, 50], [5, 10, 20, 50]], // danh sách số trang trên 1 lần hiển thị bảng
	       "order": [[ 1, 'desc' ]] //sắp xếp giảm dần theo cột thứ 1
	   } );
	        
	   } );
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
	
	<c:if test="${param.tl != null }">
			<script type="text/javascript">
				//window.alert("Đăng kí không thành công!");
				//var el = document.querySelector("#dkweb");
				//el.click();
				function showErrorToastThemLoaiTC() {
					toast({
						title : 'Thất bại',
						message : 'Thêm loại không thành công.',
						type : 'error',
						duration : 5000
					})
				}
				showErrorToastThemLoaiTC();
			</script>
		</c:if>
	<c:if test="${param.tlTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastThemLoaiTB() {
				toast({
			        title :'Thành công',
			        message : 'Thêm loại thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastThemLoaiTB();
		</script>
	</c:if>
	<c:if test="${param.sl != null }">
			<script type="text/javascript">
				//window.alert("Đăng kí không thành công!");
				//var el = document.querySelector("#dkweb");
				//el.click();
				function showErrorToastSuaLoaiTC() {
					toast({
						title : 'Thất bại',
						message : 'Sửa loại không thành công.',
						type : 'error',
						duration : 5000
					})
				}
				showErrorToastSuaLoaiTC();
			</script>
		</c:if>
	<c:if test="${param.slTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastSuaLoaiTB() {
				toast({
			        title :'Thành công',
			        message : 'Sửa loại thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastSuaLoaiTB();
		</script>
	</c:if>
	
	<c:if test="${param.xlTC != null}">
		<script type="text/javascript">
			//window.alert("Tài khoản hoặc mật khẩu chưa đúng!");
			function showSuccessToastXoaLoaiTC() {
				toast({
			        title :'Thành công',
			        message : 'Xóa loại thành công.',
			        type  : 'success',
			        duration : 5000
			    })
			}
			showSuccessToastXoaLoaiTC();
		</script>
	</c:if>
</body>
</html>