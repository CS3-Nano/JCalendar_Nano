package beans;

public class PendingReq {
	private int pendngID; 
	private int userID; 
	private int friendID; 
	private String reqState;
	
	
	public PendingReq() {
		super();
	}
	public PendingReq(int pendngID, int userID, int friendID, String reqState) {
		super();
		this.pendngID = pendngID;
		this.userID = userID;
		this.friendID = friendID;
		this.reqState = reqState;
	}
	public PendingReq( int userID, int friendID, String reqState) {
		super();
		this.pendngID = 0;
		this.userID = userID;
		this.friendID = friendID;
		this.reqState = reqState;
	}
	public int getPendngID() {
		return pendngID;
	}
	public void setPendngID(int pendngID) {
		this.pendngID = pendngID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getFriendID() {
		return friendID;
	}
	public void setFriendID(int friendID) {
		this.friendID = friendID;
	}
	public String getReqState() {
		return reqState;
	}
	public void setReqState(String reqState) {
		this.reqState = reqState;
	}
	
	
}
