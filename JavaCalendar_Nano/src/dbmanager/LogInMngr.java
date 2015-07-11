package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.LogIn;

public class LogInMngr {
	public static ArrayList<LogIn> userLog;
	private static Connection conn=DbConnection.getInstance().getConnection();
	
	public static void readAllLogIn() throws SQLException{	
		conn=DbConnection.getInstance().getConnection();
		userLog=null;
		userLog=new ArrayList<LogIn>();
		String sql="SELECT * FROM `login`";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			LogIn logIn=new LogIn();
			logIn.setUserID(rs.getInt("userID"));
			logIn.setUsername(rs.getString("username"));
			logIn.setPasswrd(rs.getString("passwrd"));
			userLog.add(logIn);
		}
		closeConectio(stmt, rs);
	}
	public static boolean insert(LogIn logIn) throws SQLException{
		String sql="insert into login (userID,username,passwrd) values(?,?,?);";
		PreparedStatement stmt=conn.prepareStatement(sql);
		
		stmt.setInt(1, logIn.getUserID());
		stmt.setString(2, logIn.getUsername());
		stmt.setString(3, logIn.getPasswrd());
		int affected =stmt.executeUpdate();
		closeConectio(stmt, null);
		if(affected==1){
			userLog.add(logIn);
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean update(LogIn oldLog,LogIn newLog) throws SQLException{
		String sql="UPDATE login SET username=? , passwrd=? WHERE userID=? ";	
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setString(1, newLog.getUsername());
		stmt.setString(2, newLog.getPasswrd());
		stmt.setInt(3, oldLog.getUserID());
		int affected=stmt.executeUpdate();
		closeConectio(stmt, null);
		if(affected==1){
			readAllLogIn();
			return true;
		}else{
			return false;
			
		}
		
	}
	
	public static boolean delete(LogIn logIn) throws SQLException{
		String sql="DELETE FROM login WHERE userID=? ";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setInt(1, logIn.getUserID());
		int affected=stmt.executeUpdate();
		closeConectio(stmt, null);
		if(affected==1){
			readAllLogIn();
			return true;
		}else{
			return false;
		}
	}
	
	private static void closeConectio(Statement stmt,ResultSet rs) throws SQLException{
		if(rs!=null){
			rs.close();
		}
		if(stmt!=null){
			stmt.close();
		}
	}
	
	
}
