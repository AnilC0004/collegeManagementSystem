package model;

public class Person {
	private String name;
	private String emailID;
	private String password;
	private String imageURL;
	private String phoneNo;
	private String position;
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEmailID() {
		return emailID;
	}
	
	public String getPhoneno() {
		return phoneNo;
	}

	public void setPhoneno(String phoneno) {
		this.phoneNo = phoneno;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getImageURL() {
		return imageURL;
	}
	
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
}
