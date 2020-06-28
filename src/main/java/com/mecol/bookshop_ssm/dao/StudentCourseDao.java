package com.mecol.bookshop_ssm.dao;

import com.mecol.bookshop_ssm.entity.StudentCourse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentCourseDao {
    StudentCourse selectCourseBySid(@Param("studentId") Integer studentId, @Param("id")Integer id);

    void insStudentCourse(@Param("studentId") Integer studentId, @Param("id")Integer id);

    void delBySCid(@Param("studentId") Integer studentId, @Param("id") Integer id);

    List<StudentCourse> selCourseBySid(Integer studentId);
}
