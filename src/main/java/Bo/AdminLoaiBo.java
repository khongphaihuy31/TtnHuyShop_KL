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
}
