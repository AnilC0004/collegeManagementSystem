package model;

import java.util.ArrayList;

public class Faculty extends DepartmentMember{
    
    private String userId;
    private ArrayList<Course> course=new ArrayList<Course>();
    
    public Faculty() {
		setPosition("Faculty");
	}
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public ArrayList<Course> getCourse() {
        return course;
    }

    public void setCourse(ArrayList<Course> course) {
        this.course = course;
    }

    
}
