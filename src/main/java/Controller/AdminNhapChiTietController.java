package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminNhapChiTietController
 */
@WebServlet("/AdminNhapChiTietController")
public class AdminNhapChiTietController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNhapChiTietController() {
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
			
			String tensanpham = request.getParameter("tensanpham");
			String gianhap = request.getParameter("gianhap");
			String giaban = request.getParameter("giaban");
			String maloai = request.getParameter("maloai");
			String mathuonghieu = request.getParameter("mathuonghieu");
			String madanhmuc = request.getParameter("madanhmuc");
			String motasanpham = request.getParameter("motasanpham");
			String anh = request.getParameter("anh");
			String anhchonsize =  request.getParameter("anhchonsize");
			String lsize1 = request.getParameter("lsize1");
			String lsize2 = request.getParameter("lsize2");
			String lsize3 =  request.getParameter("lsize3");
			String lsize4 = request.getParameter("lsize4");
			String lsize5 = request.getParameter("lsize5");
			String lmau1 = request.getParameter("lmau1");
			String anhmau1 = request.getParameter("anhmau1");
			String lmau2 =  request.getParameter("lmau2");
			String anhmau2 = request.getParameter("anhmau2");
			String lmau3 = request.getParameter("lmau3");
			String anhmau3 = request.getParameter("anhmau3");
			String lmau4 = request.getParameter("lmau4");
			String anhmau4 =  request.getParameter("anhmau4");
			String lmau5 = request.getParameter("lmau5");
			String anhmau5 = request.getParameter("anhmau5");
			
			//Lấy list size
			ArrayList<String> listSize = new ArrayList<String>();
			if(lsize1!= null) {
				listSize.add(lsize1);
			}
			if(lsize2!= null) {
				listSize.add(lsize2);
			}
			if(lsize3!= null) {
				listSize.add(lsize3);
			}
			if(lsize4!= null) {
				listSize.add(lsize4);
			}
			if(lsize5!= null) {
				listSize.add(lsize5);
			}
			
			//Lấy list màu
			ArrayList<String> listMau = new ArrayList<String>();
			if(lmau1!= null) {
				listMau.add(lmau1);
			}
			if(lmau2!= null) {
				listMau.add(lmau2);
			}
			if(lmau3!= null) {
				listMau.add(lmau3);
			}
			if(lmau4!= null) {
				listMau.add(lmau4);
			}
			if(lmau5!= null) {
				listMau.add(lmau5);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminNhapChiTiet.jsp");
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
