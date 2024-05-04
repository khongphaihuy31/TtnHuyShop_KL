package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.AdminLoaiThuocDanhMucBean;

public class AdminLoaiTrongDanhMucDao {
	//Lấy danh sách loai trong danh mục
	public ArrayList<AdminLoaiThuocDanhMucBean> dsLoaiTrongDanhMuc() throws Exception{
		ArrayList<AdminLoaiThuocDanhMucBean> dsLoaiTrongDanhMuc = new ArrayList<AdminLoaiThuocDanhMucBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from tb_LoaiThuocDanhMucAdmin order by maloaithuocdanhmuc desc";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long maloai = rs.getLong("maloai");
			String tenloai = rs.getString("tenloai"); 
			long madanhmuc = rs.getLong("madanhmuc");
			String tendanhmuc = rs.getString("tendanhmuc");
			long maloaithuocdanhmuc = rs.getLong("maloaithuocdanhmuc");
			
			dsLoaiTrongDanhMuc.add(new AdminLoaiThuocDanhMucBean(maloai, tenloai, madanhmuc, tendanhmuc, maloaithuocdanhmuc));
		}
		return dsLoaiTrongDanhMuc;
	}
	
	//Lấy tên loại theo mã loại
	public String timTenLoai(long maloai)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select tenloai from Loai where maloai=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, maloai);
		ResultSet rs = cmd.executeQuery();
		String tenloai = null;
		if(rs.next()) {
			tenloai = rs.getString("tenloai");
		}
		return tenloai;
	}
	
	//Thêm loại trong danh mục
	public int themLoaiTrongDanhMuc(long maloai, String tenloai, long madanhmuc)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into LoaiThuocDanhMuc values(?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, maloai);
		cmd.setString(2, tenloai);
		cmd.setLong(3, madanhmuc);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Kiểm tra thêm loại trong danh mục
	public int ktraThemLoaiTrongDanhMuc(long maloai, long madanhmuc)throws Exception {
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from LoaiThuocDanhMuc where maloai= ? and madanhmuc = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, maloai);
		cmd.setLong(2, madanhmuc);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			return 1;
		}
		return 0;
	}
	
	//Sửa loại trong danh mục
	public int suaLoaiTrongDanhMuc(long maloai, long madanhmuccu, long madanhmucmoi)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update LoaiThuocDanhMuc set madanhmuc= ? where maloai=? and madanhmuc=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, madanhmucmoi);
		cmd.setLong(2, maloai);
		cmd.setLong(3, madanhmuccu);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Xóa loại trong danh mục
	public int xoaLoaiTrongDanhMuc(long maloai, long madanhmuc)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from LoaiThuocDanhMuc where maloai=? and madanhmuc= ? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, maloai);
		cmd.setLong(2, madanhmuc);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Xóa loại trong danh mục (Chức năng xóa loại)
	public int xoaLoaiTrongDanhMucThuocLoai(long maloai)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from LoaiThuocDanhMuc where maloai=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, maloai);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
}
