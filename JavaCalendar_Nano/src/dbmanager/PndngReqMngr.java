package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.omg.CORBA.Request;

import beans.PendingReq;

public class PndngReqMngr {
	public static ArrayList<PendingReq> requests;
	private static Connection conn=DbConnection.getInstance().getConnection();
	
	public static void readRequest() throws SQLException{
		requests=null;
		requests=new ArrayList<PendingReq>();
		
		String sql="SELECT * FROM `pendingReq` ";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		while(rs.next()){
			PendingReq reqst=new PendingReq();
			reqst.setPendngID(rs.getInt("pendngID"));
			reqst.setUserID(rs.getInt("userID"));
			reqst.setFriendID(rs.getInt("friendID"));
			reqst.setReqState(rs.getString("reqState"));
			
			requests.add(reqst);
		}		
		closeConectio(stmt, rs);
	}
	public static boolean insertReq(PendingReq req) throws SQLException{
		String sql="insert into pendingReq (userID,friendID,reqState) values(?,?,?);";
		ResultSet keys=null;
		PreparedStatement stmt=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, req.getUserID());
		stmt.setInt(2, req.getFriendID());
		stmt.setString(3, req.getReqState());
		
		int affected=stmt.executeUpdate();
		if(affected==1){
			readRequest();
			closeConectio(stmt, keys);
			return true;
		}else{
			closeConectio(stmt, keys);
			return false;
		}
		
	}
	public static boolean deleteReq(PendingReq req) throws SQLException{
		String sql="DELETE FROM `pendingreq` WHERE `pendngID`=?;";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setInt(1, req.getPendngID());
		int affected=stmt.executeUpdate();
		closeConectio(stmt, null);
		if(affected==1){
			readRequest();
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
