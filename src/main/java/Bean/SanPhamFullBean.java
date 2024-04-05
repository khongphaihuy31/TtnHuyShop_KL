package Bean;

public class SanPhamFullBean extends SanPhamBean{
	private String tenloai;
	private String tenthuonghieu;
	
	public SanPhamFullBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SanPhamFullBean(long masanpham, String tensanpham, String anh, long giaban, long giagiam, long soluongdaban,
			boolean sanphamhot, String motasanpham, long maloai, long mathuonghieu,
			long madanhmuc, String anhchonsize,String tenloai, String tenthuonghieu) {
		super(masanpham, tensanpham, anh, giaban, giagiam, soluongdaban, sanphamhot, motasanpham, maloai,
				mathuonghieu, madanhmuc, anhchonsize);
		this.tenloai = tenloai;
		this.tenthuonghieu = tenthuonghieu;
		// TODO Auto-generated constructor stub
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
	public String getTenthuonghieu() {
		return tenthuonghieu;
	}
	public void setTenthuonghieu(String tenthuonghieu) {
		this.tenthuonghieu = tenthuonghieu;
	} 

}
