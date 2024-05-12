package Bean;

public class ThongKeThu {
	private long year;
	private long month;
	private long day;
	private long thu;
	public ThongKeThu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThongKeThu(long year, long month, long day, long thu) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.thu = thu;
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
	public long getThu() {
		return thu;
	}
	public void setThu(long thu) {
		this.thu = thu;
	}
}
