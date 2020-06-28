package com.mecol.bookshop_ssm.entity;


import com.fasterxml.jackson.annotation.JsonBackReference;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/*
@JsonIgnoreProperties(value= {"handler"})//忽略handler的序列化


利用@JsonIgnoreProperties注解忽略要序列化的属性
（值得一提的是，我在测试时发现这个注解可以忽略所的属性，但是在忽略级联对象时就会出现异常，
这里我的级联对象是clazz，在忽略clazz时，
还是会抛出com.fasterxml.jackson.databind.JsonMappingException: No serializer found for class的错误
，所以在这里就直接忽略handler就行了）

因为 我们查询教师信息的课程时 用到了懒加载 如果没有@JsonIgnoreProperties(value= {"handler"})
就会抛出异常

* */

public class Teacher
{
    private  int id;
    private String username;
    private int sex;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private int grade;
    private int rank;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date jobDate;

    private String college;
    private String password;
    private String phone;
    private Long roleId;

    //教师 课程是多对1关系 一个老师多门课程
    //必须写上 courseList的set get方法不然发送回去的json就没有courseList的数据
    private List<Course> courseList;

    public List<Course> getCourseList() {
        return courseList;
    }

    public void setCourseList(List<Course> courseList) {
        this.courseList = courseList;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
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

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public Date getJobDate() {
        return jobDate;
    }

    public void setJobDate(Date jobDate) {
        this.jobDate = jobDate;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", sex=" + sex +
                ", birthday=" + birthday +
                ", grade=" + grade +
                ", rank=" + rank +
                ", jobDate=" + jobDate +
                ", college='" + college + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", roleId=" + roleId +
                ", courseList=" + courseList +
                '}';
    }
}
