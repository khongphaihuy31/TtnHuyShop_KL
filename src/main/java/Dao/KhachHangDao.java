package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Bean.KhachHangBean;


public class KhachHangDao {
	public KhachHangBean ktradangnhap(String tendangnhap, String matkhau) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from KhachHang where tendangnhap=? and matkhau=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendangnhap);
		cmd.setString(2, matkhau);
		
		ResultSet rs = cmd.executeQuery();
		KhachHangBean kh = null;
		if(rs.next()) {
			long makhachhang = rs.getLong("makhachhang");
			String hoten = rs.getString("hoten"); 
			String diachi= rs.getString("diachi"); 
			String sodienthoai= rs.getString("sodienthoai"); 
			String email= rs.getString("email"); 
			String tendn= rs.getString("tendangnhap"); 
			String mk= rs.getString("matkhau");
			Boolean quyen = rs.getBoolean("quyen");
			long tichdiem = rs.getLong("tichdiem");
			String sothich = rs.getString("sothich");					
			kh = new KhachHangBean(makhachhang, hoten, diachi, sodienthoai, email, tendn, mk, quyen, tichdiem, sothich);
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
}
