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
import Bean.SanPhamBean;
import Bean.TichDiemBean;
import Bo.ChiTietSanPhamBo;
import Bo.DonDatHangBo;
import Bo.DonHangChiTietBo;
import Bo.GioHangBo;
//import Bo.GioHangBo;
import Bo.HoSoKhachHangBo;
import Bo.KhachHangBo;
import Bo.SanPhamBo;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			if (request.getParameter("thanhtoan").equals("tienmat")) {
				HttpSession session = request.getSession();
				KhachHangBean khbean = (KhachHangBean) session.getAttribute("dn");
				DonDatHangBo ddhbo = new DonDatHangBo();

				long tongdongia = 0;
				if (request.getParameter("diem") != null) {
					if (request.getParameter("diem").equals("on")) {
						long tienthanhtoan = Long.parseLong(request.getParameter("tienthanhtoan"));
						KhachHangBo khbo = new KhachHangBo();
						if (tienthanhtoan < (khbean.getTichdiem() * 1000)) {
							tongdongia = 0;
							// Cập nhật điểm khách hàng thành 0
							long diemConLai = khbean.getTichdiem() - (tienthanhtoan / 1000);
							khbo.capNhatDiem(khbean.getMakhachhang(), diemConLai);
						} else {
							tongdongia = tienthanhtoan - (khbean.getTichdiem() * 1000);
							// Cập nhật điểm khách hàng thành 0
							khbo.capNhatDiem(khbean.getMakhachhang(), 0);
						}

						TichDiemBo tdbo = new TichDiemBo();
						ArrayList<TichDiemBean> dsTichDiem = tdbo.getDsTichDiem();
						for (TichDiemBean tdbean : dsTichDiem) {
							if (tienthanhtoan >= tdbean.getDieukien()) {
								long diemcong = khbo.getTichDiem(khbean.getMakhachhang()) + tdbean.getDiemcong();
								khbo.capNhatDiem(khbean.getMakhachhang(), diemcong);
								break;
							}
						}
					}
				} else {
					long tienthanhtoan = Long.parseLong(request.getParameter("tienthanhtoan"));
					tongdongia = tienthanhtoan;
					KhachHangBo khbo = new KhachHangBo();
					TichDiemBo tdbo = new TichDiemBo();
					ArrayList<TichDiemBean> dsTichDiem = tdbo.getDsTichDiem();
					for (TichDiemBean tdbean : dsTichDiem) {
						if (tienthanhtoan >= tdbean.getDieukien()) {
							long diemcong = khbo.getTichDiem(khbean.getMakhachhang()) + tdbean.getDiemcong();
							khbo.capNhatDiem(khbean.getMakhachhang(), diemcong);
							break;
						}
					}
				}
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				NoiNhanBean nnbean = hskhbo.getNoiNhanHang(khbean.getMakhachhang());
				String diachinhanhang = nnbean.getSonha() + ", " + nnbean.getPhuong() + ", " + nnbean.getQuan() + ", "
						+ nnbean.getThanhpho();

				ddhbo.themDonDatHang(khbean.getMakhachhang(), false, false, tongdongia, diachinhanhang);
				long madonvuathem = ddhbo.getMaxHD(khbean.getMakhachhang());
				DonHangChiTietBo dhctbo = new DonHangChiTietBo();

				if (request.getParameter("spDesign") == null) {
					String dsMaGioChon = request.getParameter("dsMaGioChon");
					GioHangBo sp = new GioHangBo();
					ArrayList<GioHangBean> dsgio = new ArrayList<GioHangBean>();
					if (dsMaGioChon != null) {
						String dsMagiohang[] = dsMaGioChon.split("/");
						for (int i = 0; i < dsMagiohang.length; i++) {
							long magiohang = Long.parseLong(dsMagiohang[i]);
							GioHangBean gh = sp.getSanPhamMua(khbean.getMakhachhang(), magiohang);
							dsgio.add(gh);
						}
					}

					ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();
					for (GioHangBean spbean : dsgio) {
						long soluong = ctspbo.getSoluongTrongKho(spbean.getMasanpham(), spbean.getMausanpham(),
								spbean.getSize());
						long soluongconlai = soluong - spbean.getSoluongmua();

						SanPhamBo spbo = new SanPhamBo();
						// Cập nhật số lượng đã bán
						spbo.capNhatSoLuongDaBan(spbean.getMasanpham(),
								spbean.getSoluongmua() + spbean.getSoluongdaban());

						ctspbo.suaSoHangTrongKho(spbean.getMasanpham(), spbean.getMausanpham(), spbean.getSize(),
								soluongconlai);
						if (spbean.getGiagiam() == 0) {
							dhctbo.themChiTietHD(madonvuathem, spbean.getMasanpham(), spbean.getSoluongmua(),
									spbean.getMausanpham(), spbean.getSize(), null, spbean.getGiaban(),
									spbean.getTensanpham(), spbean.getAnhTheoMau());
						} else {
							dhctbo.themChiTietHD(madonvuathem, spbean.getMasanpham(), spbean.getSoluongmua(),
									spbean.getMausanpham(), spbean.getSize(), null, spbean.getGiagiam(),
									spbean.getTensanpham(), spbean.getAnhTheoMau());
						}
					}

					ArrayList<GioHangBean> giohang = sp.getSanPhamTrongGio(khbean.getMakhachhang());

					for (GioHangBean gh : giohang) {
						for (GioHangBean g : dsgio) {
							if (gh.getMagiohang() == g.getMagiohang()) {
								sp.xoaSpTrongGio(gh.getMagiohang());
							}
						}
					}
				} else {
					String maaodesign = request.getParameter("maaodesign");
					long masanpham = Long.parseLong(maaodesign);
					SanPhamBo spbo = new SanPhamBo();
					SanPhamBean sp = spbo.getSanPham(masanpham);
					ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();

					String maumua = request.getParameter("maumua");
					String sizemua = request.getParameter("sizemua");
					String slm = request.getParameter("soluongmua");
					String anhdesign = request.getParameter("anhdesign");
					String anhTheoMau = request.getParameter("anhTheoMau");
					long soluongmua = Long.parseLong(slm);
					// Cập nhật số lượng đã bán
					spbo.capNhatSoLuongDaBan(masanpham, soluongmua + sp.getSoluongdaban());

					long soluong = ctspbo.getSoluongTrongKho(masanpham, maumua, sizemua);
					long soluongconlai = soluong - soluongmua;
					ctspbo.suaSoHangTrongKho(masanpham, maumua, sizemua, soluongconlai);
					if (sp.getGiagiam() == 0) {
						dhctbo.themChiTietHD(madonvuathem, masanpham, soluongmua, maumua, sizemua, anhdesign,
								sp.getGiaban(), sp.getTensanpham(), anhTheoMau);
					} else {
						dhctbo.themChiTietHD(madonvuathem, masanpham, soluongmua, maumua, sizemua, anhdesign,
								sp.getGiagiam(), sp.getTensanpham(), anhTheoMau);
					}
				}

				if (khbean != null) {
					NoiNhanBean noiNhanBean = hskhbo.getNoiNhanHang(khbean.getMakhachhang());
					if (noiNhanBean != null) {
						request.setAttribute("noinhan", noiNhanBean);
					}
				}

				// GioHangBo giohang = (GioHangBo)session.getAttribute("giohang");
				// for(GioHangBean sp: giohang.dsSP) {
				// dhctbo.themChiTietHD(madonvuathem, sp.getMasanpham(), sp.getSoluongmua(),
				// sp.getMausanpham(), sp.getSize());
				// }
//				System.out.print(request.getParameter("thanhtoan"));
//				session.removeAttribute("giohang");
				response.sendRedirect("HoSoKhachHang?donmua=1&btnchoxacnhan=1");
			} // Nếu kiểm tra thanhtoan === online thì sẽ kiểm tra có phải sản phẩm thiết kế ko
