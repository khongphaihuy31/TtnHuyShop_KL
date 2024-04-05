package Dao;

import java.sql.PreparedStatement;


public class AdminXacNhanDao {
	public int suaTinhTrangHD(long mahoadon)throws Exception{
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
}
