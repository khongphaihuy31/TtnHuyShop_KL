package Bean;

public class GiamGiaBean {
	private long magiamgia;
	private String tengiamgia;
	private long tiengiam;
	private long dieukien;
	private String mota;
	public GiamGiaBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GiamGiaBean(long magiamgia, String tengiamgia, long tiengiam, long dieukien, String mota) {
		super();
		this.magiamgia = magiamgia;
		this.tengiamgia = tengiamgia;
		this.tiengiam = tiengiam;
		this.dieukien = dieukien;
		this.mota = mota;
	}
	public long getMagiamgia() {
		return magiamgia;
	}
	public void setMagiamgia(long magiamgia) {
		this.magiamgia = magiamgia;
	}
	public String getTengiamgia() {
		return tengiamgia;
	}
	public void setTengiamgia(String tengiamgia) {
		this.tengiamgia = tengiamgia;
	}
	public long getTiengiam() {
		return tiengiam;
	}
	public void setTiengiam(long tiengiam) {
		this.tiengiam = tiengiam;
	}
	public long getDieukien() {
		return dieukien;
	}
	public void setDieukien(long dieukien) {
		this.dieukien = dieukien;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
}
