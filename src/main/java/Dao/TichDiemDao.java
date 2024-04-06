package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.GiamGiaBean;
import Bean.TichDiemBean;

public class TichDiemDao {
	//Xử lý lấy danh dách tich điểm
	public ArrayList<TichDiemBean> getDsTichDiem()throws Exception{
		ArrayList<TichDiemBean> dsTichDiem = new ArrayList<TichDiemBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from TichDiem order by dieukien desc ";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long matichdiem = rs.getLong("matichdiem");
			long dieukien = rs.getLong("dieukien");
			long diemcong = rs.getLong("diemcong");
			dsTichDiem.add(new TichDiemBean(matichdiem, dieukien, diemcong));
			
		}
		return dsTichDiem;
	}
}
