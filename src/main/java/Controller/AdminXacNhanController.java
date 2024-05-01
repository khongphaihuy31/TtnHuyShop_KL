package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.DonDatHangBean;
import Bean.DonMuaBean;
import Bean.GiamGiaBean;
import Bean.KhachHangBean;
import Bo.AdminKhachHangBo;
import Bo.AdminXacNhanBo;
import Bo.ChiTietSanPhamBo;
import Bo.DonDatHangBo;
import Bo.DonMuaBo;
import Bo.GiamGiaBo;
import Bo.KhachHangBo;

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
			
			//Xử lý xác nhận đơn
			String xacNhanDon = request.getParameter("xacNhanDon");
			if(xacNhanDon!= null) {
				long mhd = Long.parseLong(xacNhanDon);
				ddhbo.capNhatChiTietHDChuanBiDon(mhd);
				response.sendRedirect("AdminXacNhanController?xacNhanTC=1");
				return;
			}
			
			//Xử lý chuẩn bị đơn xong
			String dangGiaoDon = request.getParameter("dangGiaoDon");
			if(dangGiaoDon!= null) {
				long mhd = Long.parseLong(dangGiaoDon);
				ddhbo.capNhatChiTietHDDangGiao(mhd);
				response.sendRedirect("AdminXacNhanController?dangGiaoTC=1");
				return;
			}
			
			//Xử lý đơn đã được giao
			String daGiaoDon = request.getParameter("daGiaoDon");
			if(daGiaoDon!= null) {
				long mhd = Long.parseLong(daGiaoDon);
				ddhbo.capNhatChiTietHDDaGiao(mhd);
				response.sendRedirect("AdminXacNhanController?daGiaoTC=1");
				return;
			}
			
			//Xử lý hủy đơn hàng
			String huyDon = request.getParameter("huyDon");
			if(huyDon!= null) {
				long mhd = Long.parseLong(huyDon);
				
				//Lấy danh sách thông tin các sản phẩm theo đơn mã hóa đơn
				AdminXacNhanBo axnbo = new AdminXacNhanBo();
				ArrayList<DonMuaBean> dsSpTheoMHD=  null;
				dsSpTheoMHD = axnbo.dsSanPhamTrongDonMuaTheoMHD(mhd);
				
				long tongdongiakhichuagiam=0;
				//Trả lại số lượng sản phẩm theo mã sản phẩm, màu, size
				for(int i=0; i<dsSpTheoMHD.size(); i++) {
					ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();
					//lấy số lượng sản phẩm hiện tại có trong kho
					long soLuongHienTaiTrongKho = ctspbo.getSoluongTrongKho(dsSpTheoMHD.get(i).getMasanpham(),dsSpTheoMHD.get(i).getMausanpham() , dsSpTheoMHD.get(i).getSizesanpham());
					//cập nhật lại số lượng trong kho sau khi xóa
					ctspbo.suaSoHangTrongKho(dsSpTheoMHD.get(i).getMasanpham(),dsSpTheoMHD.get(i).getMausanpham() , dsSpTheoMHD.get(i).getSizesanpham(), soLuongHienTaiTrongKho+ dsSpTheoMHD.get(i).getSoluongmua());
					//lấy tổng đơn giá khi chưa giảm
					tongdongiakhichuagiam += dsSpTheoMHD.get(i).getThanhtien();
				}
				
				//Lấy tổng tiền khi được giảm
				GiamGiaBo ggbo = new GiamGiaBo();
				ArrayList<GiamGiaBean> dsgg = new ArrayList<GiamGiaBean>();
				dsgg = ggbo.getGiamGia();
				for(GiamGiaBean gg: dsgg) {
					if(tongdongiakhichuagiam>= gg.getDieukien()) {
						tongdongiakhichuagiam = tongdongiakhichuagiam - gg.getTiengiam();
						break;
					}
				}
				
				long makhachhang=0;
				
				//Lấy tổng đơn giá cẩn phải trả
				long tongdongiacanphaitra=0;
				ArrayList<DonDatHangBean> dsHoaDonChuaGiao = ddhbo.dsdonchuagiao();
				for(int i=0; i<dsHoaDonChuaGiao.size(); i++) {
					if(dsHoaDonChuaGiao.get(i).getMahoadon() == mhd) {
						tongdongiacanphaitra = dsHoaDonChuaGiao.get(i).getTongdongia();
						//lấy mã khách hàng
						makhachhang = dsHoaDonChuaGiao.get(i).getMakhachhang();
					}
				}
				
				//Cập nhật lại điểm cho khách hàng
				if(tongdongiakhichuagiam >  tongdongiacanphaitra) {
					long tiengiamdiem = tongdongiakhichuagiam - tongdongiacanphaitra;
					long sodiemgiam = tiengiamdiem / 1000;
					//Lấy số điểm hiện tại của khách hàng
					KhachHangBo khbo = new KhachHangBo();
					long diemKhachHang = khbo.getTichDiem(makhachhang);
					khbo.capNhatDiem(makhachhang, diemKhachHang+sodiemgiam);
				}
				
				//Xóa đơn hàng chi tiết
				axnbo.xoaDonHangChiTiet(mhd);
				
				//Xóa đơn đặt hàng
				axnbo.xoaDonDatHang(mhd);
				
				response.sendRedirect("AdminXacNhanController?huyDonTC=1");
				return;
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
