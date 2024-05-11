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
import Bean.ChiTietSanPhamBean;
import Bean.SizeSanPhamBean;
import Bo.AdminSanPhamBo;

/**
 * Servlet implementation class AdminNhapChiTietController
 */
@WebServlet("/AdminNhapChiTietController")
public class AdminNhapChiTietController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNhapChiTietController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			if(request.getParameter("btnnhapcu")== null) {
				String tensanpham = request.getParameter("tensanpham");
				String gianhap = request.getParameter("gianhap");
				String giaban = request.getParameter("giaban");
				String maloai = request.getParameter("maloai");
				String mathuonghieu = request.getParameter("mathuonghieu");
				String madanhmuc = request.getParameter("madanhmuc");
				String motasanpham = request.getParameter("FCKeditor1");
				String anh = request.getParameter("anh");
				String anhchonsize =  request.getParameter("anhchonsize");
				String lsize1 = request.getParameter("lsize1");
				String lsize2 = request.getParameter("lsize2");
				String lsize3 =  request.getParameter("lsize3");
				String lsize4 = request.getParameter("lsize4");
				String lsize5 = request.getParameter("lsize5");
				String lmau1 = request.getParameter("lmau1");
				String anhmau1 = request.getParameter("anhmau1");
				String lmau2 =  request.getParameter("lmau2");
				String anhmau2 = request.getParameter("anhmau2");
				String lmau3 = request.getParameter("lmau3");
				String anhmau3 = request.getParameter("anhmau3");
				String lmau4 = request.getParameter("lmau4");
				String anhmau4 =  request.getParameter("anhmau4");
				String lmau5 = request.getParameter("lmau5");
				String anhmau5 = request.getParameter("anhmau5");
				
