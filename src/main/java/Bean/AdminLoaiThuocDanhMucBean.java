package Bean;

public class AdminLoaiThuocDanhMucBean extends LoaiThuocDanhMucBean{
	private String tendanhmuc;

	public AdminLoaiThuocDanhMucBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminLoaiThuocDanhMucBean(long maloai, String tenloai, long madanhmuc, String tendanhmuc) {
		super(maloai, tenloai, madanhmuc);
		// TODO Auto-generated constructor stub
		this.tendanhmuc = tendanhmuc;
	}

	public String getTendanhmuc() {
		return tendanhmuc;
	}

	public void setTendanhmuc(String tendanhmuc) {
		this.tendanhmuc = tendanhmuc;
	}
	
}
