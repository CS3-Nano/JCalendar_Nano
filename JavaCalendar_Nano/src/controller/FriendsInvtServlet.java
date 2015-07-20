package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbmanager.FreindsMngr;
import dbmanager.PndngReqMngr;
import service.FreindService;
import service.UsersService;
import beans.Freinds;
import beans.User;

/**
 * Servlet implementation class FriendsInvtServlet
 */
@WebServlet("/frndinvt")
public class FriendsInvtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] val=request.getParameterValues("freindInv");
//		System.out.println("size of array"+val.length);
		User usr=(User) request.getSession().getAttribute("user");
		UsersService us=new UsersService();
		FreindService fs=new FreindService();
		for (int i = 0; i < val.length; i++) {
			int pndgId=Integer.parseInt(val[i]);
			System.out.println(fs.getRqById(pndgId).getUserID()+" req id is "+fs.getRqById(pndgId).getPendngID());
			Freinds frnd=new Freinds(fs.getRqById(pndgId).getUserID(), fs.getRqById(pndgId).getFriendID());
			boolean frn;
			try {
				frn = FreindsMngr.insertFriends(frnd);
				if(frn){
					PndngReqMngr.deleteReq(fs.getRqById(pndgId));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("settings.jsp");
			return;
		}
	}

}
