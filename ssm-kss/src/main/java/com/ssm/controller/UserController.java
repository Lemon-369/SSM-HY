package com.ssm.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ssm.pojo.LayUiData;
import com.ssm.pojo.QueryCondition;
import com.ssm.pojo.User;
import com.ssm.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@CrossOrigin
@Controller
@RequestMapping(value = "user")
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    @ResponseBody
    @RequestMapping(value = "/queryAll")
    public LayUiData queryAll(Integer page, Integer limit,QueryCondition queryCondition){
        Page<User> page1 = new Page(page, limit);
        if(queryCondition==null){
            queryCondition = new QueryCondition();
        }
        List<User> users = userService.queryAll(page1,queryCondition);
        page1.setRecords(users);
        LayUiData layUiData = new LayUiData();
        layUiData.setCount((int) page1.getTotal());//总条数
        layUiData.setData(users);
        return layUiData;
    }

    @ResponseBody
    @RequestMapping("/add")
    public void add(User user) {
        int add = userService.add(user);
    }



}
