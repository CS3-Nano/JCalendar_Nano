package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Event;

public class EventMngr {
	public static ArrayList<Event> events;
	private static Connection conn=DbConnection.getInstance().getConnection();
	
	public static void readEvents() throws SQLException{
		events=null;
		events=new ArrayList<Event>();
		
		String sql="SELECT * FROM `events` ";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while (rs.next()) {
			Event evnt=new Event();
			evnt.setEvntID(rs.getInt("evntID"));
			evnt.setEvntStart(rs.getTimestamp("evntStart"));
			evnt.setEvntEnd(rs.getTimestamp("evntEnd"));
			evnt.setEvntDesc(rs.getString("evntDesc"));
			evnt.setEvntOwner(rs.getInt("evntOwner"));
			evnt.setEventRec(rs.getBoolean("eventRec"));
			evnt.setPrvcyStat(rs.getBoolean("prvcyStat"));
			evnt.setPriority(rs.getInt("priority"));
			
			events.add(evnt);
			
		}
	}
	public static boolean insertEvent(Event evnt) throws SQLException{
		String sql="insert into events (evntStart,evntEnd,evntDesc,evntOwner,eventRec,prvcyStat,priority) "
				+ "values(?,?,?,?,?,?,?);";
		ResultSet keys=null;
		PreparedStatement stmt=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		stmt.setTimestamp(1, evnt.getEvntStart());
		stmt.setTimestamp(2, evnt.getEvntEnd());
		stmt.setString(3, evnt.getEvntDesc());
		stmt.setInt(4, evnt.getEvntOwner());
		stmt.setBoolean(5, evnt.isEventRec());
		stmt.setBoolean(6, evnt.isPrvcyStat());
		stmt.setInt(7, evnt.getPriority());
		
		int affected=stmt.executeUpdate();
		if(affected==1){
			readEvents();
			closeConectio(stmt, keys);
			return true;
		}else{
			closeConectio(stmt, keys);

			return false;
		}
	}
	public static boolean updateEvent(Event oldevnt,Event newEvnt) throws SQLException{
		String sql="UPDATE events  SET evntStart=?,evntEnd=? ,evntDesc=? ,"
				+ "evntOwner =?,eventRec=? prvcyStat=?,priority=? WHERE evntID=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setTimestamp(1, newEvnt.getEvntStart());
		stmt.setTimestamp(2, newEvnt.getEvntEnd());
		stmt.setString(3, newEvnt.getEvntDesc());
		stmt.setInt(4, newEvnt.getEvntOwner());
		stmt.setBoolean(5, newEvnt.isEventRec());
		stmt.setBoolean(6, newEvnt.isPrvcyStat());
		stmt.setInt(7, newEvnt.getPriority());
		stmt.setInt(8, oldevnt.getEvntID());
		
		int affected=stmt.executeUpdate();
		closeConectio(stmt, null);
		if(affected==1){
			readEvents();
			return true;
		}else{
			return false;
		}
	}
	public static boolean deleteEvent(Event evnt) throws SQLException{
		String sql="DELETE FROM events WHERE evntID=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setInt(1, evnt.getEvntID());
		int affected=stmt.executeUpdate();
		if(affected==1){
			readEvents();
			return true;
		}else{
			return false;
			
		}
	}
	public static Event getEvntByid(int id) throws SQLException{
		if(events==null){
			readEvents();
		}
		for (Event event : events) {
			if(event.getEvntID()==id){
				return event;
			}
		}
		return null;
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
