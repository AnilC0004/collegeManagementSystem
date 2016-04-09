package model;

public class UniversityMember extends Person{
	
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuLoc() {
		return uLoc;
	}
	public void setuLoc(String uLoc) {
		this.uLoc = uLoc;
	}
	private String uID;
	private String uName;
	private String uLoc;
	
	

}
