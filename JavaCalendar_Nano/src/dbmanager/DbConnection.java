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
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
			return true;
		} catch(ClassNotFoundException e){
			e.printStackTrace();
			return false;
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
	public Connection testConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
		return conn;
	}
	public static void processExeptions(SQLException e){		// error handling
		System.err.println("Error message :"+e.getMessage());
		System.err.println("Error code "+e.getErrorCode());
		System.err.println("SQL state "+e.getSQLState());
	}
}
