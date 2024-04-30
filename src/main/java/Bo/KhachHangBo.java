package Bo;

import java.util.ArrayList;

import Bean.KhachHangBean;
import Dao.KhachHangDao;

public class KhachHangBo {
	KhachHangDao khdao = new KhachHangDao();
//	Kiểm tra đăng nhập
	public KhachHangBean ktradangnhap(String tendangnhap, String matkhau) throws Exception {
		return khdao.ktradangnhap(tendangnhap, matkhau);
	}
//	Kiểm tra tên đăng nhập khi đăng kí
	public int ktradangki(String tendangnhap, String sodienthoai) throws Exception{
		return khdao.ktradangki(tendangnhap, sodienthoai);
	}
//	Đăng kí khách hàng
	public int dangkikhachhang(String hoten, String diachi, String sodienthoai, String email, String tendangnhap, String matkhau) throws Exception{
		return khdao.dangkikhachhang(hoten, diachi, sodienthoai, email, tendangnhap, matkhau);
	}
	
//xử lý điểm tích lũy cho khách hàng	
	public int capNhatDiem(long makhachhang, long tichdiem) throws Exception{
		return khdao.capNhatDiem(makhachhang, tichdiem);
	}
	// Xử lý lấy điểm tích lũy hiện tại
	public long getTichDiem(long makhachhang)throws Exception {
		return khdao.getTichDiem(makhachhang);
	}
	//xử lý đổi mật khẩu	
	public int doiPass(long makhachhang, String pass) throws Exception{
		return khdao.doiPass(makhachhang, pass);
	}
	
	//Lấy khách hàng theo mã khách hàng
	public KhachHangBean getKhachHang(long mkh) throws Exception{
		return khdao.getKhachHang(mkh);
	}
	
	//Kiểm tra quên mật khẩu
	public KhachHangBean ktraQuenPass(String email, String sodienthoai)throws Exception {
		return khdao.ktraQuenPass(email, sodienthoai);
	}
	
	//xử lý cập nhật mã code	
	public int capNhatCode(String email, String code) throws Exception{
		return khdao.capNhatCode(email, code);
	}
	
	//xử lý lấy mã code để so sánh
	public String getMaCode(String email)throws Exception {
		return khdao.getMaCode(email);
	}
	
	//xử lý đổi mật khẩu theo email	
	public int doiPassTheoEmail(String email, String pass) throws Exception{
		return khdao.doiPassTheoEmail(email, pass);
	}
	
	//Xử lý lấy danh sách số điện thoại của khách hàng
	public ArrayList<String> getdsSoDienThoai()throws Exception{
		return khdao.getdsSoDienThoai();
	}
	
	//Xử lý lấy danh sách email của khách hàng
	public ArrayList<String> getdsEmail()throws Exception{
		return khdao.getdsEmail();
	}
}
