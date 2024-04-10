package Bo;

import java.util.ArrayList;

import Bean.AnhSanPham;
import Dao.ChiTietSanPhamDao;

public class ChiTietSanPhamBo {
	ChiTietSanPhamDao chiTietSanPhamDao =  new ChiTietSanPhamDao();
	public ArrayList<String> dsSize(long masanpham)throws Exception{
		return chiTietSanPhamDao.getdsSize(masanpham);
	}
	public ArrayList<AnhSanPham> getdsAnhVaMau(long masanpham)throws Exception{
		return chiTietSanPhamDao.getdsAnhVaMau(masanpham);	
	}
	public ArrayList<String> getdsChiTietSP(long masanpham)throws Exception{
		return chiTietSanPhamDao.getdsChiTietSP(masanpham);
	}
	
	//Xử lý cập nhật số lượng hàng trong kho
	public int suaSoHangTrongKho(long masanpham, String mau, String size, long soluong) throws Exception{
		return chiTietSanPhamDao.suaSoHangTrongKho(masanpham, mau, size, soluong);
	}
	
	//xử lý lấy số lượng sản phẩm trong kho theo mã, màu và size
	public long getSoluongTrongKho(long masanpham, String mau, String size) throws Exception{
		return chiTietSanPhamDao.getSoluongTrongKho(masanpham, mau, size);
	}
}
