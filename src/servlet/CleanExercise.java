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
import javax.servlet.http.HttpSession;

import com.Admin;
import com.Mysql;

public class CleanExercise extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CleanExercise() {
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
		HttpSession session=request.getSession(true);
		Admin admin=(Admin) session.getAttribute("admin");
		if(admin==null)
		{
			Logger.getLogger("log").log(Level.WARNING,"非法侵入，尝试清空题库，已阻止！");
			response.sendRedirect("error.html");
		}else
		{
			String sql="truncate table exercise";
			try {
				Mysql mysql=Mysql.getInstance();
				mysql.update(sql);
				Logger.getLogger("log").log(Level.WARNING,"题库已经清空，操作人是："+admin.getName());
				response.sendRedirect("index.jsp");
			} catch (ClassNotFoundException e) {
				// TODO 自动生成的 catch 块
				Logger.getLogger("log").log(Level.WARNING,e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				Logger.getLogger("log").log(Level.WARNING,e.getMessage());
				e.printStackTrace();
			}
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
