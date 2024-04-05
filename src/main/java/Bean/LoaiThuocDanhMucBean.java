package Bean;

public class LoaiThuocDanhMucBean {
	private long maloai;
	private String tenloai;
	private long madanhmuc;
	
	public LoaiThuocDanhMucBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoaiThuocDanhMucBean(long maloai, String tenloai, long madanhmuc) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
		this.madanhmuc = madanhmuc;
	}

	public long getMaloai() {
		return maloai;
	}

	public void setMaloai(long maloai) {
		this.maloai = maloai;
	}

	public String getTenloai() {
		return tenloai;
	}

	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}

	public long getMadanhmuc() {
		return madanhmuc;
	}

	public void setMadanhmuc(long madanhmuc) {
		this.madanhmuc = madanhmuc;
	}
	
	
}
