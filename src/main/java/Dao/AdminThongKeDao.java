package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.LoaiBean;
import Bean.ThongKeChi;
import Bean.ThongKeThu;

public class AdminThongKeDao {
	//Lấy danh sách thống kê thu theo ngày
	public ArrayList<ThongKeThu> dsThongKeThu() throws Exception{
		ArrayList<ThongKeThu> dsThongKeThu = new ArrayList<ThongKeThu>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "SELECT YEAR(ngaydat) AS year, MONTH(ngaydat) AS month, DAY(ngaydat) as day, SUM(tongdongia) AS thu\r\n"
				+ "FROM DonDatHang\r\n"
				+ "where thanhtoan = 1\r\n"
				+ "GROUP BY YEAR(ngaydat), MONTH(ngaydat), DAY(ngaydat)\r\n"
				+ "ORDER BY year, month, day DESC;";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long year = rs.getLong("year");
			long month = rs.getLong("month");
			long day = rs.getLong("day");
			long thu = rs.getLong("thu");
			
			dsThongKeThu.add(new ThongKeThu(year, month, day, thu));
		}
		cmd.close();
		kn.cn.close();
		return dsThongKeThu;
	}
	
	//Lấy danh sách thống kê chi theo ngày
	public ArrayList<ThongKeChi> dsThongKeChi() throws Exception{
		ArrayList<ThongKeChi> dsThongKeThu = new ArrayList<ThongKeChi>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "SELECT YEAR(ngaynhap) AS year, MONTH(ngaynhap) AS month, DAY(ngaynhap) as day, SUM(tongtiennhap) AS chi\r\n"
				+ "FROM NhapHang\r\n"
				+ "GROUP BY YEAR(ngaynhap), MONTH(ngaynhap), DAY(ngaynhap)\r\n"
				+ "ORDER BY year, month, day DESC;";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long year = rs.getLong("year");
			long month = rs.getLong("month");
			long day = rs.getLong("day");
			long chi = rs.getLong("chi");
			
			dsThongKeThu.add(new ThongKeChi(year, month, day, chi));
		}
		cmd.close();
		kn.cn.close();
		return dsThongKeThu;
	}
	
	//Lấy danh sách thống kê thu theo tháng
	public ArrayList<ThongKeThu> dsThongKeThuThang() throws Exception{
		ArrayList<ThongKeThu> dsThongKeThu = new ArrayList<ThongKeThu>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "SELECT YEAR(ngaydat) AS year, MONTH(ngaydat) AS month, SUM(tongdongia) AS thu\r\n"
				+ "FROM DonDatHang\r\n"
				+ "where thanhtoan = 1\r\n"
				+ "GROUP BY YEAR(ngaydat), MONTH(ngaydat)\r\n"
				+ "ORDER BY year, month;";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long year = rs.getLong("year");
			long month = rs.getLong("month");
			long thu = rs.getLong("thu");
			
			dsThongKeThu.add(new ThongKeThu(year, month, 0, thu));
		}
		cmd.close();
		kn.cn.close();
		return dsThongKeThu;
	}
	
	//Lấy danh sách thống kê chi theo tháng
	public ArrayList<ThongKeChi> dsThongKeChiThang() throws Exception{
		ArrayList<ThongKeChi> dsThongKeThu = new ArrayList<ThongKeChi>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "SELECT YEAR(ngaynhap) AS year, MONTH(ngaynhap) AS month, SUM(tongtiennhap) AS chi\r\n"
				+ "FROM NhapHang\r\n"
				+ "GROUP BY YEAR(ngaynhap), MONTH(ngaynhap)\r\n"
				+ "ORDER BY year, month DESC;";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long year = rs.getLong("year");
			long month = rs.getLong("month");
			long chi = rs.getLong("chi");
			
			dsThongKeThu.add(new ThongKeChi(year, month, 0, chi));
		}
		cmd.close();
		kn.cn.close();
		return dsThongKeThu;
	}
	
	
	//Lấy danh sách thống kê thu theo năm
	public ArrayList<ThongKeThu> dsThongKeThuNam() throws Exception{
		ArrayList<ThongKeThu> dsThongKeThu = new ArrayList<ThongKeThu>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "SELECT YEAR(ngaydat) AS year, SUM(tongdongia) AS thu\r\n"
				+ "FROM DonDatHang\r\n"
				+ "where thanhtoan = 1\r\n"
				+ "GROUP BY YEAR(ngaydat)\r\n"
				+ "ORDER BY year DESC;";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long year = rs.getLong("year");
			long thu = rs.getLong("thu");
			
			dsThongKeThu.add(new ThongKeThu(year, 0, 0, thu));
		}
		cmd.close();
		kn.cn.close();
		return dsThongKeThu;
	}
	
	//Lấy danh sách thống kê chi theo năm
	public ArrayList<ThongKeChi> dsThongKeChiNam() throws Exception{
		ArrayList<ThongKeChi> dsThongKeThu = new ArrayList<ThongKeChi>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "SELECT YEAR(ngaynhap) AS year, SUM(tongtiennhap) AS chi\r\n"
				+ "FROM NhapHang\r\n"
				+ "GROUP BY YEAR(ngaynhap)\r\n"
				+ "ORDER BY year DESC;";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long year = rs.getLong("year");
			long chi = rs.getLong("chi");
			
			dsThongKeThu.add(new ThongKeChi(year, 0, 0, chi));
		}
		cmd.close();
		kn.cn.close();
		return dsThongKeThu;
	}
}
