package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Bo.AdminSanPhamBo;

/**
 * Servlet implementation class AdminThemSanPhamController
 */
@WebServlet("/AdminThemSanPhamController")
public class AdminThemSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminThemSanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			//Thêm sản phẩm , upload file
				String tensanpham = null ;
				String giacu = null;
				String giamoi = null;
				String soluongdaban = null;
				String motasanpham = null;
				String chitietsanpham = null;
				String maloai = null;
				String mathuonghieu = null;
				String madanhmuc = null;
				String anh = null;
				List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
				//duyệt qua các đối tượng gửi lên từ client gồm file và các control
				for (FileItem fileItem : fileItems) {
					if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
						// xử lý file
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
					   //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhUpFile";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anh = "anhUpFile/"+nameimg;
							} catch (Exception e) {
							    e.printStackTrace();
							}
						}
					 }else//Neu la control
					 {
						String tentk=fileItem.getFieldName();
						if(tentk.equals("tensanpham")) {
							tensanpham = fileItem.getString();
						}
						if(tentk.equals("giacu")) {
							giacu = fileItem.getString();
						}
						if(tentk.equals("giamoi")) {
							giamoi = fileItem.getString();
						}
						if(tentk.equals("soluongdaban")) {
							soluongdaban = fileItem.getString();
						}
						if(tentk.equals("motasanpham")) {
							motasanpham = fileItem.getString();
						}
						if(tentk.equals("chitietsanpham")) {
							chitietsanpham = fileItem.getString();
						}
						if(tentk.equals("maloai")) {
							maloai = fileItem.getString();
						}
						if(tentk.equals("mathuonghieu")) {
							mathuonghieu = fileItem.getString();
						}
						if(tentk.equals("madanhmuc")) {
							madanhmuc = fileItem.getString();
						}
					}
				}
				long giacu1 = Long.parseLong(giacu);
				long giamoi1 = Long.parseLong(giamoi);
				long soluongdaban1 = Long.parseLong(soluongdaban);
				long maloai1 = Long.parseLong(maloai);
				long mathuonghieu1 = Long.parseLong(mathuonghieu);
				long madanhmuc1 = Long.parseLong(madanhmuc);
				
				AdminSanPhamBo spbo = new AdminSanPhamBo();
				spbo.themSanPham(tensanpham, anh, giacu1, giamoi1, soluongdaban1, motasanpham, chitietsanpham, maloai1, mathuonghieu1, madanhmuc1);
				response.sendRedirect("AdminSanPhamController");
				return;
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
