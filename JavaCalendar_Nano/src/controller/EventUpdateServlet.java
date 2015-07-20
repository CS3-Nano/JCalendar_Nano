package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbmanager.EventMngr;
import beans.Event;
import beans.User;

/**
 * Servlet implementation class EventUpdate
 */
@WebServlet("/evnupdt")
public class EventUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String typ=request.getParameter("optType");
		Event oldEvnt=(Event) request.getSession().getAttribute("oldEvnt");
		if(typ.equals("update")){
			int stYr=Integer.parseInt(request.getParameter("stYear"));
			int stMnth=Integer.parseInt(request.getParameter("stMonth"));
			int stday=Integer.parseInt(request.getParameter("stDay"));
			int stHr=Integer.parseInt(request.getParameter("stHr"));
			int stMn=Integer.parseInt(request.getParameter("stMin"));
			
			int endYr=Integer.parseInt(request.getParameter("endYear"));
			int endMnth=Integer.parseInt(request.getParameter("endMonth"));
			int endday=Integer.parseInt(request.getParameter("endDay"));
			int	endHr=Integer.parseInt(request.getParameter("endHr"));
			int endMn=Integer.parseInt(request.getParameter("endMin"));
			
			GregorianCalendar strt=new GregorianCalendar(stYr, stMnth-1, stday, stHr, stMn);
			GregorianCalendar end=new GregorianCalendar(endYr, endMnth-1, endday, endHr, endMn);
			
			String desc=request.getParameter("evntDesc");
			User usr=(User) request.getSession().getAttribute("user");
			int rec=Integer.parseInt(request.getParameter("eventRec"));
			boolean recr=(rec!=0);
			int prvcy=Integer.parseInt(request.getParameter("prvcyStat"));
			boolean prvcyBl=(prvcy!=0);
			int pryrty=Integer.parseInt(request.getParameter("priority"));
			Event evnt=new Event(0, strt, end, desc, usr.getUserID(), recr ,pryrty,prvcyBl);
			
			try {
				EventMngr.updateEvent(oldEvnt, evnt);
//				EventMngr.insertEvent(evnt);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(typ.equals("delete")){
			try {
				EventMngr.deleteEvent(oldEvnt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			response.sendRedirect("home.jsp");
		
		
	}

}
