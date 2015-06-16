package dbmanager;


import java.sql.Connection;

public class DbConnection {
	private static DbConnection instance=null;
	
	private static final String USERNAME = "teamnano";
	private static final String PASSWORD = "nano";
	private static final String CONN_STRING =
			"jdbc:mysql://localhost/calendardb";
	private Connection conn=null;
}
