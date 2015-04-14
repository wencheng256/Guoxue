package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Mysql {

	private static Mysql mysql;
	private Statement statement;
	private PreparedStatement select;
	private Connection connection;
	private String url;
	
	
	private Mysql() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Scanner in=new Scanner(getClass().getResourceAsStream("mysql.txt"));
		String host=in.nextLine();
		String duan=in.nextLine();
		String username=in.nextLine();
		String pass=in.nextLine();
		
		url="jdbc:mysql://"+host+":"+duan+"/guoxue?useUnicode=true&characterEncoding=utf-8";
		connection=DriverManager.getConnection(url,username,pass);
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
		return statement.executeQuery(sql);
	}
	public int insert(String table,String key,String value) throws SQLException
	{
		String sql="INSERT INTO "+table+"("+key+") Values("+value+")";
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
