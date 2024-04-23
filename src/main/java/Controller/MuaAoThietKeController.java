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

import Bo.ChiTietSanPhamBo;

/**
 * Servlet implementation class MuaAoThietKeController
 */
@WebServlet("/MuaAoThietKeController")
public class MuaAoThietKeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MuaAoThietKeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		try {
				
//				String maumua = request.getParameter("mau");
//				String sizemua = request.getParameter("size");
//				String maaodesign = request.getParameter("maaodesign");
//				String soluongmua = request.getParameter("soluongmua");
//				String anhdesign = request.getParameter("soluongmua");
				
				//Thêm sản phẩm , upload file
				String maumua = null ;
				String sizemua = null;
				String maaodesign = null;
				String soluongmua = null;
				String anhdesign = null;
				String anhTheoMau = null;
				
				List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
				//duyệt qua các đối tượng gửi lên từ client gồm file và các control
				for (FileItem fileItem : fileItems) {
					if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
						// xử lý file
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
					   //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "anhDesign";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anhdesign = "anhDesign/"+nameimg;
							} catch (Exception e) {
							    e.printStackTrace();
							}
						}
					 }else//Neu la control
					 {
						String tentk=fileItem.getFieldName();
						if(tentk.equals("mau")) {
							maumua = fileItem.getString();
						}
						if(tentk.equals("size")) {
							sizemua = fileItem.getString("UTF-8");
						}
						if(tentk.equals("maaodesign")) {
							maaodesign = fileItem.getString("UTF-8");
						}
						if(tentk.equals("soluongmua")) {
							soluongmua = fileItem.getString("UTF-8");
						}
						if(tentk.equals("anhTheoMau")) {
							anhTheoMau = fileItem.getString("UTF-8");
						}
					}
				}
				long masanpham = Long.parseLong(maaodesign);
				String mausanpham = maumua;
				String size = sizemua;
				long soluongmua1 = Long.parseLong(soluongmua);
//				long soluongdaban1 = Long.parseLong(soluongdaban);
//				long maloai1 = Long.parseLong(maloai);
//				long mathuonghieu1 = Long.parseLong(mathuonghieu);
//				long madanhmuc1 = Long.parseLong(madanhmuc);
//				
				ChiTietSanPhamBo ctspbo = new ChiTietSanPhamBo();
				long soluongSpTrongKho = ctspbo.getSoluongTrongKho(masanpham, mausanpham, size);
				if(soluongmua1> soluongSpTrongKho) {
					response.sendRedirect("ThietKeAoController?msp="+masanpham+"&khongdu=1");
					return;
				}
//				AdminSanPhamBo spbo = new AdminSanPhamBo();
//				spbo.themSanPham(tensanpham, anh, giacu1, giamoi1, soluongdaban1, motasanpham, chitietsanpham, maloai1, mathuonghieu1, madanhmuc1);
				response.sendRedirect("ThanhToanController?maumua="+maumua+"&sizemua="+sizemua+"&maaodesign="+maaodesign+"&soluongmua="+soluongmua+"&anhdesign="+anhdesign+"&anhTheoMau="+anhTheoMau);
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
