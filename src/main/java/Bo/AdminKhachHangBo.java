package Bo;

import java.util.ArrayList;

import Bean.KhachHangBean;
import Dao.AdminKhachHangDao;

public class AdminKhachHangBo {
	AdminKhachHangDao adkhdao = new AdminKhachHangDao();
	public ArrayList<KhachHangBean> dskhachhang()throws Exception{
		return adkhdao.dskhachhang();
	}
}
