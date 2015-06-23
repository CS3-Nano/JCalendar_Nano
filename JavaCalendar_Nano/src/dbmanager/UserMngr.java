package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.User;

public class UserMngr {
	public static ArrayList<User> users;
	private static Connection conn=DbConnection.getInstance().getConnection();
	
	public static void readUsers() throws SQLException{
		users=null;
		users=new ArrayList<User>();
		String sql="SELECT * FROM users";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while (rs.next()){
			User user=new User();
			user.setUserID(rs.getInt("userID"));
			user.setUserFName(rs.getString("userFName"));
			user.setUserLName(rs.getString("userLName"));
			user.setUserEmail(rs.getString("userEmail"));
			user.setUserContact(rs.getString("userContact"));
			users.add(user);
		}
		closeConectio(stmt, rs);
	}

	public static boolean insert(User user) throws SQLException{
		String sql="insert into users (userFName,userLName,userEmail,userContact) values(?,?,?,?);";
		ResultSet keys=null;
		PreparedStatement stmt=conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, user.getUserFName());
		stmt.setString(2, user.getUserLName());
		stmt.setString(3, user.getUserEmail());
		stmt.setString(4, user.getUserContact());
		int affected=stmt.executeUpdate();
		
		if(affected==1){
			keys=stmt.getGeneratedKeys();
			keys.next();
			int newKey =keys.getInt(1);
			user.setUserID(newKey);
			readUsers();
		}else{
			return false;
		}
		closeConectio(stmt, keys);
		
		return true;
		
		
	}

	public static boolean update(User oldUser,User updtUsr) throws SQLException{
		System.out.println("call");
		String sql="UPDATE users SET "+
				"userFName = ? ,userLName = ? ,userEmail =?,userContact =?"+
				"WHERE userID=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setString(1, updtUsr.getUserFName());
		stmt.setString(2, updtUsr.getUserLName());
		stmt.setString(3, updtUsr.getUserEmail());
		stmt.setString(4, updtUsr.getUserContact());
		stmt.setInt(5, oldUser.getUserID());
		int affected=stmt.executeUpdate();
		if(affected==1){
			readUsers();
			closeConectio(stmt, null);
			return true;
		}else{
			closeConectio(stmt, null);
			return false;
		}
		
		
	}

	public static boolean delete(User user) throws SQLException{
		String sql="DELETE FROM users WHERE userID = ?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setInt(1, user.getUserID());
		int affected=stmt.executeUpdate();
		if(affected==1){
			readUsers();
			closeConectio(stmt, null);
			return true;
		}else{
			return false;
		}
	}
	public static boolean setUserId(User usr){
		for (User user : users) {
			if(user.getUserFName().equals(usr.getUserFName())){
				if(user.getUserLName().equals(usr.getUserLName())){
					usr.setUserID(user.getUserID());
					return true;
				}
			}
		}
		return false;
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
