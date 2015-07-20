package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbmanager.DbConnection;
import service.UsersService;
import beans.Hash;
import beans.LogIn;
import beans.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DbConnection.getInstance().testConnection();
		} catch (ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
			response.sendRedirect("errpage.jsp");
			return;
		}
		
		String userFName=(String) request.getParameter("userFName");
		String userLName=(String) request.getParameter("userLName");
		String userEmail=(String) request.getParameter("userEmail");
		String userContact=(String) request.getParameter("userContact");
		String username=(String) request.getParameter("username");
		String passwrd=(String) request.getParameter("passwrd");
		Hash hash=new Hash();
		String hsPw=hash.crtNwHash(passwrd);
		
		User usr=new User(0, userFName, userLName, userEmail, userContact);
		LogIn log=new LogIn(username, hsPw);
		
		System.out.println(usr.getUserFName()+" "+usr.getUserLName());
		System.out.println(log.getUsername()+" "+log.getPasswrd());
		UsersService usrSrvc=new UsersService();
		boolean insrt=false;
		try {
			insrt=usrSrvc.addnew(usr, log);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(insrt){
			request.getSession().setAttribute("user", usr);
			response.sendRedirect("home.jsp");
		}else{
			
		}
		
	}

}
