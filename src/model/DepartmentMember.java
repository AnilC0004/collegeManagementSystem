package model;

public abstract class DepartmentMember extends CollegeMember{

	private String deptNo;
	private String deptName;
	private int studentCount;
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
		return studentCount;
	}
	public void setStudentCount(int studentCount) {
		this.studentCount = studentCount;
	}
	public int getFacultyCount() {
		return facultyCount;
	}
	public void setFacultyCount(int facultyCount) {
		this.facultyCount = facultyCount;
	}
	

}
