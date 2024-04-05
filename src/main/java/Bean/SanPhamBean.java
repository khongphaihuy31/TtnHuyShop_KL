package Bean;

public class SanPhamBean {
	private long masanpham;
	private String tensanpham;
	private String anh;
	private long giaban;
	private long giagiam;
	private long soluongdaban;
	private boolean sanphamhot;
	private String motasanpham;
	private long maloai;
	private long mathuonghieu;
	private long madanhmuc;
	private String anhchonsize;
	
	public SanPhamBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SanPhamBean(long masanpham, String tensanpham, String anh, long giaban, long giagiam, long soluongdaban,
			boolean sanphamhot, String motasanpham, long maloai, long mathuonghieu, long madanhmuc,String anhchonsize) {
		super();
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.anh = anh;
		this.giaban = giaban;
		this.giagiam = giagiam;
		this.soluongdaban = soluongdaban;
		this.sanphamhot = sanphamhot;
		this.motasanpham = motasanpham;
		this.maloai = maloai;
		this.mathuonghieu = mathuonghieu;
		this.madanhmuc = madanhmuc;
		this.anhchonsize = anhchonsize;
	}

	public long getMasanpham() {
		return masanpham;
	}

	public void setMasanpham(long masanpham) {
		this.masanpham = masanpham;
	}

	public String getTensanpham() {
		return tensanpham;
	}

	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public long getGiaban() {
		return giaban;
	}

	public void setGiaban(long giaban) {
		this.giaban = giaban;
	}

	public long getGiagiam() {
		return giagiam;
	}

	public void setGiagiam(long giagiam) {
		this.giagiam = giagiam;
	}

	public long getSoluongdaban() {
		return soluongdaban;
	}

	public void setSoluongdaban(long soluongdaban) {
		this.soluongdaban = soluongdaban;
	}

	public boolean isSanphamhot() {
		return sanphamhot;
	}

	public void setSanphamhot(boolean sanphamhot) {
		this.sanphamhot = sanphamhot;
	}

	public String getMotasanpham() {
		return motasanpham;
	}

	public void setMotasanpham(String motasanpham) {
		this.motasanpham = motasanpham;
	}

	public long getMaloai() {
		return maloai;
	}

	public void setMaloai(long maloai) {
		this.maloai = maloai;
	}

	public long getMathuonghieu() {
		return mathuonghieu;
	}

	public void setMathuonghieu(long mathuonghieu) {
		this.mathuonghieu = mathuonghieu;
	}

	public long getMadanhmuc() {
		return madanhmuc;
	}

	public void setMadanhmuc(long madanhmuc) {
		this.madanhmuc = madanhmuc;
	}

	public String getAnhchonsize() {
		return anhchonsize;
	}

	public void setAnhchonsize(String anhchonsize) {
		this.anhchonsize = anhchonsize;
	}
	
}
