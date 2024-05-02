package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Bean.LoaiBean;
import Bo.AdminLoaiBo;

/**
 * Servlet implementation class AdminLoaiSanPhamController
 */
@WebServlet("/AdminLoaiSanPhamController")
public class AdminLoaiSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoaiSanPhamController() {
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
			
			AdminLoaiBo lbo = new AdminLoaiBo();
			ArrayList<LoaiBean> dsloai ;
			dsloai = lbo.dsLoai();
			request.setAttribute("dsloai", dsloai);
			
			String btnthem = request.getParameter("btnthem");
			if(btnthem != null) {
				String tenloai = request.getParameter("tenloai");
				if(tenloai != null) {
					lbo.themLoai(tenloai);
					response.sendRedirect("AdminLoaiSanPhamController")	;
					return;
				}else {
					response.sendRedirect("AdminLoaiSanPhamController?tl=null")	;
					return;
				}
			}
			
			String btnsua = request.getParameter("btnsua");
			if(btnsua != null) {
				long maloai = Long.parseLong(btnsua);
				String tenloai = request.getParameter("tenloai");
				lbo.suaLoai(maloai, tenloai);
				response.sendRedirect("AdminLoaiSanPhamController")	;
				return;
			}
			
			String btnxoa = request.getParameter("btnxoa");
			if(btnxoa != null) {
				long maloai = Long.parseLong(request.getParameter("maloai"));
				lbo.xoaLoai(maloai);
				response.sendRedirect("AdminLoaiSanPhamController")	;
				return;
			}
			
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminLoai.jsp");
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
