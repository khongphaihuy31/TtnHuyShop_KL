package Bo;

import java.util.ArrayList;

import Bean.GiamGiaBean;
import Dao.GiamGiaDao;

public class GiamGiaBo {
	GiamGiaDao ggdao = new GiamGiaDao();
	public ArrayList<GiamGiaBean> getGiamGia()throws Exception{
		return ggdao.getGiamGia();
	}
	
	// Thêm khuyến mãi
	public int themKhuyenMai(String tengiamgia, long tiengiam, long dieukien, String mota)throws Exception{
		return ggdao.themKhuyenMai(tengiamgia, tiengiam, dieukien, mota);
	}
	
	//Sửa khuyến mãi
	public int suaKhuyenMai(long magiamgia, String tengiamgia, long tiengiam, long dieukien, String mota)throws Exception{
		return ggdao.suaKhuyenMai(magiamgia, tengiamgia, tiengiam, dieukien, mota);
	}
	
	//Xóa khuyến mãi
	public int xoaKhuyenMai(long magiamgia)throws Exception{
		return ggdao.xoaKhuyenMai(magiamgia);
	}
}
