package model;

public class Event {

	public Event() {
    }
 
    public Event(String thumbnailUrl,String title,String hostClg,String description,String eventDate,
    		String startDate,int days) {
        this.thumbnailUrl = thumbnailUrl;
        this.title = title;
        this.hostClg = hostClg;
        this.description = description;
        this.eventDate = eventDate;
        this.startDate=startDate;
        this.days=days;
    }

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHostClg() {
		return hostClg;
	}

	public void setHostClg(String hostClg) {
		this.hostClg = hostClg;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	private String thumbnailUrl;
	private String title;
    private String hostClg;
    private String description;
    private String eventDate;
    private String startDate;
    private int days;
 
    
}
