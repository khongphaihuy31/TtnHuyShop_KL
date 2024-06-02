package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.KhachHangBean;

/**
 * Servlet implementation class ChuyenKhoanController
 */
@WebServlet("/ChuyenKhoan")
public class ChuyenKhoanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChuyenKhoanController() {
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

			HttpSession session = request.getSession();
			KhachHangBean khbean = (KhachHangBean) session.getAttribute("dn");
			String madonvuathem =  request.getParameter("madonvuathem");
			String tongdongia =  request.getParameter("tienthanhtoan");
			String noiDungChuyenKhoan = madonvuathem+"" + khbean.getMakhachhang();
			request.setAttribute("noiDungChuyenKhoan", noiDungChuyenKhoan);
			request.setAttribute("tienthanhtoan", tongdongia);
			
			RequestDispatcher rd = request.getRequestDispatcher("qrthanhtoan.jsp");
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
