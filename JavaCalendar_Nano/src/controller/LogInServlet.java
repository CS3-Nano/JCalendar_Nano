package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbmanager.DbConnection;
import beans.Hash;
import beans.LogIn;
import beans.User;
import service.LogInService;
import service.UsersService;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/login")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usrName=request.getParameter("username").trim();
		String pasWrd=request.getParameter("passwrd").trim();		
		
		try {
			DbConnection.getInstance().testConnection();
		} catch (ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
			response.sendRedirect("errpage.jsp");
			return;
		}
		LogInService logServc=new LogInService();
		LogIn logIn=new LogIn(usrName, pasWrd);
		boolean b=logServc.authenticate(logIn);
		if(b){
			UsersService usrServc=new UsersService();
			User user=usrServc.getLoggedUser(logIn);
			if(user==null){
				request.getSession().setAttribute("user", null);
				request.getSession().setAttribute("loginerr", "No user Found");
				response.sendRedirect("login.jsp");	
			}else{
				request.getSession().setAttribute("user", user);
				String page=(String) request.getSession().getAttribute("currntpg");
				if(page==null){
					response.sendRedirect("home.jsp");
				}else{
					response.sendRedirect(page);
				}
			}
			
		}else{
			request.getSession().setAttribute("loginerr", "records not found");
			response.sendRedirect("login.jsp");
		}
	}
	
}
