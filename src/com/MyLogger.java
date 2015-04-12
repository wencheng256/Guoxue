package com;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.FileHandler;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.Logger;


public class MyLogger {
	
	private static boolean status=false;
	private static MyLogger mine;
	
	private MyLogger()
	{
		try {
			Logger.getLogger("log").setLevel(Level.ALL);
			SimpleDateFormat format=new SimpleDateFormat("yyyyMMddhh");
			String date=format.format(new Date());
			Handler handler=new FileHandler("%h/guoxue/"+date+".log",0,10);
			handler.setLevel(Level.ALL);
			Logger.getLogger("log").addHandler(handler);
			System.out.println("日志类启动成功");
		} catch (SecurityException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	static public void open()
	{
		if(!status)
		{
			mine=new MyLogger();
			status=true;
		}
	}
	
	public static MyLogger getInstance()
	{
		return mine;
	}

	

}
