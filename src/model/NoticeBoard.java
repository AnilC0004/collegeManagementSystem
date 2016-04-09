package model;

public class NoticeBoard {
	private String imgURL;
	private String title;
	private String description;
	//private int days;
	//private Date start_date;
	private String hostCollege;
	private String eventDate;
	
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getHostCollege() {
		return hostCollege;
	}
	public void setHostCollege(String hostCollege) {
		this.hostCollege = hostCollege;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
