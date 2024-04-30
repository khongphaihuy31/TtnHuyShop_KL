package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.KhachHangBean;
import Bo.KhachHangBo;
import nl.captcha.Captcha;



/**
 * Servlet implementation class DangNhapController
 */
@WebServlet("/DangNhapController")
public class DangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapController() {
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
			
			String taikhoan = request.getParameter("taikhoan");
			String matkhau = request.getParameter("matkhau");
			HttpSession session = request.getSession();
			KhachHangBo khbo = new KhachHangBo();
			KhachHangBean kHangBean ;
			if(session.getAttribute("solanloi") == null) {
				session.setAttribute("so", (int)0);
			}
			
			Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
			String answer = request.getParameter("answer");
			if(answer == null) {
				if(taikhoan!=null && matkhau!=null){
						kHangBean = khbo.ktradangnhap(taikhoan, matkhau);
						if(kHangBean != null){
							if(session.getAttribute("solanloi")!= null) {
								session.removeAttribute("solanloi");
							}
							if(kHangBean.isQuyen()==false) {
								session.setAttribute("dn", kHangBean);
								session.setAttribute("taikhoan", kHangBean.getHoten());
								if(request.getParameter("suathongtin") != null) {
									response.sendRedirect("HoSoKhachHangController?info=1&suathongtin=1");
								}else {
									response.sendRedirect("TrangChuController");
								}
							}else {
								session.setAttribute("dn", kHangBean);
								session.setAttribute("taikhoan", taikhoan);
								response.sendRedirect("AdminTrangChuController");
							}
						}else {
							session.setAttribute("so", (int)session.getAttribute("so")+1);
							session.setAttribute("solanloi", session.getAttribute("so"));
							response.sendRedirect("TrangChuController?loi=dangNhap");
						}
				}
			}else {
				if(taikhoan!=null && matkhau!=null){
					kHangBean = khbo.ktradangnhap(taikhoan, matkhau);
					if(kHangBean != null && captcha.isCorrect(answer)){
						if(session.getAttribute("solanloi")!= null) {
							session.removeAttribute("solanloi");
						}
						if(kHangBean.isQuyen()==false) {
							session.setAttribute("dn", kHangBean);
							session.setAttribute("taikhoan", taikhoan);
							if(request.getParameter("suathongtin") != null) {
								response.sendRedirect("HoSoKhachHangController?info=1");
							}else {
								response.sendRedirect("TrangChuController");
							}
						}else {
							session.setAttribute("dn", kHangBean);
							session.setAttribute("taikhoan", taikhoan);
							response.sendRedirect("AdminTrangChuController");
						}
					}else {
						session.setAttribute("so", (int)session.getAttribute("so")+1);
						session.setAttribute("solanloi", session.getAttribute("so"));
						response.sendRedirect("TrangChuController?loi=dangNhap");
					}
			}
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
