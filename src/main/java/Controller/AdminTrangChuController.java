package Controller;

import java.io.IOException;
import java.util.ArrayList;

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
			
			//lấy danh sách khách hàng
			AdminKhachHangBo adkhbo = new AdminKhachHangBo();
			ArrayList<KhachHangBean> dskh;
			dskh = adkhbo.dskhachhang();
			request.setAttribute("dskhachhang", dskh);
			
			//lấy danh sách hóa đơn
			DonDatHangBo ddhbo = new DonDatHangBo();
			ArrayList<Long> dshoadon;
			dshoadon = ddhbo.dshoadonchoxacnhan();
			request.setAttribute("dshoadon", dshoadon);
			
			//lấy danh sách sản phẩm chưa xác nhận
			DonMuaBo dmbo = new DonMuaBo();
			ArrayList<DonMuaBean> dsSPChuaXacNhan;
			
			
			String mahoadon = request.getParameter("mahoadon");
			if(mahoadon !=null) {
				if(mahoadon.equals("All")){
					dsSPChuaXacNhan = dmbo.dsDonChuaXacNhan();
					request.setAttribute("dsSPChuaXacNhan", dsSPChuaXacNhan);
				}else if(mahoadon.equals("All") == false) {
					long mahoadon1 = Long.parseLong(mahoadon);
					dsSPChuaXacNhan = dmbo.dsDonChuaXacNhanTheoMaHD(mahoadon1);
					request.setAttribute("dsSPChuaXacNhan", dsSPChuaXacNhan);
					
				}
			}else {
				dsSPChuaXacNhan = dmbo.dsDonChuaXacNhan();
				request.setAttribute("dsSPChuaXacNhan", dsSPChuaXacNhan);
			}
				
			
					
			RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
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
