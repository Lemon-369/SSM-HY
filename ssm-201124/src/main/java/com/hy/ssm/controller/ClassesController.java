package com.hy.ssm.controller;

import com.hy.ssm.pojo.Classes;
import com.hy.ssm.service.ClasssesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClassesController {
    @Autowired
    private ClasssesService service;

    @ResponseBody
    @RequestMapping("queryClasses")
    public List<Classes> queryClasses(Model model){
        return service.queryClasses();
    }
}
