package Bo;

import java.util.ArrayList;

import Bean.SanPhamBean;
import Dao.AdminSanPhamDao;

public class AdminSanPhamBo {
	AdminSanPhamDao spdao = new AdminSanPhamDao();
//	Lấy các sản phẩm hot
	public ArrayList<SanPhamBean> dsSanPham()throws Exception{
		return spdao.dsSanPham();
	}
	
	//Xóa sản phẩm
	public int xoaSanPham(long masanpham)throws Exception{
		return spdao.xoaSanPham(masanpham);
	}
	
	//Sửa sản phẩm hot
	public int capNhatSpHot(long masanpham ,long sanphamhot)throws Exception{
		return spdao.capNhatSpHot(masanpham, sanphamhot);
	}
	
	//Thêm sản phẩm
	public int themSanPham(String tensanpham, String anh, long giacu, long giamoi, long soluongdaban, String motasanpham, String chitietsanpham, long maloai, long mathuonghieu, long madanhmuc)throws Exception{
		return spdao.themSanPham(tensanpham, anh, giacu, giamoi, soluongdaban, motasanpham, chitietsanpham, maloai, mathuonghieu, madanhmuc);
	}
	
	//Sửa sản phẩm
	public int suaSanPham(long masanpham ,String tensanpham, long giacu, long giamoi, long soluongdaban, String motasanpham, String chitietsanpham, long maloai, long mathuonghieu, long madanhmuc)throws Exception{
		return spdao.suaSanPham(masanpham, tensanpham, giacu, giamoi, soluongdaban, motasanpham, chitietsanpham, maloai, mathuonghieu, madanhmuc);
	}
	
	//Xóa sản phẩm thuộc mã loại
	public int xoaSanPhamThuocLoai(long maloai)throws Exception{
		return spdao.xoaSanPhamThuocLoai(maloai);
	}
}
