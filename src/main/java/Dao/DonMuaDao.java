package Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.DonMuaBean;

public class DonMuaDao {
	//xử lý lấy sản phẩm chờ xác nhận
	public ArrayList<DonMuaBean> getSPChoXacNhan(long makhachhang)throws Exception{
		ArrayList<DonMuaBean> dsSPChoXacNhan = new ArrayList<DonMuaBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from tb_DonMua where makhachhang=? and matrangthai=1";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giamoi = rs.getLong("giamoi");
			long soluongmua = rs.getLong("soluongmua");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon = rs.getLong("mahoadon");
			long thanhtien = rs.getLong("thanhtien");
			String mausanpham = rs.getString("mausanpham");
			String sizesanpham = rs.getString("sizesanpham");
			String hoten = rs.getString("hoten");
			
//			dsSPChoXacNhan.add(new DonMuaBean(masanpham, tensanpham, anh, giamoi, soluongmua, makhachhang1, matrangthai, ngaydat, mahoadon, mausanpham, sizesanpham, thanhtien, hoten));
		}
		return dsSPChoXacNhan;
	}
	
	//xử lý lấy sản phẩm đã giao
	public ArrayList<DonMuaBean> getSPDagiao(long makhachhang)throws Exception{
		ArrayList<DonMuaBean> dsSPDagiao = new ArrayList<DonMuaBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from tb_DonMua where makhachhang=? and matrangthai=2";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makhachhang);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giamoi = rs.getLong("giamoi");
			long soluongmua = rs.getLong("soluongmua");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon = rs.getLong("mahoadon");
			long thanhtien = rs.getLong("thanhtien");
			String mausanpham = rs.getString("mausanpham");
			String sizesanpham = rs.getString("sizesanpham");
			String hoten = rs.getString("hoten");
			
//			dsSPDagiao.add(new DonMuaBean(masanpham, tensanpham, anh, giamoi, soluongmua, makhachhang1, matrangthai, ngaydat, mahoadon, mausanpham, sizesanpham, thanhtien, hoten));
		}
		return dsSPDagiao;
	}
	
	//lấy danh sách đơn mua chưa xác nhận (Admin)
	public ArrayList<DonMuaBean> dsDonChuaXacNhan()throws Exception{
		ArrayList<DonMuaBean> dsDonChuaXacNhan = new ArrayList<DonMuaBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from tb_DonMua where matrangthai = 1 ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giamoi = rs.getLong("giamoi");
			long soluongmua = rs.getLong("soluongmua");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon1 = rs.getLong("mahoadon");
			long thanhtien = rs.getLong("thanhtien");
			String mausanpham = rs.getString("mausanpham");
			String sizesanpham = rs.getString("sizesanpham");
			String hoten = rs.getString("hoten");
			
//			dsDonChuaXacNhan.add(new DonMuaBean(masanpham, tensanpham, anh, giamoi, soluongmua, makhachhang1, matrangthai, ngaydat, mahoadon1, mausanpham, sizesanpham, thanhtien, hoten));
		}
		return dsDonChuaXacNhan;
	}
	
	//lấy danh sách đơn mua chưa xác nhận theo mã hóa đơn (Admin)
	public ArrayList<DonMuaBean> dsDonChuaXacNhanTheoMaHD(long mahoadon)throws Exception{
		ArrayList<DonMuaBean> dsDonChuaXacNhan = new ArrayList<DonMuaBean>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from tb_DonMua where mahoadon=? and matrangthai = 1 ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long masanpham = rs.getLong("masanpham");
			String tensanpham = rs.getString("tensanpham");
			String anh = rs.getString("anh");
			long giamoi = rs.getLong("giamoi");
			long soluongmua = rs.getLong("soluongmua");
			long makhachhang1 = rs.getLong("makhachhang");
			long matrangthai = rs.getLong("matrangthai");
			Date ngaydat = rs.getDate("ngaydat");
			long mahoadon1 = rs.getLong("mahoadon");
			long thanhtien = rs.getLong("thanhtien");
			String mausanpham = rs.getString("mausanpham");
			String sizesanpham = rs.getString("sizesanpham");
			String hoten = rs.getString("hoten");
			
//			dsDonChuaXacNhan.add(new DonMuaBean(masanpham, tensanpham, anh, giamoi, soluongmua, makhachhang1, matrangthai, ngaydat, mahoadon1, mausanpham, sizesanpham, thanhtien, hoten));
		}
		return dsDonChuaXacNhan;
	}
}
