package com.hy.ssm.mapper;

import com.hy.ssm.pojo.QueryCondition;
import com.hy.ssm.pojo.Student;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface StudentMapper{

    /**
     * 查询学生 并且显示班级表的classNo字段
     */
    public List<Student> queryAll();

    /**
     * 根据条件查询
     * @param condition
     * @return
     */
    public List<Student> queryBy(QueryCondition condition);

    /**
     * 添加学生信息
     * @param student
     */
//    @SelectKey(statement = "select uuid()",before = true,keyColumn = "id",keyProperty = "id",resultType = String.class)
//    @Insert("insert into student values(#{id},#{name},#{gender},#{classNo})")
    public void insert(Student student);

    /**
     * 批量删除
     * @param ids
     */
//    @Delete({"<script>",
//            "delete from student where id in (",
//            "<foreach collection='array' separator = ',' close = ')' item='id'>",
//            "#{id}",
//            "</foreach>",
//            "</script>"
//    })
    public void delete(String[] ids);

    /**
     * 修改
     * @param student
     */
//    @Update("update student set name=#{name},gender=#{gender},classNo=#{classNo} where id=#{id}")
    public void update(Student student);

}
