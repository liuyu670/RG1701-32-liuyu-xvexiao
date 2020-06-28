package com.mecol.bookshop_ssm.service;

import com.mecol.bookshop_ssm.entity.StudentCourse;

import java.util.List;

public interface StudentCourseService {
    StudentCourse selectCourseBySid(Integer studentId,Integer id);

    void insStudentCourse(Integer studentId, Integer id);

    void delBySCid(Integer studentId, Integer id);

    List<StudentCourse> selCourseBySid(Integer studentId);
}
