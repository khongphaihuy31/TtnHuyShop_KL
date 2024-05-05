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

import Bo.BannerBo;

/**
 * Servlet implementation class AdminThemSuaBannerController
 */
@WebServlet("/AdminThemSuaBannerController")
public class AdminThemSuaBannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminThemSuaBannerController() {
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
			BannerBo bnbo = new BannerBo();
			//Thêm sản phẩm , upload file
			String mabanner = null ;
			String srcbanner = null;
			
			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
					// xử lý file
					String nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
						String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "Banner";
						File dir = new File(dirUrl);
						if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
							dir.mkdir();
						}
						String fileImg = dirUrl + File.separator + nameimg;
						File file = new File(fileImg);//tạo file
						try {
							fileItem.write(file);//lưu file
							srcbanner = "Banner/"+nameimg;
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}else//Neu la control
				{
					String tentk=fileItem.getFieldName();
					if(tentk.equals("mabanner")) {
						mabanner = fileItem.getString("UTF-8");
					}
				}
			}
			
			if(mabanner== null) {
				int n = bnbo.themBanner(srcbanner);
				if(n ==1) {
					response.sendRedirect("AdminBannerController?thembanner=1");
					return;
				}
			}else {
				long LongMabanner = Long.parseLong(mabanner);
				int n = bnbo.suaBanner(LongMabanner, srcbanner);
				if(n ==1) {
					response.sendRedirect("AdminBannerController?suabanner=1");
					return;
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
