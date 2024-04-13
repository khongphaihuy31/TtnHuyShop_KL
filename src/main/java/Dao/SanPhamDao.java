package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.SanPhamBean;
import Bean.SanPhamFullBean;

public class SanPhamDao {
//	Lấy các sản phẩm hot
	public ArrayList<SanPhamBean> getSanPhamHot()throws Exception{
		ArrayList<SanPhamBean> dsSanPhamHot = new ArrayList<SanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from SanPham where sanphamhot = 1";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giaban = rs.getLong("giaban");
			long giagiam = rs.getLong("giagiam");
			String anhchonsize = rs.getString("anhchonsize");
			long soluongdaban = rs.getLong("soluongdaban");
			boolean sanphamhot = rs.getBoolean("sanphamhot");
			String motasanpham = rs.getString("motasanpham");
			long maloai = rs.getLong("maloai");
			long mathuonghieu = rs.getLong("mathuonghieu");
			long madanhmuc = rs.getLong("madanhmuc");
			
			dsSanPhamHot.add(new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize));
		}
		return dsSanPhamHot;
	}
	
//	Lấy sản phẩm theo mã sản phẩm
	public SanPhamBean getSanPham(long msp)throws Exception{
		SanPhamBean sp = new SanPhamBean();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from SanPham where masanpham = ?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, msp);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giaban = rs.getLong("giaban");
			long giagiam = rs.getLong("giagiam");
			String anhchonsize = rs.getString("anhchonsize");
			long soluongdaban = rs.getLong("soluongdaban");
			boolean sanphamhot = rs.getBoolean("sanphamhot");
			String motasanpham = rs.getString("motasanpham");
			long maloai = rs.getLong("maloai");
			long mathuonghieu = rs.getLong("mathuonghieu");
			long madanhmuc = rs.getLong("madanhmuc");
			
			sp = new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize);
			
		}
		return sp;
	}
	
// Lấy các sản phẩm theo mã loại và mã danh mục
	public ArrayList<SanPhamBean> getSanPhamLoaiTrongDanhMuc(long maloai, long madanhmuc , long mathuonghieu)throws Exception{
		ArrayList<SanPhamBean> dsSanPhamLoaiTrongDanhMuc = new ArrayList<SanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		if(madanhmuc ==0 && mathuonghieu == 0) {
			String sql = "select * from SanPham where maloai = ?";
			
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setLong(1, maloai);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				long masanpham = rs.getLong("masanpham");
				String tensanpham = rs.getString("tensanpham");
				String anh = rs.getString("anh");
				long giaban = rs.getLong("giaban");
				long giagiam = rs.getLong("giagiam");
				String anhchonsize = rs.getString("anhchonsize");
				long soluongdaban = rs.getLong("soluongdaban");
				boolean sanphamhot = rs.getBoolean("sanphamhot");
				String motasanpham = rs.getString("motasanpham");
				long maloai1 = rs.getLong("maloai");
				long mathuonghieu1 = rs.getLong("mathuonghieu");
				long madanhmuc1 = rs.getLong("madanhmuc");
				
				dsSanPhamLoaiTrongDanhMuc.add(new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize));
			}
		}else if(maloai == 0 && madanhmuc ==0){
			String sql = "select * from SanPham where mathuonghieu = ?";
			
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setLong(1, mathuonghieu);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				long masanpham = rs.getLong("masanpham");
				String tensanpham = rs.getString("tensanpham");
				String anh = rs.getString("anh");
				long giaban = rs.getLong("giaban");
				long giagiam = rs.getLong("giagiam");
				String anhchonsize = rs.getString("anhchonsize");
				long soluongdaban = rs.getLong("soluongdaban");
				boolean sanphamhot = rs.getBoolean("sanphamhot");
				String motasanpham = rs.getString("motasanpham");
				long maloai1 = rs.getLong("maloai");
				long mathuonghieu1 = rs.getLong("mathuonghieu");
				long madanhmuc1 = rs.getLong("madanhmuc");
				
				dsSanPhamLoaiTrongDanhMuc.add(new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize));
			}
		}else {
			String sql = "select * from SanPham where maloai = ? and madanhmuc = ?";
			
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setLong(1, maloai);
			cmd.setLong(2, madanhmuc);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				long masanpham = rs.getLong("masanpham");
				String tensanpham = rs.getString("tensanpham");
				String anh = rs.getString("anh");
				long giaban = rs.getLong("giaban");
				long giagiam = rs.getLong("giagiam");
				String anhchonsize = rs.getString("anhchonsize");
				long soluongdaban = rs.getLong("soluongdaban");
				boolean sanphamhot = rs.getBoolean("sanphamhot");
				String motasanpham = rs.getString("motasanpham");
				long maloai1 = rs.getLong("maloai");
				long mathuonghieu1 = rs.getLong("mathuonghieu");
				long madanhmuc1 = rs.getLong("madanhmuc");
				
				dsSanPhamLoaiTrongDanhMuc.add(new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize));			
			}			
		}
		return dsSanPhamLoaiTrongDanhMuc;
	}
	
//	Lấy sản phẩm theo tìm kiếm
	public ArrayList<SanPhamFullBean> getSanPhamTimKiem()throws Exception{
		ArrayList<SanPhamFullBean> dsSanPhamTimKiem = new ArrayList<SanPhamFullBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from tb_SanPhamCoTLoaiTTHieu";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giaban = rs.getLong("giaban");
			long giagiam = rs.getLong("giagiam");
			String anhchonsize = rs.getString("anhchonsize");
			long soluongdaban = rs.getLong("soluongdaban");
			boolean sanphamhot = rs.getBoolean("sanphamhot");
			String motasanpham = rs.getString("motasanpham");
			long maloai = rs.getLong("maloai");
			long mathuonghieu = rs.getLong("mathuonghieu");
			long madanhmuc = rs.getLong("madanhmuc");
			String tenloai = rs.getString("tenloai");
			String tenthuonghieu = rs.getString("tenthuonghieu");
			
			dsSanPhamTimKiem.add(new SanPhamFullBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc,anhchonsize, tenloai, tenthuonghieu));
		}
		return dsSanPhamTimKiem;
	}
	
//	Lấy các sản phẩm ưa thích
	public ArrayList<SanPhamBean> getSanPhamUaThich()throws Exception{
		ArrayList<SanPhamBean> dsSanPhamUaThich = new ArrayList<SanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select top 12 * from SanPham";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giaban = rs.getLong("giaban");
			long giagiam = rs.getLong("giagiam");
			String anhchonsize = rs.getString("anhchonsize");
			long soluongdaban = rs.getLong("soluongdaban");
			boolean sanphamhot = rs.getBoolean("sanphamhot");
			String motasanpham = rs.getString("motasanpham");
			long maloai = rs.getLong("maloai");
			long mathuonghieu = rs.getLong("mathuonghieu");
			long madanhmuc = rs.getLong("madanhmuc");
			
			dsSanPhamUaThich.add(new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize));
		}
		return dsSanPhamUaThich;
	}
}
