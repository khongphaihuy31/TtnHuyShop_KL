package Bo;

import java.util.ArrayList;

import Bean.DanhMucBean;
import Dao.DanhMucDao;

public class DanhMucBo {
	DanhMucDao dmdao = new DanhMucDao();
	public ArrayList<DanhMucBean> dsDanhMuc()throws Exception{
		return dmdao.dsDanhMuc();
	}
}
