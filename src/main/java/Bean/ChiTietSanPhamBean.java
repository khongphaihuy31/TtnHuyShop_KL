package Bean;

public class ChiTietSanPhamBean {
	private long masanpham;
	private String mau;
	private String size;
	private long soluong;
	public ChiTietSanPhamBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietSanPhamBean(long masanpham, String mau, String size, long soluong) {
		super();
		this.masanpham = masanpham;
		this.mau = mau;
		this.size = size;
		this.soluong = soluong;
	}
	public long getMasanpham() {
		return masanpham;
	}
	public void setMasanpham(long masanpham) {
		this.masanpham = masanpham;
	}
	public String getMau() {
		return mau;
	}
	public void setMau(String mau) {
		this.mau = mau;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
}
