package Bo;

import java.util.ArrayList;

import Dao.DonDatHangDao;

public class DonDatHangBo {
	DonDatHangDao ddhdao = new DonDatHangDao();
	// thêm đơn dặt hàng
	public int themDonDatHang(long makhachhang, boolean phuongthucthanhtoan, boolean thanhtoan, long tongdongia, String diachinhanhang) throws Exception{
		return ddhdao.themDonDatHang(makhachhang,phuongthucthanhtoan,thanhtoan,tongdongia,diachinhanhang);
	}
	
	// lấy mã đơn đặt hàng vừa thêm
	public long getMaxHD(long makhachhang) throws Exception{
		return ddhdao.getMaxHD(makhachhang);
	}
	
	//xử lý cập nhật đơn hàng đã thanh toán
	public int capNhatDaThanhToan(long mahoadon, long makhachhang) throws Exception{
		return ddhdao.capNhatDaThanhToan(mahoadon, makhachhang);
	}
	
	//xử lý lấy danh sách mã hóa đơn chờ xác nhận
	public ArrayList<Long> dshoadonchoxacnhan()throws Exception{
		return ddhdao.dshoadonchoxacnhan();
	}
	
	//xử lý lấy danh sách mã hóa đơn chuẩn bị đơn
	public ArrayList<Long> dshoadonchuanbidon()throws Exception{
		return ddhdao.dshoadonchuanbidon();
	}
	
	//xử lý lấy danh sách mã hóa đơn đang giao
	public ArrayList<Long> dshoadondanggiao()throws Exception{
		return ddhdao.dshoadondanggiao();
	}
	
	//xử lý lấy danh sách mã hóa đơn đã giao
	public ArrayList<Long> dshoadondagiao()throws Exception{
		return ddhdao.dshoadondagiao();
	}
}
