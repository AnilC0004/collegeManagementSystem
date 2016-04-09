package model;

import java.util.ArrayList;


/**
 * Created by GAURAV on 06-03-2016.
 */
public class Faculty extends DepartmentMember{
    
    private String userId;
    private ArrayList<Course> course=new ArrayList<Course>();
    
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
