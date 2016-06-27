
package model;

import java.util.ArrayList;


/**
 * Created by GAURAV on 21-03-2016.
 */
public class Course {
    
    private String courseID;
    private String courseName;
    private String subcourseID;
    private ArrayList<SubCourse> sub= new ArrayList<SubCourse>();
    private Integer semesterCount;
    
    public int getSemesterCount() {
		return semesterCount;
	}

	public void setSemesterCount(int semesterCount) {
		this.semesterCount = semesterCount;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getSubcourseID() {
        return subcourseID;
    }

    public void setSubcourseID(String subcourseID) {
        this.subcourseID = subcourseID;
    }
    public ArrayList<SubCourse> getSub() {
        return sub;
    }

    public void setSub(ArrayList<SubCourse> sub) {
        this.sub = sub;
    }

    
}
