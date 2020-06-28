package com.mecol.bookshop_ssm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mecol.bookshop_ssm.dao.CourseDao;
import com.mecol.bookshop_ssm.entity.Course;
import com.mecol.bookshop_ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CourseServiceImpl implements CourseService
{
    @Autowired
    private CourseDao courseDao;


    @Override
    public ResultUtil getCourseList(Integer page, Integer limit) {
        PageHelper.startPage(page,limit);
        List<Course> courses=courseDao.getCourseList(page,limit);
        PageInfo<Course> coursePageInfo=new PageInfo<>(courses);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(coursePageInfo.getTotal());
        resultUtil.setData(coursePageInfo.getList());

        return resultUtil;
    }

    @Override
    public void delCourseById(int id) {
        courseDao.delCourseById(id);
    }

    @Override
    public Course getCourseById(int id) {

        return courseDao.getCourseById(id);
    }

    @Override
    public void updCourse(Course course) {
        courseDao.updCourse(course);
    }

    @Override
    public void insCourse(Course course) {
        courseDao.insCourse(course);
    }
}
