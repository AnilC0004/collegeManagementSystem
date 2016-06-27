package model;


public class Subject {
    private String subjCode;
    private String subjName;
    private char className;
    private Integer sem;
    private String courseID;
    private String subCourseID;

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

	public String getSubjCode() {
        return subjCode;
    }

    public void setSubjCode(String subjCode) {
        this.subjCode = subjCode;
    }

    public String getSubjName() {
        return subjName;
    }

    public void setSubjName(String subjName) {
        this.subjName = subjName;
    }

    public char getClassName() {
        return className;
    }

    public void setClassName(char className) {
        this.className = className;
    }

    public Integer getSem() {
        return sem;
    }

    public void setSem(Integer sem) {
        this.sem = sem;
    }
}
