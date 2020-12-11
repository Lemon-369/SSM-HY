package com.hy.ssm.mapper;

import com.hy.ssm.pojo.Classes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClassesMapper {
    /**
     * 查询所有班级
     * @return
     */
    public List<Classes> queryClasses();
}
