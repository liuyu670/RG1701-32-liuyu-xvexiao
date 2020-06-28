
package com.mecol.bookshop_ssm.entity;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Student {
	
	private int id;
	
	private String username;
	
	private String password;
	
	private int sex;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	//@DateTimeFormat(pattern = "yyyy-MM-dd") 很重要 必须加上 不然jsp中
	// 数据类型和这里绑定不了 ajax请求进入不了controller

	
	private String phone;
	
	private String email;
	
	private String address;
	
	private String note;
	
	private int status;
	
	private int levelId;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	private Long roleId;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;


	private List<Course> courseList;

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Student{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", sex=" + sex +
				", birthday=" + birthday +
				", phone='" + phone + '\'' +
				", email='" + email + '\'' +
				", address='" + address + '\'' +
				", note='" + note + '\'' +
				", status=" + status +
				", levelId=" + levelId +
				", roleId=" + roleId +
				", createTime=" + createTime +
				", courseList=" + courseList +
				'}';
	}
}
