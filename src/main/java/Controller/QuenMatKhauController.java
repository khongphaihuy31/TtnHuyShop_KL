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
					response.sendRedirect("TrangChuController?btnQuenPass = 1&sodienthoai="+sodienthoai+"&email="+email+"&matkhau="+kh.getMatkhau());
					return;
				}else {
					response.sendRedirect("TrangChuController?loiQuenPass = 1");
					return;
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
