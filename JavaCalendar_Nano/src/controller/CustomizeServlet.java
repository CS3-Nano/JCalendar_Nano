package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.UserConfig;

import dbmanager.UsrCstmzMngr;
import beans.User;
import beans.UsrCstmiz;

/**
 * Servlet implementation class CustomizeServlet
 */
@WebServlet("/cstm")
public class CustomizeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")==null){
			request.getSession().setAttribute("currntpg", "customize.jsp");
			response.sendRedirect("login.jsp");	
			}else{
				User usr=(User) request.getSession().getAttribute("user");	
				String avtr=request.getParameter("avatar");
				String highPrtyclr=request.getParameter("HighPClr");
				String medPrrtyclr=request.getParameter("MediumPClr");
				String lwPrtyClr=request.getParameter("LowPClr");
				String prvcyClr=request.getParameter("prvtClr");
				String thm=request.getParameter("thm");
				UsrCstmiz cstm=new UsrCstmiz(usr.getUserID(), highPrtyclr, medPrrtyclr, lwPrtyClr, prvcyClr, thm, avtr);
				
				try {
					boolean insrt=UsrCstmzMngr.insertUsrCstmz(cstm);
					if(insrt){
						response.getWriter().write("Customization saved");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		response.sendRedirect("settings.jsp");
	}

}
