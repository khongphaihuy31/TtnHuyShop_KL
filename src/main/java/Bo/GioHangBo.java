package Bo;

import java.util.ArrayList;

import Bean.GioHangBean;
import Dao.GioHangDao;

public class GioHangBo {
	GioHangDao ghdao = new GioHangDao();
	public ArrayList<GioHangBean> getSanPhamTrongGio(long makhachhang)throws Exception{
		return ghdao.getSanPhamTrongGio(makhachhang);
	}
	
	public int capNhatGio(long masanpham, long makhachhang, long soluongmua, String mau, String size) throws Exception{
		return ghdao.capNhatGio(masanpham, makhachhang, soluongmua, mau, size);
	}
	
	public int themSanPhamVaoGio(long masanpham, long makhachhang, long soluongmua, String mau, String size) throws Exception{
		ArrayList<GioHangBean> dsSpGio = new ArrayList<GioHangBean>();
		dsSpGio = getSanPhamTrongGio(makhachhang);
		boolean daco = false;
		long soluongtong= soluongmua;
		for(GioHangBean gh: dsSpGio) {
			if(masanpham == gh.getMasanpham() && mau.equals(gh.getMausanpham()) && size.equals(gh.getSize())) {
				daco =true;
				soluongtong += gh.getSoluongmua(); 
			}
		}
		if(daco) {
			return ghdao.capNhatGio(masanpham, makhachhang, soluongtong, mau, size);
		}else {
			return ghdao.themSanPhamVaoGio(masanpham, makhachhang, soluongmua, mau, size);	
		}
	}
	
	public int xoaSpTrongGio(long masanpham, long makhachhang, String mau, String size)throws Exception{
		return ghdao.xoaSpTrongGio(masanpham, makhachhang, mau, size);
	}
	
	public int xoachon(ArrayList<GioHangBean> dsSpGio, long makhachhang) throws Exception{
		ArrayList<GioHangBean> dsGioHang = new ArrayList<GioHangBean>();
		dsGioHang = getSanPhamTrongGio(makhachhang);
		for(GioHangBean gh: dsGioHang) {
			for(GioHangBean sp: dsSpGio) {
				if(sp.getMasanpham()== gh.getMasanpham() && sp.getMausanpham().equals(gh.getMausanpham()) && sp.getSize().equals(gh.getSize())) {
					ghdao.xoaSpTrongGio(sp.getMasanpham(), makhachhang, sp.getMausanpham(), sp.getSize());
					dsSpGio.remove(sp);
					break;
				}
				if(dsSpGio.size() ==0) {
					return 1;
				}
			}
		}
		return 1;
	}
}
	/*public void themSP(long masanpham, String tensanpham, String anh, long giacu,
				long giamoi, long soluongdaban, String motasanpham, String chitietsanpham, 
				long maloai, long mathuonghieu, long madanhmuc, long soluongmua, String mausanpham, String size) {
		for(GioHangBean sp: dsSP) {
			if(sp.getMasanpham() == masanpham&&sp.getMausanpham().equals(mausanpham) && sp.getSize().equals(size)){
				long soluong = sp.getSoluongmua();
				sp.setSoluongmua(soluongmua + soluong);
				sp.setThanhtien(sp.getGiamoi() * (soluongmua + soluong));
				return;
			}
		}
		GioHangBean sanpham = new GioHangBean(masanpham, tensanpham, anh, giacu, giamoi, soluongdaban, false, motasanpham, chitietsanpham, maloai, mathuonghieu, madanhmuc, soluongmua, mausanpham, size);
		dsSP.add(sanpham);
	}
	
	public void xoaSP(long maSP, String mausanpham, String size) {
		for(GioHangBean sp: dsSP) {
			if(sp.getMasanpham() == maSP&&sp.getMausanpham().equals(mausanpham) && sp.getSize().equals(size)) {
				dsSP.remove(sp);
				return;
			}
		}
	}
	
	public void xoachon(int indexSPxoa) {
		for(int i=0; i<dsSP.size();i++) {
			if(i == indexSPxoa) {
				dsSP.remove(i);
				return;
			}
		}
	}
	
	public void suaSP(long maSP, String mausanpham, String size, long soluongmua) {
		for(GioHangBean sp: dsSP) {
			if(sp.getMasanpham() == maSP&&sp.getMausanpham().equals(mausanpham) && sp.getSize().equals(size)) {
				sp.setSoluongmua(soluongmua);
				return;
			}
		}
	}
	
	public long tongTien() {
		long tongTien = 0;
		for(GioHangBean sp: dsSP) {
			tongTien += sp.getThanhtien();
		}
		return tongTien;
	}
}*/
