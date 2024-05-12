package Bo;

import java.util.ArrayList;

import Bean.ThongKeChi;
import Bean.ThongKeThu;
import Dao.AdminThongKeDao;

public class AdminThongKeBo {
	AdminThongKeDao adtkdao = new AdminThongKeDao();
	//Lấy danh sách thống kê thu theo ngày
	public ArrayList<ThongKeThu> dsThongKeThu() throws Exception{
		return adtkdao.dsThongKeThu();
	}
	//Lấy danh sách thống kê chi theo ngày
	public ArrayList<ThongKeChi> dsThongKeChi() throws Exception{
		return adtkdao.dsThongKeChi();
	}
	
	//Lấy danh sách thống kê chi theo tháng
	public ArrayList<ThongKeChi> dsThongKeChiThang() throws Exception{
		return adtkdao.dsThongKeChiThang();
	}
	//Lấy danh sách thống kê thu theo tháng
	public ArrayList<ThongKeThu> dsThongKeThuThang() throws Exception{
		return adtkdao.dsThongKeThuThang();
	}
	
	//Lấy danh sách thống kê chi theo năm
	public ArrayList<ThongKeChi> dsThongKeChiNam() throws Exception{
		return adtkdao.dsThongKeChiNam();
	}
	//Lấy danh sách thống kê thu theo năm
	public ArrayList<ThongKeThu> dsThongKeThuNam() throws Exception{
		return adtkdao.dsThongKeThuNam();
	}
}
