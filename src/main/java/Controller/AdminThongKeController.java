package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AdminThongKeDoanhThu;
import Bean.ThongKeChi;
import Bean.ThongKeThu;
import Bo.AdminThongKeBo;

/**
 * Servlet implementation class AdminThongKeController
 */
@WebServlet("/AdminThongKeController")
public class AdminThongKeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminThongKeController() {
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
			
			if(request.getParameter("thang")!= null) {
				ArrayList<AdminThongKeDoanhThu> dsThongKeDoanhThu= new ArrayList<AdminThongKeDoanhThu>();
				
				AdminThongKeBo adtkbo = new AdminThongKeBo();
				//danh sách thu
				ArrayList<ThongKeThu> dsthu = adtkbo.dsThongKeThuThang();
				//danh sách chi
				ArrayList<ThongKeChi> dschi = adtkbo.dsThongKeChiThang();
				for(ThongKeThu t: dsthu) {
					String thoigianthu = t.getMonth()+"/"+t.getYear();
					boolean cungngay = false;
					ThongKeChi thongKeChi= null;
					for(ThongKeChi c:dschi) {
						String thoigianchi = c.getMonth()+"/"+c.getYear();
						if(thoigianchi.equals(thoigianthu)== true) {
							cungngay = true;
							thongKeChi = c;
							break;
						}
					}
					if(cungngay) {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianthu, t.getThu(), thongKeChi.getChi(), t.getThu()-thongKeChi.getChi()));
					}else {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianthu, t.getThu(), 0, t.getThu()-0));
					}
				}
				
				for(ThongKeChi c:dschi) {
					String thoigianchi = c.getMonth()+"/"+c.getYear();
					boolean congay=false;
					for(AdminThongKeDoanhThu dt: dsThongKeDoanhThu) {
						if(thoigianchi.equals(dt.getThoigian())) {
							congay = true;
							break;
						}
					}
					if(congay== false) {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianchi, 0, c.getChi(), 0-c.getChi()));
					}
				}
				
				request.setAttribute("dsThongKeDoanhThu", dsThongKeDoanhThu);
			}else if(request.getParameter("nam")!= null) {
				ArrayList<AdminThongKeDoanhThu> dsThongKeDoanhThu= new ArrayList<AdminThongKeDoanhThu>();
				
				AdminThongKeBo adtkbo = new AdminThongKeBo();
				//danh sách thu
				ArrayList<ThongKeThu> dsthu = adtkbo.dsThongKeThuNam();
				//danh sách chi
				ArrayList<ThongKeChi> dschi = adtkbo.dsThongKeChiNam();
				for(ThongKeThu t: dsthu) {
					String thoigianthu = t.getYear()+"";
					boolean cungngay = false;
					ThongKeChi thongKeChi= null;
					for(ThongKeChi c:dschi) {
						String thoigianchi = c.getYear()+"";
						if(thoigianchi.equals(thoigianthu)== true) {
							cungngay = true;
							thongKeChi = c;
							break;
						}
					}
					if(cungngay) {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianthu, t.getThu(), thongKeChi.getChi(), t.getThu()-thongKeChi.getChi()));
					}else {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianthu, t.getThu(), 0, t.getThu()-0));
					}
				}
				
				for(ThongKeChi c:dschi) {
					String thoigianchi = c.getYear()+"";
					boolean congay=false;
					for(AdminThongKeDoanhThu dt: dsThongKeDoanhThu) {
						if(thoigianchi.equals(dt.getThoigian())) {
							congay = true;
							break;
						}
					}
					if(congay== false) {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianchi, 0, c.getChi(), 0-c.getChi()));
					}
				}
				
				request.setAttribute("dsThongKeDoanhThu", dsThongKeDoanhThu);
			}else {
				ArrayList<AdminThongKeDoanhThu> dsThongKeDoanhThu= new ArrayList<AdminThongKeDoanhThu>();
				
				AdminThongKeBo adtkbo = new AdminThongKeBo();
				//danh sách thu
				ArrayList<ThongKeThu> dsthu = adtkbo.dsThongKeThu();
				//danh sách chi
				ArrayList<ThongKeChi> dschi = adtkbo.dsThongKeChi();
				for(ThongKeThu t: dsthu) {
					String thoigianthu = t.getDay()+"/"+t.getMonth()+"/"+t.getYear();
					boolean cungngay = false;
					ThongKeChi thongKeChi= null;
					for(ThongKeChi c:dschi) {
						String thoigianchi = c.getDay()+"/"+c.getMonth()+"/"+c.getYear();
						if(thoigianchi.equals(thoigianthu)== true) {
							cungngay = true;
							thongKeChi = c;
							break;
						}
					}
					if(cungngay) {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianthu, t.getThu(), thongKeChi.getChi(), t.getThu()-thongKeChi.getChi()));
					}else {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianthu, t.getThu(), 0, t.getThu()-0));
					}
				}
				
				for(ThongKeChi c:dschi) {
					String thoigianchi = c.getDay()+"/"+c.getMonth()+"/"+c.getYear();
					boolean congay=false;
					for(AdminThongKeDoanhThu dt: dsThongKeDoanhThu) {
						if(thoigianchi.equals(dt.getThoigian())) {
							congay = true;
							break;
						}
					}
					if(congay== false) {
						dsThongKeDoanhThu.add(new AdminThongKeDoanhThu(thoigianchi, 0, c.getChi(), 0-c.getChi()));
					}
				}
				
				request.setAttribute("dsThongKeDoanhThu", dsThongKeDoanhThu);
			}
			
			
			
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminThongKe.jsp");
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
