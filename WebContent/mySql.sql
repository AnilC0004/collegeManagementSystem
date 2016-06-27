//spurious table createeee

create table developers (
	name varchar2(30) constraint DEV_NM_NN not null, 
	email_id varchar2(40) constraint DEV_EID_PK primary key,
	password varchar2(20) constraint DEV_PASS_NN not null, 
	imgurl varchar2(200),
	description varchar2(1000) 
);

ALTER TABLE developers ADD MOBILE_NO NUMBER(10 , 0);

CREATE TABLE var_attendance (
		ROLL_NO VARCHAR2(20) NOT NULL,
		SUBJ_CODE VARCHAR2(10) NOT NULL,
		WORKING_DATE DATE NOT NULL,
		STATUS NUMBER(1 , 0) NOT NULL
	);

CREATE UNIQUE INDEX id||AT_RN_SC_WD_CPK ON var_attendance (ROLL_NO ASC, SUBJ_CODE ASC, WORKING_DATE ASC);

ALTER TABLE var_attendance ADD CONSTRAINT id||AT_RN_SC_WD_CPK PRIMARY KEY (ROLL_NO, SUBJ_CODE, WORKING_DATE);

ALTER TABLE var_attendance ADD CONSTRAINT id||AT_RN_FK FOREIGN KEY (ROLL_NO)
	REFERENCES var_student (ROLL_NO)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

CREATE TABLE var_college (
		C_ID VARCHAR2(10) NOT NULL,
		C_NAME VARCHAR2(60) NOT NULL,
		C_LOC VARCHAR2(100) NOT NULL,
		DIRECTOR VARCHAR2(30) NOT NULL,
		EMAIL_ID VARCHAR2(40),
		PASSWORD VARCHAR2(20),
		IMG_URL VARCHAR2(200),
		MOBILE_NO NUMBER(10 , 0)
	);

CREATE UNIQUE INDEX id||CL_EID_UN ON var_college (EMAIL_ID ASC);

CREATE UNIQUE INDEX id||CL_CID__PK ON var_college (C_ID ASC);

ALTER TABLE var_college ADD CONSTRAINT id||CL_CID__PK PRIMARY KEY (C_ID);

CREATE TABLE var_college_TO_COURSES (
		C_ID VARCHAR2(10) NOT NULL,
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		D_NO VARCHAR2(10) NOT NULL
	);

CREATE UNIQUE INDEX id||CTC_CID_COUID_SCOUID_CPK ON var_college_TO_COURSES (C_ID ASC, COURSE_ID ASC, SUBCOURSE_ID ASC);

ALTER TABLE var_college_TO_COURSES ADD CONSTRAINT id||CTC_CID_COUID_SCOUID_CPK PRIMARY KEY (C_ID, COURSE_ID, SUBCOURSE_ID);

