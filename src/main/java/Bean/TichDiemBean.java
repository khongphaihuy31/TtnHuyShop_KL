package Bean;

public class TichDiemBean {
	private long matichdiem;
	private long dieukien;
	private long diemcong;
	public TichDiemBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TichDiemBean(long matichdiem, long dieukien, long diemcong) {
		super();
		this.matichdiem = matichdiem;
		this.dieukien = dieukien;
		this.diemcong = diemcong;
	}
	public long getMatichdiem() {
		return matichdiem;
	}
	public void setMatichdiem(long matichdiem) {
		this.matichdiem = matichdiem;
	}
	public long getDieukien() {
		return dieukien;
	}
	public void setDieukien(long dieukien) {
		this.dieukien = dieukien;
	}
	public long getDiemcong() {
		return diemcong;
	}
	public void setDiemcong(long diemcong) {
		this.diemcong = diemcong;
	}
	
	
}
