package Bo;

import java.util.ArrayList;

import Bean.DonMuaBean;
import Dao.DonMuaDao;

public class DonMuaBo {
	DonMuaDao dmdao = new DonMuaDao();
	//xử lý lấy sản phẩm chờ xác nhận
	public ArrayList<DonMuaBean> getSPChoXacNhan(long makhachhang)throws Exception{
		return dmdao.getSPChoXacNhan(makhachhang);
	}
	
	//xử lý lấy sản phẩm đã giao
	public ArrayList<DonMuaBean> getSPDagiao(long makhachhang)throws Exception{
		return dmdao.getSPDagiao(makhachhang);
	}
	
	//lấy danh sách đơn mua chưa xác nhận (Admin)
	public ArrayList<DonMuaBean> dsDonChuaXacNhan()throws Exception{
		return dmdao.dsDonChuaXacNhan();
	}
	
	//lấy danh sách đơn mua chưa xác nhận theo mã hóa đơn (Admin)
	public ArrayList<DonMuaBean> dsDonChuaXacNhanTheoMaHD(long mahoadon)throws Exception{
		return dmdao.dsDonChuaXacNhanTheoMaHD(mahoadon);
	}
}
