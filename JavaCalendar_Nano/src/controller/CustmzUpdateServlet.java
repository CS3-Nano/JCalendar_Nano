package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbmanager.UsrCstmzMngr;
import service.UsrCustmizService;
import beans.User;
import beans.UsrCstmiz;

/**
 * Servlet implementation class CustmzUpdateServlet
 */
@WebServlet("/cstmupdt")
public class CustmzUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

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
				UsrCstmiz newCstm=new UsrCstmiz(usr.getUserID(), highPrtyclr, medPrrtyclr, lwPrtyClr, prvcyClr, thm, avtr);
				UsrCustmizService ucs=new UsrCustmizService();
				UsrCstmiz cstm=ucs.getCustmByUser(usr);
				if(cstm.getCustmID()==1){
					System.out.println("no older one have to insert");
					try {
						boolean insrt=UsrCstmzMngr.insertUsrCstmz(newCstm);
						response.sendRedirect("settings.jsp");
						return;
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}else{
					try {
						UsrCstmzMngr.updateUsrCstmz(cstm, newCstm);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					response.sendRedirect("settings.jsp");
					return;
				}
			}
	}

}
