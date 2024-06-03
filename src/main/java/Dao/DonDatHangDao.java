package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Bean.DonDatHangBean;

public class DonDatHangDao {
	// xử lý thêm đơn đặt hàng
	public int themDonDatHang(long makhachhang, boolean phuongthucthanhtoan, boolean thanhtoan, long tongdongia,
			String diachinhanhang) throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		String sql = "insert into DonDatHang values (?,?,?,?,?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);

		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		String tam = dd.format(n1);
		Date n2 = dd.parse(tam);
		cmd.setDate(1, new java.sql.Date(n2.getTime()));

		cmd.setLong(2, 1);

		cmd.setLong(3, makhachhang);
		cmd.setBoolean(4, phuongthucthanhtoan);
		cmd.setBoolean(5, thanhtoan);
		cmd.setLong(6, tongdongia);
		cmd.setString(7, diachinhanhang);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}

	// xử lý lấy mã đặt hàng vừa thêm
	public long getMaxHD(long makhachhang) throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select max(mahoadon) as MaxHD from DonDatHang where makhachhang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		ResultSet rs = cmd.executeQuery();
		long max = 0;
		if (rs.next()) {
			max = rs.getLong(1);
		}
		cmd.close();
		kn.cn.close();
		return max;
	}

	// xử lý cập nhật đơn hàng đã thanh toán
	public int capNhatDaThanhToan(long mahoadon, long makhachhang) throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "update DonDatHang set thanhtoan = 1 where mahoadon = ? and makhachhang = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		cmd.setLong(2, makhachhang);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}

	// xử lý cập nhật trạng thái chuẩn bị đơn cho đơn đặt hàng
	public int capNhatChiTietHDChuanBiDon(long mahoadon) throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "update DonDatHang set matrangthai = 2 where mahoadon = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}

	// xử lý cập nhật trạng thái đang giao cho đơn đặt hàng
	public int capNhatChiTietHDDangGiao(long mahoadon) throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "update DonDatHang set matrangthai = 3 where mahoadon = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}

	// xử lý cập nhật trạng thái đã giao cho đơn đặt hàng
	public int capNhatChiTietHDDaGiao(long mahoadon) throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "update DonDatHang set matrangthai = 4 where mahoadon = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}

	// xử lý lấy danh sách đơn đặt hàng chuẩn bị đơn
	public ArrayList<DonDatHangBean> dsdonchuanbi(long makhachhang) throws Exception {
		ArrayList<DonDatHangBean> dshoadon = new ArrayList<DonDatHangBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select * from DonDatHang where matrangthai = 2 and makhachhang=? order by mahoadon DESC";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon = rs.getLong("mahoadon");
			boolean phuongthucthanhtoan = rs.getBoolean("phuongthucthanhtoan");
			boolean thanhtoan = rs.getBoolean("thanhtoan");
			long tongdongia = rs.getLong("tongdongia");
			String diachinhanhang = rs.getString("diachinhanhang");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");

			dshoadon.add(
					new DonDatHangBean(mahoadon, ngaydat, phuongthucthanhtoan, thanhtoan, tongdongia, diachinhanhang,makhachhang1,matrangthai));
		}
		return dshoadon;
	}

	// xử lý lấy danh sách đơn đặt hàng chờ xác nhận
	public ArrayList<DonDatHangBean> dsdonchoxacnhan(long makhachhang) throws Exception {
		ArrayList<DonDatHangBean> dshoadon = new ArrayList<DonDatHangBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select * from DonDatHang where matrangthai = 1 and makhachhang=? order by mahoadon DESC";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon = rs.getLong("mahoadon");
			boolean phuongthucthanhtoan = rs.getBoolean("phuongthucthanhtoan");
			boolean thanhtoan = rs.getBoolean("thanhtoan");
			long tongdongia = rs.getLong("tongdongia");
			String diachinhanhang = rs.getString("diachinhanhang");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");

			dshoadon.add(
					new DonDatHangBean(mahoadon, ngaydat, phuongthucthanhtoan, thanhtoan, tongdongia, diachinhanhang,makhachhang1,matrangthai));
		}
		return dshoadon;
	}

	// xử lý lấy danh sách đơn đặt hàng đang giao
	public ArrayList<DonDatHangBean> dsdondanggiao(long makhachhang) throws Exception {
		ArrayList<DonDatHangBean> dshoadon = new ArrayList<DonDatHangBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select * from DonDatHang where matrangthai = 3 and makhachhang=? order by mahoadon DESC";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon = rs.getLong("mahoadon");
			boolean phuongthucthanhtoan = rs.getBoolean("phuongthucthanhtoan");
			boolean thanhtoan = rs.getBoolean("thanhtoan");
			long tongdongia = rs.getLong("tongdongia");
			String diachinhanhang = rs.getString("diachinhanhang");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");

			dshoadon.add(
					new DonDatHangBean(mahoadon, ngaydat, phuongthucthanhtoan, thanhtoan, tongdongia, diachinhanhang,makhachhang1,matrangthai));
		}
		return dshoadon;
	}

	// xử lý lấy danh sách đơn đặt hàng đã giao
	public ArrayList<DonDatHangBean> dsdondagiao(long makhachhang) throws Exception {
		ArrayList<DonDatHangBean> dshoadon = new ArrayList<DonDatHangBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select * from DonDatHang where matrangthai = 4 and makhachhang=? order by mahoadon DESC";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon = rs.getLong("mahoadon");
			boolean phuongthucthanhtoan = rs.getBoolean("phuongthucthanhtoan");
			boolean thanhtoan = rs.getBoolean("thanhtoan");
			long tongdongia = rs.getLong("tongdongia");
			String diachinhanhang = rs.getString("diachinhanhang");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");

			dshoadon.add(
					new DonDatHangBean(mahoadon, ngaydat, phuongthucthanhtoan, thanhtoan, tongdongia, diachinhanhang,makhachhang1,matrangthai));
		}
		return dshoadon;
	}

	// xử lý lấy danh sách mã hóa đơn chờ xác nhận
	public ArrayList<Long> dshoadonchoxacnhan() throws Exception {
		ArrayList<Long> dshoadon = new ArrayList<Long>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select mahoadon from DonDatHang where matrangthai = 1";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);

		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long mahoadon = rs.getLong("mahoadon");

			dshoadon.add(mahoadon);
		}
		return dshoadon;
	}

	// xử lý lấy danh sách mã hóa đơn chuẩn bị đơn
	public ArrayList<Long> dshoadonchuanbidon() throws Exception {
		ArrayList<Long> dshoadon = new ArrayList<Long>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select mahoadon from DonDatHang where matrangthai = 2";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);

		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long mahoadon = rs.getLong("mahoadon");

			dshoadon.add(mahoadon);
		}
		return dshoadon;
	}

	// xử lý lấy danh sách mã hóa đơn đang giao
	public ArrayList<Long> dshoadondanggiao() throws Exception {
		ArrayList<Long> dshoadon = new ArrayList<Long>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select mahoadon from DonDatHang where matrangthai = 3";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);

		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long mahoadon = rs.getLong("mahoadon");

			dshoadon.add(mahoadon);
		}
		return dshoadon;
	}

	// xử lý lấy danh sách mã hóa đơn đã giao
	public ArrayList<Long> dshoadondagiao() throws Exception {
		ArrayList<Long> dshoadon = new ArrayList<Long>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select mahoadon from DonDatHang where matrangthai = 4";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);

		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long mahoadon = rs.getLong("mahoadon");

			dshoadon.add(mahoadon);
		}
		return dshoadon;
	}

	// xử lý lấy doanh thu trong ngày
	public long getDoanhThuTrongNgay(String ngayhientai) throws Exception {
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		long doanhthutrongngay = 0;

		String sql = "select sum(tongdongia) as tongdoanhthu from DonDatHang where ngaydat =?";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, ngayhientai);

		ResultSet rs = cmd.executeQuery();
		if (rs.next()) {
			doanhthutrongngay = rs.getLong("tongdoanhthu");
		}
		return doanhthutrongngay;
	}
	
	// xử lý lấy danh sách mã hóa đơn chưa giao
	public ArrayList<Long> dshoadonchuagiao() throws Exception {
		ArrayList<Long> dshoadon = new ArrayList<Long>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select mahoadon from DonDatHang where matrangthai != 4";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);

		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long mahoadon = rs.getLong("mahoadon");

			dshoadon.add(mahoadon);
		}
		return dshoadon;
	}
	// xử lý lấy danh sách đơn đặt hàng chưa giao
	public ArrayList<DonDatHangBean> dsdonchuagiao() throws Exception {
		ArrayList<DonDatHangBean> dshoadon = new ArrayList<DonDatHangBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();

		String sql = "select * from DonDatHang where matrangthai != 4";

		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon = rs.getLong("mahoadon");
			boolean phuongthucthanhtoan = rs.getBoolean("phuongthucthanhtoan");
			boolean thanhtoan = rs.getBoolean("thanhtoan");
			long tongdongia = rs.getLong("tongdongia");
			String diachinhanhang = rs.getString("diachinhanhang");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");

			dshoadon.add(
					new DonDatHangBean(mahoadon, ngaydat, phuongthucthanhtoan, thanhtoan, tongdongia, diachinhanhang,makhachhang1,matrangthai));
		}
		return dshoadon;
	}
}
