package Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoiDao {
	public Connection cn;
	public void ketnoi() throws Exception{
		//B1: xác định hqtcsdl
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url ="jdbc:sqlserver://DESKTOP-THE3LGI:1433;databaseName=CSDLKhoaLuanTotNghiep;user=sa; password=nhathuy123";
		cn= DriverManager.getConnection(url);
	}
}
