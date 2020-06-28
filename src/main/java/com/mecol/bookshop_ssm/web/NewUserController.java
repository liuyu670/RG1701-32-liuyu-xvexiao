package com.mecol.bookshop_ssm.web;

import com.mecol.bookshop_ssm.entity.Student;
import com.mecol.bookshop_ssm.entity.Teacher;
import com.mecol.bookshop_ssm.service.StudentService;
import com.mecol.bookshop_ssm.service.TeacherService;
import com.mecol.bookshop_ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/newUser")
public class NewUserController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/student")
    @ResponseBody
    public ResultUtil student(Student student)
    {
        student.setRoleId((long) 12);//学生
        try {
            studentService.registerStudent(student);
            return  ResultUtil.ok();

        }
        catch (Exception e)
        {
            e.printStackTrace();
            return new ResultUtil(500,"数据库sql等错误，请检查输出");
        }
    }
    @RequestMapping("/teacher")
    @ResponseBody
    public ResultUtil teacher(Teacher teacher)
    {
        teacher.setRoleId((long) 13);//教师
        try
        {
            teacherService.registerTeacher(teacher);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

}
