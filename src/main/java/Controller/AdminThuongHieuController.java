package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.ThuongHieuBean;
import Bo.AdminLoaiTrongDanhMucBo;
import Bo.AdminSanPhamBo;
import Bo.AdminThuongHieuBo;

/**
 * Servlet implementation class AdminThuongHieuController
 */
@WebServlet("/AdminThuongHieuController")
public class AdminThuongHieuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminThuongHieuController() {
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
			
			//Lấy danh sách thương hiệu
			AdminThuongHieuBo adthbo =  new AdminThuongHieuBo();
			ArrayList<ThuongHieuBean> dsthuonghieu;
			dsthuonghieu = adthbo.getDsThuongHieu();
			request.setAttribute("dsthuonghieu", dsthuonghieu);
			
			//Xử lý thêm thương hiệu
			String btnthem = request.getParameter("btnthem");
			if(btnthem != null) {
				String tenthuonghieu = request.getParameter("tenthuonghieu");
				if(tenthuonghieu != null && tenthuonghieu.trim()!= "") {
					adthbo.themThuongHieu(tenthuonghieu);
					response.sendRedirect("AdminThuongHieuController?tthTC=1");
					return;
//					System.out.print("ok đấy");
				}else {
					response.sendRedirect("AdminThuongHieuController?tth=null")	;
					return;
//					System.out.print("ko ok lắm");
				}
			}
			
			//Xử lý sửa thương hiệu
			String btnsua = request.getParameter("btnsua");
			if(btnsua != null) {
				long mathuonghieu = Long.parseLong(btnsua);
				String tenthuonghieu = request.getParameter("tenthuonghieu");
				if(tenthuonghieu != null && tenthuonghieu.trim()!= "") {
					adthbo.suaThuongHieu(mathuonghieu, tenthuonghieu);
					response.sendRedirect("AdminThuongHieuController?sthTC=1")	;
					return;
				}else {
					response.sendRedirect("AdminThuongHieuController?sth=null")	;
					return;
				}
			}
			
			//Xử lý xóa thương hiệu
			String btnxoa = request.getParameter("btnxoa");
			if(btnxoa != null) {
				long mathuonghieu = Long.parseLong(btnxoa);
				adthbo.xoaSanPhamThuocThuongHieu(mathuonghieu);
				adthbo.xoaThuongHieu(mathuonghieu);
				response.sendRedirect("AdminThuongHieuController?xthTC=1");
				return;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminThuongHieu.jsp");
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
