package com.hy.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hy.ssm.pojo.QueryCondition;
import com.hy.ssm.pojo.Student;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface StudentMapper extends BaseMapper<Student> {

    /**
     * 查询学生 并且显示班级表的classNo字段
     */
    public Page<Student> queryAll(Page<Student> studentPage);

    /**
     * 根据条件查询
     * @param condition
     * @return
     */
    public List<Student> queryBy(QueryCondition condition);

}
