package com.hy.ssm.service;

import com.hy.ssm.mapper.ClassesMapper;
import com.hy.ssm.pojo.Classes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClasssesService {
    @Autowired
    private ClassesMapper classesMapper;

    public List<Classes> queryClasses(){
        List<Classes> classes = classesMapper.queryClasses();
        return classes;
    }
}
