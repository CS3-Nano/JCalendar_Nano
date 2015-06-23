package beans;

public class User {
	private int userID;
	private String userFName;
	private String userLName;
	private String userEmail;
	private String userContact;
	
	
	
	
	public User() {
	}
	public User(int userID, String userFName, String userLName,
			String userEmail, String userContact) {
		super();
		this.userID = userID;
		this.userFName = userFName;
		this.userLName = userLName;
		this.userEmail = userEmail;
		this.userContact = userContact;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserFName() {
		return userFName;
	}
	public void setUserFName(String userFName) {
		this.userFName = userFName;
	}
	public String getUserLName() {
		return userLName;
	}
	public void setUserLName(String userLName) {
		this.userLName = userLName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserContact() {
		return userContact;
	}
	public void setUserContact(String userContact) {
		this.userContact = userContact;
	}
}
