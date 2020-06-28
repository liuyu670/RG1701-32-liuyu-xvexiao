package com.mecol.bookshop_ssm.service;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mecol.bookshop_ssm.dao.*;
import com.mecol.bookshop_ssm.entity.*;
import com.mecol.bookshop_ssm.util.EncryptUtil;
import com.mecol.bookshop_ssm.util.ResultUtil;
import com.mecol.bookshop_ssm.web.TeacherController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
@Transactional
public class TeacherServiceImpl implements TeacherService
{

    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private RoleMenuDao roleMenuDao;
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private StudentDao studentDao;

    @Override
    public ResultUtil getTeacherList(Integer page, Integer limit) {

            PageHelper.startPage(page,limit);
            List<Teacher> teachers=teacherDao.getTeacherList();
            PageInfo<Teacher> teacherPageInfo=new PageInfo<>(teachers);
            ResultUtil resultUtil=new ResultUtil();
            resultUtil.setCode(0);
            resultUtil.setCount(teacherPageInfo.getTotal());

            resultUtil.setData(teacherPageInfo.getList());
            //虽然 我存在一对多关系 但不会无限循环查下去 看mapper中的解释
        //所以@ResponseBody就不会存在双向引用导致的死递归问题
            return resultUtil;
    }

    @Override
    public void delTeacherById(int id) {
        teacherDao.delTeacherById(id);
    }

    @Override
    public Teacher getTeacherById(int id) {
        return teacherDao.getTeacherById(id);
    }

    @Override
    public void updTeacher(Teacher teacher) {
        teacherDao.updTeacher(teacher);
    }

    @Override
    public void insTeacher(Teacher teacher) {
        teacher.setPassword(EncryptUtil.encrypt("123456"));//管理员添加教师默认密码是123456
        teacherDao.insTeacher(teacher);
    }

    @Override
    public Teacher login(String username, String password) {
        return teacherDao.login(username,password);
    }


    @Override
    public List<Menu> getMenus(Teacher teacher1)
    {
        List<Menu> menuList=new ArrayList<>();
        Long roleId=teacher1.getRoleId();
        List<RoleMenu> roleMenus=roleMenuDao.selMenusByRoleId(roleId);
        //rolemenu里面就是一个中间表 两个字段 roleId menuId 关联起来
        if(roleMenus!=null&&roleMenus.size()>0)
        {
            List<Menu> noChildrenMenus=new ArrayList<>();
            for(int i=0;i<roleMenus.size();i++)
            {
                Menu menu=menuDao.getMenuById(roleMenus.get(i).getMenuId()); //获取rolemenu中的menuId
                noChildrenMenus.add(menu); //就是根据这个登陆者的roleid 所拥有的菜单取出来
            }
            for(int i=0;i<noChildrenMenus.size();i++)
            {
                if(noChildrenMenus.get(i).getParentId()==0)
                //说明这个菜单是一级菜单 没有上一级菜单
                //如果这里不为0 表示这个菜单是二级菜单 或者三级菜单 ParentId对应了属于哪个上级菜单
                {
                    Menu menu=new Menu();
                    menu=noChildrenMenus.get(i); //把这个一级菜单取出来
                    List<Menu> menus=new ArrayList<>();
                    for(int j=0;j<noChildrenMenus.size();j++) //把所有菜单过一遍
                    {
                        //如果有菜单属于这个一级菜单
                        if(noChildrenMenus.get(j).getParentId()==noChildrenMenus.get(i).getMenuId())
                        {
                            Menu menu2=new Menu();
                            menu2=noChildrenMenus.get(j);//取出这个二级菜单
                            menus.add(menu2);
                        }
                    }
                    menu.setChildren(menus); //存放了属于这个一级菜单的所有二级菜单
                    menuList.add(menu);//存放了所有的一级菜单和其对应的所有二级菜单
                }
            }

        }
        //下面是根据menu的sorting进行排序 升序排列 这样左侧菜单就会按照升序排列
        Collections.sort(menuList, new Comparator<Menu>() {
            @Override
            public int compare(Menu o1, Menu o2) {

                return o1.getSorting().compareTo(o2.getSorting());
            }
        });

        return menuList;
    }

    @Override
    public List<Teacher> getAllTeachers() {
        return teacherDao.getTeacherList();
    }

    @Override
    public ResultUtil getCourseList(Integer page, Integer limit,Integer teacherId)
    {
        PageHelper.startPage(page,limit);
        List<Course> courses=courseDao.selectCourseByTId(teacherId);
        PageInfo<Course> coursePageInfo=new PageInfo<>(courses);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(coursePageInfo.getTotal());
        resultUtil.setData(coursePageInfo.getList());

        return resultUtil;
    }

    @Override
    public ResultUtil getStudentCourses(Integer page, Integer limit, Integer teacherId)
    {

        PageHelper.startPage(page,limit);
        List<Course> courses=courseDao.getStudentCourseByTeacherId(teacherId);
        PageInfo<Course> pageInfo=new PageInfo<>(courses);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public Teacher getTeacherByUsername(String username) {
        return teacherDao.getTeacherByUsername(username);
    }

    @Override
    public void registerTeacher(Teacher teacher) {
        teacher.setPassword(EncryptUtil.encrypt(teacher.getPassword()));//管理员添加教师默认密码是123456
        teacherDao.insTeacher(teacher);
    }


}
