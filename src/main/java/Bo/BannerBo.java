package Bo;

import java.util.ArrayList;

import Bean.BannerBean;
import Dao.BannerDao;

public class BannerBo {
	BannerDao bndao =  new BannerDao();
	//Lấy danh sách banner
	public ArrayList<BannerBean> getDsBanner() throws Exception{
		return bndao.getDsBanner();
	}
	
	// Thêm banner
	public int themBanner(String srcbanner)throws Exception{
		return bndao.themBanner(srcbanner);
	}
	//Sửa banner
	public int suaBanner(long mabanner, String srcbanner)throws Exception{
		return bndao.suaBanner(mabanner, srcbanner);
	}
	
	//Xóa banner
	public int xoaBanner(long mabanner)throws Exception{
		return bndao.xoaBanner(mabanner);
	}
}
