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

public class Delete extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Delete() {
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
		PrintWriter out=response.getWriter();
		String table=request.getParameter("table");
		int id=Integer.parseInt(request.getParameter("id"));
		try {
			Mysql mysql=Mysql.getInstance();
			mysql.delete(table, id);
			response.sendRedirect(table+".jsp");
		} catch (ClassNotFoundException e) {
			// TODO �Զ���ɵ� catch ��
			Logger.getLogger("log").log(Level.WARNING,e.getMessage());
			response.sendRedirect("error.html");
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			Logger.getLogger("log").log(Level.WARNING,e.getMessage());
			response.sendRedirect("error.html");
		}
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
		doGet(request,response);
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
