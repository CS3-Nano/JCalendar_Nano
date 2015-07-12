package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;

import dbmanager.EventMngr;
import beans.Event;
import beans.User;

public class EventService  {
	public ArrayList<Event> getUpcmEvnts(User usr){
		ArrayList<Event> upCmng=new ArrayList<Event>();
		try {
			EventMngr.readEvents();
			Collections.sort(EventMngr.events);
			GregorianCalendar cal=new GregorianCalendar();		//get the current date time
			System.out.println("Today "+
					cal.get(Calendar.YEAR)+" "+
					(cal.get(Calendar.MONTH)+1)+" "+
					cal.get(Calendar.DATE)+" "+
					cal.get(Calendar.HOUR_OF_DAY)+" "+
					cal.get(Calendar.MINUTE)+" "
					);
			for (Event event : EventMngr.events) {
				if(event.getStart().after(cal)){
					if(event.getEvntOwner()==usr.getUserID()){
						upCmng.add(event);
					}
					System.out.println("ID :"+event.getEvntID()+" "+
							event.getStart().get(Calendar.YEAR)+" "+
							(event.getStart().get(Calendar.MONTH)+1)+" "+
							event.getStart().get(Calendar.DATE)+" "+
							event.getStart().get(Calendar.HOUR_OF_DAY)+" "+
							event.getStart().get(Calendar.MINUTE)+" "
							);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Collections.sort(upCmng);
		System.out.println(upCmng.size());
		return upCmng;
	}
}
