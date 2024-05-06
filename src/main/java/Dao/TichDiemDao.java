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
	
	// Thêm tích điểm
	public int themTichDiem(long dieukien, long diemcong)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into TichDiem values (?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, dieukien);
		cmd.setLong(2, diemcong);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	//Sửa tích điểm
	public int suaTichDiem(long matichdiem,long dieukien, long diemcong)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update TichDiem set dieukien= ?,diemcong= ? where matichdiem=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, dieukien);
		cmd.setLong(2, diemcong);
		cmd.setLong(3, matichdiem);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
//Xóa tích điểm
public int xoaTichDiem(long matichdiem)throws Exception{
	KetNoiDao kn = new KetNoiDao();
	kn.ketnoi();
	
	String sql = "delete from TichDiem where matichdiem=? ";
	PreparedStatement cmd = kn.cn.prepareStatement(sql);
	
	cmd.setLong(1, matichdiem);
	
	int kq = cmd.executeUpdate();
	cmd.close();
	kn.cn.close();
	return kq;
}
}
