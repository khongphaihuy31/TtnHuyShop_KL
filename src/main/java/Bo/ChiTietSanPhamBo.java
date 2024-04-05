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
}
