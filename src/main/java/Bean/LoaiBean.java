package Bean;

public class LoaiBean {
	private long maloai;
	private String tenloai;
	
	public LoaiBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoaiBean(long maloai, String tenloai) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
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
	
	
}
