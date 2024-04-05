package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.GiamGiaBean;

public class GiamGiaDao {
	public ArrayList<GiamGiaBean> getGiamGia()throws Exception{
		ArrayList<GiamGiaBean> dsGiamGia = new ArrayList<GiamGiaBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from GiamGia where khoa = 0 order by tiengiam desc ";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long magiamgia = rs.getLong("magiamgia");
			String tengiamgia = rs.getString("tengiamgia");
			long tiengiam = rs.getLong("tiengiam");
			long dieukien = rs.getLong("dieukien");
			String mota = rs.getString("mota");
			boolean khoa = rs.getBoolean("khoa");
			dsGiamGia.add(new GiamGiaBean(magiamgia, tengiamgia, tiengiam, dieukien, mota, khoa));
			
		}
		return dsGiamGia;
	}
}
