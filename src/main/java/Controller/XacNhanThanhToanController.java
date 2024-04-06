package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ButtonGroup;

import Bean.GioHangBean;
import Bean.KhachHangBean;
import Bean.NoiNhanBean;
import Bean.TichDiemBean;
import Bo.DonDatHangBo;
import Bo.DonHangChiTietBo;
import Bo.GioHangBo;
//import Bo.GioHangBo;
import Bo.HoSoKhachHangBo;
import Bo.KhachHangBo;
import Bo.TichDiemBo;

/**
 * Servlet implementation class XacNhanThanhToanController
 */
@WebServlet("/XacNhanThanhToanController")
public class XacNhanThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XacNhanThanhToanController() {
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
			
			if(request.getParameter("thanhtoan").equals("tienmat")) {
				HttpSession session = request.getSession();
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
				DonDatHangBo ddhbo = new DonDatHangBo();
				
				long tongdongia =0;
				if(request.getParameter("diem")!= null) {
					if(request.getParameter("diem").equals("on")) {
						long tienthanhtoan = Long.parseLong(request.getParameter("tienthanhtoan"));
						tongdongia = tienthanhtoan - (khbean.getTichdiem()*1000);
						// Cập nhật điểm khách hàng thành 0
						KhachHangBo khbo = new KhachHangBo();
						khbo.capNhatDiem(khbean.getMakhachhang(), 0);
						TichDiemBo tdbo = new TichDiemBo();
						ArrayList<TichDiemBean> dsTichDiem = tdbo.getDsTichDiem();
						for(TichDiemBean tdbean: dsTichDiem) {
							if(tienthanhtoan >= tdbean.getDieukien()) {
								long diemcong = khbo.getTichDiem(khbean.getMakhachhang()) + tdbean.getDiemcong();
								khbo.capNhatDiem(khbean.getMakhachhang(), diemcong);
								break;
							}
						}
					}
				}else {
					long tienthanhtoan = Long.parseLong(request.getParameter("tienthanhtoan"));
					tongdongia = tienthanhtoan;
					KhachHangBo khbo = new KhachHangBo();
					TichDiemBo tdbo = new TichDiemBo();
					ArrayList<TichDiemBean> dsTichDiem = tdbo.getDsTichDiem();
					for(TichDiemBean tdbean: dsTichDiem) {
						if(tienthanhtoan >= tdbean.getDieukien()) {
							long diemcong = khbo.getTichDiem(khbean.getMakhachhang()) + tdbean.getDiemcong();
							khbo.capNhatDiem(khbean.getMakhachhang(), diemcong);
						}
					}
				}
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				NoiNhanBean nnbean = hskhbo.getNoiNhanHang(khbean.getMakhachhang());
				String diachinhanhang = nnbean.getSonha()+", "+nnbean.getPhuong()+", "+ nnbean.getQuan()+", "+ nnbean.getThanhpho();
				
				ddhbo.themDonDatHang(khbean.getMakhachhang(), false, false, tongdongia, diachinhanhang);
				long madonvuathem = ddhbo.getMaxHD();
				DonHangChiTietBo dhctbo = new DonHangChiTietBo();
				
				
				String dsMaGioChon = request.getParameter("dsMaGioChon");
				GioHangBo sp =  new GioHangBo();
				ArrayList<GioHangBean> dsgio = new ArrayList<GioHangBean>();
				if(dsMaGioChon != null) {
					String dsMagiohang[] = dsMaGioChon.split("/");
					for(int i=0; i<dsMagiohang.length;i++) {
						long magiohang = Long.parseLong(dsMagiohang[i]);
						GioHangBean gh = sp.getSanPhamMua(khbean.getMakhachhang(), magiohang);
						dsgio.add(gh);
					}
				}
				
				for(GioHangBean spbean: dsgio) {
					if(spbean.getGiagiam()==0) {
						dhctbo.themChiTietHD(madonvuathem, spbean.getMasanpham(), spbean.getSoluongmua(), spbean.getMausanpham(), spbean.getSize(), null,spbean.getGiaban(), 
								spbean.getTensanpham(), spbean.getAnhTheoMau());
					}else {
						dhctbo.themChiTietHD(madonvuathem, spbean.getMasanpham(), spbean.getSoluongmua(), spbean.getMausanpham(), spbean.getSize(), null,spbean.getGiagiam(), 
								spbean.getTensanpham(), spbean.getAnhTheoMau());
					}
				}
				
				ArrayList<GioHangBean> giohang = sp.getSanPhamTrongGio(khbean.getMakhachhang());
				
				for(GioHangBean gh: giohang) {
					for(GioHangBean g: dsgio) {
						if( gh.getMagiohang()==g.getMagiohang()) {
							sp.xoaSpTrongGio(gh.getMagiohang());
						}
					}
				}
				
	//			GioHangBo giohang = (GioHangBo)session.getAttribute("giohang");
	//			for(GioHangBean sp: giohang.dsSP) {
	//				dhctbo.themChiTietHD(madonvuathem, sp.getMasanpham(), sp.getSoluongmua(), sp.getMausanpham(), sp.getSize());
	//			}
//				System.out.print(request.getParameter("thanhtoan"));
//				session.removeAttribute("giohang");
				response.sendRedirect("HoSoKhachHangController?donmua=1&btnchoxacnhan=1");
			}
			
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
