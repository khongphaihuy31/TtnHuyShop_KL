package Bean;

public class AnhSanPham {
	private String mauString;
	private String srcanh;
	
	public AnhSanPham() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AnhSanPham(String mauString, String srcanh) {
		super();
		this.mauString = mauString;
		this.srcanh = srcanh;
	}
	public String getMauString() {
		return mauString;
	}
	public void setMauString(String mauString) {
		this.mauString = mauString;
	}
	public String getSrcanh() {
		return srcanh;
	}
	public void setSrcanh(String srcanh) {
		this.srcanh = srcanh;
	}
}
