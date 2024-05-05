package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.ThuongHieuBean;

public class AdminThuongHieuDao {
	//Lấy danh sách thương hiệu
	public ArrayList<ThuongHieuBean> getDsThuongHieu() throws Exception{
		ArrayList<ThuongHieuBean> dsLoaiThuongHieu = new ArrayList<ThuongHieuBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from ThuongHieu order by mathuonghieu DESC";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long mathuonghieu = rs.getLong("mathuonghieu");
			String tenthuonghieu = rs.getString("tenthuonghieu"); 
			
			dsLoaiThuongHieu.add(new ThuongHieuBean(mathuonghieu, tenthuonghieu));
		}
		return dsLoaiThuongHieu;
	}
	
	// Thêm thương hiệu
		public int themThuongHieu(String tenthuonghieu)throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			
			String sql = "insert into ThuongHieu values (?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setString(1, tenthuonghieu);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
		
		//Sửa thương hiệu
		public int suaThuongHieu(long mathuonghieu, String tenthuonghieu)throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			
			String sql = "update ThuongHieu set tenthuonghieu= ? where mathuonghieu=? ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setString(1, tenthuonghieu);
			cmd.setLong(2, mathuonghieu);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
		
		//Xóa thương hiệu
		public int xoaThuongHieu(long mathuonghieu)throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			
			String sql = "delete from ThuongHieu where mathuonghieu=? ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setLong(1, mathuonghieu);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
		
		//Xóa sản phẩm thuộc Mã thương hiệu
		public int xoaSanPhamThuocThuongHieu(long mathuonghieu)throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			String sql = "delete from SanPham where mathuonghieu=? ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setLong(1, mathuonghieu);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
}
