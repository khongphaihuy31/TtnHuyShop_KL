package Bo;

import Dao.DonHangChiTietDao;

public class DonHangChiTietBo {
	DonHangChiTietDao dhctdao = new DonHangChiTietDao();
	//xử lý thêm chi tiết đơn hàng
	public int themChiTietHD(long mahoadon, long masanpham, long soluongmua, String mausanpham, String sizesanpham) throws Exception{
		return dhctdao.themChiTietHD(mahoadon, masanpham, soluongmua, mausanpham, sizesanpham);
	}
}
