package model;

public class Student extends DepartmentMember{
	
	private String rollNo;
	private String courseID;
	private String subCourseID;
	private String batchYear;
	private Integer sem;
	private String sClass;
	
	
	public String getBatchYear() {
		return batchYear;
	}
	public void setBatchYear(String batchYear) {
		this.batchYear = batchYear;
	}
	public Integer getSem() {
		return sem;
	}
	public void setSem(Integer sem) {
		this.sem = sem;
	}
	public String getsClass() {
		return sClass;
	}
	public void setsClass(String sClass) {
		this.sClass = sClass;
	}
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public String getCourseID() {
		return courseID;
	}
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	public String getSubCourseID() {
		return subCourseID;
	}
	public void setSubCourseID(String subCourseID) {
		this.subCourseID = subCourseID;
	}
	
	
	
	
	

}
