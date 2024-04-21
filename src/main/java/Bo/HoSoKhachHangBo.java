package Bo;

import Bean.NoiNhanBean;
import Dao.HoSoKhachHangDao;

public class HoSoKhachHangBo {
	HoSoKhachHangDao hskhdao = new HoSoKhachHangDao();
	//xử lý sửa thông tin khách hàng
	public int suaThongTinKh(long makhachhang, String hoten, String diachi, String sodienthoai, String email, String anhdaidien) throws Exception{
		return hskhdao.suaThongTinKh(makhachhang, hoten, diachi, sodienthoai, email, anhdaidien);
	}
	
	//xử lý thêm nơi nhận hàng
	public int themNoiNhanHang(long makhachhang, String thanhpho, String quan, String phuong, String sonha) throws Exception{
		return hskhdao.themNoiNhanHang(makhachhang, thanhpho, quan, phuong, sonha);
	}
	
	//xử lý lấy nơi nhận hàng
	public NoiNhanBean getNoiNhanHang(long makhachhang) throws Exception{
		return hskhdao.getNoiNhanHang(makhachhang);
	}
	
	//xử lý sửa nơi nhận hàng
	public int suaNoiNhanHang(long makhachhang, String thanhpho, String quan, String phuong, String sonha) throws Exception{
		return hskhdao.suaNoiNhanHang(makhachhang, thanhpho, quan, phuong, sonha);
	}
}
