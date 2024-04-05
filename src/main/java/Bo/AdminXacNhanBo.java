package Bo;

import Dao.AdminXacNhanDao;

public class AdminXacNhanBo {
	AdminXacNhanDao adminXN = new AdminXacNhanDao();
	public int suaTinhTrangHD(long mahoadon)throws Exception{
		return adminXN.suaTinhTrangHD(mahoadon);
	}
}
