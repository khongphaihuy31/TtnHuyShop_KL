package Bo;

import java.util.ArrayList;

import Bean.DonMuaBean;
import Dao.AdminXacNhanDao;

public class AdminXacNhanBo {
	AdminXacNhanDao adminXN = new AdminXacNhanDao();
	public int suaTinhTrangHD(long mahoadon)throws Exception{
		return adminXN.suaTinhTrangHD(mahoadon);
	}
	
	//Lấy danh sách các sản phẩm trong đơn mua theo mã hóa đơn
	public ArrayList<DonMuaBean> dsSanPhamTrongDonMuaTheoMHD(long mahoadon)throws Exception{
		return adminXN.dsSanPhamTrongDonMuaTheoMHD(mahoadon);
	}
	
	//Xóa đơn hàng chi tiết
	public int xoaDonHangChiTiet(long mahoadon)throws Exception{
		return adminXN.xoaDonHangChiTiet(mahoadon);
	}
	
	//Xóa đơn đặt hàng
	public int xoaDonDatHang(long mahoadon)throws Exception{
		return adminXN.xoaDonDatHang(mahoadon);
	}
	
	//Tìm danh sách khách hàng phù hợp
	public ArrayList<Long> dsMaKhachHangTimKiem(String tenkhachhang, String sodienthoai)throws Exception{
		return adminXN.dsMaKhachHangTimKiem(tenkhachhang, sodienthoai);
	}
}
