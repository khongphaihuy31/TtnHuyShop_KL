/**
 * 
 */

var tongtien = 0;
const tt = document.querySelector('.tongtien');
document.querySelectorAll('input[id="chonmua"]').forEach((e) => {
	e.onclick = function(e) {
		if (this.checked) {
			var name = this.name;

			var ttsp = document.querySelector(`.huy${name}`);

			tongtien += Number(ttsp.innerHTML);
			console.log(typeof(tongtien));
			//var a = ${name};
			//console.log(a);
			//tongtien += ${name};
			const formattedNumber = tongtien.toLocaleString('vi-VN', {
			  style: 'currency',
			  currency: 'VND'
			});
			tt.innerHTML = formattedNumber
			//tt.innerHTML = `<fmt:setLocale value="vi_VN"/><fmt:formatNumber value='${tongtien}' type="currency"/>`;
		}else{
			var name = this.name;

			var ttsp = document.querySelector(`.huy${name}`);

			tongtien -= Number(ttsp.innerHTML);
			console.log(typeof(tongtien));
			//var a = ${name};
			//console.log(a);
			//tongtien += ${name};
			const formattedNumber = tongtien.toLocaleString('vi-VN', {
			  style: 'currency',
			  currency: 'VND'
			});
			tt.innerHTML = formattedNumber
			//tt.innerHTML = `<fmt:setLocale value="vi_VN"/><fmt:formatNumber value='${tongtien}' type="currency"/>`;
		}
	};
})