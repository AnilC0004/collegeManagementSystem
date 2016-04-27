package model;

public class Developer extends Person {
	
	private String description;

	public Developer() {
		setPosition("Developer");
	}
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
