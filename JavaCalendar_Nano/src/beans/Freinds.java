package beans;

public class Freinds {
	private int userID;
	private int friendID;
	
	public Freinds() {
		super();
	}
	public Freinds(int userID, int friendID) {
		super();
		this.userID = userID;
		this.friendID = friendID;
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
	
}
