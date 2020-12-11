import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ssm.mapper.UserMapper;
import com.ssm.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用CRUD测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class MythodTest {
    @Autowired
    private UserMapper userMapper;

    /**
     * 添加一条数据
     */
    @Test
    public void testInsert(){
        User user = new User();
        user.setName("zh");
        user.setAge(18);
        user.setEmail("973780979@qq.com");
        userMapper.insert(user);
    }

    /**
     * 根据条件删除
     */
    @Test
    public void delete(){
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<User>();
        userQueryWrapper.eq("age",18);
        userQueryWrapper.like("name","z");
        userMapper.delete(userQueryWrapper);
    }

    /**
     * 根据id删除
     */
    @Test
    public void deleteById(){
        userMapper.deleteById(7);
    }

    /**
     * 根据 Map 中的条件删除，为空则删除所有
     */
    @Test
    public void deleteByMap(){
        Map<String, Object> columnMap = new HashMap<String, Object>();
        columnMap.put("name", "narudo");
        columnMap.put("age", 20);
        userMapper.deleteByMap(columnMap);
    }

    /**
     * 根据id更新数据
     */
    @Test
    public void updateById(){
        User user = new User();
        user.setId(9);
        user.setAge(19);
        userMapper.updateById(user);
    }

    /**
     * 根据其他条件更新
     */
    @Test
    public void update(){
        User user = new User();
        user.setName("majiko");
        //根据以下条件跟新数据
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<User>();
        userQueryWrapper.eq("name","sasuke");
        userQueryWrapper.eq("age",18);
        /*
            user:需要修改数据，封装成实体类
            userQueryWrapper:更新数据所对应的条件
         */
        userMapper.update(user,userQueryWrapper);
    }


}
