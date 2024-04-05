package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.GioHangBean;

public class GioHangDao {
	public ArrayList<GioHangBean> getSanPhamTrongGio(long makhachhang)throws Exception{
		ArrayList<GioHangBean> dsSanPhamTrongGio = new ArrayList<GioHangBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "SELECT dbo.GioHang.masanpham, dbo.GioHang.makhachhang, dbo.GioHang.soluongmua, dbo.GioHang.mau, dbo.GioHang.size, dbo.AnhSanPham.srcanh, dbo.SanPham.tensanpham, dbo.SanPham.anh, dbo.SanPham.giaban, dbo.SanPham.giagiam, dbo.SanPham.soluongdaban, dbo.SanPham.sanphamhot, dbo.SanPham.motasanpham, dbo.SanPham.maloai, dbo.SanPham.mathuonghieu, dbo.SanPham.madanhmuc, dbo.SanPham.anhchonsize\r\n"
				+ "FROM     dbo.AnhSanPham INNER JOIN\r\n"
				+ "dbo.GioHang ON dbo.AnhSanPham.masanpham = dbo.GioHang.masanpham INNER JOIN\r\n"
				+ "dbo.SanPham ON dbo.AnhSanPham.masanpham = dbo.SanPham.masanpham AND dbo.GioHang.masanpham = dbo.SanPham.masanpham where makhachhang=? and dbo.GioHang.mau = dbo.AnhSanPham.mau";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			long soluongmua = rs.getLong("soluongmua");
			String mau = rs.getString("mau");
			String size = rs.getString("size");
			String anhtheomau = rs.getString("srcanh");
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
			
			dsSanPhamTrongGio.add(new GioHangBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize, soluongmua, soluongmua*giagiam, mau, size, anhtheomau));
		}
		return dsSanPhamTrongGio;
	}
	
	// Thêm sản phẩm vào giỏ
		public int themSanPhamVaoGio(long masanpham, long makhachhang, long soluongmua, String mau, String size) throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			String sql = "insert into GioHang values (?,?,?,?,?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setLong(1, masanpham);
			cmd.setLong(2, makhachhang);
			cmd.setLong(3, soluongmua);
			cmd.setString(4, mau);
			cmd.setString(5, size);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
		
		//xử lý cập nhật số lượng hàng trong giỏ	
		public int capNhatGio(long masanpham, long makhachhang, long soluongmua, String mau, String size) throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			
			String sql = "update GioHang set soluongmua = ? where masanpham = ? and makhachhang = ? and mau = ? and size=?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setLong(1, soluongmua);
			cmd.setLong(2, masanpham);
			cmd.setLong(3, makhachhang);
			cmd.setString(4, mau);
			cmd.setString(5, size);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
		
		//Xóa sản phẩm trong giỏ
		public int xoaSpTrongGio(long masanpham, long makhachhang, String mau, String size)throws Exception{
			KetNoiDao kn = new KetNoiDao();
			kn.ketnoi();
			
			String sql = "delete from GioHang where masanpham = ? and makhachhang = ? and mau = ? and size=? ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setLong(1, masanpham);
			cmd.setLong(2, makhachhang);
			cmd.setString(3, mau);
			cmd.setString(4, size);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			return kq;
		}
}
