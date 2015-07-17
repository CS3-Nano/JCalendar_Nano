package service;

import java.sql.SQLException;

import beans.Event;
import beans.Map;
import dbmanager.MapMngr;

public class MapService {

	public MapService() throws SQLException {
		super();
		MapMngr.readMap();
	}
	public Map getEvntMp(Event evnt){
		for (Map map : MapMngr.maps) {
			if(map.getEvntID()==evnt.getEvntID()){
				return map;
			}
		}
		return null;
	}
	public Map getMapbyEvntId(int id){
		for (Map map : MapMngr.maps) {
			if(map.getEvntID()==id){
				return map;
			}
		}
		return null;
	}
}
