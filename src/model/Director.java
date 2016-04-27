package model;

public class Director extends Person {
	private String collegeID;
	private String collegeName;
	private String collegeLocation;
	
	public Director() {
		setPosition("Director");
	}
	
	

	
	public String getCollegeID() {
		return collegeID;
	}
	public void setCollegeID(String collegeID) {
		this.collegeID = collegeID;
	}
	public String getCollegeName() {
		return collegeName;
	}
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}
	public String getCollegeLocation() {
		return collegeLocation;
	}
	public void setCollegeLocation(String collegeLocation) {
		this.collegeLocation = collegeLocation;
	}

	
}
