package Bo;

import java.util.ArrayList;

import Bean.DonDatHangBean;
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
	
	//xử lý lấy danh sách đơn đặt hàng chuẩn bị đơn
	public ArrayList<DonDatHangBean> dsdonchuanbi(long makhachhang)throws Exception{
		return ddhdao.dsdonchuanbi(makhachhang);
	}
	
	//xử lý lấy danh sách đơn đặt hàng chờ xác nhận
	public ArrayList<DonDatHangBean> dsdonchoxacnhan(long makhachhang)throws Exception{
		return ddhdao.dsdonchoxacnhan(makhachhang);
	}
	
	//xử lý lấy danh sách đơn đặt hàng đang giao
	public ArrayList<DonDatHangBean> dsdondanggiao(long makhachhang)throws Exception{
		return ddhdao.dsdondanggiao(makhachhang);
	}
	
	//xử lý lấy danh sách đơn đặt hàng đã giao
	public ArrayList<DonDatHangBean> dsdondagiao(long makhachhang)throws Exception{
		return ddhdao.dsdondagiao(makhachhang);
	}
	
	// xử lý lấy doanh thu trong ngày
	public long getDoanhThuTrongNgay(String ngayhientai) throws Exception {
		return ddhdao.getDoanhThuTrongNgay(ngayhientai);
	}
}
