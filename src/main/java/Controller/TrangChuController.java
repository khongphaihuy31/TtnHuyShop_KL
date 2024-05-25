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
import Bean.SanPhamFullBean;
import Bo.BannerBo;
import Bo.GiamGiaBo;
import Bo.GioHangBo;
import Bo.KhachHangBo;
//import Bo.GioHangBo;
import Bo.LoaiBo;
import Bo.SanPhamBo;
import Bo.TichDiemBo;

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
			
			GiamGiaBo ggbo = new GiamGiaBo();
			request.setAttribute("dsGiamGia", ggbo.getGiamGia());
			
			TichDiemBo tdbo = new TichDiemBo();
			request.setAttribute("dsTichDiem", tdbo.getDsTichDiem());
			
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
			SanPhamBo spbo = new SanPhamBo();
			request.setAttribute("dsSanPhamKhuyenMai", spbo.getSanPhamGiamGia());
			if(maloai == null && madanhmuc == null && mathuonghieu == null && request.getParameter("btnTimKiem") == null ) {
				//Xử lý lấy danh sách sản phẩm hot
				request.setAttribute("dsSanPhamHot", spbo.getSanPhamHot());
				
			}else if(request.getParameter("btnTimKiem") == null){
				//Xử lý lấy danh sách sản phẩm loai trong danh muc
				ArrayList<SanPhamBean> spbean = spbo.getSanPhamLoaiTrongDanhMuc(Long.parseLong(maloai), Long.parseLong(madanhmuc), Long.parseLong(mathuonghieu));
				for(SanPhamBean sp: spbean) {
					System.out.print(sp.getMasanpham());
				}
				request.setAttribute("dsSanPhamLoaiTrongDanhMuc", (ArrayList<SanPhamBean>)spbo.getSanPhamLoaiTrongDanhMuc(Long.parseLong(maloai), Long.parseLong(madanhmuc), Long.parseLong(mathuonghieu)));
			}else {
				String keyTimKiem = request.getParameter("keyTimKiem");
				HttpSession session = request.getSession();
				if(session.getAttribute("dn")!= null) {
					KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
					if(khbean.getSothich() == null) {
						khbo.capNhatSoThich(khbean.getMakhachhang(), keyTimKiem);
					}else {
						String [] dsSoThich = khbean.getSothich().split(">");
						ArrayList<String> sothich= new ArrayList<String>();
						if(dsSoThich.length ==2) {
							for(int i=0; i<dsSoThich.length; i++) {
								sothich.add(dsSoThich[i]);
							}
							sothich.remove(0);
							sothich.add(keyTimKiem);
							String sothichcapnhat = sothich.get(0);
							for(String st: sothich) {
								if(st.equals(sothich.get(0))==false) {
									sothichcapnhat += ">"+st;
								}
							}
							khbo.capNhatSoThich(khbean.getMakhachhang(), sothichcapnhat);
						}else {
							for(int i=0; i<dsSoThich.length; i++) {
								sothich.add(dsSoThich[i]);
							}
							sothich.add(keyTimKiem);
							String sothichcapnhat = sothich.get(0);
							for(String st: sothich) {
								if(st.equals(sothich.get(0))==false) {
									sothichcapnhat += ">"+st;
								}
							}
							khbo.capNhatSoThich(khbean.getMakhachhang(), sothichcapnhat);
						}
					}
				}
				request.setAttribute("dsSanPhamTimKiem", spbo.getSanPhamTimKiem(keyTimKiem));
			}
			
			HttpSession session = request.getSession();
			GioHangBo ghbo = new GioHangBo();
			if(session.getAttribute("dn")!= null) {
				KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");			
				request.setAttribute("giohang", ghbo.getSanPhamTrongGio(khbean.getMakhachhang()));
				
				//lấy sản phẩm gợi ý mua
//				System.out.println(khbean.getSothich());
				if(khbean.getSothich() != null) {
					String [] sothich = khbean.getSothich().split(">");
					ArrayList<SanPhamFullBean> dsspfullbean = new ArrayList<SanPhamFullBean>();
					for(String st: sothich) {
						if(dsspfullbean.size()==0) {
							dsspfullbean = spbo.getSanPhamTimKiem(st);
						}else {
							ArrayList<SanPhamFullBean> dskiemduoc = spbo.getSanPhamTimKiem(st);
							for(SanPhamFullBean spkiemduoc: dskiemduoc) {
								boolean daco= false;
								for(SanPhamFullBean spfullbean: dsspfullbean) {
									if(spkiemduoc.getMasanpham()== spfullbean.getMasanpham()) {
										daco = true;
										break;
									}
								}
								if(daco== false) {
									dsspfullbean.add(spkiemduoc);
								}
							}
						}
					}
					request.setAttribute("dsSpGoiYMua", dsspfullbean);
				}
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
