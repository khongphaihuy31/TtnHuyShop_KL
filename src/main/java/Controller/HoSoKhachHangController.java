package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.DonDatHangBean;
import Bean.DonMuaBean;
import Bean.GioHangBean;
import Bean.KhachHangBean;
import Bean.NoiNhanBean;
import Bo.DonDatHangBo;
import Bo.DonMuaBo;
import Bo.GioHangBo;
//import Bo.GioHangBo;
import Bo.HoSoKhachHangBo;
import Bo.KhachHangBo;
import Bo.LoaiBo;

/**
 * Servlet implementation class HoSoKhachHangController
 */
@WebServlet("/HoSoKhachHangController")
public class HoSoKhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HoSoKhachHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			//Xử lý lấy danh sách loại
			LoaiBo lbo = new LoaiBo();
			request.setAttribute("dsTenLoaiDMTatCa", lbo.getTenLoaiDMTatCa());
			request.setAttribute("dsTenLoaiDMThuongHieu", lbo.getTenLoaiDMThuongHieu());
			request.setAttribute("dsTenLoaiDMDoNam", lbo.getTenLoaiDMDoNam());
			request.setAttribute("dsTenLoaiDMDoNu", lbo.getTenLoaiDMDoNu());
			request.setAttribute("dsTenLoaiDMTreEm", lbo.getTenLoaiDMTreEm());			
			
//			String btnluu = request.getParameter("btnluu");
//			if(btnluu != null) {
//				HttpSession session = request.getSession();
//				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");	
//				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
//				String hoten = request.getParameter("hoten");
//				String diachi = request.getParameter("diachi");
//				String sodienthoai = request.getParameter("sodienthoai");
//				String email = request.getParameter("email");
//				String anhDaiDien = request.getParameter("anhDaiDien");
//				int n = hskhbo.suaThongTinKh(khbean.getMakhachhang(), hoten, diachi, sodienthoai, email, anhDaiDien);
//				if(n ==1) {
//					response.sendRedirect("DangNhapController?suathongtin=1&taikhoan="+khbean.getTendangnhap()+"&matkhau="+khbean.getMatkhau());
//					return;
//				}
//			}
			
			if(request.getParameter("btnThemLocation") != null) {
				String tenTinhThanh = request.getParameter("tenTinhThanh");
				String tenQuanHuyen = request.getParameter("tenQuanHuyen");
				String tenPhuongXa = request.getParameter("tenPhuongXa");
				String sonha = request.getParameter("locationDetail");
				String diachi = sonha+", "+tenPhuongXa+", "+tenQuanHuyen+", "+tenTinhThanh+".";
				;
				HttpSession session = request.getSession();
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");	
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				int nn = hskhbo.themNoiNhanHang(khbean.getMakhachhang(), tenTinhThanh, tenQuanHuyen, tenPhuongXa, sonha);
				hskhbo.capNhatDiaChi(khbean.getMakhachhang(), diachi);
				if(nn == 1) {
					response.sendRedirect("HoSoKhachHangController?location=1&themlocation=1");
					return;
				}
			}
			
			if(request.getParameter("btnLuuLocation") != null) {
				String tenTinhThanh = request.getParameter("tenTinhThanh");
				String tenQuanHuyen = request.getParameter("tenQuanHuyen");
				String tenPhuongXa = request.getParameter("tenPhuongXa");
				String sonha = request.getParameter("locationDetail");
				String diachi = sonha+", "+tenPhuongXa+", "+tenQuanHuyen+", "+tenTinhThanh+".";
				System.out.print(diachi);
				HttpSession session = request.getSession();
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");	
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				hskhbo.suaNoiNhanHang(khbean.getMakhachhang(), tenTinhThanh, tenQuanHuyen, tenPhuongXa, sonha);
				hskhbo.capNhatDiaChi(khbean.getMakhachhang(), diachi);
				response.sendRedirect("HoSoKhachHangController?location=1&capnhatlocation=1");
				return;
			}
			
			HttpSession session = request.getSession();
			HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
			KhachHangBean kh = (KhachHangBean)session.getAttribute("dn");
			KhachHangBo khbo = new KhachHangBo();
			KhachHangBean khbean = khbo.ktradangnhap(kh.getTendangnhap(),kh.getMatkhau());
			session.removeAttribute("dn");
			session.setAttribute("dn", khbean);
			if(khbean != null) {
				NoiNhanBean noiNhanBean= hskhbo.getNoiNhanHang(khbean.getMakhachhang());
				if(noiNhanBean != null) {
					request.setAttribute("noinhan", noiNhanBean);
				}
			}
			
			//lấy sản phẩm chờ xác nhận
			DonMuaBo dmbo = new DonMuaBo();
			ArrayList<DonMuaBean> dsSPChoXacNhan = dmbo.getSPChoXacNhan(khbean.getMakhachhang());
			request.setAttribute("dsSPChoXacNhan", dsSPChoXacNhan);
			//lấy sản phẩm chuẩn bị đơn
			ArrayList<DonMuaBean> dsSPChuanBi = dmbo.getSPDagiao(khbean.getMakhachhang());
			request.setAttribute("dsSPChuanBi", dsSPChuanBi);
			
			
			// xử lý lấy danh sách hóa đơn chờ xác nhận
			DonDatHangBo ddhbo = new DonDatHangBo();
			ArrayList<DonDatHangBean> dshdchoxacnhan = ddhbo.dsdonchoxacnhan(khbean.getMakhachhang());
			request.setAttribute("dshdchoxacnhan", dshdchoxacnhan);
			// xử lý lấy danh sách hóa đơn đang chuẩn bị
			ArrayList<DonDatHangBean> dshddangchuanbi = ddhbo.dsdonchuanbi(khbean.getMakhachhang());
			request.setAttribute("dshddangchuanbi", dshddangchuanbi);
			
			GioHangBo ghbo = new GioHangBo();
			if(session.getAttribute("dn")!= null) {			
				request.setAttribute("giohang", ghbo.getSanPhamTrongGio(khbean.getMakhachhang()));
			}else {
				ArrayList<GioHangBean> giohang = null;
				request.setAttribute("giohang", giohang);
			}
			
//			GioHangBo sp;
//			ArrayList<GioHangBean> dsSP = null;
//			if(session.getAttribute("giohang") != null) {
//				sp = (GioHangBo)session.getAttribute("giohang")	;
//				dsSP = sp.dsSP;
//			}
//			request.setAttribute("dsSP", dsSP);
			if(request.getParameter("thanhtoan")!= null) {
				if(request.getParameter("thanhtoan").equals("thanhcong")) {
					long madonvuathem = ddhbo.getMaxHD(khbean.getMakhachhang());
					ddhbo.capNhatDaThanhToan(madonvuathem, khbean.getMakhachhang());
				}
			}
			
			
			
					
			RequestDispatcher rd = request.getRequestDispatcher("hosokhachhang.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
