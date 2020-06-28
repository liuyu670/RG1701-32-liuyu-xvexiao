package com.mecol.bookshop_ssm.service;

import com.mecol.bookshop_ssm.entity.Menu;
import com.mecol.bookshop_ssm.entity.Student;
import com.mecol.bookshop_ssm.entity.StudentSearch;
import com.mecol.bookshop_ssm.util.ResultUtil;

import java.util.List;

public interface StudentService {
    ResultUtil getAllStudentList(Integer page, Integer limit, StudentSearch search);

    ResultUtil deleteStudentById(int id);

    Student getStudentById(int id);

    ResultUtil updateStudent(Student student);

    ResultUtil updateStudentStatusById(int id, int status);

    Student selStudentByStudentname(String username);

    void insertStudent(Student student);

    Student login(String username, String password);

    List<Menu> getMenus(Student student1);

    ResultUtil getStudentCourse(Integer page, Integer limit);

    ResultUtil getCourse(Integer page, Integer limit);

    ResultUtil getCourseList(Integer page, Integer limit, List<Integer> ids);

    Student getStudentByStudentName(String username);

    void registerStudent(Student student);
}
