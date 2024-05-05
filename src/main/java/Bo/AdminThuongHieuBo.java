package Bo;

import java.util.ArrayList;

import Bean.ThuongHieuBean;
import Dao.AdminThuongHieuDao;

public class AdminThuongHieuBo {
	AdminThuongHieuDao adthdao = new AdminThuongHieuDao();
	//Lấy danh sách thương hiệu
	public ArrayList<ThuongHieuBean> getDsThuongHieu() throws Exception{
		return adthdao.getDsThuongHieu();
	}
	
	// Thêm thương hiệu
	public int themThuongHieu(String tenthuonghieu)throws Exception{
		return adthdao.themThuongHieu(tenthuonghieu);
	}
	
	//Sửa thương hiệu
	public int suaThuongHieu(long mathuonghieu, String tenthuonghieu)throws Exception{
		return adthdao.suaThuongHieu(mathuonghieu, tenthuonghieu);
	}
	
	//Xóa thương hiệu
	public int xoaThuongHieu(long mathuonghieu)throws Exception{
		return adthdao.xoaThuongHieu(mathuonghieu);
	}
	
	//Xóa sản phẩm thuộc Mã thương hiệu
	public int xoaSanPhamThuocThuongHieu(long mathuonghieu)throws Exception{
		return adthdao.xoaSanPhamThuocThuongHieu(mathuonghieu);
	}
}
