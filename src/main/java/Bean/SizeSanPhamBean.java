package Bean;

public class SizeSanPhamBean {
	private long masanpham;
	private String size;
	public SizeSanPhamBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SizeSanPhamBean(long masanpham, String size) {
		super();
		this.masanpham = masanpham;
		this.size = size;
	}
	public long getMasanpham() {
		return masanpham;
	}
	public void setMasanpham(long masanpham) {
		this.masanpham = masanpham;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
}
