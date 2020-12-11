package com.ssm.controller;

import com.ssm.pojo.Classes;
import com.ssm.service.ClassesServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "classes")
public class ClassesController {
    //注入service
    @Autowired
    private ClassesServiceImpl classesService;

    @RequestMapping(value = "queryAll")
    @ResponseBody
    public List<Classes> queryAll(){
        List<Classes> classes = classesService.queryAll();
        return classes;
    }
}
