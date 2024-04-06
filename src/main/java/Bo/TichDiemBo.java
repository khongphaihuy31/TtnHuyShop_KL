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
}
