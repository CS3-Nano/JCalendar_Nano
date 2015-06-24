package beans;

public class LogIn {
	private int userID;
	private String username;
	private String passwrd;
	
	
	public LogIn() {
	}
	public LogIn(String username, String passwrd) {
		super();
		this.userID=-1;
		this.username = username;
		this.passwrd = passwrd;
	}

	public LogIn(int userID, String username, String passwrd) {
		super();
		this.userID = userID;
		this.username = username;
		this.passwrd = passwrd;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswrd() {
		return passwrd;
	}

	public void setPasswrd(String passwrd) {
		this.passwrd = passwrd;
	}
	
	
	
	
}
