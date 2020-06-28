package com.mecol.bookshop_ssm.dao;

import com.mecol.bookshop_ssm.entity.Teacher;
import com.mecol.bookshop_ssm.web.TeacherController;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherDao {
    List<Teacher> getTeacherList();

    void delTeacherById(int id);

    Teacher getTeacherById(int id);

    void updTeacher(Teacher teacher);

    void insTeacher(Teacher teacher);

    Teacher login(@Param("username")String username, @Param("password")String password);

    Teacher getTeacherByUsername(String username);
}
