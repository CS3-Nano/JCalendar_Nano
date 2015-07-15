package beans;

public class UsrCstmiz {
	private int custmID;
	private int userID ;
	private String HighPClr;
	private String MediumPClr;
	private String LowPClr ;
	private String prvtClr ;
	private String Theam;
	private String avatar;
		
	public UsrCstmiz() {
		super();
	}
	public UsrCstmiz(int userID, String highPClr, String mediumPClr,
			String lowPClr, String prvtClr, String theam, String avatar) {
		super();
		this.userID = userID;
		HighPClr = highPClr;
		MediumPClr = mediumPClr;
		LowPClr = lowPClr;
		this.prvtClr = prvtClr;
		Theam = theam;
		this.avatar = avatar;
	}
	public int getCustmID() {
		return custmID;
	}
	public void setCustmID(int custmID) {
		this.custmID = custmID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getHighPClr() {
		return HighPClr;
	}
	public void setHighPClr(String highPClr) {
		HighPClr = highPClr;
	}
	public String getMediumPClr() {
		return MediumPClr;
	}
	public void setMediumPClr(String mediumPClr) {
		MediumPClr = mediumPClr;
	}
	public String getLowPClr() {
		return LowPClr;
	}
	public void setLowPClr(String lowPClr) {
		LowPClr = lowPClr;
	}
	public String getPrvtClr() {
		return prvtClr;
	}
	public void setPrvtClr(String prvtClr) {
		this.prvtClr = prvtClr;
	}
	public String getTheam() {
		return Theam;
	}
	public void setTheam(String theam) {
		Theam = theam;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	
}
