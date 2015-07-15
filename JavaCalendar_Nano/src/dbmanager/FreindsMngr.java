package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Freinds;

public class FreindsMngr {

	public static ArrayList<Freinds> freindList;
	private static Connection conn=DbConnection.getInstance().getConnection();
	
	public static void readFreinds() throws SQLException{
		freindList=null;
		freindList=new ArrayList<Freinds>();
		
		String sql="SELECT * FROM `friends`";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		while(rs.next()){
			Freinds frnd=new Freinds();
			frnd.setUserID(rs.getInt("userID"));
			frnd.setFriendID(rs.getInt("friendID"));
			freindList.add(frnd);
		}
		closeConectio(stmt, rs);
	}
	
	public static boolean insertFriends(Freinds frnd) throws SQLException{
		String sql="insert into friends (userID ,friendID) values (?,?);";
		ResultSet keys=null;
		PreparedStatement stmt=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, frnd.getUserID());
		stmt.setInt(2, frnd.getFriendID());
		
		int affected=stmt.executeUpdate();
		if(affected==1){
			readFreinds();
			closeConectio(stmt, keys);
			return true;
		}else{
			closeConectio(stmt, keys);
			return false;
		}
	}
	
	public static boolean deleteFriends(Freinds frnd) throws SQLException{
		String sql="DELETE FROM friends WHERE userID=? AND friendID=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setInt(1, frnd.getUserID());
		stmt.setInt(2, frnd.getFriendID());
		
		int affected=stmt.executeUpdate();
		if(affected==1){
			readFreinds();
			closeConectio(stmt, null);
			return true;
		}else{
			closeConectio(stmt, null);
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
