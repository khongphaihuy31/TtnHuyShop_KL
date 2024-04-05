package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Bean.NoiNhanBean;



public class HoSoKhachHangDao {
	//xử lý sửa thông tin khách hàng
	public int suaThongTinKh(long makhachhang, String hoten, String diachi, String sodienthoai, String email) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		String sql = "update KhachHang set hoten = ?, diachi = ?, sodienthoai= ?, email= ? where makhachhang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, diachi);
		cmd.setString(3, sodienthoai);
		cmd.setString(4, email);
		cmd.setLong(5, makhachhang);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//xử lý lấy nơi nhận hàng
	public NoiNhanBean getNoiNhanHang(long makhachhang) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		String sql = "select * from NoiNhanHang where makhachhang = ?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		
		ResultSet rs = cmd.executeQuery();
		NoiNhanBean nn =null;
		if(rs.next()) {
			String thanhpho = rs.getString("thanhpho");
			String quan = rs.getString("quan");
			String phuong = rs.getString("phuong");
			String sonha = rs.getString("sonha");
			long makhachhang1 = rs.getLong("makhachhang");
			
			nn = new NoiNhanBean(thanhpho, quan, phuong, sonha, makhachhang1);
		}
		return nn;
	}
	
	//thêm nơi nhận hàng
	public int themNoiNhanHang(long makhachhang, String thanhpho, String quan, String phuong, String sonha) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		String sql = "insert into NoiNhanHang values (?,?,?,?,?)";
				
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, thanhpho);
		cmd.setString(2, quan);
		cmd.setString(3, phuong);
		cmd.setString(4, sonha);
		cmd.setLong(5, makhachhang);
		
		int kq= cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Xử lý sửa nơi nhận
	public int suaNoiNhanHang(long makhachhang, String thanhpho, String quan, String phuong, String sonha) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		String sql = "update NoiNhanHang set thanhpho = ?, quan = ?, phuong= ?, sonha= ? where makhachhang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, thanhpho);
		cmd.setString(2, quan);
		cmd.setString(3, phuong);
		cmd.setString(4, sonha);
		cmd.setLong(5, makhachhang);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
}
