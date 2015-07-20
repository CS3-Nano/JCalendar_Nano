package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignOutServlet
 */
@WebServlet("/sgnout")
public class SignOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;




	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")==null){
			request.getSession().setAttribute("currntpg", "home.jsp");
			response.sendRedirect("login.jsp");
			return;
			}else{
				request.getSession().setAttribute("user", null);
				response.sendRedirect("login.jsp");	
			
			}
	}

}
