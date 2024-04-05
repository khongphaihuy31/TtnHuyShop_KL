package Dao;

import java.sql.PreparedStatement;


public class DonHangChiTietDao {
	//xử lý thêm chi tiết đơn hàng
	public int themChiTietHD(long mahoadon, long masanpham, long soluongmua, String mausanpham, String sizesanpham) throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into DonHangChiTiet values (?,?,?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		cmd.setLong(2, masanpham);
		cmd.setLong(3, soluongmua);
		cmd.setString(4, mausanpham);
		cmd.setString(5, sizesanpham);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	

}
