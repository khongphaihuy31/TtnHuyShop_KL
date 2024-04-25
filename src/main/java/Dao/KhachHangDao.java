package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Bean.KhachHangBean;


public class KhachHangDao {
	public KhachHangBean ktradangnhap(String tendangnhap, String matkhau) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from KhachHang where sodienthoai=? and matkhau=? or email=? and matkhau=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendangnhap);
		cmd.setString(2, matkhau);
		cmd.setString(3, tendangnhap);
		cmd.setString(4, matkhau);
		
		ResultSet rs = cmd.executeQuery();
		KhachHangBean kh = null;
		if(rs.next()) {
			long makhachhang = rs.getLong("makhachhang");
			String hoten = rs.getString("hoten"); 
			String diachi= rs.getString("diachi"); 
			String sodienthoai= rs.getString("sodienthoai"); 
			String email= rs.getString("email"); 
			String avatar= rs.getString("avatar");
			String tendn= rs.getString("tendangnhap"); 
			String mk= rs.getString("matkhau");
			Boolean quyen = rs.getBoolean("quyen");
			long tichdiem = rs.getLong("tichdiem");
			String sothich = rs.getString("sothich");					
			kh = new KhachHangBean(makhachhang, hoten, diachi, sodienthoai, email, avatar, tendn, mk, quyen, tichdiem, sothich);
		}
		return kh;
	}
	
	public int dangkikhachhang( String hoten, String diachi, String sodienthoai, String email, String tendangnhap, String matkhau) throws  Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "INSERT INTO [dbo].[KhachHang]\r\n"
				+ "           ([hoten]\r\n"
				+ "           ,[diachi]\r\n"
				+ "           ,[sodienthoai]\r\n"
				+ "           ,[email]\r\n"
				+ "           ,[tendangnhap]\r\n"
				+ "           ,[matkhau])\r\n"
				+ "     VALUES\r\n"
				+ "           (?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?\r\n"
				+ "           ,?)";
		PreparedStatement cdm = kn.cn.prepareStatement(sql);
		cdm.setString(1, hoten);
		cdm.setString(2, diachi);
		cdm.setString(3, sodienthoai);
		cdm.setString(4, email);
		cdm.setString(5, tendangnhap);
		cdm.setString(6, matkhau);
		int rs = cdm.executeUpdate();
		return rs;
	}
	
	public int ktradangki(String tendangnhap, String sodienthoai)throws Exception {
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from KhachHang where tendangnhap= ? or sodienthoai = ?";
		PreparedStatement cdm = kn.cn.prepareStatement(sql);
		cdm.setString(1, tendangnhap);
		cdm.setString(2, sodienthoai);
		ResultSet rs = cdm.executeQuery();
		if(rs.next()) {
			return 1;
		}
		return 0;
	}
	
	//xử lý điểm tích lũy cho khách hàng	
	public int capNhatDiem(long makhachhang, long tichdiem) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update KhachHang set tichdiem = ? where makhachhang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, tichdiem);
		cmd.setLong(2, makhachhang);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public long getTichDiem(long makhachhang)throws Exception {
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select tichdiem from KhachHang where makhachhang= ?";
		PreparedStatement cdm = kn.cn.prepareStatement(sql);
		cdm.setLong(1, makhachhang);
		ResultSet rs = cdm.executeQuery();
		if(rs.next()) {
			return rs.getLong("tichdiem");
		}
		return 0;
	}
	
	//xử lý đổi mật khẩu	
	public int doiPass(long makhachhang, String pass) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update KhachHang set matkhau = ? where makhachhang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, pass);
		cmd.setLong(2, makhachhang);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Lấy khách hàng theo mã khách hàng
	public KhachHangBean getKhachHang(long mkh) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from KhachHang where makhachhang = ?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mkh);
		
		ResultSet rs = cmd.executeQuery();
		KhachHangBean kh = null;
		if(rs.next()) {
			long makhachhang = rs.getLong("makhachhang");
			String hoten = rs.getString("hoten"); 
			String diachi= rs.getString("diachi"); 
			String sodienthoai= rs.getString("sodienthoai"); 
			String email= rs.getString("email"); 
			String avatar= rs.getString("avatar");
			String tendn= rs.getString("tendangnhap"); 
			String mk= rs.getString("matkhau");
			Boolean quyen = rs.getBoolean("quyen");
			long tichdiem = rs.getLong("tichdiem");
			String sothich = rs.getString("sothich");					
			kh = new KhachHangBean(makhachhang, hoten, diachi, sodienthoai, email, avatar, tendn, mk, quyen, tichdiem, sothich);
		}
		return kh;
	}
}
