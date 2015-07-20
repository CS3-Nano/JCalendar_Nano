package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbmanager.PndngReqMngr;
import beans.PendingReq;
import beans.User;

/**
 * Servlet implementation class FrndRqstServlet
 */
@WebServlet("/FrndRqst")
public class FrndRqstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrndRqstServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] val=request.getParameterValues("freindRq");
//		System.out.println("size of array"+val.length);
		User usr=(User) request.getSession().getAttribute("user");
		for (int i = 0; i < val.length; i++) {
			System.out.println(val[i]);
			int frndid=Integer.parseInt(val[i]);
			PendingReq prq=new PendingReq(usr.getUserID(), frndid, "request");
			try {
				PndngReqMngr.insertReq(prq);
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		response.sendRedirect("settings.jsp");
	}

}
