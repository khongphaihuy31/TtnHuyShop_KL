package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.DonMuaBean;
import Bean.KhachHangBean;
import Bo.AdminKhachHangBo;
import Bo.DonDatHangBo;
import Bo.DonMuaBo;
import Bo.SanPhamBo;

/**
 * Servlet implementation class AdminTrangChuController
 */
@WebServlet("/AdminTrangChuController")
public class AdminTrangChuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTrangChuController() {
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
			
			Date n1 = new Date();
			SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
			String tam  = dd.format(n1);
			//lấy tổng doanh thu trong ngày
			DonDatHangBo ddhbo = new DonDatHangBo();
			request.setAttribute("tongdoanhthutrongngay", ddhbo.getDoanhThuTrongNgay(tam));
			
			//lấy danh sách khách hàng
			AdminKhachHangBo adkhbo = new AdminKhachHangBo();
			ArrayList<KhachHangBean> dskh;
			dskh = adkhbo.dskhachhang();
			request.setAttribute("dskhachhang", dskh);
			
			//lấy số lượng sản phẩm mà cửa hàng có
			SanPhamBo spbo = new SanPhamBo();
			request.setAttribute("soluongsanpham", spbo.getSLSanPham());
			
			//lấy danh sách hóa đơn chưa xác nhận
			ArrayList<Long> dshoadon;
			dshoadon = ddhbo.dshoadonchuagiao();
			request.setAttribute("dshoadon", dshoadon);
					
			RequestDispatcher rd = request.getRequestDispatcher("AdminTrangChu.jsp");
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
