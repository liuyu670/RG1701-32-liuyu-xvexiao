package com.mecol.bookshop_ssm.web;

import com.mecol.bookshop_ssm.entity.Course;
import com.mecol.bookshop_ssm.entity.Teacher;
import com.mecol.bookshop_ssm.service.CourseService;
import com.mecol.bookshop_ssm.service.TeacherService;
import com.mecol.bookshop_ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.management.relation.RelationSupport;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController
{
    @Autowired
    private CourseService courseService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/courseList")
    public String  getAllCourseList()
    {
        return "/jsp/course/courseList";
    }
    @RequestMapping("/getCourseList")
    @ResponseBody
    public ResultUtil getCourseList(Integer page,Integer limit)
    {
        return courseService.getCourseList(page,limit);
    }

    @RequestMapping("/addCourse")
    public String addCourse(HttpServletRequest request)
    {
        List<Teacher> teacherList=teacherService.getAllTeachers();
        request.setAttribute("teacherList",teacherList);
        return "/jsp/course/addCourse";
    }


    @RequestMapping("/delCourseById/{id}")
    @ResponseBody
    public ResultUtil delCourseById(@PathVariable("id") int id)
    {
        try
        {
            courseService.delCourseById(id);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }
    @RequestMapping("/editCourse/{id}")
    public String editCourse(HttpServletRequest request,@PathVariable("id") int id)
    {
        Course course=courseService.getCourseById(id);
        List<Teacher> teacherList=teacherService.getAllTeachers();
        request.setAttribute("teacherList",teacherList);
        request.setAttribute("course",course);
        return "/jsp/course/editCourse";
    }

    @RequestMapping("/updCourse")
    @ResponseBody
    public ResultUtil updCourse(Course course)
    {
        try
        {
            courseService.updCourse(course);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

    @RequestMapping("/insCourse")
    @ResponseBody
    public ResultUtil insCourse(Course course)
    {
        try
        {
            courseService.insCourse(course);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }
}
