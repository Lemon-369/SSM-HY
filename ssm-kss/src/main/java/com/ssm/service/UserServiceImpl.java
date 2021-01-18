package com.ssm.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ssm.mapper.UserMapper;
import com.ssm.pojo.QueryCondition;
import com.ssm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class UserServiceImpl implements UserService {
    //注入mapper
    @Autowired
    private UserMapper userMapper;

    /**
     * 查询所有、模糊查询
     * @param page
     * @param condition
     * @return
     */
    public List<User> queryAll(Page<User> page, QueryCondition condition) {
        List<User> users = userMapper.queryAll(page,condition);
        return users;
    }

    /**
     * 添加
     * @param user
     */
    public int add(User user){
        int insert = userMapper.insert(user);
        return insert;
    }



}
