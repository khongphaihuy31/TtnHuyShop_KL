package Bo;

import java.util.ArrayList;

import Bean.GiamGiaBean;
import Dao.GiamGiaDao;

public class GiamGiaBo {
	GiamGiaDao ggdao = new GiamGiaDao();
	public ArrayList<GiamGiaBean> getGiamGia()throws Exception{
		return ggdao.getGiamGia();
	}
}
