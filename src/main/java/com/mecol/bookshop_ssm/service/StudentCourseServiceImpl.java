package com.mecol.bookshop_ssm.service;

import com.mecol.bookshop_ssm.dao.StudentCourseDao;
import com.mecol.bookshop_ssm.entity.StudentCourse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentCourseServiceImpl implements StudentCourseService
{
    @Autowired
    private StudentCourseDao studentCourseDao;


    @Override
    public StudentCourse selectCourseBySid(Integer studentId,Integer id) {
        return studentCourseDao.selectCourseBySid(studentId,id);
    }

    @Override
    public void insStudentCourse(Integer studentId, Integer id) {
        studentCourseDao.insStudentCourse(studentId,id);
    }

    @Override
    public void delBySCid(Integer studentId, Integer id) {
        studentCourseDao.delBySCid(studentId,id);
    }

    @Override
    public List<StudentCourse> selCourseBySid(Integer studentId) {
        return studentCourseDao.selCourseBySid(studentId);
    }
}
