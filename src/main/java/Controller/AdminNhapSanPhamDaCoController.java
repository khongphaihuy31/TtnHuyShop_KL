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

/**
 * Servlet implementation class AdminNhapSanPhamDaCoController
 */
@WebServlet("/AdminNhapSanPhamDaCoController")
public class AdminNhapSanPhamDaCoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNhapSanPhamDaCoController() {
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
			//Thêm sản phẩm , upload file
			String gianhap = null;
			String lsize1 = null;
			String lsize2 = null;
			String lsize3 =  null;
			String lsize4 = null;
			String lsize5 = null;
			String lmau1 = null;
			String anhmau1 = null;
			String lmau2 =  null;
			String anhmau2 = null;
			String lmau3 = null;
			String anhmau3 = null;
			String lmau4 = null;
			String anhmau4 =  null;
			String lmau5 = null;
			String anhmau5 = null;
			String btnnhapcu = null;
			
			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
					// xử lý file
					String tentk=fileItem.getFieldName();
					
					if(tentk.equals("anhmau1")) {
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
							//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhSanPham";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anhmau1 = "anhSanPham/"+nameimg;
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
					
					if(tentk.equals("anhmau2")) {
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
							//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhSanPham";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anhmau2 = "anhSanPham/"+nameimg;
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
					
					if(tentk.equals("anhmau3")) {
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
							//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhSanPham";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anhmau3 = "anhSanPham/"+nameimg;
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
					
					if(tentk.equals("anhmau4")) {
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
							//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhSanPham";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anhmau4 = "anhSanPham/"+nameimg;
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
					
					if(tentk.equals("anhmau5")) {
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
							//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhSanPham";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anhmau5 = "anhSanPham/"+nameimg;
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
					
				 }else//Neu la control
				 {
					String tentk=fileItem.getFieldName();
					
					if(tentk.equals("gianhap")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							gianhap = fileItem.getString();
//						}
					}
					if(tentk.equals("lsize1")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							lsize1 = fileItem.getString();
//						}
					}
					if(tentk.equals("lsize2")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							lsize2 = fileItem.getString();
//						}
					}
					if(tentk.equals("lsize3")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							lsize3 = fileItem.getString();
//						}
					}
					if(tentk.equals("lsize4")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							lsize4 = fileItem.getString();
//						}
					}
					if(tentk.equals("lsize5")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							lsize5 = fileItem.getString();
//						}
					}
					if(tentk.equals("lmau1")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau1 = fileItem.getString();
//						}
					}
					if(tentk.equals("lmau2")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau2 = fileItem.getString();
//						}
					}
					if(tentk.equals("lmau3")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau3 = fileItem.getString();
//						}
					}
					if(tentk.equals("lmau4")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau4 = fileItem.getString();
//						}
					}
					if(tentk.equals("lmau5")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau5 = fileItem.getString();
//						}
					}
					if(tentk.equals("btnnhapcu")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						btnnhapcu = fileItem.getString();
//						}
					}
				}
			}
			
			response.sendRedirect("AdminNhapChiTietController?btnnhapcu="+btnnhapcu+"&gianhap="+gianhap+"&lsize1="+lsize1+"&lsize2="+lsize2+"&lsize3="+lsize3+"&lsize4="+lsize4+"&lsize5="+lsize5+"&lmau1="+lmau1+"&anhmau1="+anhmau1+"&lmau2="+lmau2+"&anhmau2="+anhmau2+"&lmau3="+lmau3+"&anhmau3="+anhmau3+"&lmau4="+lmau4+"&anhmau4="+anhmau4+"&lmau5="+lmau5+"&anhmau5="+anhmau5);
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
