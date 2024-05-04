package Bo;

import java.util.ArrayList;

import Bean.AdminLoaiThuocDanhMucBean;
import Dao.AdminLoaiTrongDanhMucDao;

public class AdminLoaiTrongDanhMucBo {
	AdminLoaiTrongDanhMucDao ltdmdao = new AdminLoaiTrongDanhMucDao();
	public String timTenLoai(long maloai)throws Exception{
		return ltdmdao.timTenLoai(maloai);
	}
	
	//Kiểm tra thêm loại trong danh mục
	public int ktraThemLoaiTrongDanhMuc(long maloai, long madanhmuc)throws Exception {
		return ltdmdao.ktraThemLoaiTrongDanhMuc(maloai, madanhmuc);
	}
	
	//Thêm loại trong danh mục
	public int themLoaiTrongDanhMuc(long maloai, String tenloai, long madanhmuc)throws Exception{
		return ltdmdao.themLoaiTrongDanhMuc(maloai, tenloai, madanhmuc);
	}
	
	//Lấy danh sách loai trong danh mục
	public ArrayList<AdminLoaiThuocDanhMucBean> dsLoaiTrongDanhMuc() throws Exception{
		return ltdmdao.dsLoaiTrongDanhMuc();
	}
	
	//Sửa loại trong danh mục
	public int suaLoaiTrongDanhMuc(long maloai, long madanhmuccu, long madanhmucmoi)throws Exception{
		return ltdmdao.suaLoaiTrongDanhMuc(maloai, madanhmuccu, madanhmucmoi);
	}
	
	//Xóa loại trong danh mục
	public int xoaLoaiTrongDanhMuc(long maloai, long madanhmuc)throws Exception{
		return ltdmdao.xoaLoaiTrongDanhMuc(maloai, madanhmuc);
	}
	//Xóa loại trong danh mục (Chức năng xóa loại)
	public int xoaLoaiTrongDanhMucThuocLoai(long maloai)throws Exception{
		return ltdmdao.xoaLoaiTrongDanhMucThuocLoai(maloai);
	}
}
