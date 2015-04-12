package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Mysql;

public class Deleteperson extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Deleteperson() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num=request.getParameter("num");
		String sql="DELETE  from user WHERE num='"+num+"'";
		String sql2="DELETE  from grade WHERE user='"+num+"'";
		System.out.println(sql);
		System.out.println(sql2);
		try {
			Mysql mysql=Mysql.getInstance();
			mysql.update(sql);
			mysql.update(sql2);
			response.sendRedirect("person.jsp");
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			Logger.getLogger("log").log(Level.WARNING,e.getMessage());
			response.sendRedirect("error.html");
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			Logger.getLogger("log").log(Level.WARNING,e.getMessage());
			response.sendRedirect("error.html");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
