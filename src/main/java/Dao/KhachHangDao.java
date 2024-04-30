package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	public int ktradangki(String email, String sodienthoai)throws Exception {
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from KhachHang where email= ? or sodienthoai = ?";
		PreparedStatement cdm = kn.cn.prepareStatement(sql);
		cdm.setString(1, email);
		cdm.setString(2, sodienthoai);
		ResultSet rs = cdm.executeQuery();
		if(rs.next()) {
			return 1;
		}
		return 0;
	}
	
	public KhachHangBean ktraQuenPass(String email1, String sodienthoai1)throws Exception {
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from KhachHang where email= ? and sodienthoai = ?";
		PreparedStatement cdm = kn.cn.prepareStatement(sql);
		cdm.setString(1, email1);
		cdm.setString(2, sodienthoai1);
		ResultSet rs = cdm.executeQuery();
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
	
	//xử lý cập nhật mã code	
	public int capNhatCode(String email, String code) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update KhachHang set code = ? where email = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, code);
		cmd.setString(2, email);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//xử lý lấy mã code để so sánh
	public String getMaCode(String email)throws Exception {
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select code from KhachHang where email= ?";
		PreparedStatement cdm = kn.cn.prepareStatement(sql);
		cdm.setString(1, email);
		ResultSet rs = cdm.executeQuery();
		if(rs.next()) {
			return rs.getString("code");
		}
		return "";
	}
	
	//Xử lý lấy danh sách số điện thoại của khách hàng
	public ArrayList<String> getdsSoDienThoai()throws Exception{
		ArrayList<String> dsSodienthoai = new ArrayList<String>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select sodienthoai from KhachHang";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String sodienthoai = rs.getString("sodienthoai");
			
			dsSodienthoai.add(sodienthoai);
		}
		return dsSodienthoai;
	}
	
	//Xử lý lấy danh sách email của khách hàng
	public ArrayList<String> getdsEmail()throws Exception{
		ArrayList<String> dsEmail = new ArrayList<String>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select email from KhachHang";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String email = rs.getString("email");
			
			dsEmail.add(email);
		}
		return dsEmail;
	}
	
	//xử lý đổi mật khẩu theo email	
	public int doiPassTheoEmail(String email, String pass) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update KhachHang set matkhau = ? where email = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, pass);
		cmd.setString(2, email);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
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
