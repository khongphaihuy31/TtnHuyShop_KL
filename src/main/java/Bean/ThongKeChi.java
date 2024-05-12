package Bean;

public class ThongKeChi {
	private long year;
	private long month;
	private long day;
	private long chi;
	public ThongKeChi() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThongKeChi(long year, long month, long day, long chi) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.chi = chi;
	}
	public long getYear() {
		return year;
	}
	public void setYear(long year) {
		this.year = year;
	}
	public long getMonth() {
		return month;
	}
	public void setMonth(long month) {
		this.month = month;
	}
	public long getDay() {
		return day;
	}
	public void setDay(long day) {
		this.day = day;
	}
	public long getChi() {
		return chi;
	}
	public void setChi(long chi) {
		this.chi = chi;
	}
	
}
