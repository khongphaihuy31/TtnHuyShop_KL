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
	
	// xử lý cập nhật trạng thái chuẩn bị đơn cho đơn đặt hàng
	public int capNhatChiTietHDChuanBiDon(long mahoadon) throws Exception {
		return ddhdao.capNhatChiTietHDChuanBiDon(mahoadon);
	}
	
	// xử lý cập nhật trạng thái đang giao cho đơn đặt hàng
	public int capNhatChiTietHDDangGiao(long mahoadon) throws Exception {
		return ddhdao.capNhatChiTietHDDangGiao(mahoadon);
	}
	
	// xử lý cập nhật trạng thái đã giao cho đơn đặt hàng
	public int capNhatChiTietHDDaGiao(long mahoadon) throws Exception {
		return ddhdao.capNhatChiTietHDDaGiao(mahoadon);
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
	
	// xử lý lấy danh sách mã hóa đơn chưa giao
	public ArrayList<Long> dshoadonchuagiao() throws Exception {
		return ddhdao.dshoadonchuagiao();
	}
	// xử lý lấy danh sách đơn đặt hàng chưa giao
	public ArrayList<DonDatHangBean> dsdonchuagiao() throws Exception {
		return ddhdao.dsdonchuagiao();
	}
	public ArrayList<DonDatHangBean> dsdonchuagiaoSort() throws Exception {
		return ddhdao.dsdonchuagiaoSort();
	}
}
