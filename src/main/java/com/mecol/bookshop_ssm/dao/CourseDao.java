package com.mecol.bookshop_ssm.dao;

import com.mecol.bookshop_ssm.entity.Course;

import java.util.List;

public interface CourseDao {
    List<Course> getCourseList(Integer page, Integer limit); //参数用不到 自动生成的 不细心

    void delCourseById(int id);

    Course getCourseById(int id);

    void updCourse(Course course);

    void insCourse(Course course);

    List<Course> getAllCourseList();

    List<Course> getCourseListIn(List<Integer> ids);

    List<Course> selectCourseByTeacherId(Integer teacherId);

    List<Course> selectCourseByTId(Integer teacherId);

    List<Course> getStudentCourseByTeacherId(Integer teacherId);
    List<Course> selectCourseByStudentId(Integer id);
 }
