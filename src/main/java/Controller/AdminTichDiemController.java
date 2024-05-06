package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.TichDiemBean;
import Bo.TichDiemBo;

/**
 * Servlet implementation class AdminTichDiemController
 */
@WebServlet("/AdminTichDiemController")
public class AdminTichDiemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTichDiemController() {
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
			
			//Lấy danh sách tích điểm
			TichDiemBo tdbo =new TichDiemBo();
			ArrayList<TichDiemBean> dstichdiem;
			dstichdiem = tdbo.getDsTichDiem();
			request.setAttribute("dstichdiem", dstichdiem);
			
			//Xử lý thêm
			String btnthem = request.getParameter("btnthem");
			if(btnthem != null) {
				String dieukien = request.getParameter("dieukien");
				String diemcong = request.getParameter("diemcong");
				long dieukienlong= Long.parseLong(dieukien);
				long diemconglong= Long.parseLong(diemcong);
				tdbo.themTichDiem(dieukienlong, diemconglong);
				response.sendRedirect("AdminTichDiemController?ttdTC=1");
				return;
			}
			
			//Xử lý sửa
			String btnsua = request.getParameter("btnsua");
			if(btnsua != null) {
				String dieukien = request.getParameter("dieukien");
				String diemcong = request.getParameter("diemcong");
				long dieukienlong= Long.parseLong(dieukien);
				long diemconglong= Long.parseLong(diemcong);
				long matichdiem= Long.parseLong(btnsua);
				tdbo.suaTichDiem(matichdiem, dieukienlong, diemconglong);
				response.sendRedirect("AdminTichDiemController?stdTC=1");
				return;
			}
			
			//Xử lý xóa 
			String btnxoa = request.getParameter("btnxoa");
			if(btnxoa != null) {
				long matichdiem = Long.parseLong(btnxoa);
				tdbo.xoaTichDiem(matichdiem);
				response.sendRedirect("AdminTichDiemController?xtdTC=1");
				return;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminTichDiem.jsp");
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
