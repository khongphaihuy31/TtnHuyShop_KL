<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ttn-Huy Fashion</title>
<link rel="shortcut icon" href="./assets/img/huy-removebg-preview.png"
	type="image/x-icon">
<link rel="stylesheet" href="fontawesome-free-6.3.0-web/css/all.min.css">
<style>
.model {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	display: none;
	animation: FadeIn linear 0.1s;
}

.model.open {
	display: flex;
}

.model__overlay {
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.2);
}

.model__body {
	--Growth-from: 0.7;
	--Growth-to: 1;
	margin: auto;
	z-index: 2;
	animation: Growth linear 0.1s;
}

.auth-from {
	background: linear-gradient(169.68deg, #086a87 19.53%, #75dbd9 128.18%);
	border-radius: 5px;
	overflow: hidden;
	padding-top: 30px;
}

.auth-form__container {
	padding: 0 32px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.auth-from__heading {
	font-size: 2.2rem;
	font-weight: 500;
}

.auth-from__switch-btn {
	font-size: 1.6rem;
	color: #ee4d2d;
	font-weight: 500;
	cursor: pointer;
}

.auth-from_input {
	width: 100%;
	margin-top: 16px;
	height: 40px;
	padding-left: 12px;
	font-size: 1.4rem;
	opacity: 0.6;
	border: 1px solid #dbdbdb;
	border-radius: 4px;
}

.auth-form__policy-text {
	font-size: 1.4rem;
	font-weight: 400;
	margin: 0 8px;
	text-align: center;
	line-height: 1.8rem
}

.auth-form__policy-link {
	color: #ee4d2d;
	text-decoration: none;
}

.auth-form__help {
	position: relative;
	display: flex;
	justify-content: flex-end;
}

.auth-form__help-link {
	text-decoration: none;
	font-size: 1.4rem;
	color: #979797;
}

.auth-form__help-link.auth-form__help-link--separate {
	padding-right: 20px;
	color: #ee4d2d;
}

.auth-form__help-link--separate::before {
	content: "";
	display: block;
	position: absolute;
	border-left: 2px solid #979797;
	height: 16px;
	right: 90px;
	top: 50%;
	transform: translateY(-56%);
}

.course_qr_img {
	width: 15rem;
}
/* HTML: <div class="loader"></div> */
/* .loader {
  width: 90px;
  height: 14px;
  --c:#181717 90deg,#0000 0;
  background: 
    conic-gradient(from 135deg at top   ,var(--c)) 0 0,
    conic-gradient(from -45deg at bottom,var(--c)) 0 100%;
  background-size: calc(100%/4) 50%;
  background-repeat: repeat-x;
  animation: l12 1s infinite;
  margin-bottom: 16px;
}
@keyframes l12 {
    80%,100% {background-position: calc(100%/3) 0,calc(100%/-3) 100%}
} */
.loader {
	position: relative;
	color: #fff;
	margin-bottom: 10px;
	width: 65%;
	display: grid;
	grid-template-columns: 70px 1fr 70px;
	border-radius: 5px;
	--color: #f0f06e;
	animation: show 0.3s ease 1 forwards
}

.loader::before {
	position: absolute;
	bottom: 0;
	right: 0;
	background-color: var(--color);
	width: 100%;
	height: 3px;
	content: '';
	box-shadow: 0 0 10px var(--color);
	animation: timeOut 600s linear 1 forwards;
}

@keyframes timeOut {
	to { width:0;
	
}
}

/* .loader {
  width: fit-content;
  font-weight: bold;
  font-family: sans-serif;
  font-size: 30px;
  padding-bottom: 3px;
  background: linear-gradient(currentColor 0 0) 0 100%/0% 3px no-repeat;
  animation: l2 2s linear infinite;
  margin-bottom: 16px;
} */
/* .loader:before {
  content:"";
  display: block;
  width: 200px;
}
@keyframes l2 {to{background-size: 100% 3px}} */

/* .loader {
  width: calc(80px / cos(45deg));
  height: 14px;
  background: repeating-linear-gradient(-45deg,#000 0 15px,#0000 0 20px) left/200% 100%;
  animation: l3 2s infinite linear;
  width: 200px;
  margin-bottom: 16px;
}
@keyframes l3 {
    100% {background-position:right}
} */
</style>
</head>
<body>
	<div
		style="position: fixed; top: 0; right: 0; left: 0; bottom: 0; background-image: linear-gradient(95.2deg, rgba(173, 252, 234, 1) 26.8%, rgba(192, 229, 246, 1));"
		class="model__body">
		<!-- Login form -->
		<div
			style="width: 40%; min-width: 470px; height: 100%; display: flex; align-items: center; margin: auto; justify-content: center;"
			class="model__login">
			<div
				style="box-shadow: 0px -25px 20px -20px rgba(116, 115, 115, 0.45), 25px 0 20px -20px rgba(116, 115, 115, 0.45), 0px 25px 20px -20px rgba(116, 115, 115, 0.45), -25px 0 20px -20px rgba(116, 115, 115, 0.45);"
				class="auth-from">
				<div class="auth-form__container">
					<img class="course_qr_img"
						src="data:image/png;base64,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">
					<h1
						style="margin-bottom: 10px; width: 300px; text-align: center; color: rgb(250, 212, 0); font-size: 25px;">Mã
						QR thanh toán tự động</h1>
					<h4 style="margin: 0; color: rgb(250, 212, 0); font-size: 15px;">(Xác
						nhận tự động - Thường không quá 5')</h4>
					<div style="display: flex;">
						<div>
							<p
								style="font-size: 20px; font-weight: bold; margin-bottom: 10px;">
								Số tiền <span style="color: red;">*</span>:
							</p>
							<p style="margin: 0; font-size: 20px; font-weight: bold;">
								Nội dung <span style="color: red;">*</span>:
							</p>
							<p style="font-size: 20px; font-weight: bold; margin-top: 10px;">
								Người thụ hưởng <span style="color: red;">*</span>
							</p>
						</div>
						<div style="margin-left: 20px;">
							<p>
								<span style="margin: 0; font-size: 20px; font-weight: bold;"
									id="st"> </span> <i style="margin-left: 90px;"
									class="fa-regular fa-copy"></i>
							</p>
							<h1 style="display: none;" class="tienThanhToan">${tienthanhtoan}</h1>
							<h1 style="display: none;" class="noiDungChuyenKhoan">${noiDungChuyenKhoan}</h1>
							<a style="display: none;" class="btnChuyenKhoanThanhCong" href="HoSoKhachHangController?donmua=1&btnchoxacnhan=1&thanhtoan=thanhcong"></a>
							<a style="display: none;" class="btnChuyenKhoanThatBai" href="HoSoKhachHangController?donmua=1&btnchoxacnhan=1&thanhtoan=thatbai"></a>
							<p>
								<span style="margin: 0; font-size: 20px; font-weight: bold;"
									id="ndck"> </span><i style="margin-left: 28px;"
									class="fa-regular fa-copy"></i>
							</p>
							<p style="font-size: 20px; font-weight: bold; margin-top: 10px;">TON
								THAT NHAT HUY</p>
						</div>
					</div>
					<p
						style="display: block; width: 90%; border: 1px solid #000; margin: 0;"></p>
					<div style="display: flex; justify-content: space-between;">
						<p style="font-size: 20px; font-weight: bold; color: red;">Đang
							chờ thanh toán</p>
						<p id="thoiGian"
							style="font-size: 20px; font-weight: bold; color: red; margin-left: 50px;">9:15</p>
					</div>
					<div class="loader"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		let MY_BANK = {
		    BANK_ID: "MB",
		    ACCOUNT_ID: "4910183992030",
		    ACCOUNT_NAME: "TON THAT NHAT HUY"
		};

		var paidSetInterval;
		var countdownInterval;
		thoiGianFn = function(paidPrice, paidContent) {
			var thoiGian = document.getElementById("thoiGian");

			// Lưu thời gian hiện tại
			var startTime = Date.now();

			// Thiết lập thời gian hết hạn là 10 phút sau thời điểm hiện tại
			var expirationTime = startTime + (10 * 60 * 1000); // 10 phút * 60 giây * 1000 milliseconds

			// Cập nhật giao diện
			updateUI();

			// Thiết lập đồng hồ đếm thời gian
			countdownInterval = setInterval(updateUI, 1000);

			// Hàm cập nhật giao diện
			function updateUI() {
				var currentTime = Date.now();
				var remainingTime = expirationTime - currentTime;

				// Nếu thời gian còn lại âm hoặc bằng 0, ngừng đếm ngược
				if (remainingTime <= 0) {
					clearInterval(paidSetInterval);
					clearInterval(countdownInterval);
					const btnChuyenKhoanThatBai = document.querySelector('.btnChuyenKhoanThatBai');
					btnChuyenKhoanThatBai.click();
					// thoiGian.innerHTML = "Hết thời gian thanh toán";
				} else {
					var minutes = Math.floor(remainingTime / (60 * 1000));
					var seconds = Math.floor((remainingTime % (60 * 1000)) / 1000);
					thoiGian.innerHTML = minutes + ":" + seconds;
					checkPaid(paidPrice, paidContent);
					// setTimeout(()=>{

					// },5000)
				};
			};
		};
		var isSucess = false;
		async function checkPaid(price, content) {
			if (isSucess) {
				return;
			} else {
				try {
					const response = await fetch(
						"https://script.google.com/macros/s/AKfycbxHR63HBhji7VSpyWPmB53lyDeEvGjKP01fx4fzSk7PA9KCPAXAOfgSyGiv5sneTf9I/exec"
					);
					const data = await response.json();
					const lastPaid = data.data[data.data.length - 1];
					const lastContent = lastPaid["Mô tả"];
					const lastPrice = lastPaid["Giá trị"];
					if (lastPrice >= price && lastContent.includes(content)) {
						//console.log("Thanh toan thanh cong");
						isSucess = true;
						clearInterval(paidSetInterval);
						clearInterval(countdownInterval);
						// thoiGian.innerHTML = "Thanh toán thành công";
						const btnChuyenKhoanThanhCong = document.querySelector('.btnChuyenKhoanThanhCong');
						btnChuyenKhoanThanhCong.click();
					} 
					//else {
					//	console.log("Khong thanh cong");
					//};
				} catch (e) {
					console.log(e);
				};
			};
		};

		const ndck = document.getElementById('ndck');
		const st = document.getElementById('st');
		const course_qr_img = document.querySelector('.course_qr_img');
		const tienThanhToan = document.querySelector('.tienThanhToan');
		const noiDungChuyenKhoan = document.querySelector('.noiDungChuyenKhoan');
		function showLogin() {
			var paidPrice = tienThanhToan.innerHTML;
			var paidContent = noiDungChuyenKhoan.innerHTML;
			//const paidPrice = 65000;
			//const paidContent = 3131;
			let QR = 'https://img.vietqr.io/image/'+MY_BANK.BANK_ID+'-'+MY_BANK.ACCOUNT_ID+'-qr_only.png?amount='+paidPrice+'&addInfo='+paidContent+'&accountName='+MY_BANK.ACCOUNT_NAME;
			//let QR = `https://img.vietqr.io/image/${MY_BANK.BANK_ID}-${MY_BANK.ACCOUNT_ID}-qr_only.png?amount=${paidPrice}&addInfo=${paidContent}&accountName=${MY_BANK.ACCOUNT_NAME}`;
			course_qr_img.src=QR;
		    ndck.innerHTML= paidContent;
		    st.innerHTML= paidPrice+" đ";
			thoiGianFn(paidPrice, paidContent);
			//paidSetInterval = setInterval(
			//	checkPaid(paidPrice, paidContent), 1000);
		};

		showLogin();
		
		window.addEventListener('beforeunload', (event) => {
			  // Kiểm tra xem người dùng có muốn rời khỏi trang này hay không
			  //if (!confirm('Bạn có muốn rời khỏi trang này?')) {
			    event.preventDefault(); // Ngăn điều hướng
			    //return false; // Chỉ ra rằng điều hướng nên bị hủy
			  //}
			});
		window.addEventListener('keydown', (event) => {
			  if (event.keyCode === 116 && event.ctrlKey) { // Kiểm tra Ctrl+F5
			    event.preventDefault(); // Ngăn hành vi tải lại mặc định
			    // Xử lý logic tải lại tại đây (ví dụ: hiển thị thông báo)
			    console.log('Đã ngăn tải lại!');
			  }
			});
	</script>
</body>
</html>