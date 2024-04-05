package Bean;

public class GioHangBean extends SanPhamBean{
	private long soluongmua;
	private long thanhtien;
	private String mausanpham;
	private String size;
	private String anhTheoMau; 
	
	public GioHangBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public GioHangBean(long masanpham, String tensanpham, String anh, long giaban, long giagiam, long soluongdaban,
			boolean sanphamhot, String motasanpham, long maloai, long mathuonghieu,
			long madanhmuc, String anhchonsize,long soluongmua, long thanhtien, String mausanpham, String size,String anhTheoMau) {
		super(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai,
				mathuonghieu, madanhmuc, anhchonsize);
		this.soluongmua = soluongmua;
		if(giagiam == 0) {
			this.thanhtien = giaban * soluongmua;;
		}else {
			this.thanhtien = giagiam * soluongmua;
		}
		this.mausanpham = mausanpham;
		this.size = size;
		this.anhTheoMau = anhTheoMau;
	}

	public long getSoluongmua() {
		return soluongmua;
	}

	public void setSoluongmua(long soluongmua) {
		this.soluongmua = soluongmua;
	}

	public long getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}

	public String getMausanpham() {
		return mausanpham;
	}

	public void setMausanpham(String mausanpham) {
		this.mausanpham = mausanpham;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}


	public String getAnhTheoMau() {
		return anhTheoMau;
	}


	public void setAnhTheoMau(String anhTheoMau) {
		this.anhTheoMau = anhTheoMau;
	}
	
}
