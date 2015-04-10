package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class Upload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Upload() {
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
		String url=request.getSession().getServletContext().getRealPath("") ;
		url=url+"/file";
		int maxsize=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,url,maxsize);
		Enumeration enu=multi.getFileNames();
		String name="hehe";
		
		if(enu.hasMoreElements()){
			name=(String) enu.nextElement();
			name=multi.getFilesystemName(name);
		}		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>Upload</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("<h1 style='textalign:center;'>Are you sure to insert?</h1>");
		out.println(name);
		out.println("<form action='addexcel' method='post'>"
				+ "<input type='hidden' value='"+name+"'name='name'>"
				+ "<input type='submit'style='width:100px; height:30px;' value='sure'>"
				+ "<a href='exercise.jsp'><input type='button'style='width:100px; height:30px;' value='no'></a>"
				+ "</form>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
