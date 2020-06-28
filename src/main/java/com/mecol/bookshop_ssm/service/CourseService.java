package com.mecol.bookshop_ssm.service;

import com.mecol.bookshop_ssm.entity.Course;
import com.mecol.bookshop_ssm.util.ResultUtil;

public interface CourseService {
    ResultUtil getCourseList(Integer page, Integer limit);

    void delCourseById(int id);

    Course getCourseById(int id);

    void updCourse(Course course);

    void insCourse(Course course);
}
