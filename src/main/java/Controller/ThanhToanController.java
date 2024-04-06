package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.GiamGiaBean;
import Bean.GioHangBean;
import Bean.KhachHangBean;
import Bean.NoiNhanBean;
import Bo.GiamGiaBo;
import Bo.GioHangBo;
//import Bo.GioHangBo;
import Bo.HoSoKhachHangBo;
import Bo.KhachHangBo;
import Bo.LoaiBo;

/**
 * Servlet implementation class ThanhToanController
 */
@WebServlet("/ThanhToanController")
public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanController() {
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
			
			//Xử lý lấy danh sách loại
			LoaiBo lbo = new LoaiBo();
			request.setAttribute("dsTenLoaiDMTatCa", lbo.getTenLoaiDMTatCa());
			request.setAttribute("dsTenLoaiDMThuongHieu", lbo.getTenLoaiDMThuongHieu());
			request.setAttribute("dsTenLoaiDMDoNam", lbo.getTenLoaiDMDoNam());
			request.setAttribute("dsTenLoaiDMDoNu", lbo.getTenLoaiDMDoNu());
			request.setAttribute("dsTenLoaiDMTreEm", lbo.getTenLoaiDMTreEm());
			
			HttpSession session = request.getSession();
			KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
			if(khbean != null) {
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				NoiNhanBean noiNhanBean= hskhbo.getNoiNhanHang(khbean.getMakhachhang());
				if(noiNhanBean != null) {
					request.setAttribute("noinhan", noiNhanBean);
				}
			}
			
			
			GioHangBo sp =  new GioHangBo();
			if(session.getAttribute("dn")!= null) {
				String dsMaGioChon = request.getParameter("dsMaGioChon");
				
				ArrayList<GioHangBean> dsgio = new ArrayList<GioHangBean>();
				if(dsMaGioChon != null) {
					String dsMagiohang[] = dsMaGioChon.split("/");
					for(int i=0; i<dsMagiohang.length;i++) {
						long magiohang = Long.parseLong(dsMagiohang[i]);
						GioHangBean gh = sp.getSanPhamMua(khbean.getMakhachhang(), magiohang);
						dsgio.add(gh);
					}
				}
//				dsgio = sp.getSanPhamTrongGio(khbean.getMakhachhang());
				request.setAttribute("giohang", dsgio);
				request.setAttribute("dsMaGioChon", dsMaGioChon);
				long tongtien=0;
				for(GioHangBean g : dsgio) {
//					String a = g.getMasanpham()+"/"+g.getMausanpham()+"/"+g.getSize();
//					System.out.print(a);
					long thanhTien;
					if(g.getGiagiam() == 0) {
						thanhTien = g.getGiaban() * g.getSoluongmua();
//						request.setAttribute(a, thanhTien);
					}else {
						thanhTien = g.getGiagiam() * g.getSoluongmua();
//						request.setAttribute(a, thanhTien);
					}
					tongtien += thanhTien;
				}
				request.setAttribute("tongtien", tongtien);
				
				KhachHangBo khbo = new KhachHangBo();
				long diemKhachHang = khbo.getTichDiem(khbean.getMakhachhang());
				System.out.print(diemKhachHang);
				request.setAttribute("diemKhachHang", diemKhachHang);
				
				GiamGiaBo ggbo = new GiamGiaBo();
				ArrayList<GiamGiaBean> dsgg = new ArrayList<GiamGiaBean>();
				dsgg = ggbo.getGiamGia();
				for(GiamGiaBean gg: dsgg) {
					if(tongtien>= gg.getDieukien()) {
						tongtien = tongtien - gg.getTiengiam();
						request.setAttribute("giamgia", -gg.getTiengiam());
						request.setAttribute("tiensaukhigiamgia", tongtien);
						long tiengiamdiem1 = tongtien- (diemKhachHang *1000);
						request.setAttribute("tiengiamdiem1", tiengiamdiem1);
						break;
					}
				}
				
				long tiengiamdiem = tongtien- (diemKhachHang*1000);
				request.setAttribute("tiengiamdiem", tiengiamdiem);
			}
			
			
			
			
			RequestDispatcher rd = request.getRequestDispatcher("thanhtoan.jsp");
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
