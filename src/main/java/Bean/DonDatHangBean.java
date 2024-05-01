package Bean;

import java.util.Date;

public class DonDatHangBean {
	private long mahoadon;
	private Date ngaydat;
	private boolean phuongthucthanhtoan;
	private boolean thanhtoan;
	private long tongdongia;
	private String diachinhanhang;
	private long makhachhang;
	private long matrangthai;
	
	public DonDatHangBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DonDatHangBean(long mahoadon, Date ngaydat, boolean phuongthucthanhtoan, boolean thanhtoan, long tongdongia,
			String diachinhanhang,long makhachhang,long matrangthai) {
		super();
		this.mahoadon = mahoadon;
		this.ngaydat = ngaydat;
		this.phuongthucthanhtoan = phuongthucthanhtoan;
		this.thanhtoan = thanhtoan;
		this.tongdongia = tongdongia;
		this.diachinhanhang = diachinhanhang;
		this.makhachhang = makhachhang;
		this.matrangthai = matrangthai;
	}

	public long getMahoadon() {
		return mahoadon;
	}

	public void setMahoadon(long mahoadon) {
		this.mahoadon = mahoadon;
	}

	public Date getNgaydat() {
		return ngaydat;
	}

	public void setNgaydat(Date ngaydat) {
		this.ngaydat = ngaydat;
	}

	public boolean isPhuongthucthanhtoan() {
		return phuongthucthanhtoan;
	}

	public void setPhuongthucthanhtoan(boolean phuongthucthanhtoan) {
		this.phuongthucthanhtoan = phuongthucthanhtoan;
	}

	public boolean isThanhtoan() {
		return thanhtoan;
	}

	public void setThanhtoan(boolean thanhtoan) {
		this.thanhtoan = thanhtoan;
	}

	public long getTongdongia() {
		return tongdongia;
	}

	public void setTongdongia(long tongdongia) {
		this.tongdongia = tongdongia;
	}

	public String getDiachinhanhang() {
		return diachinhanhang;
	}

	public void setDiachinhanhang(String diachinhanhang) {
		this.diachinhanhang = diachinhanhang;
	}

	public long getMakhachhang() {
		return makhachhang;
	}

	public void setMakhachhang(long makhachhang) {
		this.makhachhang = makhachhang;
	}

	public long getMatrangthai() {
		return matrangthai;
	}

	public void setMatrangthai(long matrangthai) {
		this.matrangthai = matrangthai;
	}
	
	
}
