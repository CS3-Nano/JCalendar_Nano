package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Map;

public class MapMngr {
	public static ArrayList<Map> maps;
	private static Connection conn=DbConnection.getInstance().getConnection();
	
	public static void readMap() throws SQLException{
		maps=null;
		maps=new ArrayList<Map>();
		
		String sql="SELECT * FROM `map`;";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);	
		while(rs.next()){
			Map map=new Map();
			map.setMapId(rs.getInt("mapId"));
			map.setEvntID(rs.getInt("evntID"));
			map.setZoom(rs.getInt("zoom"));
			map.setLat(rs.getDouble("lat"));
			map.setLng(rs.getDouble("lng"));
			
			maps.add(map);
		}
	}
	
	public static boolean insertMap(Map map) throws SQLException{
		String sql="INSERT INTO `map`(evntID,zoom,lat,lng) VALUES (?,?,?,?)";
		ResultSet keys=null;
		PreparedStatement stmt=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, map.getEvntID());
		stmt.setInt(2, map.getZoom());
		stmt.setDouble(3, map.getLat());
		stmt.setDouble(4, map.getLng());
		
		int affected=stmt.executeUpdate();
		if(affected==1){
			keys=stmt.getGeneratedKeys();
			keys.next();
			int newkey=keys.getInt(1);
			map.setMapId(newkey);
			readMap();
			closeConectio(stmt, keys);
			return true;
		}else{
			closeConectio(stmt, keys);
			return false;
		}
	}
	
	public static boolean updateMap(Map oldMap,Map newMap) throws SQLException{
		String sql="UPDATE `map` SET evntID=?,zoom=?,lat=?,lng=? WHERE mapId=?";
		
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setInt(1, newMap.getEvntID());
		stmt.setInt(2, newMap.getZoom());
		stmt.setDouble(3, newMap.getLat());
		stmt.setDouble(4, newMap.getLng());
		stmt.setInt(5, oldMap.getMapId());
		
		int affected=stmt.executeUpdate();
		closeConectio(stmt, null);
		if(affected==1){
			readMap();
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean deleteMap(Map map) throws SQLException{
		String sql="DELETE FROM `map` WHERE mapId=?";
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setInt(1, map.getMapId());
		int affected=stmt.executeUpdate();
		closeConectio(stmt, null);
		if(affected==1){
			readMap();
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
