package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbmanager.MapMngr;
import beans.Map;

/**
 * Servlet implementation class MapServlet
 */
@WebServlet("/map")
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean map=false;
		String mapstat=request.getParameter("map");
		boolean map2=Boolean.parseBoolean(mapstat);
		
		System.out.println("Map status"+map2);
		System.out.println(" call heres");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eventId=Integer.valueOf(request.getParameter("eventId"));
		int zoom=Integer.valueOf(request.getParameter("zoom"));
		Double lat=Double.valueOf(request.getParameter("lat"));
		Double lng=Double.valueOf(request.getParameter("lng"));
		
		Map map=new Map(0, eventId, zoom, lat, lng);
		try {
			MapMngr.insertMap(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("home.jsp");
		return;

	}

}
