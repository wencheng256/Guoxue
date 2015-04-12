package servlet;

import java.io.IOException;

import com.Mysql;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddClass extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddClass() {
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
		PrintWriter out=response.getWriter();
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String school=request.getParameter("school");
		try {
			Mysql mysql=Mysql.getInstance();
			mysql.insert("class", "name,school","'"+name+"',"+school);
			Logger.getLogger("log").log(Level.INFO, name+"班级创建成功");
			response.sendRedirect("class.jsp");
		} catch (ClassNotFoundException e) {
			// TODO �Զ���ɵ� catch ��
			out.println(e.getMessage());
			Logger.getLogger("log").log(Level.WARNING,e.getMessage());
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			out.println(e.getMessage());
			Logger.getLogger("log").log(Level.WARNING,e.getMessage());
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
