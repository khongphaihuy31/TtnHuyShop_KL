package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ButtonGroup;

import Bean.GioHangBean;
import Bean.KhachHangBean;
import Bo.DonDatHangBo;
import Bo.DonHangChiTietBo;
//import Bo.GioHangBo;

/**
 * Servlet implementation class XacNhanThanhToanController
 */
@WebServlet("/XacNhanThanhToanController")
public class XacNhanThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XacNhanThanhToanController() {
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
			
			HttpSession session = request.getSession();
			KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
			DonDatHangBo ddhbo = new DonDatHangBo();
			ddhbo.themDonDatHang(khbean.getMakhachhang(), phuongthucthanhtoan, thanhtoan, tongdongia, diachinhanhang);
			long madonvuathem = ddhbo.getMaxHD();
			DonHangChiTietBo dhctbo = new DonHangChiTietBo();
//			GioHangBo giohang = (GioHangBo)session.getAttribute("giohang");
//			for(GioHangBean sp: giohang.dsSP) {
//				dhctbo.themChiTietHD(madonvuathem, sp.getMasanpham(), sp.getSoluongmua(), sp.getMausanpham(), sp.getSize());
//			}
			System.out.print(request.getParameter("thanhtoan"));
			session.removeAttribute("giohang");
			response.sendRedirect("HoSoKhachHangController?donmua=1&btnchoxacnhan=1");
			
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
