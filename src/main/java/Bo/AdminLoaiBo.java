package Bo;

import java.util.ArrayList;

import Bean.LoaiBean;
import Dao.AdminLoaiDao;

public class AdminLoaiBo {
	AdminLoaiDao admloaidao = new AdminLoaiDao();
	//Lấy danh sách loại
	public ArrayList<LoaiBean> dsLoai() throws Exception{
		return admloaidao.dsLoai();
	}
	
	// Thêm loại
	public int themLoai(String tenloai)throws Exception{
		return admloaidao.themLoai(tenloai);
	}
	
	//Sửa loại
	public int suaLoai(long maloai, String tenloai)throws Exception{
		return admloaidao.suaLoai(maloai, tenloai);
	}
	
	//Xóa loại
	public int xoaLoai(long maloai)throws Exception{
		return admloaidao.xoaLoai(maloai);
	}
	
	//Xóa size sản phẩm theo mã sản phẩm
	public int xoaSizeSanPham(long masanpham)throws Exception{
		return admloaidao.xoaSizeSanPham(masanpham);
	}
	//Xóa ảnh, màu sản phẩm theo mã sản phẩm
	public int xoaAnhSanPham(long masanpham)throws Exception{
		return admloaidao.xoaAnhSanPham(masanpham);
	}
	//Xóa chi tiết sản phẩm theo mã sản phẩm
	public int xoaChiTietSanPham(long masanpham)throws Exception{
		return admloaidao.xoaChiTietSanPham(masanpham);
	}
	//Xóa sản phẩm trong giỏ theo mã sản phẩm
	public int xoaGioHang(long masanpham)throws Exception{
		return admloaidao.xoaGioHang(masanpham);
	}
}
