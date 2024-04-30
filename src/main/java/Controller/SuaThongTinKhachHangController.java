package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Bean.KhachHangBean;
import Bo.HoSoKhachHangBo;

/**
 * Servlet implementation class SuaThongTinKhachHangController
 */
@WebServlet("/SuaThongTinKhachHangController")
public class SuaThongTinKhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaThongTinKhachHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		try {
			HoSoKhachHangBo hskhbo = new HoSoKhachHangBo();
			HttpSession session = request.getSession();
			KhachHangBean khbean = (KhachHangBean)session.getAttribute("dn");
			//Thêm sản phẩm , upload file
			String hoten = null ;
			String sodienthoai = null;
			String email = null;
			String anhDaiDien = null;
			String anhDaiDien1 = null;
			
			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
					// xử lý file
					String nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
						String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "Avatar";
						File dir = new File(dirUrl);
						if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
							dir.mkdir();
						}
						String fileImg = dirUrl + File.separator + nameimg;
						File file = new File(fileImg);//tạo file
						try {
							fileItem.write(file);//lưu file
							anhDaiDien = "Avatar/"+nameimg;
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}else//Neu la control
				{
					String tentk=fileItem.getFieldName();
					if(tentk.equals("hoten")) {
						hoten = fileItem.getString("UTF-8");
					}
					if(tentk.equals("sodienthoai")) {
						sodienthoai = fileItem.getString("UTF-8");
					}
					if(tentk.equals("email")) {
						email = fileItem.getString("UTF-8");
					}
					if(tentk.equals("anhDaiDien1")) {
						anhDaiDien1 = fileItem.getString("UTF-8");
					}
				}
			}
			int a = hskhbo.ktraSuaThongTinKh(email, sodienthoai, khbean.getMakhachhang());
			if(a==1) {
				response.sendRedirect("HoSoKhachHangController?info=1&suainfo=thatbai");
				return;
			}else {
				if(anhDaiDien1!=null && anhDaiDien== null) {
					int n = hskhbo.suaThongTinKh(khbean.getMakhachhang(), hoten, khbean.getDiachi(), sodienthoai, email, anhDaiDien1);
					if(n ==1) {
						response.sendRedirect("DangNhapController?suathongtin=1&taikhoan="+sodienthoai+"&matkhau="+khbean.getMatkhau());
						return;
					}
				}else {
					int n = hskhbo.suaThongTinKh(khbean.getMakhachhang(), hoten, khbean.getDiachi(), sodienthoai, email, anhDaiDien);
					if(n ==1) {
						response.sendRedirect("DangNhapController?suathongtin=1&taikhoan="+sodienthoai+"&matkhau="+khbean.getMatkhau());
						return;
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
