package Bo;

import java.util.ArrayList;

import Dao.DonDatHangDao;

public class DonDatHangBo {
	DonDatHangDao ddhdao = new DonDatHangDao();
	// thêm đơn dặt hàng
	public int themDonDatHang(long makhachhang) throws Exception{
		return ddhdao.themDonDatHang(makhachhang);
	}
	
	// lấy mã đơn đặt hàng vừa thêm
	public long getMaxHD() throws Exception{
		return ddhdao.getMaxHD();
	}
	
	//xử lý lấy danh sách hóa đơn
	public ArrayList<Long> dshoadon()throws Exception{
		return ddhdao.dshoadon();
	}
}
