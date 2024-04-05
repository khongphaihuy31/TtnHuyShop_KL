package Bean;

public class DanhMucBean {
	private long madanhmuc;
	private String tendanhmuc;
	public DanhMucBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DanhMucBean(long madanhmuc, String tendanhmuc) {
		super();
		this.madanhmuc = madanhmuc;
		this.tendanhmuc = tendanhmuc;
	}
	public long getMadanhmuc() {
		return madanhmuc;
	}
	public void setMadanhmuc(long madanhmuc) {
		this.madanhmuc = madanhmuc;
	}
	public String getTendanhmuc() {
		return tendanhmuc;
	}
	public void setTendanhmuc(String tendanhmuc) {
		this.tendanhmuc = tendanhmuc;
	}
	
}
