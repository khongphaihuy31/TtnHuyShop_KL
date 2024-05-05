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
		
		String sql = "select * from GiamGia order by tiengiam desc ";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long magiamgia = rs.getLong("magiamgia");
			String tengiamgia = rs.getString("tengiamgia");
			long tiengiam = rs.getLong("tiengiam");
			long dieukien = rs.getLong("dieukien");
			String mota = rs.getString("mota");
			dsGiamGia.add(new GiamGiaBean(magiamgia, tengiamgia, tiengiam, dieukien, mota));
			
		}
		return dsGiamGia;
	}
	
	// Thêm khuyến mãi
		public int themKhuyenMai(String tengiamgia, long tiengiam, long dieukien, String mota)throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			
			String sql = "insert into GiamGia values (?,?,?,?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setString(1, tengiamgia);
			cmd.setLong(2, tiengiam);
			cmd.setLong(3, dieukien);
			cmd.setString(4, mota);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
		//Sửa khuyến mãi
		public int suaKhuyenMai(long magiamgia, String tengiamgia, long tiengiam, long dieukien, String mota)throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			
			String sql = "update GiamGia set tengiamgia= ?,tiengiam= ?,dieukien= ?,mota= ? where magiamgia=? ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setString(1, tengiamgia);
			cmd.setLong(2, tiengiam);
			cmd.setLong(3, dieukien);
			cmd.setString(4, mota);
			cmd.setLong(5, magiamgia);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
		//Xóa khuyến mãi
		public int xoaKhuyenMai(long magiamgia)throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			
			String sql = "delete from GiamGia where magiamgia=? ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setLong(1, magiamgia);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
}
