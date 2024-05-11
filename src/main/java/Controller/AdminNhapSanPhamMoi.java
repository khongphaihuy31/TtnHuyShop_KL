package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AnhSanPham;
import Bean.DanhMucBean;
import Bean.LoaiBean;
import Bean.SanPhamBean;
import Bean.SizeSanPhamBean;
import Bean.ThuongHieuBean;
import Bo.AdminLoaiBo;
import Bo.AdminSanPhamBo;
import Bo.DanhMucBo;
import Bo.LoaiBo;

/**
 * Servlet implementation class AdminNhapSanPhamMoi
 */
@WebServlet("/AdminNhapSanPhamMoi")
public class AdminNhapSanPhamMoi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNhapSanPhamMoi() {
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
			
			//Xử lý nhập sản phẩm đã có trong cửa hàng
			String btnnhapcu = request.getParameter("btnnhapcu");
			if(btnnhapcu !=null) {
				String msp = request.getParameter("msp");
				long masanpham = Long.parseLong(msp);
				AdminSanPhamBo adspbo = new AdminSanPhamBo();
				SanPhamBean spnhapdacotrongcuahang = adspbo.getSanPham(masanpham);
				request.setAttribute("spnhapdacotrongcuahang", spnhapdacotrongcuahang);
				
				//Lấy danh sách size đã có  ở sản phẩm
				ArrayList<AnhSanPham> dsAnhSanPham = adspbo.dsAnhSanPham(masanpham);
				request.setAttribute("dsAnhSanPham", dsAnhSanPham);
				
				ArrayList<SizeSanPhamBean> dsSizeSanPham = adspbo.dsSizeSanPham(masanpham);
				request.setAttribute("dsSizeSanPham", dsSizeSanPham);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminNhapSanPhamMoi.jsp");
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
