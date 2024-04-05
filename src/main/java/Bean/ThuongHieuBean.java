package Bean;

public class ThuongHieuBean {
	private long mathuonghieu;
	private String tenthuonghieu;
	
	public ThuongHieuBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ThuongHieuBean(long mathuonghieu, String tenthuonghieu) {
		super();
		this.mathuonghieu = mathuonghieu;
		this.tenthuonghieu = tenthuonghieu;
	}

	public long getMathuonghieu() {
		return mathuonghieu;
	}

	public void setMathuonghieu(long mathuonghieu) {
		this.mathuonghieu = mathuonghieu;
	}

	public String getTenthuonghieu() {
		return tenthuonghieu;
	}

	public void setTenthuonghieu(String tenthuonghieu) {
		this.tenthuonghieu = tenthuonghieu;
	}
	
	
}
