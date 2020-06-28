package com.mecol.bookshop_ssm.web;

import com.mecol.bookshop_ssm.entity.*;
import com.mecol.bookshop_ssm.service.StudentCourseService;
import com.mecol.bookshop_ssm.service.StudentService;
import com.mecol.bookshop_ssm.util.EncryptUtil;
import com.mecol.bookshop_ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController
{
    @Autowired
    private StudentService studentService;
    @Autowired
    private StudentCourseService studentCourseService;

    @RequestMapping("/login")
    @ResponseBody
    public ResultUtil login(String username, String password, HttpServletRequest request, HttpSession session)
    {
        Student student=studentService.login(username, EncryptUtil.encrypt(password));
        if(student!=null)
        {
            Admin admin=new Admin();
            session.setAttribute("user",admin); //在拦截器中使用 主要是骗过拦截器 假装已经登录了
            session.setAttribute("student",student); //main.jsp中取出
            session.setAttribute("usertype","2");//代表是学生登录
            session.setAttribute("studentId",student.getId()); // choose请求处理函数中用到
            student.setRoleId((long) 12); //系统设定了 学生的roleId是12 这里直接关联起来
            studentService.updateStudent(student);
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
        Student student= (Student) session.getAttribute("student");
        Student student1=studentService.getStudentById(student.getId());
        if(student1!=null)
        {
            menus=studentService.getMenus(student1);
        }
        return menus;
    }
    @RequestMapping("/logOut")
    public ModelAndView logOut(ModelAndView modelAndView,HttpSession session)
    {
        session.invalidate();
        modelAndView.setViewName("redirect:/index.jsp");
        return modelAndView;
    }




    @RequestMapping("/studentCourses")
    public String studentCourses()
    {
        return "/jsp/student/studentCourses";
    }
    @RequestMapping("/getStudentCourses")
    @ResponseBody
    public ResultUtil getStudentCourses(Integer page, Integer limit)
    {
        return studentService.getStudentCourse(page,limit);
    }



    @RequestMapping("/studentList")
    public String studentList()
    {
        return "/jsp/student/studentList";
    }
    @RequestMapping("/getAllStudentList")
    @ResponseBody
    public ResultUtil getAllStudentList(Integer page, Integer limit, StudentSearch search)
    {
        //这是带分页的查询
        return studentService.getAllStudentList(page,limit,search);
    }

    @RequestMapping("/deleteCourse")
    @ResponseBody
    public ResultUtil deleteCourse(Integer id,HttpSession session)
    {
        Integer studentId= (Integer) session.getAttribute("studentId");
        try
        {
            StudentCourse studentCourse=studentCourseService.selectCourseBySid(studentId,id);
            if(studentCourse==null)
            {
                return ResultUtil.error("未选择此课程，无法删除");
            }
            studentCourseService.delBySCid(studentId,id);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error("删除失败，请重试");
        }
    }


    @RequestMapping("/choose")
    @ResponseBody
    public ResultUtil choose(Integer id,HttpSession session)
    {
        //System.out.println("课程id"+id+",,,"+"学生id"+session.getAttribute("studentId"));
        Integer studentId= (Integer) session.getAttribute("studentId");

        StudentCourse studentCourse=studentCourseService.selectCourseBySid(studentId,id);
        if(studentCourse!=null)
        {
            return ResultUtil.error();
        }
        else
        {
            studentCourseService.insStudentCourse(studentId,id);
            return ResultUtil.ok();
        }

    }

    @RequestMapping("/courseList")
    public String courseList()
    {
        return "/jsp/student/courseList";
    }

    @RequestMapping("/deleteStudentById")
    @ResponseBody
    public ResultUtil deleteStudentById(int id)
    {
        return studentService.deleteStudentById(id);
    }
    @RequestMapping("/editStudent/{id}")
    public String editStudent(@PathVariable("id")int id, HttpSession session)
    {
        Student student=studentService.getStudentById(id);
        session.setAttribute("student",student);
        return "/jsp/student/editStudent";
    }

    @RequestMapping("/updateStudent")
    @ResponseBody
    public ResultUtil updateStudent(Student student)throws ParseException
    {
        //System.out.println("曹操。。。。。。");

       return studentService.updateStudent(student);
    }

    @RequestMapping("/updateStudentStatusById")
    @ResponseBody
    public ResultUtil updateStudentStatusById(int id,int status)
    {

        return studentService.updateStudentStatusById(id,status);
    }
    @RequestMapping("/addStudent")
    public String addStudent()
    {
        return "/jsp/student/addStudent";
    }
    @RequestMapping("/checkStudentByStudentname/{username}")
    @ResponseBody
    public ResultUtil checkStudentByStudentname(@PathVariable("username")String username)
    {
        Student student=studentService.selStudentByStudentname(username);
        if(student!=null)
        {
            return new ResultUtil(500,"学生姓名已经存在，请做标记");
        }
        return new ResultUtil(0);
    }

    @RequestMapping("/insertStudent")
    @ResponseBody
    public ResultUtil insStudent(Student student)
    {
       // System.out.println("曹操。。。。。。。。。。。。。");
        student.setRoleId((long) 12);
        try {
            studentService.insertStudent(student);
            return  ResultUtil.ok();

        }
        catch (Exception e)
        {
            e.printStackTrace();
            return new ResultUtil(500,"数据库sql等错误，请检查输出");
        }

    }

    @RequestMapping("/chooseCourse")
    public String chooseCourse()
    {
        return "/jsp/student/chooseCourse";
    }

    @RequestMapping("/getCourse")
    @ResponseBody
    public ResultUtil getCourse(Integer page,Integer limit)
    {
        return  studentService.getCourse(page,limit);
    }

    @RequestMapping("/getCourseList")
    @ResponseBody
    public ResultUtil getCourseList(Integer page,Integer limit,HttpSession session)
    {
        Integer studentId= (Integer) session.getAttribute("studentId");
        List<StudentCourse> studentCourses=studentCourseService.selCourseBySid(studentId);
        if(studentCourses!=null)
        {
            List<Integer> ids=new ArrayList<>();
            for(int i=0;i<studentCourses.size();i++)
            {
                ids.add(studentCourses.get(i).getC_id());
            }
            //上面先把studentID对应的courseId查出来 然后再连表查询
            return studentService.getCourseList(page,limit,ids);
        }
        else
        {
            return ResultUtil.ok("没有选择的课程");
        }

    }
    @RequestMapping("/info")
    public String info(HttpSession session)
    {
        //覆盖一下之前的student 不然显示的还是之前的student
        Integer studentId= (Integer) session.getAttribute("studentId");
        Student student=studentService.getStudentById(studentId);
        session.setAttribute("student",student);
        return "/jsp/student/editStudent";
    }

    @RequestMapping("/changePassword")
    public  String changePassword()
    {
        return "/jsp/student/changePassword";
    }
    @RequestMapping("/changeStudentPassword")
    @ResponseBody
    public ResultUtil changeStudentPassword(String oldPassword,String newPassword1,String username)
    {
        Student student=studentService.getStudentByStudentName(username);
        if(student!=null)
        {
            if(student.getPassword().equals(EncryptUtil.encrypt(oldPassword)))
            {
                student.setPassword(EncryptUtil.encrypt(newPassword1));
                studentService.updateStudent(student);
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








