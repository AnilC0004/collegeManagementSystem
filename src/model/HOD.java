package model;

public class HOD extends Person {
	
	private String collegeID;
	private String deptNo;
	private String deptName;
	private int StudentCount;
	private int facultyCount;

	public HOD() {
		setPosition("HOD");
	}
	public String getCollegeID() {
		return collegeID;
	}
	public void setCollegeID(String collegeID) {
		this.collegeID = collegeID;
	}
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getStudentCount() {
		return StudentCount;
	}
	public void setStudentCount(int studentCount) {
		StudentCount = studentCount;
	}
	public int getFacultyCount() {
		return facultyCount;
	}
	public void setFacultyCount(int facultyCount) {
		this.facultyCount = facultyCount;
	}
	
	
}
