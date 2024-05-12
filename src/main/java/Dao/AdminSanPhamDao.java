package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.AnhSanPham;
import Bean.ChiTietSanPhamBean;
import Bean.SanPhamBean;
import Bean.SizeSanPhamBean;

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
	
//	Lấy sản phẩm theo mã sản phẩm
	public SanPhamBean getSanPham(long masanpham)throws Exception{
		SanPhamBean dsSanPham = new SanPhamBean();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from SanPham where masanpham=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			long masanpham1 = rs.getLong("masanpham");
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
			
			dsSanPham = new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai, mathuonghieu, madanhmuc, anhchonsize);
		}
		return dsSanPham;
	}
	
//	Lấy danh sách size theo mã sản phẩm
	public ArrayList<SizeSanPhamBean> dsSizeSanPham(long masanpham)throws Exception{
		ArrayList<SizeSanPhamBean> dsSanPham = new ArrayList<SizeSanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from SizeSanPham where masanpham=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham1 = rs.getLong("masanpham");
			String size = rs.getString("size");
			
			dsSanPham.add(new SizeSanPhamBean(masanpham1, size));
		}
		return dsSanPham;
	}
	
//	Lấy danh sách màu và ảnh theo mã sản phẩm
	public ArrayList<AnhSanPham> dsAnhSanPham(long masanpham)throws Exception{
		ArrayList<AnhSanPham> dsSanPham = new ArrayList<AnhSanPham>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from AnhSanPham where masanpham=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String mau = rs.getString("mau");
			String srcanh = rs.getString("srcanh");
			
			dsSanPham.add(new AnhSanPham(mau, srcanh));
		}
		return dsSanPham;
	}
	
//	Lấy giá nhập
	public long getgianhap(long masanpham)throws Exception{
		long gianhap=0;
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from NhapHang where masanpham=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			gianhap = rs.getLong("gianhap");
		}
		return gianhap;
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
	
	//Sửa mô tả sản phẩm
	public int capNhatMoTaSanPham(long masanpham ,String motasanpham)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update SanPham set motasanpham = ? where masanpham=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, motasanpham);
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
	public int nhapHang(long masanpham, long soluongnhap, long gianhap, long tongtiennhap, String tensanpham, String anhsanpham)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "insert into NhapHang(masanpham, soluongnhap, gianhap, tongtiennhap, tensanpham, anhsanpham) values(?,?,?,?,?,?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		cmd.setLong(2, soluongnhap);
		cmd.setLong(3, gianhap);
		cmd.setLong(4, tongtiennhap);
		cmd.setString(5, tensanpham);
		cmd.setString(6, anhsanpham);
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
	//Cập nhật số lượng trong kho
	public int capNhatChiTietSanPham(long masanpham, String mau, String size, long soluong)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update ChiTietSanPham set soluong= ? where masanpham=? and mau=? and size=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, soluong);
		cmd.setLong(2, masanpham);
		cmd.setString(3, mau);
		cmd.setString(4, size);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
//	Lấy danh sách chi tiết sản phẩm
	public ArrayList<ChiTietSanPhamBean> dsChiTietSanPham()throws Exception{
		ArrayList<ChiTietSanPhamBean> dsSanPham = new ArrayList<ChiTietSanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from ChiTietSanPham";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String mau = rs.getString("mau");
			String size = rs.getString("size");
			long soluong = rs.getLong("soluong");
			
			dsSanPham.add(new ChiTietSanPhamBean(masanpham, mau, size, soluong));
		}
		return dsSanPham;
	}
	
//	Lấy danh sách chi tiết sản phẩm
	public ArrayList<ChiTietSanPhamBean> dsChiTietSanPhamThemMasanpham(long masanpham)throws Exception{
		ArrayList<ChiTietSanPhamBean> dsSanPham = new ArrayList<ChiTietSanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from ChiTietSanPham where masanpham = ?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham1 = rs.getLong("masanpham");
			String mau = rs.getString("mau");
			String size = rs.getString("size");
			long soluong = rs.getLong("soluong");
			
			dsSanPham.add(new ChiTietSanPhamBean(masanpham1, mau, size, soluong));
		}
		return dsSanPham;
	}
	
	//Sửa giá giảm sản phẩm
	public int suaGiaGiamSanPham(long masanpham ,String tensanpham, long giaban, long giagiam, long maloai, long mathuonghieu, long madanhmuc)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update SanPham set tensanpham= ?, giaban=?, giagiam=?, maloai=?, mathuonghieu=?, madanhmuc=? where masanpham=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, tensanpham);
		cmd.setLong(2, giaban);
		cmd.setLong(3, giagiam);
		cmd.setLong(4, maloai);
		cmd.setLong(5, mathuonghieu);
		cmd.setLong(6, madanhmuc);
		cmd.setLong(7, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}

	//Sửa ảnh sản phẩm
	public int suaAnhSanPham(long masanpham ,String anh)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update SanPham set anh= ? where masanpham=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, anh);
		cmd.setLong(2, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Sửa ảnh chọn size
	public int suaAnhChonSize(long masanpham ,String anhchonsize)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update SanPham set anhchonsize= ? where masanpham=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, anhchonsize);
		cmd.setLong(2, masanpham);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Sửa ảnh sản phẩm theo màu
	public int suaAnhSanPhamTheoMau(long masanpham ,String mau, String srcanh)throws Exception{
		KetNoiDao kn= new KetNoiDao();
		kn.ketnoi();
		
		String sql = "update AnhSanPham set srcanh= ? where masanpham=? and mau=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setString(1, srcanh);
		cmd.setLong(2, masanpham);
		cmd.setString(3, mau);
		
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
//	Lấy danh sách sản phẩm thuộc loại
	public ArrayList<SanPhamBean> dsSanPhamThuocLoai(long maloai)throws Exception{
		ArrayList<SanPhamBean> dsSanPham = new ArrayList<SanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from SanPham where maloai=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, maloai);
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
			long maloai1 = rs.getLong("maloai");
			long mathuonghieu = rs.getLong("mathuonghieu");
			long madanhmuc = rs.getLong("madanhmuc");
			String anhchonsize = rs.getString("anhchonsize");
			
			dsSanPham.add(new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai1, mathuonghieu, madanhmuc, anhchonsize));
		}
		return dsSanPham;
	}
	
//	Lấy danh sách sản phẩm thuộc thương hiệu
	public ArrayList<SanPhamBean> dsSanPhamThuocThuongHieu(long mathuonghieu)throws Exception{
		ArrayList<SanPhamBean> dsSanPham = new ArrayList<SanPhamBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from SanPham where mathuonghieu=?";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mathuonghieu);
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
			long maloai1 = rs.getLong("maloai");
			long mathuonghieu1 = rs.getLong("mathuonghieu");
			long madanhmuc = rs.getLong("madanhmuc");
			String anhchonsize = rs.getString("anhchonsize");
			
			dsSanPham.add(new SanPhamBean(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai1, mathuonghieu1, madanhmuc, anhchonsize));
		}
		return dsSanPham;
	}
}
