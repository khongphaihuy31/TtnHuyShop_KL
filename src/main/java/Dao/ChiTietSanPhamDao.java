package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.AnhSanPham;

public class ChiTietSanPhamDao {
	public ArrayList<String> getdsSize(long masanpham)throws Exception{
		ArrayList<String> dsSize = new ArrayList<String>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from SizeSanPham where masanpham = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String size = rs.getString("size");
			
			dsSize.add(size);
		}
		return dsSize;
	}
	public ArrayList<AnhSanPham> getdsAnhVaMau(long masanpham)throws Exception{
		ArrayList<AnhSanPham> dsAnhVaMau = new ArrayList<AnhSanPham>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from AnhSanPham where masanpham = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String mau = rs.getString("mau");
			String srcanh = rs.getString("srcanh");		
			dsAnhVaMau.add(new AnhSanPham(mau, srcanh));
		}
		return dsAnhVaMau;
	}
	
	public ArrayList<String> getdsChiTietSP(long masanpham)throws Exception{
		ArrayList<String> listCT = new ArrayList<String>();
		KetNoiDao kn = new KetNoiDao();
		kn.ketnoi();
		
		String sql = "select * from ChiTietSanPham where masanpham = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, masanpham);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String size = rs.getString("size");
			String mau = rs.getString("mau");
			long soluong = rs.getLong("soluong");
			String ct = "'"+mau+"/"+size+"/"+soluong+"'";
			listCT.add(ct);
		}
		return listCT;
	}
}
