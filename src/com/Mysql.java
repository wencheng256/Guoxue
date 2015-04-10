package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Mysql {

	private static Mysql mysql;
	private Statement statement;
	private PreparedStatement select;
	private Connection connection;
	private String url;
	private String user;
	private String pass;
	
	
	private Mysql() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		user="root";
		pass="abc123";
		url="jdbc:mysql://localhost:3306/guoxue?useUnicode=true&characterEncoding=utf-8";
		connection=DriverManager.getConnection(url, user, pass);
		statement=connection.createStatement();
		select=connection.prepareStatement("select * from ?");
	}
	
	static public Mysql getInstance() throws ClassNotFoundException, SQLException
	{
		if(mysql==null)
			mysql=new Mysql();
		return mysql;
	}
	
	public ResultSet query(String sql) throws SQLException
	{
		//System.out.println(sql);
		return statement.executeQuery(sql);
	}
	public int insert(String table,String key,String value) throws SQLException
	{
		String sql="INSERT INTO "+table+"("+key+") Values("+value+")";
		//System.out.println(sql);
		return statement.executeUpdate(sql);
	}
	
	public ResultSet selectAll(String table) throws SQLException
	{
		select.setString(1,table);
		return select.executeQuery();
	}
	public int delete(String table,int id) throws SQLException
	{
		String sql="delete from "+table+" where id ="+id;
		return statement.executeUpdate(sql);
	}
	public int update(String sql) throws SQLException
	{
		//System.out.println(sql);
		return statement.executeUpdate(sql);
	}
	
}
