package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.DanhMucBean;

public class DanhMucDao {
	public ArrayList<DanhMucBean> dsDanhMuc()throws Exception{
		ArrayList<DanhMucBean> dsDanhMuc = new ArrayList<DanhMucBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from DanhMuc";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long madanhmuc = rs.getLong("madanhmuc");
			String tendanhmuc = rs.getString("tendanhmuc");
			
			dsDanhMuc.add(new DanhMucBean(madanhmuc, tendanhmuc));
		}
		return dsDanhMuc;
	}
}
