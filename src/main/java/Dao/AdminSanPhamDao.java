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
	public int themSanPham(String tensanpham, String anh, long giaban, String motasanpham, long maloai, long mathuonghieu, long madanhmuc, String anhchonsize)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into SanPham(tensanpham, anh, giaban, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize) values(?,?,?,?,?,?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tensanpham);
		cmd.setString(2, anh);
		cmd.setLong(3, giaban);
		cmd.setString(4, motasanpham);
		cmd.setLong(5, maloai);
		cmd.setLong(6, mathuonghieu);
		cmd.setLong(7, madanhmuc);
		cmd.setString(8, anhchonsize);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Lấy mã sản phẩm max
	public long getMaxMasanpham() throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select max(masanpham) as MaxHD from SanPham";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long max = 0;
		if (rs.next()) {
			max = rs.getLong(1);
		}
		cmd.close();
		kn.cn.close();
		return max;
	}
	
	//Thêm size sản phẩm
	public int themSizeSanPham(String size,long masanpham)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into SizeSanPham(size, masanpham) values(?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, size);
		cmd.setLong(2, masanpham);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Thêm màu và ảnh sản phẩm
	public int themMauSanPham(String mau,String srcanh,long masanpham)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into AnhSanPham(mau, srcanh, masanpham) values(?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, mau);
		cmd.setString(2, srcanh);
		cmd.setLong(3, masanpham);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Nhập hàng
	public int nhapHang(long masanpham, long soluongnhap, long gianhap, long tongtiennhap)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into NhapHang(masanpham, soluongnhap, gianhap, tongtiennhap) values(?,?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		cmd.setLong(2, soluongnhap);
		cmd.setLong(3, gianhap);
		cmd.setLong(4, tongtiennhap);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Lấy mã nhập hàng max
	public long getMaxMadonnhap() throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select max(madonnhap) as MaxHD from NhapHang";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long max = 0;
		if (rs.next()) {
			max = rs.getLong(1);
		}
		cmd.close();
		kn.cn.close();
		return max;
	}
	
	//Chi tiết nhập hàng
	public int chiTietNhapHang(long masanpham, String mau, String size, long soluong, long madonnhap)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into ChiTietNhapHang(masanpham, mau, size, soluong, madonnhap) values(?,?,?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		cmd.setString(2, mau);
		cmd.setString(3, size);
		cmd.setLong(4, soluong);
		cmd.setLong(5, madonnhap);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Chi tiết sản phẩm
	public int chiTietSanPham(long masanpham, String mau, String size, long soluong)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into ChiTietSanPham(masanpham, mau, size, soluong) values(?,?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		cmd.setString(2, mau);
		cmd.setString(3, size);
		cmd.setLong(4, soluong);
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