ALTER TABLE var_college_TO_COURSES ADD CONSTRAINT id||CTC_COUID_SCOUID_FK FOREIGN KEY (COURSE_ID, SUBCOURSE_ID)
	REFERENCES id||_SUBCOURSES (COURSE_ID, SUBCOURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE var_college_TO_COURSES ADD CONSTRAINT id||CTC_CID_DNO_FK FOREIGN KEY (C_ID, D_NO)
	REFERENCES id||_DEPARTMENTS (C_ID, D_NO)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

CREATE TABLE var_course (
		COURSE_ID VARCHAR2(10) NOT NULL,
		COURSE_NAME VARCHAR2(60) NOT NULL,
		NO_OF_SEM NUMBER(2 , 0) NOT NULL
	);

CREATE UNIQUE INDEX id||CO_COUID_PK ON var_course (COURSE_ID ASC);

ALTER TABLE var_course ADD CONSTRAINT id||CO_COUID_PK PRIMARY KEY (COURSE_ID);

CREATE TABLE id||_DEPARTMENTS (
		C_ID VARCHAR2(10) NOT NULL,
		D_NO VARCHAR2(10) NOT NULL,
		D_NAME VARCHAR2(50) NOT NULL,
		HOD VARCHAR2(30) NOT NULL,
		PASSWORD VARCHAR2(20) NOT NULL,
		MOBILE_NO NUMBER(10 , 0),
		EMAIL_ID VARCHAR2(40),
		NO_OF_STUDENT NUMBER(3 , 0) NOT NULL,
		NO_OF_FACULTY NUMBER(2 , 0) NOT NULL
	);

ALTER TABLE id||_DEPARTMENTS MODIFY (IMG_URL VARCHAR2(200) );	

CREATE UNIQUE INDEX id||D_CID_DNO_CPK ON id||_DEPARTMENTS (C_ID ASC, D_NO ASC);

CREATE UNIQUE INDEX id||D_EID_UN ON id||_DEPARTMENTS (EMAIL_ID ASC);

CREATE UNIQUE INDEX id||D_MOB_UN ON id||_DEPARTMENTS (MOBILE_NO ASC);

ALTER TABLE id||_DEPARTMENTS ADD CONSTRAINT id||D_CID_DNO_CPK PRIMARY KEY (C_ID, D_NO);

ALTER TABLE id||_DEPARTMENTS ADD CONSTRAINT id||D_CID_FK FOREIGN KEY (C_ID)
	REFERENCES var_college (C_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;
CREATE TABLE id||_FACULTIES (
		FACULTY_ID VARCHAR2(20) NOT NULL,
		FACULTY_NAME VARCHAR2(30) NOT NULL,
		PASSWORD VARCHAR2(20) NOT NULL,
		C_ID VARCHAR2(10) NOT NULL,
		D_NO VARCHAR2(10) NOT NULL,
		MOBILE_NO NUMBER(10 , 0),
		EMAIL_ID VARCHAR2(40)
	);

CREATE UNIQUE INDEX id||F_MOB_UN ON id||_FACULTIES (MOBILE_NO ASC);

CREATE UNIQUE INDEX id||F_FID_PK ON id||_FACULTIES (FACULTY_ID ASC);

CREATE UNIQUE INDEX id||F_EID_UN ON id||_FACULTIES (EMAIL_ID ASC);

ALTER TABLE id||_FACULTIES ADD CONSTRAINT id||F_FID_PK PRIMARY KEY (FACULTY_ID);

ALTER TABLE id||_FACULTIES ADD CONSTRAINT id||F_CID_DNO_FK FOREIGN KEY (C_ID, D_NO)
	REFERENCES id||_DEPARTMENTS (C_ID, D_NO)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;


CREATE TABLE id||_NOTICE_BOARD (
		IMGURL VARCHAR2(200) NOT NULL,
		TITLE VARCHAR2(200) NOT NULL,
		DESCRIPTION VARCHAR2(1000) NOT NULL,
		START_DATE DATE NOT NULL,
		DAYS NUMBER(2 , 0),
		EVENT_DATE DATE,
		HOST_CLG VARCHAR2(10)
	);

CREATE TABLE var_student (
		ROLL_NO VARCHAR2(20) NOT NULL,
		STUDENT_NAME VARCHAR2(30) NOT NULL,
		C_ID VARCHAR2(10) NOT NULL,
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		MOBILE_NO NUMBER(10 , 0),
		EMAIL_ID VARCHAR2(40),
		BATCH_YR NUMBER(4 , 0) NOT NULL,
		SEM NUMBER(2 , 0) NOT NULL,
		CLASS CHAR(1) NOT NULL
	);

CREATE UNIQUE INDEX id||ST_EID_UN ON var_student (EMAIL_ID ASC);

CREATE UNIQUE INDEX id||ST_RN_PK ON var_student (ROLL_NO ASC);

CREATE UNIQUE INDEX id||ST_MOB_UN ON var_student (MOBILE_NO ASC);

ALTER TABLE var_student ADD CONSTRAINT id||ST_RN_PK PRIMARY KEY (ROLL_NO);

ALTER TABLE var_student ADD CONSTRAINT id||ST_CID_COUID_SCOUID_FK FOREIGN KEY (C_ID, COURSE_ID, SUBCOURSE_ID)
	REFERENCES var_college_TO_COURSES (C_ID, COURSE_ID, SUBCOURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;
CREATE TABLE id||_SUBCOURSES (
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_NAME VARCHAR2(60) NOT NULL
	);

CREATE UNIQUE INDEX id||SCO_COUID_SCOUID_CPK ON id||_SUBCOURSES (COURSE_ID ASC, SUBCOURSE_ID ASC);

ALTER TABLE id||_SUBCOURSES ADD CONSTRAINT id||SCO_COUID_SCOUID_CPK PRIMARY KEY (COURSE_ID, SUBCOURSE_ID);

ALTER TABLE id||_SUBCOURSES ADD CONSTRAINT id||SCO_COUID_FK FOREIGN KEY (COURSE_ID)
	REFERENCES var_course (COURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

CREATE TABLE var_subject_to_faculty (
		C_ID VARCHAR2(10) NOT NULL,
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		SUBJ_CODE VARCHAR2(10) NOT NULL,
		CLASS CHAR(1) NOT NULL,
		FACULTY_ID VARCHAR2(20) NOT NULL
	);

CREATE UNIQUE INDEX id||STF_CID_COID_SID_SC_CL_CPK ON var_subject_to_faculty (C_ID ASC, COURSE_ID ASC, SUBCOURSE_ID ASC, SUBJ_CODE ASC, CLASS ASC);

ALTER TABLE var_subject_to_faculty ADD CONSTRAINT id||STF_CID_COID_SID_SC_CL_CPK PRIMARY KEY (C_ID, COURSE_ID, SUBCOURSE_ID, SUBJ_CODE, CLASS);

ALTER TABLE var_subject_to_faculty ADD CONSTRAINT id||STF_COUID_SCOUID_SC_FK FOREIGN KEY (COURSE_ID, SUBCOURSE_ID, SUBJ_CODE)
	REFERENCES var_subjects (COURSE_ID, SUBCOURSE_ID, SUBJ_CODE)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE var_subject_to_faculty ADD CONSTRAINT id||STF_CID_COUID_SCOUID_FK FOREIGN KEY (C_ID, COURSE_ID, SUBCOURSE_ID)
	REFERENCES var_college_TO_COURSES (C_ID, COURSE_ID, SUBCOURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;


CREATE TABLE var_subjects (
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		SUBJ_CODE VARCHAR2(10) NOT NULL,
		SUBJ_NAME VARCHAR2(50) NOT NULL,
		SEM NUMBER(2 , 0) NOT NULL
	);

CREATE UNIQUE INDEX id||SB_COUID_SCOUID_SC_CPK ON var_subjects (COURSE_ID ASC, SUBCOURSE_ID ASC, SUBJ_CODE ASC);

ALTER TABLE var_subjects ADD CONSTRAINT id||SB_COUID_SCOUID_SC_CPK PRIMARY KEY (COURSE_ID, SUBCOURSE_ID, SUBJ_CODE);

ALTER TABLE var_subjects ADD CONSTRAINT id||SB_COUID_SCOUID_FK FOREIGN KEY (COURSE_ID, SUBCOURSE_ID)
	REFERENCES id||_SUBCOURSES (COURSE_ID, SUBCOURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

CREATE TABLE UNIVERSITY (
		U_ID VARCHAR2(10) NOT NULL,
		U_NAME VARCHAR2(60) NOT NULL,
		U_LOC VARCHAR2(100) NOT NULL,
		COURSE_TABLE VARCHAR2(30) NOT NULL,
		SUBCOURSE_TABLE VARCHAR2(30) NOT NULL,
		COLLEGE_TABLE VARCHAR2(30) NOT NULL,
		DEPT_TABLE VARCHAR2(30) NOT NULL,
		STUDENT_TABLE VARCHAR2(30) NOT NULL,
		FACULTY_TABLE VARCHAR2(30) NOT NULL,
		CTC_TABLE VARCHAR2(30) NOT NULL,
		SUBJECT_TABLE VARCHAR2(30) NOT NULL,
		STF_TABLE VARCHAR2(30) NOT NULL,
		ATTENDANCE_TABLE VARCHAR2(30) NOT NULL,
		STATE VARCHAR2(20) NOT NULL
	);

CREATE UNIQUE INDEX UN_ST_UN ON UNIVERSITY (STUDENT_TABLE ASC);

CREATE UNIQUE INDEX UN_AT_UN ON UNIVERSITY (ATTENDANCE_TABLE ASC);

CREATE UNIQUE INDEX UN_CTCT_UN ON UNIVERSITY (CTC_TABLE ASC);

CREATE UNIQUE INDEX UN_SBT_UN ON UNIVERSITY (SUBJECT_TABLE ASC);

CREATE UNIQUE INDEX UN_STFT_UN ON UNIVERSITY (STF_TABLE ASC);

CREATE UNIQUE INDEX UN_SCOT_UN ON UNIVERSITY (SUBCOURSE_TABLE ASC);

CREATE UNIQUE INDEX UN_CT_UN ON UNIVERSITY (COLLEGE_TABLE ASC);

CREATE UNIQUE INDEX UN_COT_UN ON UNIVERSITY (COURSE_TABLE ASC);

CREATE UNIQUE INDEX UN_UID_PK ON UNIVERSITY (U_ID ASC);

CREATE UNIQUE INDEX UN_DT_UN ON UNIVERSITY (DEPT_TABLE ASC);

CREATE UNIQUE INDEX UN_FT_UN ON UNIVERSITY (FACULTY_TABLE ASC);

ALTER TABLE UNIVERSITY ADD CONSTRAINT UN_UID_PK PRIMARY KEY (U_ID);
///////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE PROCEDURE addUniversity(id IN university.u_id%type,name IN university.u_name%type,location IN university.u_loc%type,state in university.state%type ) is

	var_course VARCHAR2(30);
	var_subcourse VARCHAR2(30);
	var_college VARCHAR2(30);
	var_department VARCHAR2(30);
	var_student VARCHAR2(30);
	var_faculty VARCHAR2(30);
	var_colleges_to_courses VARCHAR2(30);
	var_subjects VARCHAR2(30);
	var_subject_to_faculty VARCHAR2(30);
	var_attendance VARCHAR2(30);
	query VARCHAR2(200);
BEGIN
	
	var_course := id||'_courses';
	var_subcourse := id||'_subcourses';
	var_college := id||'_colleges';
	var_department := id||'_departments';
	var_student :=id||'_students';
	var_faculty :=id||'_faculty';
	var_colleges_to_courses := id||'_colleges_to_courses';
	var_subjects := id||'_subjects';
	var_subject_to_faculty := id||'_subj_to_faculty';
	var_attendance := id||'_attendance';
	
 query:='CREATE TABLE '|| var_attendance||' (
		ROLL_NO VARCHAR2(20) NOT NULL,
		SUBJ_CODE VARCHAR2(10) NOT NULL,
		WORKING_DATE DATE NOT NULL,
		STATUS NUMBER(1 , 0) NOT NULL
	)';
	EXECUTE IMMEDIATE query;

query:='CREATE UNIQUE INDEX '||id||'AT_RN_SC_WD_CPK ON '||var_attendance ||'(ROLL_NO ASC, SUBJ_CODE ASC, WORKING_DATE ASC)';
EXECUTE IMMEDIATE query;

query:='ALTER TABLE '||var_attendance||' ADD CONSTRAINT'|| id||'AT_RN_SC_WD_CPK PRIMARY KEY (ROLL_NO, SUBJ_CODE, WORKING_DATE)';
EXECUTE IMMEDIATE query;

query:='ALTER TABLE '||var_attendance||' ADD CONSTRAINT '|| id||'AT_RN_FK FOREIGN KEY (ROLL_NO)
	REFERENCES var_student (ROLL_NO)
	ON DELETE RESTRICT
	ON UPDATE CASCADE';
	EXECUTE IMMEDIATE query;

query:='CREATE TABLE '||var_college||' (
		C_ID VARCHAR2(10) NOT NULL,
		C_NAME VARCHAR2(60) NOT NULL,
		C_LOC VARCHAR2(100) NOT NULL,
		DIRECTOR VARCHAR2(30) NOT NULL,
		EMAIL_ID VARCHAR2(40),
		PASSWORD VARCHAR2(20),
		IMG_URL VARCHAR2(200),
		MOBILE_NO NUMBER(10 , 0)
	)';
	EXECUTE IMMEDIATE query;

query:='CREATE UNIQUE INDEX '||id||'CL_EID_UN ON '||var_college|| '(EMAIL_ID ASC)';
EXECUTE IMMEDIATE query;

query:='CREATE UNIQUE INDEX '||id||'CL_CID__PK ON '||var_college||' (C_ID ASC)';
EXECUTE IMMEDIATE query;

query:='ALTER TABLE '||var_college||' ADD CONSTRAINT'|| id||'CL_CID__PK PRIMARY KEY (C_ID)';
EXECUTE IMMEDIATE query;

query:='CREATE TABLE '||var_college_TO_COURSES||' (
		C_ID VARCHAR2(10) NOT NULL,
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		D_NO VARCHAR2(10) NOT NULL
	)';
	EXECUTE IMMEDIATE query;

query:='CREATE UNIQUE INDEX '||id||'CTC_CID_COUID_SCOUID_CPK ON '||var_college_TO_COURSES||' (C_ID ASC, COURSE_ID ASC, SUBCOURSE_ID ASC)';
EXECUTE IMMEDIATE query;

query:='ALTER TABLE '||var_college_TO_COURSES||' ADD CONSTRAINT '||id||'CTC_CID_COUID_SCOUID_CPK PRIMARY KEY (C_ID, COURSE_ID, SUBCOURSE_ID)';
EXECUTE IMMEDIATE query;

query:='ALTER TABLE '||var_college_TO_COURSES||' ADD CONSTRAINT '||id||'CTC_COUID_SCOUID_FK FOREIGN KEY (COURSE_ID, SUBCOURSE_ID)
	REFERENCES id||_SUBCOURSES (COURSE_ID, SUBCOURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE';
EXECUTE IMMEDIATE query;

query:='ALTER TABLE '||var_college_TO_COURSES||' ADD CONSTRAINT '||id||'CTC_CID_DNO_FK FOREIGN KEY (C_ID, D_NO)
	REFERENCES id||_DEPARTMENTS (C_ID, D_NO)
	ON DELETE RESTRICT
	ON UPDATE CASCADE';
EXECUTE IMMEDIATE query;	
	

query:='CREATE TABLE '||var_course||' (
		COURSE_ID VARCHAR2(10) NOT NULL,
		COURSE_NAME VARCHAR2(60) NOT NULL,
		NO_OF_SEM NUMBER(2 , 0) NOT NULL
	)';
EXECUTE IMMEDIATE query;	

query:='CREATE UNIQUE INDEX'||id||'CO_COUID_PK ON var_course (COURSE_ID ASC);';

'ALTER TABLE var_course ADD CONSTRAINT' ||id||'CO_COUID_PK PRIMARY KEY (COURSE_ID);';

'CREATE TABLE'||id||'_DEPARTMENTS (
		C_ID VARCHAR2(10) NOT NULL,
		D_NO VARCHAR2(10) NOT NULL,
		D_NAME VARCHAR2(50) NOT NULL,
		HOD VARCHAR2(30) NOT NULL,
		PASSWORD VARCHAR2(20) NOT NULL,
		MOBILE_NO NUMBER(10 , 0),
		EMAIL_ID VARCHAR2(40),
		NO_OF_STUDENT NUMBER(3 , 0) NOT NULL,
		NO_OF_FACULTY NUMBER(2 , 0) NOT NULL
	);';

ALTER TABLE id||_DEPARTMENTS MODIFY (IMG_URL VARCHAR2(200) )';	

CREATE UNIQUE INDEX id||D_CID_DNO_CPK ON id||_DEPARTMENTS (C_ID ASC, D_NO ASC);

CREATE UNIQUE INDEX id||D_EID_UN ON id||_DEPARTMENTS (EMAIL_ID ASC);

CREATE UNIQUE INDEX id||D_MOB_UN ON id||_DEPARTMENTS (MOBILE_NO ASC);

ALTER TABLE id||_DEPARTMENTS ADD CONSTRAINT id||D_CID_DNO_CPK PRIMARY KEY (C_ID, D_NO);

ALTER TABLE id||_DEPARTMENTS ADD CONSTRAINT id||D_CID_FK FOREIGN KEY (C_ID)
	REFERENCES var_college (C_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;
CREATE TABLE id||_FACULTIES (
		FACULTY_ID VARCHAR2(20) NOT NULL,
		FACULTY_NAME VARCHAR2(30) NOT NULL,
		PASSWORD VARCHAR2(20) NOT NULL,
		C_ID VARCHAR2(10) NOT NULL,
		D_NO VARCHAR2(10) NOT NULL,
		MOBILE_NO NUMBER(10 , 0),
		EMAIL_ID VARCHAR2(40)
	);

CREATE UNIQUE INDEX id||F_MOB_UN ON id||_FACULTIES (MOBILE_NO ASC);

CREATE UNIQUE INDEX id||F_FID_PK ON id||_FACULTIES (FACULTY_ID ASC);

CREATE UNIQUE INDEX id||F_EID_UN ON id||_FACULTIES (EMAIL_ID ASC);

ALTER TABLE id||_FACULTIES ADD CONSTRAINT id||F_FID_PK PRIMARY KEY (FACULTY_ID);

ALTER TABLE id||_FACULTIES ADD CONSTRAINT id||F_CID_DNO_FK FOREIGN KEY (C_ID, D_NO)
	REFERENCES id||_DEPARTMENTS (C_ID, D_NO)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;


CREATE TABLE id||_NOTICE_BOARD (
		IMGURL VARCHAR2(200) NOT NULL,
		TITLE VARCHAR2(200) NOT NULL,
		DESCRIPTION VARCHAR2(1000) NOT NULL,
		START_DATE DATE NOT NULL,
		DAYS NUMBER(2 , 0),
		EVENT_DATE DATE,
		HOST_CLG VARCHAR2(10)
	);

CREATE TABLE var_student (
		ROLL_NO VARCHAR2(20) NOT NULL,
		STUDENT_NAME VARCHAR2(30) NOT NULL,
		C_ID VARCHAR2(10) NOT NULL,
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		MOBILE_NO NUMBER(10 , 0),
		EMAIL_ID VARCHAR2(40),
		BATCH_YR NUMBER(4 , 0) NOT NULL,
		SEM NUMBER(2 , 0) NOT NULL,
		CLASS CHAR(1) NOT NULL
	);

CREATE UNIQUE INDEX id||ST_EID_UN ON var_student (EMAIL_ID ASC);

CREATE UNIQUE INDEX id||ST_RN_PK ON var_student (ROLL_NO ASC);

CREATE UNIQUE INDEX id||ST_MOB_UN ON var_student (MOBILE_NO ASC);

ALTER TABLE var_student ADD CONSTRAINT id||ST_RN_PK PRIMARY KEY (ROLL_NO);

ALTER TABLE var_student ADD CONSTRAINT id||ST_CID_COUID_SCOUID_FK FOREIGN KEY (C_ID, COURSE_ID, SUBCOURSE_ID)
	REFERENCES var_college_TO_COURSES (C_ID, COURSE_ID, SUBCOURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;
CREATE TABLE id||_SUBCOURSES (
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_NAME VARCHAR2(60) NOT NULL
	);

CREATE UNIQUE INDEX id||SCO_COUID_SCOUID_CPK ON id||_SUBCOURSES (COURSE_ID ASC, SUBCOURSE_ID ASC);

ALTER TABLE id||_SUBCOURSES ADD CONSTRAINT id||SCO_COUID_SCOUID_CPK PRIMARY KEY (COURSE_ID, SUBCOURSE_ID);

ALTER TABLE id||_SUBCOURSES ADD CONSTRAINT id||SCO_COUID_FK FOREIGN KEY (COURSE_ID)
	REFERENCES var_course (COURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

CREATE TABLE var_subject_to_faculty (
		C_ID VARCHAR2(10) NOT NULL,
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		SUBJ_CODE VARCHAR2(10) NOT NULL,
		CLASS CHAR(1) NOT NULL,
		FACULTY_ID VARCHAR2(20) NOT NULL
	);

CREATE UNIQUE INDEX id||STF_CID_COID_SID_SC_CL_CPK ON var_subject_to_faculty (C_ID ASC, COURSE_ID ASC, SUBCOURSE_ID ASC, SUBJ_CODE ASC, CLASS ASC);

ALTER TABLE var_subject_to_faculty ADD CONSTRAINT id||STF_CID_COID_SID_SC_CL_CPK PRIMARY KEY (C_ID, COURSE_ID, SUBCOURSE_ID, SUBJ_CODE, CLASS);

ALTER TABLE var_subject_to_faculty ADD CONSTRAINT id||STF_COUID_SCOUID_SC_FK FOREIGN KEY (COURSE_ID, SUBCOURSE_ID, SUBJ_CODE)
	REFERENCES var_subjects (COURSE_ID, SUBCOURSE_ID, SUBJ_CODE)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE var_subject_to_faculty ADD CONSTRAINT id||STF_CID_COUID_SCOUID_FK FOREIGN KEY (C_ID, COURSE_ID, SUBCOURSE_ID)
	REFERENCES var_college_TO_COURSES (C_ID, COURSE_ID, SUBCOURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;


CREATE TABLE var_subjects (
		COURSE_ID VARCHAR2(10) NOT NULL,
		SUBCOURSE_ID VARCHAR2(10) NOT NULL,
		SUBJ_CODE VARCHAR2(10) NOT NULL,
		SUBJ_NAME VARCHAR2(50) NOT NULL,
		SEM NUMBER(2 , 0) NOT NULL
	);

CREATE UNIQUE INDEX id||SB_COUID_SCOUID_SC_CPK ON var_subjects (COURSE_ID ASC, SUBCOURSE_ID ASC, SUBJ_CODE ASC);

ALTER TABLE var_subjects ADD CONSTRAINT id||SB_COUID_SCOUID_SC_CPK PRIMARY KEY (COURSE_ID, SUBCOURSE_ID, SUBJ_CODE);

ALTER TABLE var_subjects ADD CONSTRAINT id||SB_COUID_SCOUID_FK FOREIGN KEY (COURSE_ID, SUBCOURSE_ID)
	REFERENCES id||_SUBCOURSES (COURSE_ID, SUBCOURSE_ID)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

END addUniversity;
	//////////////////////////////////




SELECT U_NAME, U_LOC, STATE
  FROM SCOTT.UNIVERSITY
  WHERE U_ID = 'rgpv'

ALTER Table rgpv_courses (sno NUMBER(3,0));

SELECT C.SUBCOURSE_NAME, D.D_NO, C.SUBCOURSE_ID
  FROM
       SCOTT.RGPV_SUBCOURSES C LEFT OUTER JOIN SCOTT.RGPV_COLLEGES_TO_COURSES D ON C.COURSE_ID = D.COURSE_ID AND C.SUBCOURSE_ID = D.SUBCOURSE_ID
  WHERE C.COURSE_ID = 'BTECH'

SELECT  C.SUBCOURSE_ID,C.SUBCOURSE_NAME, D.D_NO
  FROM
       SCOTT.RGPV_SUBCOURSES C LEFT OUTER JOIN SCOTT.RGPV_COLLEGES_TO_COURSES D ON C.COURSE_ID = D.COURSE_ID AND C.SUBCOURSE_ID = D.SUBCOURSE_ID AND D.C_ID = '0101'
  WHERE C.COURSE_ID = 'BTECH'

SELECT  C.SUBCOURSE_ID,C.SUBCOURSE_NAME, D.D_NO 
	FROM 
	SCOTT.RGPV_SUBCOURSES C LEFT OUTER JOIN SCOTT.RGPV_COLLEGES_TO_COURSES D ON C.COURSE_ID = D.COURSE_ID AND C.SUBCOURSE_ID = D.SUBCOURSE_ID AND D.C_ID = ? 
WHERE C.COURSE_ID = ? 

SELECT *
  FROM
       SCOTT.RGPV_SUBCOURSES C LEFT OUTER JOIN SCOTT.RGPV_COLLEGES_TO_COURSES D ON C.COURSE_ID = D.COURSE_ID AND C.SUBCOURSE_ID = D.SUBCOURSE_ID AND D.C_ID = '0101' AND C.COURSE_ID='BTECH'
  

SELECT C.SUBCOURSE_ID,C.SUBCOURSE_NAME,D.D_NO FROM SCOTT.RGPV_SUBCOURSES C LEFT OUTER JOIN SCOTT.RGPV_COLLEGES_TO_COURSES D ON C.COURSE_ID = D.COURSE_ID AND C.SUBCOURSE_ID = D.SUBCOURSE_ID AND D.C_ID = '0101' WHERE C.COURSE_ID = 'BTECH' 

(SELECT subcourse_id,subcourse_name FROM rgpv_subcourses WHERE course_id=?) joins (SELECT subcourse_id,dno FROM  rgpv_colleges_to_courses WHERE c_id = ? AND course_id=?);

UPDATE rgpv_COLLEGES_TO_COURSES SET D_NO = me WHERE COURSE_ID ='mtech' AND SUBCOURSE_ID ='au' AND C_ID='0101'

UPDATE rgpv_departments SET hod = 'asas',password= 'asas',mobile_no= 'asas',email_id= 'a@a', no_of_student = '122',no_of_faculty = '12' WHERE c_id='0101' AND d_no='CSE'

SELECT TOP 1 id FROM products WHERE products.id = ?;

SELECT ROLL_NO, STUDENT_NAME, MOBILE_NO, EMAIL_ID, BATCH_YR
  FROM SCOTT.RGPV_STUDENTS
SELECT B.SUBCOURSE_NAME, B.SUBCOURSE_ID
  FROM SCOTT.RGPV_COLLEGES_TO_COURSES A JOIN SCOTT.RGPV_SUBCOURSES B ON A.COURSE_ID = B.COURSE_ID AND A.SUBCOURSE_ID = B.SUBCOURSE_ID AND A.C_ID = '0101'
    AND A.D_NO = 'CS' AND A.COURSE_ID = 'BTECH'

SELECT course_id,course_name FROM rgpv_courses c inner join rgpv_colleges_to_courses D on 


INSERT INTO RGPV_subjects(roll_no,student_name ,  c_id ,  course_id ,  subcourse_id ,  mobile_no ,  email_id ,  batch_yr ,  sem ,  class) VALUES('12','ASAD','0101','BTECH','CSE','121212','A@a','1234','1','A')

ALTER TABLE RGPV_STUDENTS MODIFY(CLASS VARCHAR2(1));
ALTER TABLE RGPV_SUBJ_TO_FACULTY MODIFY(CLASS VARCHAR2(1));
SELECT FACULTY_ID, FACULTY_NAME, PASSWORD, MOBILE_NO, EMAIL_ID
  FROM SCOTT.RGPV_FACULTIES
UPDATE SCOTT.RGPV_FACULTIES
  SET FACULTY_NAME = DEFAULT, PASSWORD = DEFAULT, MOBILE_NO = DEFAULT,
      EMAIL_ID = DEFAULT
INSERT INTO SCOTT.RGPV_FACULTIES (FACULTY_ID, FACULTY_NAME, PASSWORD,
  C_ID, D_NO, MOBILE_NO, EMAIL_ID)
  VALUES ('', '', '', '', '', NULL, NULL)
SELECT ROLL_NO, STUDENT_NAME, BATCH_YR, EMAIL_ID, MOBILE_NO
  FROM SCOTT.RGPV_STUDENTS

SELECT B.FACULTY_ID, B.FACULTY_NAME, A.CLASS
  FROM SCOTT.RGPV_SUBJ_TO_FACULTY A, SCOTT.RGPV_FACULTIES B
  WHERE A.C_ID = '' AND A.COURSE_ID = '' AND A.SUBCOURSE_ID =''  AND A.SUBJ_CODE ='' 
    AND A.FACULTY_ID = B.FACULTY_ID

SELECT B.FACULTY_ID, B.FACULTY_NAME, A.CLASS
  FROM SCOTT.RGPV_SUBJ_TO_FACULTY A, SCOTT.RGPV_FACULTIES B
  WHERE A.C_ID = '0101'  AND A.COURSE_ID = 'MTECH' AND A.SUBCOURSE_ID = 'CSE' AND A.SUBJ_CODE ='TOC' 
    AND A.FACULTY_ID = B.FACULTY_ID
UPDATE SCOTT.RGPV_SUBJ_TO_FACULTY
  SET CLASS = 'A'
  WHERE FACULTY_ID = '122' AND COURSE_ID =  AND SUBCOURSE_ID =  AND SUBJ_CODE = 
  DELETE FROM SCOTT.RGPV_SUBJ_TO_FACULTY
 WHERE COURSE_ID =  AND SUBCOURSE_ID =  AND SUBJ_CODE =  AND FACULTY_ID = 
  
  INSERT INTO SCOTT.RGPV_SUBJ_TO_FACULTY (C_ID, COURSE_ID, SUBCOURSE_ID,
  FACULTY_ID, CLASS, SUBJ_CODE)
  VALUES (?, ?, ?, ?, ?, ?)
  
SELECT D_NO, D_NAME, NO_OF_STUDENT, NO_OF_FACULTY
  FROM SCOTT.RGPV_DEPARTMENTS
  WHERE C_ID = ''


UPDATE SCOTT.RGPV_DEPARTMENTS
  SET D_NAME = DEFAULT, NO_OF_STUDENT = DEFAULT, NO_OF_FACULTY = DEFAULT
  WHERE C_ID = '' AND D_NO = ''


DELETE FROM SCOTT.RGPV_DEPARTMENTS
 WHERE D_NO =  AND C_ID = 

INSERT INTO SCOTT.RGPV_DEPARTMENTS (C_ID, D_NO, D_NAME, NO_OF_STUDENT,
  NO_OF_FACULTY)
  VALUES ('', '', '', 0.0, 0.0)  
  
  
  SELECT HOD, PASSWORD, MOBILE_NO, EMAIL_ID
  FROM SCOTT.RGPV_DEPARTMENTS
  WHERE C_ID =  AND D_NO = 

  UPDATE SCOTT.RGPV_DEPARTMENTS
  SET HOD = DEFAULT, PASSWORD = DEFAULT, MOBILE_NO = DEFAULT,
      EMAIL_ID = DEFAULT
  WHERE C_ID =  AND D_NO = 
  
SELECT HOD, PASSWORD, MOBILE_NO, EMAIL_ID FROM SCOTT.RGPV_DEPARTMENTS WHERE C_ID = ?  AND D_NO = ?

UPDATE SCOTT.RGPV_DEPARTMENTS
  SET HOD = 'S Silakari', PASSWORD = '1212', MOBILE_NO = '123123',
      EMAIL_ID = '123@dad'
  WHERE C_ID = '0101' AND D_NO = 'cs'
  
  SELECT STUDENT_NAME, COURSE_ID, SUBCOURSE_ID, MOBILE_NO, EMAIL_ID,
  BATCH_YR, SEM, CLASS
  FROM SCOTT.RGPV_STUDENTS


  WHERE ROLL_NO =  AND C_ID = 

SELECT COUNT(*)
  FROM SCOTT.RGPV_ATTENDANCE
  WHERE ROLL_NO = ? AND SUBJ_CODE = ? AND WORKING_DATE BETWEEN ? AND ? 



