package Bo;

import java.util.ArrayList;

import Bean.LoaiThuocDanhMucBean;
import Bean.ThuongHieuBean;
import Dao.LoaiDao;

public class LoaiBo {
	LoaiDao ldao = new LoaiDao();
	//Lấy loại trong danh mục tất cả sản phẩm
	public ArrayList<LoaiThuocDanhMucBean> getTenLoaiDMTatCa() throws Exception{
		return ldao.getTenLoaiDMTatCa();
	}
	
	//Lấy loại trong danh mục thương hiệu
	public ArrayList<ThuongHieuBean> getTenLoaiDMThuongHieu() throws Exception{
		return ldao.getTenLoaiDMThuongHieu();
	}
	
	//Lấy loại trong danh mục đồ nam
	public ArrayList<LoaiThuocDanhMucBean> getTenLoaiDMDoNam() throws Exception{
		return ldao.getTenLoaiDMDoNam();
	}
	
	//Lấy loại trong danh mục đồ nữ
	public ArrayList<LoaiThuocDanhMucBean> getTenLoaiDMDoNu() throws Exception{
		return ldao.getTenLoaiDMDoNu();
	}
	
	//Lấy loại trong danh mục trẻ em
	public ArrayList<LoaiThuocDanhMucBean> getTenLoaiDMTreEm() throws Exception{
		return ldao.getTenLoaiDMTreEm();
	}
}
