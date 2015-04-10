package bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.Mysql;

public class data {
	
	private Mysql mysql;
	private ResultSet rs;
	
	public data()
	{
		try {
			mysql = Mysql.getInstance();
		} catch (ClassNotFoundException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}
	}
	
	public void getTable(String table) throws SQLException
	{
		rs = mysql.selectAll(table);
	}
	public void query(String sql) throws SQLException
	{
		//System.out.println(sql);
		rs=mysql.query(sql);
	}
	public int count(String table) throws SQLException
	{
		String sql="select count(*) from "+table;
		ResultSet set1=mysql.query(sql);
		set1.next();
		return set1.getInt(1);
	}

	public ResultSet getRs() {
		return rs;
	}

}
