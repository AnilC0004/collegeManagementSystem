package model;


/**
 * Created by GAURAV on 21-03-2016.
 */
public class Subject {
    private String subjCode;
    private String subjName;
    private char className;
    private int sem;

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

    public int getSem() {
        return sem;
    }

    public void setSem(int sem) {
        this.sem = sem;
    }
}
