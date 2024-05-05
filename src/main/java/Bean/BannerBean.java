package Bean;

public class BannerBean {
	private long mabanner;
	private String srcbanner;
	public BannerBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BannerBean(long mabanner, String srcbanner) {
		super();
		this.mabanner = mabanner;
		this.srcbanner = srcbanner;
	}
	public long getMabanner() {
		return mabanner;
	}
	public void setMabanner(long mabanner) {
		this.mabanner = mabanner;
	}
	public String getSrcbanner() {
		return srcbanner;
	}
	public void setSrcbanner(String srcbanner) {
		this.srcbanner = srcbanner;
	}
}
