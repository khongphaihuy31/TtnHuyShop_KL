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
	public int themSanPham(String tensanpham, String anh, long giaban, String motasanpham, long maloai, long mathuonghieu, long madanhmuc, String anhchonsize)throws Exception{
		return spdao.themSanPham(tensanpham, anh, giaban, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize);
	}
	
	//Lấy mã sản phẩm max
	public long getMaxMasanpham() throws Exception {
		return spdao.getMaxMasanpham();
	}
	
	//Thêm size sản phẩm
	public int themSizeSanPham(String size,long masanpham)throws Exception{
		return spdao.themSizeSanPham(size, masanpham);
	}
	
	//Thêm màu và ảnh sản phẩm
	public int themMauSanPham(String mau,String srcanh,long masanpham)throws Exception{
		return spdao.themMauSanPham(mau, srcanh, masanpham);
	}
	
	//Nhập hàng
	public int nhapHang(long masanpham, long soluongnhap, long gianhap, long tongtiennhap)throws Exception{
		return spdao.nhapHang(masanpham, soluongnhap, gianhap, tongtiennhap);
	}
	
	//Lấy mã nhập hàng max
	public long getMaxMadonnhap() throws Exception {
		return spdao.getMaxMadonnhap();
	}
	
	//Chi tiết nhập hàng
	public int chiTietNhapHang(long masanpham, String mau, String size, long soluong, long madonnhap)throws Exception{
		return spdao.chiTietNhapHang(masanpham, mau, size, soluong, madonnhap);
	}
	
	//Chi tiết sản phẩm
	public int chiTietSanPham(long masanpham, String mau, String size, long soluong)throws Exception{
		return spdao.chiTietSanPham(masanpham, mau, size, soluong);
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
