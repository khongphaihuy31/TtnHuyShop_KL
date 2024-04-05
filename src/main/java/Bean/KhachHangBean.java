package Bean;

public class KhachHangBean {
	private long makhachhang;
	private String hoten;
	private String diachi;
	private String sodienthoai;
	private String email;
	private String tendangnhap;
	private String matkhau;
	private boolean quyen;
	private long tichdiem;
	private String sothich;
	
	public KhachHangBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public KhachHangBean(long makhachhang, String hoten, String diachi, String sodienthoai, String email,
			String tendangnhap, String matkhau, boolean quyen, long tichdiem, String sothich) {
		super();
		this.makhachhang = makhachhang;
		this.hoten = hoten;
		this.diachi = diachi;
		this.sodienthoai = sodienthoai;
		this.email = email;
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
		this.quyen = quyen;
		this.tichdiem = tichdiem;
		this.sothich = sothich;
	}

	public long getMakhachhang() {
		return makhachhang;
	}

	public void setMakhachhang(long makhachhang) {
		this.makhachhang = makhachhang;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getSodienthoai() {
		return sodienthoai;
	}

	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTendangnhap() {
		return tendangnhap;
	}

	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public boolean isQuyen() {
		return quyen;
	}

	public void setQuyen(boolean quyen) {
		this.quyen = quyen;
	}

	public long getTichdiem() {
		return tichdiem;
	}

	public void setTichdiem(long tichdiem) {
		this.tichdiem = tichdiem;
	}

	public String getSothich() {
		return sothich;
	}

	public void setSothich(String sothich) {
		this.sothich = sothich;
	}
}
