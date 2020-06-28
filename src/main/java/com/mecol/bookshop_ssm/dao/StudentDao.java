package com.mecol.bookshop_ssm.dao;

import com.mecol.bookshop_ssm.entity.Student;
import com.mecol.bookshop_ssm.entity.StudentSearch;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentDao {
    List<Student> getAllStudentList(StudentSearch search);

    void deleteStudentById(int id);

    Student getStudentById(int id);

    void updateStudent(Student student);

    void updateStudentStatusById(@Param("id") int id, @Param("status") int status);

    Student selStudentByStudentname(String username);

    void insertStudent(Student student);

    Student login(@Param("username")String username,@Param("password")String password);

    List<Student> getStudentCourse();

    List<Student> getStudentByCourseId(Integer id);
}
