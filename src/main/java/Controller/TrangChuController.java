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

import Bean.BannerBean;
import Bean.GioHangBean;
import Bean.KhachHangBean;
import Bean.LoaiThuocDanhMucBean;
import Bean.SanPhamBean;
import Bo.BannerBo;
import Bo.GioHangBo;
import Bo.KhachHangBo;
//import Bo.GioHangBo;
import Bo.LoaiBo;
import Bo.SanPhamBo;

/**
 * Servlet implementation class TrangChuController
 */
@WebServlet("/TrangChuController")
public class TrangChuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChuController() {
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
			request.setAttribute("dsTenLoaiDMTatCa",lbo.getTenLoaiDMTatCa());
			request.setAttribute("dsTenLoaiDMThuongHieu", lbo.getTenLoaiDMThuongHieu());
			request.setAttribute("dsTenLoaiDMDoNam", lbo.getTenLoaiDMDoNam());
			request.setAttribute("dsTenLoaiDMDoNu", lbo.getTenLoaiDMDoNu());
			request.setAttribute("dsTenLoaiDMTreEm", lbo.getTenLoaiDMTreEm());
			
			request.setAttribute("dsLoai", lbo.getDsLoai());
			
			
			//Lấy danh sách banner
			BannerBo bnbo = new BannerBo();
			ArrayList<BannerBean> dsbanner;
			dsbanner = bnbo.getDsBanner();
			request.setAttribute("dsbanner", dsbanner);
			
			//Xử lý lấy danh sách số điện thoại và email của tất cả các khách hàng
			KhachHangBo khbo = new KhachHangBo();
			ArrayList<String> dsSdt = khbo.getdsSoDienThoai();
			String dsSoDienThoai = "";
			for(int i=0; i<dsSdt.size(); i++) {
				if(i==0) {
					dsSoDienThoai += dsSdt.get(0);
				}else {
					dsSoDienThoai += ">"+dsSdt.get(i);
				}
			}
			
			ArrayList<String> dsemail = khbo.getdsEmail();
			String dsEmail = "";
			for(int i=0; i<dsemail.size(); i++) {
				if(i==0) {
					dsEmail += dsemail.get(0);
				}else {
					dsEmail += ">"+dsemail.get(i);
				}
			}
			request.setAttribute("dsSoDienThoai", dsSoDienThoai);
			request.setAttribute("dsEmail", dsEmail);
			
	// Hiển thị phần body
			String maloai = request.getParameter("maloai");
			String madanhmuc = request.getParameter("madanhmuc");
			String mathuonghieu = request.getParameter("mathuonghieu");
			
			if(maloai == null && madanhmuc == null && mathuonghieu == null && request.getParameter("btnTimKiem") == null ) {
				//Xử lý lấy danh sách sản phẩm hot
				SanPhamBo spbo = new SanPhamBo();
				request.setAttribute("dsSanPhamHot", spbo.getSanPhamHot());
			}else if(request.getParameter("btnTimKiem") == null){
				//Xử lý lấy danh sách sản phẩm loai trong danh muc
				SanPhamBo spbo = new SanPhamBo();
				ArrayList<SanPhamBean> spbean = spbo.getSanPhamLoaiTrongDanhMuc(Long.parseLong(maloai), Long.parseLong(madanhmuc), Long.parseLong(mathuonghieu));
				for(SanPhamBean sp: spbean) {
					System.out.print(sp.getMasanpham());
				}
				request.setAttribute("dsSanPhamLoaiTrongDanhMuc", (ArrayList<SanPhamBean>)spbo.getSanPhamLoaiTrongDanhMuc(Long.parseLong(maloai), Long.parseLong(madanhmuc), Long.parseLong(mathuonghieu)));
			}else {
				SanPhamBo spbo = new SanPhamBo();
				String keyTimKiem = request.getParameter("keyTimKiem");
				request.setAttribute("dsSanPhamTimKiem", spbo.getSanPhamTimKiem(keyTimKiem));
			}
			
			HttpSession session = request.getSession();
			GioHangBo ghbo = new GioHangBo();
			if(session.getAttribute("dn")!= null) {
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");			
				request.setAttribute("giohang", ghbo.getSanPhamTrongGio(khbean.getMakhachhang()));
			}else {
				ArrayList<GioHangBean> giohang = null;
				request.setAttribute("giohang", giohang);
			}
			
			if(request.getParameter("loi")!=null) {
				request.setAttribute("loi", "dangnhap");			
			}
			if(request.getParameter("loidangki")!=null) {
				request.setAttribute("loidangki", "1");			
			}
//			if(session.getAttribute("giohang") != null) {
//				sp = (GioHangBo)session.getAttribute("giohang")	;
//				dsSP = sp.dsSP;
//			}
//			request.setAttribute("dsSP", dsSP);
			
			if(request.getParameter("btnQuenPass")!= null) {
				request.setAttribute("email", request.getParameter("email"));
			}
			
			if(request.getParameter("btnDoiPassMoi")!= null || request.getParameter("btnDoiPassMoiLoi")!= null) {
				request.setAttribute("email", request.getParameter("email"));
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
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
