package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.SanPhamBean;

public class AdminSanPhamDao {
//	Lấy các sản phẩm hot
	public ArrayList<SanPhamBean> dsSanPham()throws Exception{
		ArrayList<SanPhamBean> dsSanPham = new ArrayList<SanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from SanPham order by masanpham DESC";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giaban = rs.getLong("giaban");
			long giagiam = rs.getLong("giagiam");
			long soluongdaban = rs.getLong("soluongdaban");
			boolean sanphamhot = rs.getBoolean("sanphamhot");
			String motasanpham = rs.getString("motasanpham");
			long maloai = rs.getLong("maloai");
			long mathuonghieu = rs.getLong("mathuonghieu");
			long madanhmuc = rs.getLong("madanhmuc");
			String anhchonsize = rs.getString("anhchonsize");
			
			dsSanPham.add(new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize));
		}
		return dsSanPham;
	}
	
	//Xóa sản phẩm
	public int xoaSanPham(long masanpham)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		String sql = "delete from SanPham where masanpham=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Sửa sản phẩm hot
	public int capNhatSpHot(long masanpham ,long sanphamhot)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update SanPham set sanphamhot = ? where masanpham=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, sanphamhot);
		cmd.setLong(2, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Thêm sản phẩm
	public int themSanPham(String tensanpham, String anh, long giacu, long giamoi, long soluongdaban, String motasanpham, String chitietsanpham, long maloai, long mathuonghieu, long madanhmuc)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into SanPham(tensanpham, anh, giacu, giamoi, soluongdaban, motasanpham, chitietsanpham, maloai, mathuonghieu, madanhmuc ) values(?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tensanpham);
		cmd.setString(2, anh);
		cmd.setLong(3, giacu);
		cmd.setLong(4, giamoi);
		cmd.setLong(5, soluongdaban);
		cmd.setString(6, motasanpham);
		cmd.setString(7, chitietsanpham);
		cmd.setLong(8, maloai);
		cmd.setLong(9, mathuonghieu);
		cmd.setLong(10, madanhmuc);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Sửa sản phẩm
	public int suaSanPham(long masanpham ,String tensanpham, long giacu, long giamoi, long soluongdaban, String motasanpham, String chitietsanpham, long maloai, long mathuonghieu, long madanhmuc)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update SanPham set tensanpham= ?, giacu=?, giamoi=?, soluongdaban=?, motasanpham=?, chitietsanpham=?, maloai=?, mathuonghieu=?, madanhmuc=? where masanpham=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, tensanpham);
		cmd.setLong(2, giacu);
		cmd.setLong(3, giamoi);
		cmd.setLong(4, soluongdaban);
		cmd.setString(5, motasanpham);
		cmd.setString(6, chitietsanpham);
		cmd.setLong(7, maloai);
		cmd.setLong(8, mathuonghieu);
		cmd.setLong(9, madanhmuc);
		cmd.setLong(10, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Xóa sản phẩm thuộc mã loại
	public int xoaSanPhamThuocLoai(long maloai)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		String sql = "delete from SanPham where maloai=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, maloai);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
}
