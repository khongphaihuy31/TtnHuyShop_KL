package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Param;

import Bo.AdminSanPhamBo;

/**
 * Servlet implementation class AdminSuaMoTa
 */
@WebServlet("/AdminSuaMoTa")
public class AdminSuaMoTa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSuaMoTa() {
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
			
			if(request.getParameter("btnsuamotasanpham")!= null) {
				String btnsuamotasanpham = request.getParameter("btnsuamotasanpham");
				long masanpham = Long.parseLong(btnsuamotasanpham);
				//cập nhật mô tả
				String motasanpham = request.getParameter("FCKeditor1");
				AdminSanPhamBo adspbo = new AdminSanPhamBo();
				adspbo.capNhatMoTaSanPham(masanpham, motasanpham);
				response.sendRedirect("AdminSuaSanPham?msp="+masanpham);
				return;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminSuaMoTa.jsp");
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