				//Lấy list size để xử lý nhập chi tiết
				if(request.getParameter("btnNhapHang") == null) {
					ArrayList<String> listSize = new ArrayList<String>();
					if(!lsize1.equals("")) {
						listSize.add("'"+lsize1+"'");
					}
					if(!lsize2.equals("")) {
						listSize.add("'"+lsize2+"'");
					}
					if(!lsize3.equals("")) {
						listSize.add("'"+lsize3+"'");
					}
					if(!lsize4.equals("")) {
						listSize.add("'"+lsize4+"'");
					}
					if(!lsize5.equals("")) {
						listSize.add("'"+lsize5+"'");
					}
					request.setAttribute("listSize", listSize);
					
					//Lấy list màu
					ArrayList<String> listMau = new ArrayList<String>();
					if(!lmau1.equals("")) {
						listMau.add("'"+lmau1+"'");
					}
					if(!lmau2.equals("")) {
						listMau.add("'"+lmau2+"'");
					}
					if(!lmau3.equals("")) {
						listMau.add("'"+lmau3+"'");
					}
					if(!lmau4.equals("")) {
						listMau.add("'"+lmau4+"'");
					}
					if(!lmau5.equals("")) {
						listMau.add("'"+lmau5+"'");
					}
					request.setAttribute("listMau", listMau);
				}else {
					long soluongnhap=0;
					//Lấy list size để nhập hàng
					ArrayList<String> listSize = new ArrayList<String>();
					if(!lsize1.equals("")) {
						listSize.add(lsize1);
					}
					if(!lsize2.equals("")) {
						listSize.add(lsize2);
					}
					if(!lsize3.equals("")) {
						listSize.add(lsize3);
					}
					if(!lsize4.equals("")) {
						listSize.add(lsize4);
					}
					if(!lsize5.equals("")) {
						listSize.add(lsize5);
					}
					
					ArrayList<String> listMau1 = new ArrayList<String>();
					if(!lmau1.equals("")) {
						listMau1.add(lmau1);
					}
					if(!lmau2.equals("")) {
						listMau1.add(lmau2);
					}
					if(!lmau3.equals("")) {
						listMau1.add(lmau3);
					}
					if(!lmau4.equals("")) {
						listMau1.add(lmau4);
					}
					if(!lmau5.equals("")) {
						listMau1.add(lmau5);
					}
					for(String mau:listMau1) {
						for(String size: listSize) {
							String sln = request.getParameter(mau+"/"+size);
							if(!sln.equals("")) {
								soluongnhap += Long.parseLong(sln);
							}
						}
					}
					if(soluongnhap==0) {
						response.sendRedirect("AdminNhapChiTietController?tensanpham="+tensanpham+"&gianhap="+gianhap+"&giaban="+giaban+"&maloai="+maloai+"&mathuonghieu="+mathuonghieu+"&madanhmuc="+madanhmuc+"&motasanpham="+motasanpham+"&anh="+anh+"&anhchonsize="+anhchonsize+"&lsize1="+lsize1+"&lsize2="+lsize2+"&lsize3="+lsize3+"&lsize4="+lsize4+"&lsize5="+lsize5+"&lmau1="+lmau1+"&anhmau1="+anhmau1+"&lmau2="+lmau2+"&anhmau2="+anhmau2+"&lmau3="+lmau3+"&anhmau3="+anhmau3+"&lmau4="+lmau4+"&anhmau4="+anhmau4+"&lmau5="+lmau5+"&anhmau5="+anhmau5+"&chuacosl=1");
						return;
					}else {
						//Nhập sản phẩm mới
						long giabanLong = Long.parseLong(giaban);
						long maloaiLong = Long.parseLong(maloai);
						long mathuonghieuLong = Long.parseLong(mathuonghieu);
						long madanhmucLong = Long.parseLong(madanhmuc);
						AdminSanPhamBo adspbo = new AdminSanPhamBo();
						//thêm vào bảng SanPham
						adspbo.themSanPham(tensanpham, anh, giabanLong, motasanpham, maloaiLong, mathuonghieuLong, madanhmucLong, anhchonsize);
						//lấy mã sản phẩm vừa thêm
						long masanpham = adspbo.getMaxMasanpham();
						
						//Nhập size cho sản phẩm
						for(String size: listSize) {
							adspbo.themSizeSanPham(size, masanpham);
						}
						
						//Lấy list màu để nhập hàng
						ArrayList<String> listMau = new ArrayList<String>();
						if(!lmau1.equals("")) {
							adspbo.themMauSanPham(lmau1, anhmau1, masanpham);
							listMau.add(lmau1);
						}
						if(!lmau2.equals("")) {
							adspbo.themMauSanPham(lmau2, anhmau2, masanpham);
							listMau.add(lmau2);
						}
						if(!lmau3.equals("")) {
							adspbo.themMauSanPham(lmau3, anhmau3, masanpham);
							listMau.add(lmau3);
						}
						if(!lmau4.equals("")) {
							adspbo.themMauSanPham(lmau4, anhmau4, masanpham);
							listMau.add(lmau4);
						}
						if(!lmau5.equals("")) {
							adspbo.themMauSanPham(lmau5, anhmau5, masanpham);
							listMau.add(lmau5);
						}
						
						//Nhập hàng
						long gianhapLong = Long.parseLong(gianhap);
						adspbo.nhapHang(masanpham, soluongnhap, gianhapLong, soluongnhap*gianhapLong);
						//Lấy mã nhập hàng vừa thêm
						long madonnhap = adspbo.getMaxMadonnhap();
						//Thêm chi tiết hàng nhập và chi tiết sản phẩm
						for(String mau:listMau) {
							for(String size: listSize) {
								String sln = request.getParameter(mau+"/"+size);
								if(!sln.equals("")) {
									long soluong = Long.parseLong(sln);
									adspbo.chiTietNhapHang(masanpham, mau, size, soluong, madonnhap);
									adspbo.chiTietSanPham(masanpham, mau, size, soluong);
								}
							}
						}
						response.sendRedirect("AdminSanPhamController?nmTC=1");
						return;
					}
				}
			}else {
				String gianhap = request.getParameter("gianhap");
				String lsize1 = request.getParameter("lsize1");
				String lsize2 = request.getParameter("lsize2");
				String lsize3 =  request.getParameter("lsize3");
				String lsize4 = request.getParameter("lsize4");
				String lsize5 = request.getParameter("lsize5");
				String lmau1 = request.getParameter("lmau1");
				String anhmau1 = request.getParameter("anhmau1");
				String lmau2 =  request.getParameter("lmau2");
				String anhmau2 = request.getParameter("anhmau2");
				String lmau3 = request.getParameter("lmau3");
				String anhmau3 = request.getParameter("anhmau3");
				String lmau4 = request.getParameter("lmau4");
				String anhmau4 =  request.getParameter("anhmau4");
				String lmau5 = request.getParameter("lmau5");
				String anhmau5 = request.getParameter("anhmau5");
				
				//Lấy list size để xử lý nhập chi tiết
				if(request.getParameter("btnNhapHang") == null) {
					ArrayList<String> listSize = new ArrayList<String>();
					String btnnhapcu = request.getParameter("btnnhapcu");
					long masanpham= Long.parseLong(btnnhapcu);
					AdminSanPhamBo adspbo = new AdminSanPhamBo();
					//Lấy danh sách size của sản phẩm
					ArrayList<SizeSanPhamBean> dssize = adspbo.dsSizeSanPham(masanpham);
					for(SizeSanPhamBean s:dssize) {
						listSize.add("'"+s.getSize()+"'");
					}
					if(!lsize1.equals("null") && !lsize1.equals("")) {
						listSize.add("'"+lsize1+"'");
					}
					if(!lsize2.equals("null") && !lsize2.equals("")) {
						listSize.add("'"+lsize2+"'");
					}
					if(!lsize3.equals("null") && !lsize3.equals("")) {
						listSize.add("'"+lsize3+"'");
					}
					if(!lsize4.equals("null") && !lsize4.equals("")) {
						listSize.add("'"+lsize4+"'");
					}
					if(!lsize5.equals("null") && !lsize5.equals("")) {
						listSize.add("'"+lsize5+"'");
					}
					request.setAttribute("listSize", listSize);
					
					//Lấy list màu
					ArrayList<String> listMau = new ArrayList<String>();
					ArrayList<AnhSanPham> dsMau = adspbo.dsAnhSanPham(masanpham);
					for(AnhSanPham a: dsMau) {
						listMau.add("'"+a.getMauString()+"'");
					}
					if(!lmau1.equals("null") && !lmau1.equals("")) {
						listMau.add("'"+lmau1+"'");
					}
					if(!lmau2.equals("null") && !lmau2.equals("")) {
						listMau.add("'"+lmau2+"'");
					}
					if(!lmau3.equals("null") && !lmau3.equals("")) {
						listMau.add("'"+lmau3+"'");
					}
					if(!lmau4.equals("null") && !lmau4.equals("")) {
						listMau.add("'"+lmau4+"'");
					}
					if(!lmau5.equals("null") && !lmau5.equals("")) {
						listMau.add("'"+lmau5+"'");
					}
					request.setAttribute("listMau", listMau);
				}else {
					long soluongnhap=0;
					String btnnhapcu = request.getParameter("btnnhapcu");
					long masanpham= Long.parseLong(btnnhapcu);
					//Lấy list size để nhập hàng
					ArrayList<String> listSize = new ArrayList<String>();
					AdminSanPhamBo adspbo = new AdminSanPhamBo();
					//Lấy danh sách size của sản phẩm
					ArrayList<SizeSanPhamBean> dssize = adspbo.dsSizeSanPham(masanpham);
					for(SizeSanPhamBean s:dssize) {
						listSize.add(s.getSize());
					}
					if(!lsize1.equals("") && !lsize1.equals("null")) {
						listSize.add(lsize1);
					}
					if(!lsize2.equals("") && !lsize2.equals("null")) {
						listSize.add(lsize2);
					}
					if(!lsize3.equals("") && !lsize3.equals("null")) {
						listSize.add(lsize3);
					}
					if(!lsize4.equals("") && !lsize4.equals("null")) {
						listSize.add(lsize4);
					}
					if(!lsize5.equals("") && !lsize5.equals("null")) {
						listSize.add(lsize5);
					}
					
					//Lấy list màu
					ArrayList<String> listMau1 = new ArrayList<String>();
					ArrayList<AnhSanPham> dsMau = adspbo.dsAnhSanPham(masanpham);
					for(AnhSanPham a: dsMau) {
						listMau1.add(a.getMauString());
					}
					if(!lmau1.equals("") && !lmau1.equals("null")) {
						adspbo.themMauSanPham(lmau1, anhmau1, masanpham);
						listMau1.add(lmau1);
					}
					if(!lmau2.equals("") && !lmau2.equals("null")) {
						adspbo.themMauSanPham(lmau2, anhmau2, masanpham);
						listMau1.add(lmau2);
					}
					if(!lmau3.equals("") && !lmau3.equals("null")) {
						adspbo.themMauSanPham(lmau3, anhmau3, masanpham);
						listMau1.add(lmau3);
					}
					if(!lmau4.equals("") && !lmau4.equals("null")) {
						adspbo.themMauSanPham(lmau4, anhmau4, masanpham);
						listMau1.add(lmau4);
					}
					if(!lmau5.equals("") && !lmau5.equals("null")) {
						adspbo.themMauSanPham(lmau5, anhmau5, masanpham);
						listMau1.add(lmau5);
					}
					for(String mau:listMau1) {
						for(String size: listSize) {
							String sln = request.getParameter(mau+"/"+size);
							if(!sln.equals("")) {
								soluongnhap += Long.parseLong(sln);
							}
						}
					}
					if(soluongnhap==0) {
						response.sendRedirect("AdminNhapChiTietController?btnnhapcu="+btnnhapcu+"&gianhap="+gianhap+"&lsize1="+lsize1+"&lsize2="+lsize2+"&lsize3="+lsize3+"&lsize4="+lsize4+"&lsize5="+lsize5+"&lmau1="+lmau1+"&anhmau1="+anhmau1+"&lmau2="+lmau2+"&anhmau2="+anhmau2+"&lmau3="+lmau3+"&anhmau3="+anhmau3+"&lmau4="+lmau4+"&anhmau4="+anhmau4+"&lmau5="+lmau5+"&anhmau5="+anhmau5);
						return;
					}else {
						//Nhập size cho sản phẩm
						for(String size: listSize) {
							boolean cosizeroi = false;
							for(SizeSanPhamBean s: dssize) {
								if(s.getSize().equals(size)) {
									cosizeroi= true;
									break;
								}
							}
							if(cosizeroi==false) {
								adspbo.themSizeSanPham(size, masanpham);
							}
						}
						
//						//Lấy list màu để nhập hàng
//						ArrayList<String> listMau = new ArrayList<String>();
//						ArrayList<AnhSanPham> 
//						if(!lmau1.equals("")) {
//							adspbo.themMauSanPham(lmau1, anhmau1, masanpham);
//							listMau.add(lmau1);
//						}
//						if(!lmau2.equals("")) {
//							adspbo.themMauSanPham(lmau2, anhmau2, masanpham);
//							listMau.add(lmau2);
//						}
//						if(!lmau3.equals("")) {
//							adspbo.themMauSanPham(lmau3, anhmau3, masanpham);
//							listMau.add(lmau3);
//						}
//						if(!lmau4.equals("")) {
//							adspbo.themMauSanPham(lmau4, anhmau4, masanpham);
//							listMau.add(lmau4);
//						}
//						if(!lmau5.equals("")) {
//							adspbo.themMauSanPham(lmau5, anhmau5, masanpham);
//							listMau.add(lmau5);
//						}
						
						//Nhập hàng
						long gianhapLong = Long.parseLong(gianhap);
						adspbo.nhapHang(masanpham, soluongnhap, gianhapLong, soluongnhap*gianhapLong);
						//Lấy mã nhập hàng vừa thêm
						long madonnhap = adspbo.getMaxMadonnhap();
						//Thêm chi tiết hàng nhập và chi tiết sản phẩm
						for(String mau:listMau1) {
							for(String size: listSize) {
								String sln = request.getParameter(mau+"/"+size);
								if(!sln.equals("")) {
									long soluong = Long.parseLong(sln);
									adspbo.chiTietNhapHang(masanpham, mau, size, soluong, madonnhap);
									ArrayList<ChiTietSanPhamBean> dsctsp = adspbo.dsChiTietSanPhamThemMasanpham(masanpham);
									long sltonkho=0;
									boolean cochitietsproi= false;
									for(ChiTietSanPhamBean ct: dsctsp) {
										if(ct.getMau().equals(mau) && ct.getSize().equals(size)) {
											sltonkho = ct.getSoluong();
											cochitietsproi = true;
										}
									}
									if(cochitietsproi== false) {
										adspbo.chiTietSanPham(masanpham, mau, size, soluong);
									}else {
										adspbo.capNhatChiTietSanPham(masanpham, mau, size, soluong+sltonkho);
									}
								}
							}
						}
						response.sendRedirect("AdminSanPhamController?nmTC=1");
						return;
					}
				}
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminNhapChiTiet.jsp");
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
