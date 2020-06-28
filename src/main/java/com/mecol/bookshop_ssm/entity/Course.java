
package com.mecol.bookshop_ssm.entity;

import java.util.List;

public class Course {

	private int id;

	private String courseName;

	
	private String place;

	
	private String lessonType;
	
	private int credit;
	private int teacherId;

    //课程和教师 多对一关系  一门课程属于一个老师
    private Teacher teacher;

    private List<Student> studentList;

	public List<Student> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}

	public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}





	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}


	public String getLessonType() {
		return lessonType;
	}

	public void setLessonType(String lessonType) {
		this.lessonType = lessonType;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	@Override
	public String toString() {
		return "Course{" +
				"id=" + id +
				", courseName='" + courseName + '\'' +
				", place='" + place + '\'' +
				", lessonType='" + lessonType + '\'' +
				", credit=" + credit +
				", teacherId=" + teacherId +
				", teacher=" + teacher +
				", studentList=" + studentList +
				'}';
	}
}