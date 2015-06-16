package dbmanager;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	private static DbConnection instance=null;
	
	private static final String USERNAME = "teamnano";
	private static final String PASSWORD = "nano";
	private static final String CONN_STRING =
			"jdbc:mysql://localhost/calendardb";
	private Connection conn=null;
	
	private DbConnection() {			// private constructor 
	}
	
	public static DbConnection getInstance() {		// singleton object for connection
		if(instance==null){
			instance=new DbConnection();
		}
		return instance;
	} 
	private boolean openConnection(){
		try {
			conn=DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public Connection getConnection(){
		if(conn==null){
			if(openConnection()){
				System.out.println("connection opened");
				return conn;
			}else{
				return null;
			}
		}
		return conn;
	}
	public void close(){
		System.out.println("closing connection");
		try {
			conn.close();
			conn=null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
