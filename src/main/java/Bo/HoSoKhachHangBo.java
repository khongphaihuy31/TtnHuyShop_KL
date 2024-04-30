package Bo;

import java.util.ArrayList;

import Bean.NoiNhanBean;
import Dao.HoSoKhachHangDao;

public class HoSoKhachHangBo {
	HoSoKhachHangDao hskhdao = new HoSoKhachHangDao();
	//xử lý sửa thông tin khách hàng
	public int suaThongTinKh(long makhachhang, String hoten, String diachi, String sodienthoai, String email, String anhdaidien) throws Exception{
		return hskhdao.suaThongTinKh(makhachhang, hoten, diachi, sodienthoai, email, anhdaidien);
	}
	
	//Kiểm tra sửa thông tin khách hàng
	public int ktraSuaThongTinKh(String email, String sodienthoai, long makhachhang)throws Exception {
		return hskhdao.ktraSuaThongTinKh(email, sodienthoai, makhachhang);
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
	
	//xử lý cập nhật địa chỉ cho khách hàng	
	public int capNhatDiaChi(long makhachhang, String diachi) throws Exception{
		return hskhdao.capNhatDiaChi(makhachhang, diachi);
	}
	//Xử lý lấy danh sách email của các khách hàng khác
	public ArrayList<String> getdsEmail(long makhachhang)throws Exception{
		return hskhdao.getdsEmail(makhachhang);
	}
	//xử lý đổi email theo mã khách hàng 
	public int doiEmailTheoMakhachhang(String email, long makhachhang) throws Exception{
		return hskhdao.doiEmailTheoMakhachhang(email, makhachhang);
	}
}
