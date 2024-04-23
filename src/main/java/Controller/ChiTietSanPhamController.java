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

import Bean.AnhSanPham;
import Bean.GioHangBean;
import Bean.KhachHangBean;
import Bean.SanPhamBean;
import Bo.ChiTietSanPhamBo;
import Bo.GioHangBo;
//import Bo.GioHangBo;
import Bo.LoaiBo;
import Bo.SanPhamBo;

/**
 * Servlet implementation class ChiTietSanPhamController
 */
@WebServlet("/ChiTietSanPhamController")
public class ChiTietSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietSanPhamController() {
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
			
//			Xử lý chi tiết sản phẩm
			if(request.getParameter("tsp")!= null) {
				request.setAttribute("masanpham", request.getParameter("msp"));
				request.setAttribute("tensanpham", request.getParameter("tsp"));
				request.setAttribute("anh", request.getParameter("anh"));
				request.setAttribute("giaban", request.getParameter("gb"));
				request.setAttribute("giagiam", request.getParameter("gg"));
				request.setAttribute("soluongdaban", request.getParameter("sldb"));
				request.setAttribute("motasanpham", request.getParameter("mtsp"));
				request.setAttribute("maloai", request.getParameter("ml"));
				request.setAttribute("mathuonghieu", request.getParameter("mth"));
				request.setAttribute("madanhmuc", request.getParameter("mdm"));
				request.setAttribute("anhchonsize", request.getParameter("acs"));
			}else {
				String msp = request.getParameter("msp");
				long masanpham = Long.parseLong(msp);
				SanPhamBo spbo = new SanPhamBo();
				SanPhamBean spbean = spbo.getSanPham(masanpham);
				
				request.setAttribute("masanpham", request.getParameter("msp"));
				request.setAttribute("tensanpham", spbean.getTensanpham());
				request.setAttribute("anh", spbean.getAnh());
				request.setAttribute("giaban", spbean.getGiaban());
				request.setAttribute("giagiam", spbean.getGiagiam());
				request.setAttribute("soluongdaban", spbean.getSoluongdaban());
				request.setAttribute("motasanpham", spbean.getMotasanpham());
				request.setAttribute("maloai", spbean.getMaloai());
				request.setAttribute("mathuonghieu", spbean.getMathuonghieu());
				request.setAttribute("madanhmuc", spbean.getMadanhmuc());
				request.setAttribute("anhchonsize", spbean.getAnhchonsize());
			}
			
			//Xử lý lấy sản phẩm ưa thích
			SanPhamBo spbo =  new SanPhamBo();
			request.setAttribute("dsSPUaThich", spbo.getSanPhamUaThich());
			
			//Xử lý lấy size, màu và ảnh của sản phẩm
			ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();
			long masanpham = Long.parseLong(request.getParameter("msp")) ;
			request.setAttribute("listSize", ctspbo.dsSize(masanpham));
			request.setAttribute("listAnhVaMau", ctspbo.getdsAnhVaMau(masanpham));
			request.setAttribute("listCT", (ArrayList<String>)ctspbo.getdsChiTietSP(masanpham));
			
//			ArrayList<String> listCT = (ArrayList<String>)ctspbo.getdsChiTietSP(masanpham);
//			for(int i=0; i<listCT.size();i++) {
//				
//			}
			
			ArrayList<AnhSanPham> listAnhVaMau = new ArrayList<AnhSanPham>();
			listAnhVaMau = ctspbo.getdsAnhVaMau(masanpham);
			ArrayList<String> listAnhVaMauJs = new ArrayList<String>();
			for(int i = 0; i<listAnhVaMau.size(); i++) {
				String mau = listAnhVaMau.get(i).getMauString();
				String anh = listAnhVaMau.get(i).getSrcanh();
				String anhMau = "'"+mau+"<"+anh+"'";
				listAnhVaMauJs.add(anhMau); 
			}
			request.setAttribute("listAnhVaMauJs", listAnhVaMauJs);
			HttpSession session = request.getSession();
			GioHangBo ghbo = new GioHangBo();
			if(session.getAttribute("dn")!= null) {
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");			
				request.setAttribute("giohang", ghbo.getSanPhamTrongGio(khbean.getMakhachhang()));
			}else {
				ArrayList<GioHangBean> giohang = null;
				request.setAttribute("giohang", giohang);
			}
			
//			HttpSession session = request.getSession();
//			GioHangBo sp;
//			ArrayList<GioHangBean> dsSP = null;
//			if(session.getAttribute("giohang") != null) {
//				sp = (GioHangBo)session.getAttribute("giohang")	;
//				dsSP = sp.dsSP;
//			}
//			request.setAttribute("dsSP", dsSP);
			
			RequestDispatcher rd = request.getRequestDispatcher("chitietsanpham.jsp");
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
