package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.GioHangBean;
import Bean.KhachHangBean;
import Bo.ChiTietSanPhamBo;
import Bo.GioHangBo;
import Bo.LoaiBo;
import Bo.SanPhamBo;

/**
 * Servlet implementation class GioHangController
 */
@WebServlet("/GioHangController")
public class GioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GioHangController() {
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
			
			//Xử lý lấy sản phẩm ưa thích
			SanPhamBo spbo =  new SanPhamBo();
			request.setAttribute("dsSPUaThich", spbo.getSanPhamUaThich());
			
			// Xử lý thêm sản phẩm vào giỏ
			if(request.getParameter("ht") != null && request.getParameter("addCart") == null) {
				long masanpham = Long.parseLong(request.getParameter("msp"));
//				String tensanpham = request.getParameter("tsp");
//				String anh = request.getParameter("anh");
//				long giacu = Long.parseLong(request.getParameter("gc"));
//				long giamoi = Long.parseLong(request.getParameter("gm"));
//				long soluongdaban = Long.parseLong(request.getParameter("sldb"));
//				String motasanpham = request.getParameter("mtsp");
//				String chitietsanpham = request.getParameter("ctsp");
//				long maloai = Long.parseLong(request.getParameter("ml"));
//				long mathuonghieu = Long.parseLong(request.getParameter("mth"));
//				long madanhmuc = Long.parseLong(request.getParameter("mdm"));
				long soluongmua = Long.parseLong(request.getParameter("soluongmua"));
				String mausanpham = request.getParameter("mau");
				String size = request.getParameter("size");
				
				ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();
				long soluongSpTrongKho = ctspbo.getSoluongTrongKho(masanpham, mausanpham, size);
				if(soluongmua> soluongSpTrongKho) {
					response.sendRedirect("ChiTietSanPhamController?msp="+masanpham+"&khongdu=1");
					return;
				}
				
				HttpSession session = request.getSession();
				GioHangBo sp =  new GioHangBo();
				if(session.getAttribute("dn")!= null) {
					KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
					sp.themSanPhamVaoGio(masanpham, khbean.getMakhachhang(), soluongmua, mausanpham, size);
				}
				response.sendRedirect("GioHangController");
				return;
			}
			
			// Xử lý thêm
			if(request.getParameter("ht") != null && request.getParameter("addCart") != null) {
				long masanpham = Long.parseLong(request.getParameter("msp"));
				long soluongmua = Long.parseLong(request.getParameter("soluongmua"));
				String mausanpham = request.getParameter("mau");
				String size = request.getParameter("size");
				
				ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();
				long soluongSpTrongKho = ctspbo.getSoluongTrongKho(masanpham, mausanpham, size);
				if(soluongmua> soluongSpTrongKho) {
					response.sendRedirect("ChiTietSanPhamController?msp="+masanpham+"&khongdu=1");
					return;
				}
				
				HttpSession session = request.getSession();
				GioHangBo sp =  new GioHangBo();
				if(session.getAttribute("dn")!= null) {
					KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
					sp.themSanPhamVaoGio(masanpham, khbean.getMakhachhang(), soluongmua, mausanpham, size);
				}
				response.sendRedirect("ChiTietSanPhamController?themsp=1&msp="+masanpham);
				return;
			}
			
