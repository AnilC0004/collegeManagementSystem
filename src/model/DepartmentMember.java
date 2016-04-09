package model;

public abstract class DepartmentMember extends CollegeMember{

	private String deptNo;
	private String deptName;
	private int StudentCount;
	private int facultyCount;
	
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
