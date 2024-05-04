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
import Bo.AdminLoaiTrongDanhMucBo;
import Bo.AdminSanPhamBo;

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
				if(tenloai != null && tenloai.trim()!= "") {
					lbo.themLoai(tenloai);
					response.sendRedirect("AdminLoaiSanPhamController?tlTC=1");
					return;
//					System.out.print("ok đấy");
				}else {
					response.sendRedirect("AdminLoaiSanPhamController?tl=null")	;
					return;
//					System.out.print("ko ok lắm");
				}
			}
			
			String btnsua = request.getParameter("btnsua");
			if(btnsua != null) {
				long maloai = Long.parseLong(btnsua);
				String tenloai = request.getParameter("tenloai");
				if(tenloai != null && tenloai.trim()!= "") {
					lbo.suaLoai(maloai, tenloai);
					response.sendRedirect("AdminLoaiSanPhamController?slTC=1")	;
					return;
				}else {
					response.sendRedirect("AdminLoaiSanPhamController?sl=null")	;
					return;
				}
			}
			
			String btnxoa = request.getParameter("btnxoa");
			if(btnxoa != null) {
				long maloai = Long.parseLong(request.getParameter("maloai"));
				AdminSanPhamBo adspbo = new AdminSanPhamBo();
				adspbo.xoaSanPhamThuocLoai(maloai);
				AdminLoaiTrongDanhMucBo adltdmbo =  new AdminLoaiTrongDanhMucBo();
				adltdmbo.xoaLoaiTrongDanhMucThuocLoai(maloai);
				lbo.xoaLoai(maloai);
				response.sendRedirect("AdminLoaiSanPhamController?xlTC=1");
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
