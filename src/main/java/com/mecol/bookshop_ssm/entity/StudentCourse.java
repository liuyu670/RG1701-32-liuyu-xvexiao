package com.mecol.bookshop_ssm.entity;

public class StudentCourse
{
    private Integer s_id;
    private Integer c_id;

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    @Override
    public String toString() {
        return "StudentCourse{" +
                "s_id=" + s_id +
                ", c_id=" + c_id +
                '}';
    }
}
