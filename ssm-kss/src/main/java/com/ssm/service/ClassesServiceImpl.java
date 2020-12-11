package com.ssm.service;

import com.ssm.mapper.ClassesMapper;
import com.ssm.pojo.Classes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ClassesServiceImpl implements ClassesService {
    @Autowired
    private ClassesMapper classesMapper;

    public List<Classes> queryAll(){
        return classesMapper.selectList(null);
    }

}
