package Bo;

import java.util.ArrayList;

import Bean.TichDiemBean;
import Dao.TichDiemDao;

public class TichDiemBo {
	TichDiemDao tddao = new TichDiemDao();
	//Xử lý lấy danh dách tich điểm
	public ArrayList<TichDiemBean> getDsTichDiem()throws Exception{
		return tddao.getDsTichDiem();
	}
	
	// Thêm tích điểm
	public int themTichDiem(long dieukien, long diemcong)throws Exception{
		return tddao.themTichDiem(dieukien, diemcong);
	}
	
	//Sửa tích điểm
	public int suaTichDiem(long matichdiem,long dieukien, long diemcong)throws Exception{
		return tddao.suaTichDiem(matichdiem, dieukien, diemcong);
	}
	//Xóa tích điểm
	public int xoaTichDiem(long matichdiem)throws Exception{
		return tddao.xoaTichDiem(matichdiem);
	}
}