			//Lấy sản phẩm trong giỏ ra
			HttpSession session = request.getSession();
			GioHangBo sp =  new GioHangBo();
			if(session.getAttribute("dn")!= null) {
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
				ArrayList<GioHangBean> dsgio = new ArrayList<GioHangBean>();
				dsgio = sp.getSanPhamTrongGio(khbean.getMakhachhang());
				request.setAttribute("giohang", dsgio);
				
				long tongtien=0;
				for(GioHangBean g : dsgio) {
//					String a = g.getMasanpham()+"/"+g.getMausanpham()+"/"+g.getSize();
//					System.out.print(a); 
					long thanhTien;
					if(g.getGiagiam() == 0) {
						thanhTien = g.getGiaban() * g.getSoluongmua();
						request.setAttribute(String.valueOf(g.getMagiohang()), thanhTien);
					}else {
						thanhTien = g.getGiagiam() * g.getSoluongmua();
						request.setAttribute(String.valueOf(g.getMagiohang()), thanhTien);
					}
					tongtien += thanhTien;
				}
				request.setAttribute("tongtien", tongtien);
			}
			
			
			//Xử lý sửa số lượng
			String btncapnhat = request.getParameter("update");
			if(btncapnhat != null && session.getAttribute("dn")!= null) {
				long soluongcapnhat = Long.parseLong(request.getParameter("soluongcapnhat"));
				long masanpham = Long.parseLong(btncapnhat);
				String mausanpham = request.getParameter("mausp");
				String size = request.getParameter("size");
				KhachHangBean khbaen = (KhachHangBean)session.getAttribute("dn");
				GioHangBo ghbo = new GioHangBo();
				//Lấy số lượng sản phẩm trong kho
				ChiTietSanPhamBo ctspbo =  new ChiTietSanPhamBo();
				long soluongSPtrongKho = ctspbo.getSoluongTrongKho(masanpham, mausanpham, size);
				if(soluongcapnhat<=soluongSPtrongKho) {
					ghbo.capNhatGio(masanpham, khbaen.getMakhachhang(), soluongcapnhat, mausanpham, size);
					response.sendRedirect("GioHangController?capNhatTC=1");
					return;
				}else {
					response.sendRedirect("GioHangController?capNhatTB=1");
					return;
				}
			}
			
			//Xử lý xóa
			String btnxoa = request.getParameter("delete");
			if(btnxoa != null && session.getAttribute("dn")!= null) {
				long magiohang = Long.parseLong(btnxoa);
				String mausanpham = request.getParameter("mausp");
				String size = request.getParameter("size");
				KhachHangBean khbaen = (KhachHangBean)session.getAttribute("dn");
				GioHangBo ghbo = new GioHangBo();
				ghbo.xoaSpTrongGio(magiohang);
				response.sendRedirect("GioHangController");
				return;
			}
			
			//Xử lý xóa chọn
			String btnxoachon = request.getParameter("btnxoachon");
			if(btnxoachon != null && session.getAttribute("dn")!= null) {
				Enumeration<String> d = request.getParameterNames();
				KhachHangBean khbaen = (KhachHangBean)session.getAttribute("dn");
				GioHangBo ghbo = new GioHangBo();
				ArrayList<GioHangBean> dsSpChon = new ArrayList<GioHangBean>();
				while(d.hasMoreElements()) {
					String name = d.nextElement();
					String value = request.getParameter(name);
					if(value.equals("on")) {
						long mgh = Long.parseLong(name) ;
						ghbo.xoaSpTrongGio(mgh); 
					}
				}
				response.sendRedirect("GioHangController");
				return;
			}
			
			//Xử lý mua chọn
			String btnmuahang = request.getParameter("btnmuahang");
			if(btnmuahang != null && session.getAttribute("dn")!= null) {
				Enumeration<String> d = request.getParameterNames();
				KhachHangBean khbaen = (KhachHangBean)session.getAttribute("dn");
				GioHangBo ghbo = new GioHangBo();
				ArrayList<GioHangBean> dsSpChon = new ArrayList<GioHangBean>();
				boolean chonSp = false;
				String dsMaGioChon = "";
				while(d.hasMoreElements()) {
					String name = d.nextElement();
					String value = request.getParameter(name);
					if(value.equals("on")) {
						chonSp = true;
						long mgh = Long.parseLong(name) ;
						if(dsMaGioChon.equals("")) {
							dsMaGioChon += name;
						}else {
							dsMaGioChon += "/"+name;
							request.setAttribute("sosp", "lonhon2");
						}
					}
				}
				if(chonSp) {
					response.sendRedirect("ThanhToanController?dsMaGioChon="+dsMaGioChon);
					return;
				}else {
//					request.setAttribute("csp", 1);
					response.sendRedirect("GioHangController?csp=null");
					return;
				}
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("giohang.jsp");
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
