package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.GiamGiaBean;
import Bo.GiamGiaBo;

/**
 * Servlet implementation class AdminKhuyenMaiController
 */
@WebServlet("/AdminKhuyenMaiController")
public class AdminKhuyenMaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminKhuyenMaiController() {
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
			
			//Lấy danh sách khuyến mãi
			GiamGiaBo ggbo = new GiamGiaBo();
			ArrayList<GiamGiaBean> dskhuyenmai;
			dskhuyenmai = ggbo.getGiamGia();
			request.setAttribute("dskhuyenmai", dskhuyenmai);
			
			//Thêm khuyến mãi
			String btnthem = request.getParameter("btnthem");
			if(btnthem != null) {
				String tengiamgia = request.getParameter("tengiamgia");
				String tiengiam = request.getParameter("tiengiam");
				String dieukien = request.getParameter("dieukien");
				String mota = request.getParameter("mota");
				if(tengiamgia != null && tengiamgia.trim()!= ""
				&&tiengiam != null && tiengiam.trim()!= ""
				&&dieukien != null && dieukien.trim()!= ""
				&&mota != null && mota.trim()!= "") {
					long tiengiamlong = Long.parseLong(tiengiam);
					long dieukienlong = Long.parseLong(dieukien);
					ggbo.themKhuyenMai(tengiamgia, tiengiamlong, dieukienlong, mota);
					response.sendRedirect("AdminKhuyenMaiController?tkmTC=1");
					return;
				}else {
					response.sendRedirect("AdminKhuyenMaiController?tkmTB=1");
					return;
				}
			}
			
			//Sửa khuyến mãi
			String btnsua = request.getParameter("btnsua");
			if(btnsua != null) {
				String tengiamgia = request.getParameter("tengiamgia");
				String tiengiam = request.getParameter("tiengiam");
				String dieukien = request.getParameter("dieukien");
				String mota = request.getParameter("mota");
				if(tengiamgia != null && tengiamgia.trim()!= ""
				&&tiengiam != null && tiengiam.trim()!= ""
				&&dieukien != null && dieukien.trim()!= ""
				&&mota != null && mota.trim()!= "") {
					long tiengiamlong = Long.parseLong(tiengiam);
					long dieukienlong = Long.parseLong(dieukien);
					long magiamgia = Long.parseLong(btnsua);
					ggbo.suaKhuyenMai(magiamgia, tengiamgia, tiengiamlong, dieukienlong, mota);
					response.sendRedirect("AdminKhuyenMaiController?skmTC=1");
					return;
				}else {
					response.sendRedirect("AdminKhuyenMaiController?skmTB=1");
					return;
				}
			}
			
			//Xử lý xóa khuyến mãi
			String btnxoa = request.getParameter("btnxoa");
			if(btnxoa != null) {
				long magiamgia = Long.parseLong(btnxoa);
				ggbo.xoaKhuyenMai(magiamgia);
				response.sendRedirect("AdminKhuyenMaiController?xkmTC=1");
				return;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminKhuyenMai.jsp");
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
