package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.LoaiThuocDanhMucBean;
import Bean.ThuongHieuBean;


public class LoaiDao {
	//Lấy loại trong danh mục tất cả sản phẩm
	public ArrayList<LoaiThuocDanhMucBean> getTenLoaiDMTatCa() throws Exception{
		ArrayList<LoaiThuocDanhMucBean> dsLoaiTatCa = new ArrayList<LoaiThuocDanhMucBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from LoaiThuocDanhMuc where madanhmuc = 1";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long maloai = rs.getLong("maloai");
			String tenloai = rs.getString("tenloai"); 
			long madanhmuc = rs.getLong("madanhmuc");
			
			dsLoaiTatCa.add(new LoaiThuocDanhMucBean(maloai, tenloai, madanhmuc));
		}
		return dsLoaiTatCa;
	}
	
	//Lấy loại trong danh mục thương hiệu
	public ArrayList<ThuongHieuBean> getTenLoaiDMThuongHieu() throws Exception{
		ArrayList<ThuongHieuBean> dsLoaiThuongHieu = new ArrayList<ThuongHieuBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from ThuongHieu";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long mathuonghieu = rs.getLong("mathuonghieu");
			String tenthuonghieu = rs.getString("tenthuonghieu"); 
			
			dsLoaiThuongHieu.add(new ThuongHieuBean(mathuonghieu, tenthuonghieu));
		}
		return dsLoaiThuongHieu;
	}
	
	//Lấy loại trong danh mục đồ nam
	public ArrayList<LoaiThuocDanhMucBean> getTenLoaiDMDoNam() throws Exception{
		ArrayList<LoaiThuocDanhMucBean> dsLoaiDoNam = new ArrayList<LoaiThuocDanhMucBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from LoaiThuocDanhMuc where madanhmuc = 3";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long maloai = rs.getLong("maloai");
			String tenloai = rs.getString("tenloai"); 
			long madanhmuc = rs.getLong("madanhmuc");
			
			dsLoaiDoNam.add(new LoaiThuocDanhMucBean(maloai, tenloai, madanhmuc));
		}
		return dsLoaiDoNam;
	}
	
	//Lấy loại trong danh mục đồ nữ
	public ArrayList<LoaiThuocDanhMucBean> getTenLoaiDMDoNu() throws Exception{
		ArrayList<LoaiThuocDanhMucBean> dsLoaiDoNu = new ArrayList<LoaiThuocDanhMucBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from LoaiThuocDanhMuc where madanhmuc = 4";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long maloai = rs.getLong("maloai");
			String tenloai = rs.getString("tenloai"); 
			long madanhmuc = rs.getLong("madanhmuc");
			
			dsLoaiDoNu.add(new LoaiThuocDanhMucBean(maloai, tenloai, madanhmuc));
		}
		return dsLoaiDoNu;
	}
	
	//Lấy loại trong danh mục trẻ em
	public ArrayList<LoaiThuocDanhMucBean> getTenLoaiDMTreEm() throws Exception{
		ArrayList<LoaiThuocDanhMucBean> dsLoaiTreEm = new ArrayList<LoaiThuocDanhMucBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from LoaiThuocDanhMuc where madanhmuc = 5";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long maloai = rs.getLong("maloai");
			String tenloai = rs.getString("tenloai"); 
			long madanhmuc = rs.getLong("madanhmuc");
			
			dsLoaiTreEm.add(new LoaiThuocDanhMucBean(maloai, tenloai, madanhmuc));
		}
		return dsLoaiTreEm;
	}
}
