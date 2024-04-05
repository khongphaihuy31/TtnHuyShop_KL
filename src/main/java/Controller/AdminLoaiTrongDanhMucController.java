package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AdminLoaiThuocDanhMucBean;
import Bean.DanhMucBean;
import Bean.LoaiBean;
import Bo.AdminLoaiBo;
import Bo.AdminLoaiTrongDanhMucBo;
import Bo.DanhMucBo;

/**
 * Servlet implementation class AdminLoaiTrongDanhMucController
 */
@WebServlet("/AdminLoaiTrongDanhMucController")
public class AdminLoaiTrongDanhMucController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoaiTrongDanhMucController() {
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
			
			//Lấy danh sách danh mục
			DanhMucBo dmbo = new DanhMucBo();
			ArrayList<DanhMucBean> dsdanhmuc ;
			dsdanhmuc = dmbo.dsDanhMuc();
			request.setAttribute("dsdanhmuc", dsdanhmuc);
			
			//Lấy danh sách loại
			AdminLoaiBo lbo = new AdminLoaiBo();
			ArrayList<LoaiBean> dsloai ;
			dsloai = lbo.dsLoai();
			request.setAttribute("dsloai", dsloai);
			
			//Lấy danh sách loại trong danh mục
			AdminLoaiTrongDanhMucBo ltdmbo = new AdminLoaiTrongDanhMucBo();
			ArrayList<AdminLoaiThuocDanhMucBean> dsloaitrongdanhmuc ;
			dsloaitrongdanhmuc = ltdmbo.dsLoaiTrongDanhMuc();
			request.setAttribute("dsloaitrongdanhmuc", dsloaitrongdanhmuc);		
			
			//Thêm loại vào danh mục
			String btnthem = request.getParameter("btnthem");
			if(btnthem != null) {
				String madanhmuc = request.getParameter("madanhmuc");
				String maloai = request.getParameter("maloai");
				if(madanhmuc.equals("null") || maloai.equals("null")) {
					response.sendRedirect("AdminLoaiTrongDanhMucController?mdm=null");
					return;
				}else {
					long maloai1 = Long.parseLong(maloai);
					long madanhmuc1 = Long.parseLong(madanhmuc);
					int ktraLoaiTrongDanhMuc = ltdmbo.ktraThemLoaiTrongDanhMuc(maloai1, madanhmuc1);
					if(ktraLoaiTrongDanhMuc == 0) {
						String tenloai = ltdmbo.timTenLoai(maloai1);
						ltdmbo.themLoaiTrongDanhMuc(maloai1, tenloai, madanhmuc1);
						response.sendRedirect("AdminLoaiTrongDanhMucController");
						return;
					}else {
						response.sendRedirect("AdminLoaiTrongDanhMucController?kiemtra = 1");
						return;
					}
				}
			}
			
			//Sửa loại trong danh mục
			String btnsua = request.getParameter("btnsua");
			if(btnsua != null) {
				long madanhmuccu = Long.parseLong(request.getParameter("madanhmuccu"));
				long maloai = Long.parseLong(request.getParameter("maloai"));
				long madanhmucmoi = Long.parseLong(request.getParameter("madanhmucmoi"));
				
				ltdmbo.suaLoaiTrongDanhMuc(maloai, madanhmuccu, madanhmucmoi);
				response.sendRedirect("AdminLoaiTrongDanhMucController");
				return;
			}
			
			//Xóa loại trong danh mục
			String btnxoa = request.getParameter("btnxoa");
			if(btnxoa != null) {
				long madanhmuc = Long.parseLong(request.getParameter("madanhmuc"));
				long maloai = Long.parseLong(request.getParameter("maloai"));
				
				ltdmbo.xoaLoaiTrongDanhMuc(maloai, madanhmuc);
				response.sendRedirect("AdminLoaiTrongDanhMucController");
				return;
			}
					
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminLoaiTrongDanhMuc.jsp");
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
