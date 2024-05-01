package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.DonDatHangBean;
import Bean.DonMuaBean;
import Bean.KhachHangBean;
import Bo.AdminKhachHangBo;
import Bo.AdminXacNhanBo;
import Bo.DonDatHangBo;
import Bo.DonMuaBo;

/**
 * Servlet implementation class AdminXacNhanController
 */
@WebServlet("/AdminXacNhanController")
public class AdminXacNhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminXacNhanController() {
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
			
			//Xử lý xác nhận sang trạng thái chuẩn bị đơn
			String xacnhan = request.getParameter("xacnhan");
			if(xacnhan != null) {
				long mahoadon = Long.parseLong(request.getParameter("maxacnhan"));
				AdminXacNhanBo xnbo = new AdminXacNhanBo();
				xnbo.suaTinhTrangHD(mahoadon);
			}
			
			//lấy danh sách khách hàng
			AdminKhachHangBo adkhbo = new AdminKhachHangBo();
			ArrayList<KhachHangBean> dskh;
			dskh = adkhbo.dskhachhang();
			request.setAttribute("dskhachhang", dskh);
			
			//lấy danh sách mã hóa đơn chưa giao
			DonDatHangBo ddhbo = new DonDatHangBo();
			ArrayList<Long> dshoadon;
			dshoadon = ddhbo.dshoadonchuagiao();
			request.setAttribute("dshoadon", dshoadon);
			
			//lấy danh sách hóa đơn chưa giao
			request.setAttribute("dshdchoxacnhan", (ArrayList<DonDatHangBean>)ddhbo.dsdonchuagiao());
			
			//Lấy danh sách sản phẩm chưa giao
			DonMuaBo dmbo = new DonMuaBo();
			request.setAttribute("dsSPChoXacNhan", (ArrayList<DonMuaBean>)dmbo.getSPChuaGiao());
			
			//lấy danh sách sản phẩm chưa xác nhận
			ArrayList<DonMuaBean> dsSPChuaXacNhan;
			String mahoadon = request.getParameter("mahoadon");
			if(mahoadon !=null) {
				if(mahoadon.equals("All")){
					dsSPChuaXacNhan = dmbo.dsDonChuaXacNhan();
					request.setAttribute("dsSPChuaXacNhan", dsSPChuaXacNhan);
				}else if(mahoadon.equals("All") == false) {
					long mahoadon1 = Long.parseLong(mahoadon);
					dsSPChuaXacNhan = dmbo.dsDonChuaGiaoTheoMaHD(mahoadon1);
					request.setAttribute("dsSPChuaXacNhan", dsSPChuaXacNhan);
					
				}
			}else {
				dsSPChuaXacNhan = dmbo.getSPChuaGiao();
				request.setAttribute("dsSPChuaXacNhan", dsSPChuaXacNhan);
			}
					
			RequestDispatcher rd = request.getRequestDispatcher("AdminXacNhanDon.jsp");
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
