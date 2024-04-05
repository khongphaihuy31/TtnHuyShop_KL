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

import Bean.DonMuaBean;
import Bean.GioHangBean;
import Bean.KhachHangBean;
import Bean.NoiNhanBean;
import Bo.DonMuaBo;
//import Bo.GioHangBo;
import Bo.HoSoKhachHangBo;
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
			
			String btnluu = request.getParameter("btnluu");
			if(btnluu != null) {
				HttpSession session = request.getSession();
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");	
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				String hoten = request.getParameter("hoten");
				String diachi = request.getParameter("diachi");
				String sodienthoai = request.getParameter("sodienthoai");
				String email = request.getParameter("email");
				int n = hskhbo.suaThongTinKh(khbean.getMakhachhang(), hoten, diachi, sodienthoai, email);
				if(n ==1) {
					response.sendRedirect("DangNhapController?suathongtin=1&taikhoan="+khbean.getTendangnhap()+"&matkhau="+khbean.getMatkhau());
					return;
				}
			}
			
			String btnlocationthem = request.getParameter("btnlocationthem");
			if(btnlocationthem != null) {
				String thanhpho = request.getParameter("thanhpho");
				String quan = request.getParameter("quan");
				String phuong = request.getParameter("phuong");
				String sonha = request.getParameter("sonha");
				HttpSession session = request.getSession();
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");	
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				int nn = hskhbo.themNoiNhanHang(khbean.getMakhachhang(), thanhpho, quan, phuong, sonha);
				if(nn == 1) {
					NoiNhanBean noiNhanBean= hskhbo.getNoiNhanHang(khbean.getMakhachhang());
					session.setAttribute("noinhan", noiNhanBean);
					response.sendRedirect("HoSoKhachHangController?location=1");
					return;
				}
			}
			
			String btnlocationluu = request.getParameter("btnlocationluu");
			if(btnlocationluu != null) {
				String thanhpho = request.getParameter("thanhpho");
				String quan = request.getParameter("quan");
				String phuong = request.getParameter("phuong");
				String sonha = request.getParameter("sonha");
				HttpSession session = request.getSession();
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");	
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				hskhbo.suaNoiNhanHang(khbean.getMakhachhang(), thanhpho, quan, phuong, sonha);
				response.sendRedirect("HoSoKhachHangController?location=1");
				return;
			}
			
			HttpSession session = request.getSession();
			HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
			KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
			if(khbean != null) {
				NoiNhanBean noiNhanBean= hskhbo.getNoiNhanHang(khbean.getMakhachhang());
				if(noiNhanBean != null) {
					session.setAttribute("noinhan", noiNhanBean);
				}
			}
			
			//lấy sản phẩm chờ xác nhận và sản phẩm đã giao
			DonMuaBo dmbo = new DonMuaBo();
			ArrayList<DonMuaBean> dsSPChoXacNhan = dmbo.getSPChoXacNhan(khbean.getMakhachhang());
			request.setAttribute("dsSPChoXacNhan", dsSPChoXacNhan);
			
			ArrayList<DonMuaBean> dsSPDaGiao = dmbo.getSPDagiao(khbean.getMakhachhang());
			request.setAttribute("dsSPDaGiao", dsSPDaGiao);
			
			
//			GioHangBo sp;
//			ArrayList<GioHangBean> dsSP = null;
//			if(session.getAttribute("giohang") != null) {
//				sp = (GioHangBo)session.getAttribute("giohang")	;
//				dsSP = sp.dsSP;
//			}
//			request.setAttribute("dsSP", dsSP);
					
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
