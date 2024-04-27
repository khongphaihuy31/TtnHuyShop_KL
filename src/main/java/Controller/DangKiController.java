package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DangKiController
 */
@WebServlet("/DangKiController")
public class DangKiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKiController() {
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
			
			String hoten = request.getParameter("hoten");
//			String diachi = request.getParameter("diachi");
			String sodienthoai = request.getParameter("sodienthoai");
			String email = request.getParameter("email");
//			String taikhoan = request.getParameter("taikhoan");
			String matkhau1 = request.getParameter("matkhau1");
			String matkhau2 = request.getParameter("matkhau2");
			
			if(hoten != null && sodienthoai!=null && email!= null && matkhau1!= null && matkhau2 != null) {
				Bo.KhachHangBo khbo = new Bo.KhachHangBo();
				int ktrataikhoan = khbo.ktradangki(email, sodienthoai);
				if(ktrataikhoan == 0) {
					if(matkhau1.equals(matkhau2)) {
						int ktdk = khbo.dangkikhachhang(hoten, null, sodienthoai, email, null, matkhau1);
						if(ktdk == 1) {
							response.sendRedirect("DangNhapController?taikhoan=" + sodienthoai+"&matkhau="+ matkhau1);
						}else {
							response.sendRedirect("TrangChuController?loidangki=1");
						}
					}else {
						response.sendRedirect("TrangChuController?loidangki=1");
					}
				}else {
					response.sendRedirect("TrangChuController?loidangki=1&hotendk="+hoten+"&sodienthoaidk="+sodienthoai+"&emaildk="+email+"&matkhau1dk="+matkhau1+"&matkhau2dk="+matkhau2);
				}
			}else {
				response.sendRedirect("TrangChuController?loidangki=1");
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
