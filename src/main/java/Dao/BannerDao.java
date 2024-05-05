package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.BannerBean;

public class BannerDao {
	//Lấy danh sách banner
	public ArrayList<BannerBean> getDsBanner() throws Exception{
		ArrayList<BannerBean> dsLoaiThuongHieu = new ArrayList<BannerBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from Banner order by mabanner DESC";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long mabanner = rs.getLong("mabanner");
			String srcbanner = rs.getString("srcbanner"); 
			
			dsLoaiThuongHieu.add(new BannerBean(mabanner, srcbanner));
		}
		return dsLoaiThuongHieu;
	}
	
	// Thêm banner
	public int themBanner(String srcbanner)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into Banner values (?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, srcbanner);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	//Sửa banner
	public int suaBanner(long mabanner, String srcbanner)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update Banner set srcbanner= ? where mabanner=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, srcbanner);
		cmd.setLong(2, mabanner);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	//Xóa banner
	public int xoaBanner(long mabanner)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from Banner where mabanner=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, mabanner);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
}
