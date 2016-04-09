
package model;

import java.util.ArrayList;


/**
 * Created by GAURAV on 21-03-2016.
 */
public class Course {
    
    private String courseId;
    private String subcourseId;
    private ArrayList<Subject> sub=new ArrayList<Subject>();

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getSubcourseId() {
        return subcourseId;
    }

    public void setSubcourseId(String subcourseId) {
        this.subcourseId = subcourseId;
    }
    public ArrayList<Subject> getSub() {
        return sub;
    }

    public void setSub(ArrayList<Subject> sub) {
        this.sub = sub;
    }

    
}
