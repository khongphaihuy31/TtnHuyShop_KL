package Bean;

public class AdminThongKeDoanhThu {
	private String thoigian;
	private long thu;
	private long chi;
	private long tongket;
	public AdminThongKeDoanhThu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminThongKeDoanhThu(String thoigian, long thu, long chi, long tongket) {
		super();
		this.thoigian = thoigian;
		this.thu = thu;
		this.chi = chi;
		this.tongket = tongket;
	}
	public String getThoigian() {
		return thoigian;
	}
	public void setThoigian(String thoigian) {
		this.thoigian = thoigian;
	}
	public long getThu() {
		return thu;
	}
	public void setThu(long thu) {
		this.thu = thu;
	}
	public long getChi() {
		return chi;
	}
	public void setChi(long chi) {
		this.chi = chi;
	}
	public long getTongket() {
		return tongket;
	}
	public void setTongket(long tongket) {
		this.tongket = tongket;
	}
	
}
