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
import Bean.SanPhamBean;
import Bo.GiamGiaBo;
import Bo.GioHangBo;
//import Bo.GioHangBo;
import Bo.HoSoKhachHangBo;
import Bo.KhachHangBo;
import Bo.LoaiBo;
import Bo.SanPhamBo;

/**
 * Servlet implementation class ThanhToanController
 */
@WebServlet("/ThanhToan")
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
			if(session.getAttribute("dn")!= null && request.getParameter("maaodesign") == null) {
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
				ArrayList<GioHangBean> dsHangTrongGio = new ArrayList<GioHangBean>();
				dsHangTrongGio = sp.getSanPhamTrongGio(khbean.getMakhachhang());
				request.setAttribute("giohang", dsHangTrongGio);
				request.setAttribute("dsHangMua", dsgio);
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
				//System.out.print(diemKhachHang);
				request.setAttribute("diemKhachHang", diemKhachHang);
				
				GiamGiaBo ggbo = new GiamGiaBo();
				ArrayList<GiamGiaBean> dsgg = new ArrayList<GiamGiaBean>();
				dsgg = ggbo.getGiamGia();
				for(GiamGiaBean gg: dsgg) {
					if(tongtien>= gg.getDieukien()) {
						tongtien = tongtien - gg.getTiengiam();
						request.setAttribute("giamgia", -gg.getTiengiam());
						request.setAttribute("tiensaukhigiamgia", tongtien);
//						long tiengiamdiem1 = tongtien- (diemKhachHang *1000);
//						request.setAttribute("tiengiamdiem1", tiengiamdiem1);
						break;
					}
				}
				//kiểm tra tổng tiền nhỏ hơn điểm tích lũy khách hàng
				//System.out.println(tongtien);
				if(tongtien<(diemKhachHang*1000)) {
					request.setAttribute("tiengiamdiem", 0);
					request.setAttribute("soDiemTruCuaKhachHang", tongtien/1000);
				}else {
					request.setAttribute("soDiemTruCuaKhachHang", diemKhachHang);
					//tiền giảm điểm này là tiền sau khi đổi điểm tích lũy
					long tiengiamdiem = tongtien- (diemKhachHang*1000);
					request.setAttribute("tiengiamdiem", tiengiamdiem);
				}
			}
			
			//Xử lý thanh toán cho áo design
			if(session.getAttribute("dn")!= null && request.getParameter("maaodesign") != null) {
				String maaodesign = request.getParameter("maaodesign");
				String anhdesign = request.getParameter("anhdesign");
				String maumua =  request.getParameter("maumua");
				System.out.println(maumua);
				String sizemua =  request.getParameter("sizemua");
				String anhTheoMau =  request.getParameter("anhTheoMau");
				long soluongmua = Long.parseLong(request.getParameter("soluongmua"));
				
				request.setAttribute("anhdesign", anhdesign);		
				request.setAttribute("maumua", maumua);
				request.setAttribute("sizemua", sizemua);
				request.setAttribute("soluongmua", soluongmua);
				request.setAttribute("anhTheoMau", anhTheoMau);
				request.setAttribute("maaodesign", maaodesign);
//				ArrayList<GioHangBean> dsgio = new ArrayList<GioHangBean>();
//				if(dsMaGioChon != null) {
//					String dsMagiohang[] = dsMaGioChon.split("/");
//					for(int i=0; i<dsMagiohang.length;i++) {
//						long magiohang = Long.parseLong(dsMagiohang[i]);
//						GioHangBean gh = sp.getSanPhamMua(khbean.getMakhachhang(), magiohang);
//						dsgio.add(gh);
//					}
//				}
				long mspDesign = Long.parseLong(maaodesign);
				SanPhamBo spbo = new SanPhamBo();
				SanPhamBean spDesign = spbo.getSanPham(mspDesign);
				
				ArrayList<GioHangBean> dsHangTrongGio = new ArrayList<GioHangBean>();
				dsHangTrongGio = sp.getSanPhamTrongGio(khbean.getMakhachhang());
				request.setAttribute("giohang", dsHangTrongGio);
				
				request.setAttribute("spDesign", spDesign);
//				request.setAttribute("maaodesign", maaodesign);
//				long tongtien=0;
//				for(GioHangBean g : dsgio) {
//					String a = g.getMasanpham()+"/"+g.getMausanpham()+"/"+g.getSize();
//					System.out.print(a);
					long thanhTien;
					if(spDesign.getGiagiam() == 0) {
						thanhTien = spDesign.getGiaban() * soluongmua;
//						request.setAttribute(a, thanhTien);
					}else {
						thanhTien = spDesign.getGiagiam() * soluongmua;
//						request.setAttribute(a, thanhTien);
					}
//					tongtien += thanhTien;
//				}
				request.setAttribute("tongtien", thanhTien);
				
				KhachHangBo khbo = new KhachHangBo();
				long diemKhachHang = khbo.getTichDiem(khbean.getMakhachhang());
				//System.out.print(diemKhachHang);
				request.setAttribute("diemKhachHang", diemKhachHang);
				
				GiamGiaBo ggbo = new GiamGiaBo();
				ArrayList<GiamGiaBean> dsgg = new ArrayList<GiamGiaBean>();
				dsgg = ggbo.getGiamGia();
				for(GiamGiaBean gg: dsgg) {
					if(thanhTien>= gg.getDieukien()) {
						thanhTien = thanhTien - gg.getTiengiam();
						request.setAttribute("giamgia", -gg.getTiengiam());
						request.setAttribute("tiensaukhigiamgia", thanhTien);
//						long tiengiamdiem1 = thanhTien- (diemKhachHang *1000);
//						request.setAttribute("tiengiamdiem1", tiengiamdiem1);
						break;
					}
				}
				
				//System.out.println(thanhTien);
				if(thanhTien<(diemKhachHang*1000)) {
					request.setAttribute("tiengiamdiem", 0);
					request.setAttribute("soDiemTruCuaKhachHang", thanhTien/1000);
				}else {
					request.setAttribute("soDiemTruCuaKhachHang", diemKhachHang);
					//tiền giảm điểm này là tiền sau khi đổi điểm tích lũy
					long tiengiamdiem = thanhTien- (diemKhachHang*1000);
					request.setAttribute("tiengiamdiem", tiengiamdiem);
				}
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
