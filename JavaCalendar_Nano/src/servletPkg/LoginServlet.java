package servletPkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import classesPkg.Dbase;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username,password;
		
		username=request.getParameter("usrname");	//get received form data by textbox name
		password=request.getParameter("pswrd");
		
		Dbase dbObj=new Dbase();					//new database object
		int usrIDkey=dbObj.loginAuthentication(username, password);
		
		if (usrIDkey<1) {	//if user id is negative it's invalid,(no user matched)
			response.sendRedirect("Login.jsp");	//so redirect to login page
		} else {		//if user id is positive then user password&username correct
			HttpSession session=request.getSession(true);	//activate session support
			session.setAttribute("usrID", usrIDkey);		//put in a session "usrID"is the session key
			
			//request.getRequestDispatcher("mainCalendar.jsp").forward(request, response);
			response.sendRedirect("mainCalendar.jsp");
		}		
		
	}

}
