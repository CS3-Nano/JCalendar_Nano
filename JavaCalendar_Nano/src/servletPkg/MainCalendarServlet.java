package servletPkg;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classesPkg.Dbase;
import classesPkg.Event;

/**
 * Servlet implementation class MainCalendarServlet
 */
@WebServlet("/MainCalendarServlet")
public class MainCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainCalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String cMon,cYr;
		
		java.util.Calendar cal = java.util.Calendar.getInstance();
		String cMon=(String)cal.get(Calendar.DAY_OF_MONTH);
		//cYr=(String)java.util.Calendar.YEAR; 
		
		Dbase dbase=new Dbase();
		
		Timestamp startStamp = Timestamp.valueOf("2014-01-01 00:00:00.0");	//hardcode time for testing
		java.util.Date endDate=new java.util.Date();				
		Timestamp endStamp = new Timestamp(endDate.getTime());
		
		ArrayList<Event> eventsCollection=new ArrayList<Event>();
		eventsCollection=dbase.getEvents(startStamp,endStamp ,2 );	//get event data from database
		
		request.setAttribute("eventList", eventsCollection);
		request.setAttribute("cMonTest",cMon);
		//request.setAttribute("cYrTest",cYr);
		request.getRequestDispatcher("mainCalendar.jsp").forward(request, response);
		//response.sendRedirect("mainCalendar.jsp");
		/*
		if (request.getParameter("prevBtn") != null) {
		    // Invoke FirstServlet's job here.
		} else if (request.getParameter("nextBtn") != null) {
		    // Invoke SecondServlet's job here.
		} else{
			int currentMonth=Calendar.MONTH;
			int currentYear=Calendar.YEAR; 
		}*/
	}

}
