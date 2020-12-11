package com.hy.ssm.controller;

import com.hy.ssm.pojo.QueryCondition;
import com.hy.ssm.pojo.Student;
import com.hy.ssm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentService service;

    /**
     * 查询所有
     * @param model
     * @return
     */
    @RequestMapping(value = "queryAll")
    public String queryAll(Model model){
        List<Student> students = service.queryStuCla();
        model.addAttribute("stuList",students);
        return "student";
    }

    /**
     * 根据条件查询
     * @param model
     * @param condition
     * @return
     */
    @RequestMapping(value = "queryBy")
    public String queryBy(Model model, QueryCondition condition){
        List<Student> students = service.queryBy(condition);
        model.addAttribute("stuList",students);
        return "student";
    }

    @RequestMapping("insert")
    public void insert(Student student){
        service.insert(student);
    }

}
