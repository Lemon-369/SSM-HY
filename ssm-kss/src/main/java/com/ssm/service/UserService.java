package com.ssm.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ssm.pojo.QueryCondition;
import com.ssm.pojo.User;

import java.util.List;


public interface UserService {
    /**
     * 分页
     * @param page
     * @return
     */
    public List<User> queryAll(Page<User> page,QueryCondition condition);

    /**
     * 添加
     * @param user
     */
    public int add(User user);
}
