package Controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Bean.DanhMucBean;
import Bean.LoaiBean;
import Bean.SanPhamBean;
import Bean.ThuongHieuBean;
import Bo.AdminLoaiBo;
import Bo.AdminSanPhamBo;
import Bo.DanhMucBo;
import Bo.LoaiBo;

/**
 * Servlet implementation class AdminSanPhamController
 */
@WebServlet("/AdminSanPhamController")
public class AdminSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSanPhamController() {
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
			
			//Lấy danh sách loại
			AdminLoaiBo lbo = new AdminLoaiBo();
			ArrayList<LoaiBean> dsloai ;
			dsloai = lbo.dsLoai();
			request.setAttribute("dsloai", dsloai);
			
			//Lấy danh sách danh mục
			DanhMucBo dmbo = new DanhMucBo();
			ArrayList<DanhMucBean> dsdanhmuc ;
			dsdanhmuc = dmbo.dsDanhMuc();
			request.setAttribute("dsdanhmuc", dsdanhmuc);
			
			//Lấy danh sách thương hiệu
			LoaiBo lthbo = new LoaiBo();
			ArrayList<ThuongHieuBean> dsthuonghieu;
			dsthuonghieu = lthbo.getTenLoaiDMThuongHieu();
			request.setAttribute("dsthuonghieu", dsthuonghieu);
			
			
			//Lấy danh sách sản phẩm
			AdminSanPhamBo spbo = new AdminSanPhamBo();
			ArrayList<SanPhamBean> dssanpham;
			dssanpham = spbo.dsSanPham();
			request.setAttribute("dssanpham", dssanpham);
			
			//Xóa sản phẩm
			String btnxoa = request.getParameter("btnxoa");
			if(btnxoa != null) {
				long masanpham = Long.parseLong(request.getParameter("masanpham"));
				spbo.xoaSanPham(masanpham);
				response.sendRedirect("AdminSanPhamController");
				return;
			}
			
			//Sửa sản phẩm
			String btnsua= request.getParameter("btnsua");
			if(btnsua != null) {
				long masanpham = Long.parseLong(btnsua);
				String tensanpham = request.getParameter("tensanpham");
				long giacu = Long.parseLong(request.getParameter("giacu"));
				long giamoi = Long.parseLong(request.getParameter("giamoi"));
				long soluongdaban = Long.parseLong(request.getParameter("soluongdaban"));
				String motasanpham = request.getParameter("motasanpham");
				String chitietsanpham = request.getParameter("chitietsanpham");
				long maloai = Long.parseLong(request.getParameter("maloai"));
				long mathuonghieu = Long.parseLong(request.getParameter("mathuonghieu"));
				long madanhmuc = Long.parseLong(request.getParameter("madanhmuc"));
				
				spbo.suaSanPham(masanpham, tensanpham, giacu, giamoi, soluongdaban, motasanpham, chitietsanpham, maloai, mathuonghieu, madanhmuc);
				response.sendRedirect("AdminSanPhamController");
				return;
			}
					
					
			RequestDispatcher rd = request.getRequestDispatcher("AdminSanPham.jsp");
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
