package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.Email;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class SendMail extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	
	private Email email;
	
	public SendMail() {
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
		email=new Email("18369189857@163.com","abc123456");
		email.connect();
		PrintWriter out=response.getWriter();
		request.setCharacterEncoding("utf-8");
		
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\"/>");
		out.println("</head>");
		
		
		String to=request.getParameter("user");
		String sub=request.getParameter("sub");
		String content=request.getParameter("content");		
		try {
			email.senEmail(to,sub,content);
			out.println("yes");
		} catch (AddressException e) {
			out.println("发送失败");
			response.sendRedirect("error.html");
		} catch (MessagingException e) {
			out.println("发送失败");
			response.sendRedirect("error.html");
		}
			
		
		out.println("</html>");
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
