package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.LoaiBean;

public class AdminLoaiDao {
	//Lấy danh sách loại
	public ArrayList<LoaiBean> dsLoai() throws Exception{
		ArrayList<LoaiBean> dsLoai = new ArrayList<LoaiBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from Loai order by maloai DESC";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long maloai = rs.getLong("maloai");
			String tenloai = rs.getString("tenloai"); 
			
			dsLoai.add(new LoaiBean(maloai, tenloai));
		}
		cmd.close();
		kn.cn.close();
		return dsLoai;
	}
	
	// Thêm loại
	public int themLoai(String tenloai)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into Loai values (?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, tenloai);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Sửa loại
	public int suaLoai(long maloai, String tenloai)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update Loai set tenloai= ? where maloai=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, tenloai);
		cmd.setLong(2, maloai);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Xóa loại
	public int xoaLoai(long maloai)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from Loai where maloai=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, maloai);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Xóa size sản phẩm theo mã sản phẩm
	public int xoaSizeSanPham(long masanpham)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from SizeSanPham where masanpham=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	//Xóa chi tiết sản phẩm theo mã sản phẩm
	public int xoaChiTietSanPham(long masanpham)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from ChiTietSanPham where masanpham=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	//Xóa ảnh, màu sản phẩm theo mã sản phẩm
	public int xoaAnhSanPham(long masanpham)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from AnhSanPham where masanpham=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Xóa sản phẩm trong giỏ theo mã sản phẩm
	public int xoaGioHang(long masanpham)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from GioHang where masanpham=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
}
