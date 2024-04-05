package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


public class DonDatHangDao {
	//xử lý thêm đơn đặt hàng
	public int themDonDatHang(long makhachhang) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		String sql = "insert into DonDatHang values (?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		String tam  = dd.format(n1);
		Date n2 = dd.parse(tam);
		cmd.setDate(1, new java.sql.Date(n2.getTime()));
		
		cmd.setLong(2, 1);
		
		cmd.setLong(3, makhachhang);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//xử lý lấy mã đặt hàng vừa thêm
	public long getMaxHD() throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select max(mahoadon) as MaxHD from DonDatHang";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long max = 0;
		if(rs.next()) {
			max = rs.getLong(1);
		}
		cmd.close();
		kn.cn.close();
		return max;
	}
	
	//xử lý cập nhật trạng thái đơn đặt hàng	
	public int capNhatChiTietHD(long mahoadon) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update DonDatHang set matrangthai = 2 where mahoadon = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//xử lý lấy danh sách hóa đơn
	public ArrayList<Long> dshoadon()throws Exception{
		ArrayList<Long> dshoadon = new ArrayList<Long>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select mahoadon from DonDatHang where matrangthai = 1";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long mahoadon = rs.getLong("mahoadon");
					
			dshoadon.add(mahoadon);
		}
		return dshoadon;
	}
}
