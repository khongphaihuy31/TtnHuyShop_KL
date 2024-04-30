package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.KhachHangBean;
import Bo.KhachHangBo;

/**
 * Servlet implementation class QuenMatKhauController
 */
@WebServlet("/QuenMatKhauController")
public class QuenMatKhauController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuenMatKhauController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			if(request.getParameter("btnQuenPass")!= null) {
				String sodienthoai = request.getParameter("sodienthoai");
				String email = request.getParameter("email");
				KhachHangBo khbo = new KhachHangBo();
				KhachHangBean kh = khbo.ktraQuenPass(email, sodienthoai);
				if(kh != null) {
					response.sendRedirect("TrangChuController?btnQuenPass=1&email="+email);
					return;
				}else {
					response.sendRedirect("TrangChuController?loiQuenPass=1");
					return;
				}
			}
			
			if(request.getParameter("btnCode")!= null) {
				if(request.getParameter("btnCode").equals("ChuaDungLanDau")) {
					String codeNhap = request.getParameter("code");
					String btnCodeEmail = request.getParameter("btnCodeEmail");
					KhachHangBo khbo = new KhachHangBo();
					String codeGui= khbo.getMaCode(btnCodeEmail);
					if(codeNhap.equals(codeGui)) {
						khbo.capNhatCode(btnCodeEmail, null);
						response.sendRedirect("TrangChuController?btnDoiPassMoi=1&email="+btnCodeEmail);
						return;
					}else {
						response.sendRedirect("TrangChuController?btnDoiPassMoiLoi=1&email="+btnCodeEmail);
						return;
					}
				}else {
					String codeGui = request.getParameter("btnCode");
					String codeNhap = request.getParameter("code");
					String btnCodeEmail = request.getParameter("btnCodeEmail");
					KhachHangBo khbo = new KhachHangBo();
					khbo.capNhatCode(btnCodeEmail, codeGui);
					if(codeNhap.equals(codeGui)) {
						khbo.capNhatCode(btnCodeEmail, null);
						response.sendRedirect("TrangChuController?btnDoiPassMoi=1&email="+btnCodeEmail);
						return;
					}else {
						response.sendRedirect("TrangChuController?btnDoiPassMoiLoi=1&email="+btnCodeEmail);
						return;
					}
				}
			}
			
			if(request.getParameter("btnDoiPass")!= null) {
				String email = request.getParameter("btnDoiPass");
				String matkhau1 = request.getParameter("matkhau1");
				String matkhau2 = request.getParameter("matkhau2");
				if(matkhau1.equals(matkhau2)) {
					KhachHangBo khbo = new KhachHangBo();
					int n = khbo.doiPassTheoEmail(email, matkhau2);
					if(n==1) {
						response.sendRedirect("TrangChuController?doiPassQuen=1");
						return;
					}
				}
			}
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
