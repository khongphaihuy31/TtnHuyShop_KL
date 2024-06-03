package Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.DonMuaBean;


public class AdminXacNhanDao {
	public int suaTinhTrangHD(long mahoadon)throws Exception{
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
	
	//Lấy danh sách các sản phẩm trong đơn mua theo mã hóa đơn
	public ArrayList<DonMuaBean> dsSanPhamTrongDonMuaTheoMHD(long mahoadon)throws Exception{
		ArrayList<DonMuaBean> dsDonChuaXacNhan = new ArrayList<DonMuaBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from tb_DonMua where mahoadon=? and matrangthai != 4 ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			long soluongmua = rs.getLong("soluongmua");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon1 = rs.getLong("mahoadon");
			long thanhtien = rs.getLong("thanhtien");
			String mausanpham = rs.getString("mausanpham");
			String sizesanpham = rs.getString("sizesanpham");
			String anhthietke = rs.getString("anhthietke");
			long giasanpham = rs.getLong("giasanpham");
			String tensanpham = rs.getString("tensanpham");
			String anhsanpham = rs.getString("anhsanpham");
			boolean phuongthucthanhtoan = rs.getBoolean("phuongthucthanhtoan");
			boolean thanhtoan = rs.getBoolean("thanhtoan");
			long tongdongia = rs.getLong("tongdongia");
			String diachinhanhang = rs.getString("diachinhanhang");
			
			dsDonChuaXacNhan.add(new DonMuaBean(masanpham, makhachhang1, matrangthai, ngaydat, mahoadon1, soluongmua, mausanpham, sizesanpham, anhthietke, giasanpham, tensanpham, anhsanpham, phuongthucthanhtoan, thanhtoan, tongdongia, thanhtien, diachinhanhang));
		}
		return dsDonChuaXacNhan;
	}
	
	//Xóa đơn hàng chi tiết
	public int xoaDonHangChiTiet(long mahoadon)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from DonHangChiTiet where mahoadon=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, mahoadon);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	//Xóa đơn đặt hàng
	public int xoaDonDatHang(long mahoadon)throws Exception{
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "delete from DonDatHang where mahoadon=? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		
		cmd.setLong(1, mahoadon);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	//Tìm danh sách khách hàng phù hợp
	public ArrayList<Long> dsMaKhachHangTimKiem(String tenkhachhang, String sodienthoai)throws Exception{
		ArrayList<Long> dsDonChuaXacNhan = new ArrayList<Long>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "";
		if(tenkhachhang.equals("")== false) {
			if(sodienthoai.equals("")== false) {
				sql = "select makhachhang from KhachHang where hoten like N'%'+?+'%' and sodienthoai = ?";
			}else {
				sql = "select makhachhang from KhachHang where hoten like N'%'+?+'%'";
			}
		}else {
			if(sodienthoai.equals("")== false) {
				sql = "select makhachhang from KhachHang where sodienthoai = ?";
			}
		}
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		if(tenkhachhang.equals("")== false) {
			if(sodienthoai.equals("")== false) {
				cmd.setString(1, tenkhachhang);
				cmd.setString(2, sodienthoai);
			}else {
				cmd.setString(1, tenkhachhang);
			}
		}else {
			if(sodienthoai.equals("")== false) {
				cmd.setString(1, sodienthoai);
			}
		}
		
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long makhachhang1 = rs.getLong("makhachhang");
			
			dsDonChuaXacNhan.add(makhachhang1);
		}
		return dsDonChuaXacNhan;
	}
}
