package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbmanager.EventMngr;
import beans.Event;
import beans.User;

/**
 * Servlet implementation class EventServlet
 */
@WebServlet("/Event")
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")==null){
			request.getSession().setAttribute("currntpg", "event.jsp");
			response.sendRedirect("login.jsp");	
			}else{
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
				
				String mapstat=request.getParameter("map");
				boolean map=Boolean.parseBoolean(mapstat);
				Event evnt=new Event(0, strt, end, desc, usr.getUserID(), recr ,pryrty,prvcyBl);
				String page="home.jsp";
				try {
					boolean insrt=EventMngr.insertEvent(evnt);
					if(insrt){
						System.out.println("Last inserted event id "+evnt.getEvntID());
						if(map){
							page="setmap.jsp?val="+evnt.getEvntID();
							response.sendRedirect(page);
							return;
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				response.sendRedirect(page);
			}
	}

}
