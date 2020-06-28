package com.mecol.bookshop_ssm.service;

import com.mecol.bookshop_ssm.entity.Menu;
import com.mecol.bookshop_ssm.entity.Teacher;
import com.mecol.bookshop_ssm.util.ResultUtil;
import com.mecol.bookshop_ssm.web.TeacherController;

import java.util.List;

public interface TeacherService {
    ResultUtil getTeacherList(Integer page, Integer limit);

    void delTeacherById(int id);

    Teacher getTeacherById(int id);

    void updTeacher(Teacher teacher);

    void insTeacher(Teacher teacher);

    Teacher login(String username, String password);


    List<Menu> getMenus(Teacher teacher1);


    List<Teacher> getAllTeachers();

    ResultUtil getCourseList(Integer page, Integer limit,Integer teacherId);

    ResultUtil getStudentCourses(Integer page, Integer limit, Integer teacherId);

    Teacher getTeacherByUsername(String username);

    void registerTeacher(Teacher teacher);
}
