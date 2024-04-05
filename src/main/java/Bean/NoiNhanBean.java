package Bean;

public class NoiNhanBean {
	private String thanhpho;
	private String quan;
	private String phuong;
	private String sonha;
	private long makhachhang;
	public NoiNhanBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoiNhanBean(String thanhpho, String quan, String phuong, String sonha, long makhachhang) {
		super();
		this.thanhpho = thanhpho;
		this.quan = quan;
		this.phuong = phuong;
		this.sonha = sonha;
		this.makhachhang = makhachhang;
	}
	public String getThanhpho() {
		return thanhpho;
	}
	public void setThanhpho(String thanhpho) {
		this.thanhpho = thanhpho;
	}
	public String getQuan() {
		return quan;
	}
	public void setQuan(String quan) {
		this.quan = quan;
	}
	public String getPhuong() {
		return phuong;
	}
	public void setPhuong(String phuong) {
		this.phuong = phuong;
	}
	public String getSonha() {
		return sonha;
	}
	public void setSonha(String sonha) {
		this.sonha = sonha;
	}
	public long getMakhachhang() {
		return makhachhang;
	}
	public void setMakhachhang(long makhachhang) {
		this.makhachhang = makhachhang;
	}
	
}
