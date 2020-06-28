package com.mecol.bookshop_ssm.web;

import com.mecol.bookshop_ssm.entity.Admin;
import com.mecol.bookshop_ssm.entity.Course;
import com.mecol.bookshop_ssm.entity.Menu;
import com.mecol.bookshop_ssm.entity.Teacher;
import com.mecol.bookshop_ssm.service.CourseService;
import com.mecol.bookshop_ssm.service.TeacherService;
import com.mecol.bookshop_ssm.util.EncryptUtil;
import com.mecol.bookshop_ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController
{
    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CourseService courseService;

    @RequestMapping("/login")
    @ResponseBody
    public ResultUtil login(String username, String password, HttpServletRequest request, HttpSession session)
    {
        Teacher teacher=teacherService.login(username, EncryptUtil.encrypt(password));
        if(teacher!=null)
        {
            Admin admin=new Admin();
            session.setAttribute("user",admin); //在拦截器中使用 主要是骗过拦截器 假装已经登录了
            session.setAttribute("teacher",teacher); //main.jsp中取出
            session.setAttribute("usertype","3");//代表是学生登录
            session.setAttribute("teacherId",teacher.getId());
            teacher.setRoleId((long) 13); //系统设定了 教师的roleId是13 这里直接关联起来
            teacherService.updTeacher(teacher);
            return ResultUtil.ok();
        }
        else {
            return ResultUtil.error();
        }
    }

    @RequestMapping("/getMenus")
    @ResponseBody
    public List<Menu> getMenus(HttpSession session)
    {
        //System.out.println("学生获取菜单进来了");
        List<Menu> menus=null;
        Teacher teacher= (Teacher) session.getAttribute("teacher");
        Teacher teacher1=teacherService.getTeacherById(teacher.getId());
        if(teacher1!=null)
        {
            menus=teacherService.getMenus(teacher1);
        }
        return menus;
    }



    @RequestMapping("/logOut")
    public ModelAndView logOut(ModelAndView modelAndView, HttpSession session)
    {
        session.invalidate();
        modelAndView.setViewName("redirect:/index.jsp");
        return modelAndView;
    }





    @RequestMapping("/teacherList")
    public String teacherList()
    {
        return "/jsp/teacher/teacherList";
    }
    @RequestMapping("/getTeacherList")
    @ResponseBody
    public ResultUtil getTeacherList(Integer page,Integer limit)
    {

        return teacherService.getTeacherList(page,limit);
    }


    @RequestMapping("/delTeacherById/{id}")
    @ResponseBody
    public ResultUtil delTeacherById(@PathVariable("id")int id)
    {
        try
        {
            teacherService.delTeacherById(id);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }
    @RequestMapping("/editTeacher/{id}")
    public String editTeacher(HttpServletRequest request,@PathVariable("id")int id)
    {
        Teacher teacher=teacherService.getTeacherById(id);
        request.setAttribute("teacher",teacher);
        return "/jsp/teacher/editTeacher";

    }
    @RequestMapping("/updTeacher")
    @ResponseBody
    public ResultUtil updTeacher(Teacher teacher)
    {
        try
        {
            teacherService.updTeacher(teacher);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }
    @RequestMapping("/addTeacher")
    public String addTeacher()
    {
        return "/jsp/teacher/addTeacher";
    }
    @RequestMapping("/insTeacher")
    @ResponseBody
    public ResultUtil insTeacher(Teacher teacher)
    {
        teacher.setRoleId((long) 13);
        try
        {
            teacherService.insTeacher(teacher);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }
    @RequestMapping("/modifyCourse")
    public String modifyCourse()
    {
        return "/jsp/teacher/tcourseList";
    }

    @RequestMapping("/getCourseList")
    @ResponseBody
    public ResultUtil getCourseList(Integer page,Integer limit,HttpSession session)
    {
        Integer teacherId= (Integer) session.getAttribute("teacherId");
        return teacherService.getCourseList(page,limit,teacherId);
    }

    @RequestMapping("/addTCourse")
    public String addTCourse()
    {
        return "/jsp/teacher/addTCourse";
    }
    @RequestMapping("/insCourse")
    @ResponseBody
    public ResultUtil insCourse(Course course,HttpSession session)
    {
        Integer teacherId= (Integer) session.getAttribute("teacherId");
        course.setTeacherId(teacherId);
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



    @RequestMapping("/editCourse/{id}")
    public String editCourse(HttpServletRequest request,@PathVariable("id") int id)
    {
        Course course=courseService.getCourseById(id);
        request.setAttribute("course",course);
        return "/jsp/teacher/editTCourse";
    }

    @RequestMapping("/updCourse")
    @ResponseBody
    public ResultUtil updCourse(HttpSession session,Course course)
    {
        Integer teacherId= (Integer) session.getAttribute("teacherId");
        course.setTeacherId(teacherId);
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
    @RequestMapping("/courseList")
    public String courseList()
    {
        return "/jsp/teacher/tCourseStudentList";
    }
    @RequestMapping("/getStudentCourses")
    @ResponseBody
    public ResultUtil getStudentCourses(Integer page,Integer limit,HttpSession session)
    {

        Integer teacherId= (Integer) session.getAttribute("teacherId");
        return teacherService.getStudentCourses(page,limit,teacherId);
    }

    @RequestMapping("/info")
    public String info(HttpSession session)
    {
        //覆盖一下之前的student 不然显示的还是之前的student
        Integer teacherId= (Integer) session.getAttribute("teacherId");
        Teacher teacher=teacherService.getTeacherById(teacherId);
        session.setAttribute("teacher",teacher);
        return "/jsp/teacher/editTeacher";
    }

    @RequestMapping("/changePassword")
    public  String changePassword()
    {
        return "/jsp/teacher/changePassword";
    }
    @RequestMapping("/changeTeacherPassword")
    @ResponseBody
    public ResultUtil changeStudentPassword(String oldPassword,String newPassword1,String username)
    {
        Teacher teacher=teacherService.getTeacherByUsername(username);
        if(teacher!=null)
        {
            if(teacher.getPassword().equals(EncryptUtil.encrypt(oldPassword)))
            {
                teacher.setPassword(EncryptUtil.encrypt(newPassword1));
                teacherService.updTeacher(teacher);
                return ResultUtil.ok();
            }
            else
            {
                return ResultUtil.error("旧密码错误，请重新填写");
            }
        }
        return ResultUtil.error("请求出错！！");

    }




}
