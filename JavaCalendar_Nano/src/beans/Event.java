package beans;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.GregorianCalendar;



public class Event implements Comparable<Event>{
	private int evntID;
	private Timestamp evntStart;
	private Timestamp evntEnd;
	private String evntDesc;
	private int evntOwner;
	private boolean eventRec;
	private int priority;
	private boolean prvcyStat;
	
	private GregorianCalendar startCal,endCal;
	public Event() {
	}

	public Event(int evntID, Timestamp evntStart, Timestamp evntEnd, String evntDesc,
			int evntOwner, boolean eventRec, int priority , boolean prvcyStat ) {
		super();
		this.evntID = evntID;
		this.evntStart = evntStart;
		this.evntEnd = evntEnd;
		this.evntDesc = evntDesc;
		this.evntOwner = evntOwner;
		this.eventRec = eventRec;
		this.priority=priority;
		this.prvcyStat=prvcyStat;
		startCal=new GregorianCalendar();
		
		
	}
	public Event(int evntID, GregorianCalendar startCal,GregorianCalendar endCal, String evntDesc,
			int evntOwner, boolean eventRec ,int priority , boolean prvcyStat) {
		this.evntID = evntID;
		this.evntDesc = evntDesc;
		this.evntOwner = evntOwner;
		this.eventRec = eventRec;
		this.startCal=startCal;
		this.endCal=endCal;
		this.priority=priority;
		this.prvcyStat=prvcyStat;
		evntStart=new Timestamp(startCal.getTimeInMillis());
		evntEnd=new Timestamp(endCal.getTimeInMillis());
	}

	public int getEvntID() {
		return evntID;
	}

	public void setEvntID(int evntID) {
		this.evntID = evntID;
	}

	public Timestamp getEvntStart() {
		return evntStart;
	}

	public void setEvntStart(Timestamp evntStart) {
		this.evntStart = evntStart;
		startCal=new GregorianCalendar();
		startCal.setTimeInMillis(evntStart.getTime());
	}

	public Timestamp getEvntEnd() {
		return evntEnd;
	}

	public void setEvntEnd(Timestamp evntEnd) {
		this.evntEnd = evntEnd;
		endCal=new GregorianCalendar();
		endCal.setTimeInMillis(evntEnd.getTime());
	}

	public String getEvntDesc() {
		return evntDesc;
	}

	public void setEvntDesc(String evntDesc) {
		this.evntDesc = evntDesc;
	}

	public int getEvntOwner() {
		return evntOwner;
	}

	public void setEvntOwner(int evntOwner) {
		this.evntOwner = evntOwner;
	}

	public boolean isEventRec() {
		return eventRec;
	}

	public void setEventRec(boolean eventRec) {
		this.eventRec = eventRec;
	}

	public GregorianCalendar getStart() {
		return startCal;
	}

	public void setStart(int stYear,int stMonth,int stDay,int stHr,int stMin) {
		this.startCal = new GregorianCalendar(stYear, stMonth, stDay, stHr, stMin);
		evntStart=new Timestamp(startCal.getTimeInMillis());
	}

	public GregorianCalendar getEndCal() {
		return endCal;
	}

	public void setEndCal(int endYear,int endMonth,int endDay,int endHr,int endMin) {
		this.endCal = new GregorianCalendar(endYear, endMonth, endDay, endHr, endMin);
		evntEnd=new Timestamp(endCal.getTimeInMillis());
	}
	
	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public boolean isPrvcyStat() {
		return prvcyStat;
	}

	public void setPrvcyStat(boolean prvcyStat) {
		this.prvcyStat = prvcyStat;
	}

	public static void printCal(GregorianCalendar cal){
		System.out.println(cal.get(Calendar.YEAR)+" "+cal.get(Calendar.MONTH)+" "+cal.get(Calendar.DAY_OF_MONTH)+
				" "+cal.get(Calendar.HOUR_OF_DAY)+" "+cal.get(Calendar.MINUTE)
				);
	}

	@Override
	public int compareTo(Event arg0) {
		return startCal.compareTo(arg0.getStart());
		
	}
		
}
//create table events(
//		evntID int(8) primary key not null auto_increment,
//		evntStart datetime not null,
//		evntEnd datetime not null,
//		evntDesc varchar(50),
//		evntOwner int not null,
//	  	eventRec boolean	
//	);