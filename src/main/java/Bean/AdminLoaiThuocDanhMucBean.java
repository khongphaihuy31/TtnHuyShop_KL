package Bean;

public class AdminLoaiThuocDanhMucBean extends LoaiThuocDanhMucBean{
	private String tendanhmuc;
	private long maloaithuocdanhmuc;

	public AdminLoaiThuocDanhMucBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminLoaiThuocDanhMucBean(long maloai, String tenloai, long madanhmuc, String tendanhmuc, long maloaithuocdanhmuc) {
		super(maloai, tenloai, madanhmuc);
		// TODO Auto-generated constructor stub
		this.tendanhmuc = tendanhmuc;
		this.maloaithuocdanhmuc = maloaithuocdanhmuc;
	}

	public String getTendanhmuc() {
		return tendanhmuc;
	}

	public void setTendanhmuc(String tendanhmuc) {
		this.tendanhmuc = tendanhmuc;
	}

	public long getMaloaithuocdanhmuc() {
		return maloaithuocdanhmuc;
	}

	public void setMaloaithuocdanhmuc(long maloaithuocdanhmuc) {
		this.maloaithuocdanhmuc = maloaithuocdanhmuc;
	}
	
}
