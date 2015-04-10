package com;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;

import com.Mysql;

public class Excel {

	private File file;
	private String filename;
	private HSSFSheet sheet;
	private HSSFRow row;
	private HSSFCell cell;
	private HSSFWorkbook book;
	private Mysql mysql;
	
	public Excel() throws ClassNotFoundException, SQLException
	{
		file=null;
		sheet=null;
		row=null;
		cell=null;
		book=null;
		mysql=Mysql.getInstance();
	}
	public void setFilename(String filename) {
		this.filename = filename;
		file=new File(this.filename);
		try {
			book=new HSSFWorkbook(new FileInputStream(file));
			sheet=book.getSheetAt(0);
		} catch (FileNotFoundException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		} catch (IOException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}
	}
	public boolean insert()
	{
		int num=sheet.getLastRowNum();
		String arr[]=new String[10];
		for(int i=1;i<=num;i++)
		{
			try {
				row=sheet.getRow(i);
				for(int j=0;j<7;j++)
				{
					cell=row.getCell(j);
					cell.setCellType(Cell.CELL_TYPE_STRING);
					arr[j]=cell.getStringCellValue();
				}
				mysql.insert("exercise", "content,select_a,select_b,select_c,select_d,select_correct,num","'"+ arr[1]+"','"+arr[2]+"','"+arr[3]+"','"+arr[4]+"','"+arr[5]+"',"+arr[6]+","+arr[0]);
			} catch (Exception e) {
				continue;
			}
		}
		return true;
	}
	
}
