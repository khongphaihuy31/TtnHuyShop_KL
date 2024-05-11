package Bean;

public class AdminLuuTongSoLuongTonKho {
	private long masanpham;
	private long soluong;
	public AdminLuuTongSoLuongTonKho() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminLuuTongSoLuongTonKho(long masanpham, long soluong) {
		super();
		this.masanpham = masanpham;
		this.soluong = soluong;
	}
	public long getMasanpham() {
		return masanpham;
	}
	public void setMasanpham(long masanpham) {
		this.masanpham = masanpham;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	
}
