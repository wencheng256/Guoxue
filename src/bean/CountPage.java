package bean;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Mysql;

public class CountPage {
	
	public int count(int num) throws ClassNotFoundException, SQLException
	{
		Mysql mysql=Mysql.getInstance();
		String sql="SELECT id FROM exercise where num="+num;
		ResultSet rs=mysql.query(sql);
		if(rs.next()){
			int co=rs.getInt(1);
			return co/20+1;
		}
		return 1;
	}

}
