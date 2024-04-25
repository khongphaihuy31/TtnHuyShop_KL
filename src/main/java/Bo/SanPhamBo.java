package Bo;

import java.util.ArrayList;

import Bean.SanPhamBean;
import Bean.SanPhamFullBean;
import Dao.SanPhamDao;

public class SanPhamBo {
	SanPhamDao spdao = new SanPhamDao();
//	Lấy các sản phẩm hot
	public ArrayList<SanPhamBean> getSanPhamHot()throws Exception{
		return spdao.getSanPhamHot();
	}
	
// Lấy các sản phẩm theo mã loại và mã danh mục
	public ArrayList<SanPhamBean> getSanPhamLoaiTrongDanhMuc(long maloai, long madanhmuc, long mathuonghieu)throws Exception{
		return spdao.getSanPhamLoaiTrongDanhMuc(maloai, madanhmuc, mathuonghieu);
	}
	
//	Lấy sản phẩm theo tìm kiếm
	public ArrayList<SanPhamFullBean> getSanPhamTimKiem(String key)throws Exception{
		ArrayList<SanPhamFullBean> dsSanPhamTimKiem = new ArrayList<SanPhamFullBean>();
		for(SanPhamFullBean sp: spdao.getSanPhamTimKiem()) {
			if(sp.getTensanpham().toLowerCase().trim().contains(key.toLowerCase().trim()) || 
					sp.getTenloai().toLowerCase().trim().contains(key.toLowerCase().trim()) ||
					sp.getTenthuonghieu().toLowerCase().trim().contains(key.toLowerCase().trim())) {
				dsSanPhamTimKiem.add(sp);
			}
		}
		return dsSanPhamTimKiem;
	}

//	Lấy các sản phẩm ưa thích
	public ArrayList<SanPhamBean> getSanPhamUaThich()throws Exception{
		return spdao.getSanPhamUaThich();
	}
	
//	Lấy sản phẩm theo mã sản phẩm
	public SanPhamBean getSanPham(long msp)throws Exception{
		return spdao.getSanPham(msp);
	}
	
	//xử lý cập nhật số lượng đã bán	
	public int capNhatSoLuongDaBan(long masanpham, long soluongdaban) throws Exception{
		return spdao.capNhatSoLuongDaBan(masanpham, soluongdaban);
	}
	
//	Lấy số lượng sản phẩm (Admin)
	public long getSLSanPham()throws Exception{
		return spdao.getSLSanPham();
	}
}
