package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.UsrCstmiz;

public class UsrCstmzMngr {
	public static ArrayList<UsrCstmiz> customize;
	private static Connection conn=DbConnection.getInstance().getConnection();
	
	public static void readCustmiz() throws SQLException{
		customize=null;
		customize=new ArrayList<UsrCstmiz>();
		
		String sql ="SELECT * FROM `usrcstmiz`";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while (rs.next()) {
			UsrCstmiz usrCstm=new UsrCstmiz();
			usrCstm.setCustmID(rs.getInt("custmID"));
			usrCstm.setUserID(rs.getInt("userID"));
			usrCstm.setHighPClr(rs.getString("HighPClr"));
			usrCstm.setMediumPClr(rs.getString("MediumPClr"));
			usrCstm.setLowPClr(rs.getString("LowPClr"));
			usrCstm.setPrvtClr(rs.getString("prvtClr"));
			usrCstm.setTheam(rs.getString("Theam"));
			usrCstm.setAvatar(rs.getString("avatar"));
			customize.add(usrCstm);
		}
		closeConectio(stmt, rs);
	}
	public static boolean insertUsrCstmz(UsrCstmiz usrCstm) throws SQLException{
		String sql="INSERT INTO usrcstmiz( userID, HighPClr, MediumPClr , "+
				"LowPClr, prvtClr, Theam, avatar) VALUES (?,?,?,?,?,?,?)";
		ResultSet keys=null;
		PreparedStatement stmt=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		
		stmt.setInt(1, usrCstm.getUserID());
		stmt.setString(2, usrCstm.getHighPClr());
		stmt.setString(3, usrCstm.getMediumPClr());
		stmt.setString(4, usrCstm.getLowPClr());
		stmt.setString(5, usrCstm.getPrvtClr());
		stmt.setString(6, usrCstm.getTheam());
		stmt.setString(7, usrCstm.getAvatar());
		
		int affected=stmt.executeUpdate();
		if(affected==1){
			readCustmiz();
			closeConectio(stmt, keys);
			return true;
		}else{
			closeConectio(stmt, keys);
			return false;
		}
	}
	public static boolean updateUsrCstmz(UsrCstmiz oldCstmz,UsrCstmiz newCstmz) throws SQLException{
		String sql="UPDATE usrcstmiz SET userID=?,HighPClr=?,MediumPClr=?,LowPClr=?,prvtClr=?,Theam=?,avatar=? WHERE custmID=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		
		stmt.setInt(1, newCstmz.getUserID());
		stmt.setString(2, newCstmz.getHighPClr());
		stmt.setString(3, newCstmz.getMediumPClr());
		stmt.setString(4, newCstmz.getLowPClr());
		stmt.setString(5, newCstmz.getPrvtClr());
		stmt.setString(6, newCstmz.getTheam());
		stmt.setString(7, newCstmz.getAvatar());
		stmt.setInt(8, oldCstmz.getCustmID());
		
		int affected=stmt.executeUpdate();
		closeConectio(stmt, null);
		if(affected==1){
			readCustmiz();
			closeConectio(stmt, null);
			return true;
		}else{
			closeConectio(stmt, null);
			return false;
		}
	}
	public static boolean deleteUsrCstmz(UsrCstmiz usrcstm) throws SQLException{
		String sql="DELETE FROM usrcstmiz WHERE custmID= ?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setInt(1, usrcstm.getCustmID());
		int affected=stmt.executeUpdate();
		if(affected==1){
			readCustmiz();
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