//					nếu mà sản phẩm design 
//			chuyển sang trang mã QRcode
				// Sau đó nếu thành công thì chuyển qua trang hồ sơ khách hàng đã mua
			
			if (request.getParameter("thanhtoan").equals("chuyenkhoan")) {
//				if(request.getParameter("spDesign") == null){
//					String diem = request.getParameter("diem");
//					long tienthanhtoan = Long.parseLong(request.getParameter("tienthanhtoan"));
//					String dsMaGioChon = request.getParameter("dsMaGioChon");
//					response.sendRedirect("ChuyenKhoanController?diem="+diem+"&tienthanhtoan="+tienthanhtoan+"&dsMaGioChon ="+dsMaGioChon);
//				}
				
				HttpSession session = request.getSession();
				KhachHangBean khbean = (KhachHangBean) session.getAttribute("dn");
				DonDatHangBo ddhbo = new DonDatHangBo();
				boolean daThanhToan = false;

				long tongdongia = 0;
				if (request.getParameter("diem") != null) {
					if (request.getParameter("diem").equals("on")) {
						long tienthanhtoan = Long.parseLong(request.getParameter("tienthanhtoan"));
						KhachHangBo khbo = new KhachHangBo();
						if (tienthanhtoan < (khbean.getTichdiem() * 1000)) {
							tongdongia = 0;
							// Cập nhật điểm khách hàng thành 0
							long diemConLai = khbean.getTichdiem() - (tienthanhtoan / 1000);
							khbo.capNhatDiem(khbean.getMakhachhang(), diemConLai);
							
							daThanhToan = true;
						} else {
							tongdongia = tienthanhtoan - (khbean.getTichdiem() * 1000);
							// Cập nhật điểm khách hàng thành 0
							khbo.capNhatDiem(khbean.getMakhachhang(), 0);
						}

						
						//Cộng điểm cho khách hàng khi tiền thanh toán đúng điều kiện
						//Kiểm tra khi đã chuyển khoản thành công thì mới cộng điểm
						TichDiemBo tdbo = new TichDiemBo();
						ArrayList<TichDiemBean> dsTichDiem = tdbo.getDsTichDiem();
						for (TichDiemBean tdbean : dsTichDiem) {
							if (tienthanhtoan >= tdbean.getDieukien()) {
								long diemcong = khbo.getTichDiem(khbean.getMakhachhang()) + tdbean.getDiemcong();
								khbo.capNhatDiem(khbean.getMakhachhang(), diemcong);
								break;
							}
						}
						
						
					}
				} else {
					long tienthanhtoan = Long.parseLong(request.getParameter("tienthanhtoan"));
					tongdongia = tienthanhtoan;
					KhachHangBo khbo = new KhachHangBo();
					
					
					//Cộng điểm cho khách hàng khi tiền thanh toán đúng điều kiện
					//Kiểm tra khi đã chuyển khoản thành công thì mới cộng điểm
					TichDiemBo tdbo = new TichDiemBo();
					ArrayList<TichDiemBean> dsTichDiem = tdbo.getDsTichDiem();
					for (TichDiemBean tdbean : dsTichDiem) {
						if (tienthanhtoan >= tdbean.getDieukien()) {
							long diemcong = khbo.getTichDiem(khbean.getMakhachhang()) + tdbean.getDiemcong();
							khbo.capNhatDiem(khbean.getMakhachhang(), diemcong);
							break;
						}
					}
					
					
					
				}
				HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
				NoiNhanBean nnbean = hskhbo.getNoiNhanHang(khbean.getMakhachhang());
				String diachinhanhang = nnbean.getSonha() + ", " + nnbean.getPhuong() + ", " + nnbean.getQuan() + ", "
						+ nnbean.getThanhpho();

				ddhbo.themDonDatHang(khbean.getMakhachhang(), true, false, tongdongia, diachinhanhang);
				long madonvuathem = ddhbo.getMaxHD(khbean.getMakhachhang());
				DonHangChiTietBo dhctbo = new DonHangChiTietBo();

				if (request.getParameter("spDesign") == null) {
					String dsMaGioChon = request.getParameter("dsMaGioChon");
					GioHangBo sp = new GioHangBo();
					ArrayList<GioHangBean> dsgio = new ArrayList<GioHangBean>();
					if (dsMaGioChon != null) {
						String dsMagiohang[] = dsMaGioChon.split("/");
						for (int i = 0; i < dsMagiohang.length; i++) {
							long magiohang = Long.parseLong(dsMagiohang[i]);
							GioHangBean gh = sp.getSanPhamMua(khbean.getMakhachhang(), magiohang);
							dsgio.add(gh);
						}
					}

					ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();
					for (GioHangBean spbean : dsgio) {
						long soluong = ctspbo.getSoluongTrongKho(spbean.getMasanpham(), spbean.getMausanpham(),
								spbean.getSize());
						long soluongconlai = soluong - spbean.getSoluongmua();

						SanPhamBo spbo = new SanPhamBo();
						// Cập nhật số lượng đã bán
						spbo.capNhatSoLuongDaBan(spbean.getMasanpham(),
								spbean.getSoluongmua() + spbean.getSoluongdaban());

						ctspbo.suaSoHangTrongKho(spbean.getMasanpham(), spbean.getMausanpham(), spbean.getSize(),
								soluongconlai);
						if (spbean.getGiagiam() == 0) {
							dhctbo.themChiTietHD(madonvuathem, spbean.getMasanpham(), spbean.getSoluongmua(),
									spbean.getMausanpham(), spbean.getSize(), null, spbean.getGiaban(),
									spbean.getTensanpham(), spbean.getAnhTheoMau());
						} else {
							dhctbo.themChiTietHD(madonvuathem, spbean.getMasanpham(), spbean.getSoluongmua(),
									spbean.getMausanpham(), spbean.getSize(), null, spbean.getGiagiam(),
									spbean.getTensanpham(), spbean.getAnhTheoMau());
						}
					}

					//Xóa sản phẩm tích trong giỏ hàng
					ArrayList<GioHangBean> giohang = sp.getSanPhamTrongGio(khbean.getMakhachhang());

					for (GioHangBean gh : giohang) {
						for (GioHangBean g : dsgio) {
							if (gh.getMagiohang() == g.getMagiohang()) {
								sp.xoaSpTrongGio(gh.getMagiohang());
							}
						}
					}
				} else {
					String maaodesign = request.getParameter("maaodesign");
					long masanpham = Long.parseLong(maaodesign);
					SanPhamBo spbo = new SanPhamBo();
					SanPhamBean sp = spbo.getSanPham(masanpham);
					ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();

					String maumua = request.getParameter("maumua");
					String sizemua = request.getParameter("sizemua");
					String slm = request.getParameter("soluongmua");
					String anhdesign = request.getParameter("anhdesign");
					String anhTheoMau = request.getParameter("anhTheoMau");
					long soluongmua = Long.parseLong(slm);
					// Cập nhật số lượng đã bán
					spbo.capNhatSoLuongDaBan(masanpham, soluongmua + sp.getSoluongdaban());

					long soluong = ctspbo.getSoluongTrongKho(masanpham, maumua, sizemua);
					long soluongconlai = soluong - soluongmua;
					ctspbo.suaSoHangTrongKho(masanpham, maumua, sizemua, soluongconlai);
					if (sp.getGiagiam() == 0) {
						dhctbo.themChiTietHD(madonvuathem, masanpham, soluongmua, maumua, sizemua, anhdesign,
								sp.getGiaban(), sp.getTensanpham(), anhTheoMau);
					} else {
						dhctbo.themChiTietHD(madonvuathem, masanpham, soluongmua, maumua, sizemua, anhdesign,
								sp.getGiagiam(), sp.getTensanpham(), anhTheoMau);
					}
				}

				if (khbean != null) {
					NoiNhanBean noiNhanBean = hskhbo.getNoiNhanHang(khbean.getMakhachhang());
					if (noiNhanBean != null) {
						request.setAttribute("noinhan", noiNhanBean);
					}
				}

				// GioHangBo giohang = (GioHangBo)session.getAttribute("giohang");
				// for(GioHangBean sp: giohang.dsSP) {
				// dhctbo.themChiTietHD(madonvuathem, sp.getMasanpham(), sp.getSoluongmua(),
				// sp.getMausanpham(), sp.getSize());
				// }
//				System.out.print(request.getParameter("thanhtoan"));
//				session.removeAttribute("giohang");
				
				
//				request.setAttribute("madonvuathem", madonvuathem);
//				request.setAttribute("tienthanhtoan", tongdongia);
				response.sendRedirect("ChuyenKhoan?madonvuathem="+madonvuathem+"&tienthanhtoan="+tongdongia);
				return;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
