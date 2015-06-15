package classesPkg;

import java.sql.Timestamp;

public class Event {
	private int id;					//event id <<automatically added by db when inserting new event>>
	private Timestamp startDate;	//event start date&time
	private Timestamp endDate;		//event end date&time
	private String description;		//event description
	private int owner;				//event owner <<user id of the one who created the event>>
	
	public Event(int ID,Timestamp strt,Timestamp end,String desc,int ownr){
		this.id=ID;
		this.startDate=strt;
		this.endDate=end;
		this.description=desc;
		this.owner=ownr;
	}

	public int getId() {
		return id;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public String getDescription() {
		return description;
	}

	public int getOwner() {
		return owner;
	}
	
	
}
