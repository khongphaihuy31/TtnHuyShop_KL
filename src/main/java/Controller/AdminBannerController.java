package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.BannerBean;
import Bo.BannerBo;

/**
 * Servlet implementation class AdminBannerController
 */
@WebServlet("/AdminBannerController")
public class AdminBannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerController() {
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
			
			//Lấy danh sách banner
			BannerBo bnbo = new BannerBo();
			ArrayList<BannerBean> dsbanner;
			dsbanner = bnbo.getDsBanner();
			request.setAttribute("dsbanner", dsbanner);
			//xử lý xóa banner
			String mabanner = request.getParameter("btnxoa");
			if(mabanner != null) {
				long mabannerLong = Long.parseLong(mabanner);
				bnbo.xoaBanner(mabannerLong);
				response.sendRedirect("AdminBannerController?xoabanner=1");
				return;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminBanner.jsp");
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
