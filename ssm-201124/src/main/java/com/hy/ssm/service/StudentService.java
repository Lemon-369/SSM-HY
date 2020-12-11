package com.hy.ssm.service;

import com.hy.ssm.mapper.StudentMapper;
import com.hy.ssm.pojo.QueryCondition;
import com.hy.ssm.pojo.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StudentService {
    @Autowired
    private StudentMapper studentMapper;

    /**
     * 查询所有
     * @return
     */
    public List<Student> queryStuCla(){
         List<Student> students = studentMapper.queryAll();
         return students;
    }

    /**
     * 根据条件查询
     * @param condition
     * @return
     */
    public List<Student> queryBy(QueryCondition condition){
        List<Student> students = studentMapper.queryBy(condition);
        return students;
    }

    public void insert(Student student){
        studentMapper.insert(student);
    }


}
