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
 * Servlet implementation class AdminSuaSanPhamUpfile
 */
@WebServlet("/AdminSuaSanPhamUpfile")
public class AdminSuaSanPhamUpfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSuaSanPhamUpfile() {
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
			String tensanpham = null;
			String giaban = null;
			String giagiam = null;
			String loai =  null;
			String thuonghieu = null;
			String danhmuc = null;
			String anh = null;
			String anhchonsize =  null;
			String btnsua = null;
			String lmau1 =  null;
			String anhmau1 = null;
			String lmau2 =  null;
			String anhmau2 = null;
			String lmau3 = null;
			String anhmau3 = null;
			String lmau4 = null;
			String anhmau4 =  null;
			String lmau5 = null;
			String anhmau5 = null;
			
			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
					// xử lý file
					String tentk=fileItem.getFieldName();
					if(tentk.equals("anh")) {
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
							//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhBiaSanPham";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anh = "anhBiaSanPham/"+nameimg;
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
					if(tentk.equals("anhchonsize")) {
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
							//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhChonSize";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anhchonsize = "anhChonSize/"+nameimg;
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
					
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
					
					if(tentk.equals("tensanpham")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						tensanpham = fileItem.getString("utf-8");
//						}
					}
					if(tentk.equals("giaban")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							giaban = fileItem.getString();
//						}
					}
					
					if(tentk.equals("giagiam")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							giagiam = fileItem.getString();
//						}
					}
					if(tentk.equals("loai")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							loai = fileItem.getString();
//						}
					}
					if(tentk.equals("thuonghieu")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							thuonghieu = fileItem.getString();
//						}
					}
					if(tentk.equals("danhmuc")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
							danhmuc = fileItem.getString();
//						}
					}
					if(tentk.equals("lmau1")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau1 = fileItem.getString("utf-8");
//						}
					}
					if(tentk.equals("lmau2")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau2 = fileItem.getString("utf-8");
//						}
					}
					if(tentk.equals("lmau3")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau3 = fileItem.getString("utf-8");
//						}
					}
					if(tentk.equals("lmau4")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau4 = fileItem.getString("utf-8");
//						}
					}
					if(tentk.equals("lmau5")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						lmau5 = fileItem.getString("utf-8");
//						}
					}
					if(tentk.equals("btnsua")) {
//						String nameimg = fileItem.getName();
//						if(nameimg != null) {
						btnsua = fileItem.getString();
//						}
					}
				}
			}
			
			AdminSanPhamBo adspbo = new AdminSanPhamBo();
			long giabanLong = Long.parseLong(giaban);
			long masanpham = Long.parseLong(btnsua);
			long maloai = Long.parseLong(loai);
			long mathuonghieu = Long.parseLong(thuonghieu);
			long madanhmuc = Long.parseLong(danhmuc);
			//Cập nhật sản phẩm
			if(giagiam.equals("")) {
				adspbo.suaGiaGiamSanPham(masanpham, tensanpham, giabanLong, 0, maloai, mathuonghieu, madanhmuc);
			}else {
				long giagiamLong = Long.parseLong(giagiam);
				adspbo.suaGiaGiamSanPham(masanpham, tensanpham, giabanLong, giagiamLong, maloai, mathuonghieu, madanhmuc);
			}
			
			//Cập nhật ảnh sản phẩm
			if(anh != null) {
				adspbo.suaAnhSanPham(masanpham, anh);
			}
			
			//Cập nhật ảnh chọn size
			if(anhchonsize!= null) {
				adspbo.suaAnhChonSize(masanpham, anhchonsize);
			}
			
			//Cập nhật ảnh sản phẩm theo màu
			if(anhmau1 != null) {
				adspbo.suaAnhSanPhamTheoMau(masanpham, lmau1, anhmau1);
			}
			if(anhmau2!= null) {
				adspbo.suaAnhSanPhamTheoMau(masanpham, lmau2, anhmau2);
			}
			if(anhmau3!= null) {
				adspbo.suaAnhSanPhamTheoMau(masanpham, lmau3, anhmau3);
			}
			if(anhmau4!= null) {
				adspbo.suaAnhSanPhamTheoMau(masanpham, lmau4, anhmau4);
			}
			if(anhmau5!= null) {
				adspbo.suaAnhSanPhamTheoMau(masanpham, lmau5, anhmau5);
			}
			
			response.sendRedirect("AdminSanPhamController?sspCT=1");
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
