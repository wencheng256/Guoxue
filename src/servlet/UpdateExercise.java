package servlet;

import java.io.IOException;

import com.Mysql;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateExercise extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateExercise() {
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
		try {
			request.setCharacterEncoding("UTF-8");
			Mysql mysql=Mysql.getInstance();
			String id=request.getParameter("id");
			String content=request.getParameter("content");
			String cor=request.getParameter("select_correct");
			String a=request.getParameter("select_A");
			String b=request.getParameter("select_B");
			String c=request.getParameter("select_C");
			String d=request.getParameter("select_D");
			String sql="Update exercise Set content='"+content+"',select_a='"+a+"',select_b='"+b+"',select_c='"+c+"',select_d='"+d+"',select_correct="+cor+" where id="+id;
			response.sendRedirect("exercise.jsp");
			mysql.update(sql);
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			out.println(e.getMessage());
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			out.println(e.getMessage());
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
