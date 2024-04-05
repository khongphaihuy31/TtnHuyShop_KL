package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.KhachHangBean;

public class AdminKhachHangDao {
	public ArrayList<KhachHangBean> dskhachhang()throws Exception{
		ArrayList<KhachHangBean> dskhachhang = new ArrayList<KhachHangBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from KhachHang where quyen = 0";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long makhachhang = rs.getLong("makhachhang");
			String hoten = rs.getString("hoten"); 
			String diachi= rs.getString("diachi"); 
			String sodienthoai= rs.getString("sodienthoai"); 
			String email= rs.getString("email"); 
			String tendn= rs.getString("tendangnhap"); 
			String mk= rs.getString("matkhau");
			Boolean quyen = rs.getBoolean("quyen");
					
//			dskhachhang.add(new KhachHangBean(makhachhang, hoten, diachi, sodienthoai, email, tendn, mk, quyen));
		}
		return dskhachhang;
	}
}
