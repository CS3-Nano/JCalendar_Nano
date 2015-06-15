package classesPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.management.loading.PrivateMLet;

import org.eclipse.jdt.internal.compiler.ast.IfStatement;


public class Dbase {
	
    private String url = "jdbc:mysql://localhost/calendardb";
    private String user = "root";
    private String password = "slsamg";
    private Connection conn=null;
    private PreparedStatement stmt=null;
    private ResultSet rs=null;
    private String quertString=null;
    
	private boolean openConnection() {
		//java.sql.Connection conn = null;
		boolean flag=true;
		try {		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e1) {
			flag=false;
        	e1.printStackTrace();
		} catch (SQLException e1) {
			flag=false;
        	e1.printStackTrace();
		}
		return flag;
	}
	
	private boolean closeConnection() {
		boolean flag=true;
		quertString=null;
		if (rs!=null) {
			try {
				rs.close();			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				flag=false;
				e.printStackTrace();
			}
		}
		if (stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				flag=false;
				e.printStackTrace();
			}
		}
		if (conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				flag=false;
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public int loginAuthentication(String usernam,String password) {
		int userID=-1;
		if (openConnection()) {
			try {
				quertString="SELECT userID FROM login WHERE username=? AND passwrd=?";
				stmt=conn.prepareStatement(quertString);
				
				stmt.setString(1, usernam);		//mapping first ? symbol to variable username
				stmt.setString(2, password);	//mapping second ? symbol to variable username
					
				rs=stmt.executeQuery();
				if (rs.isBeforeFirst()) {	//check whether result set is empty
					while (rs.next()) {				//result set is not empty, read 	
						userID=rs.getInt("userID");
					}
				} else {
					userID=-20;		//user name and password are not in db
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("error in query excecution!");
				e.printStackTrace();
			}
			if (!closeConnection()) {
				System.out.println("connection closing failed!,closeConnection() error");
			}
		} else {
			System.out.println("database connection opening failed!,openConnection() error");
		}
		return userID;
	}

	public ArrayList<Event> getEvents(Timestamp start,Timestamp end,int uID) {
		ArrayList<Event>tempEvntList=new ArrayList<Event>();
		if (openConnection()) {
			try {
				quertString="SELECT * FROM eventstbl WHERE evnt_start>? AND evnt_end<?";
				stmt=conn.prepareStatement(quertString);
				
				stmt.setTimestamp(1, start);		//mapping first ? symbol to variable username
				stmt.setTimestamp(2, end);;	//mapping second ? symbol to variable username
					
				rs=stmt.executeQuery();
				
				if (rs.isBeforeFirst()) {	//check whether result set is empty
					while (rs.next()) {				//result set is not empty, read 	
						Event tempEvnt=new Event(
								rs.getInt("evnt_id"),
								rs.getTimestamp("evnt_start"),
								rs.getTimestamp("evnt_end"),
								rs.getString("evnt_descriptio"),
								rs.getInt("evnt_owner"));
						
						tempEvntList.add(tempEvnt);	//add event to the event list
					}
				} else {
					//userID=-20;		no matching events
					tempEvntList=null;
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("error in query excecution!");
				e.printStackTrace();
			}
			if (!closeConnection()) {
				System.out.println("connection closing failed!,closeConnection() error");
			}
		} else {
			System.out.println("database connection opening failed!,openConnection() error");
		}
		return tempEvntList;
	}
}
