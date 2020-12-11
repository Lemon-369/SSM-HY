import com.hy.ssm.mapper.ClassesMapper;
import com.hy.ssm.pojo.Classes;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class DemoTest {
    @Autowired
    private ClassesMapper mapper;

    @Test
    public void test1(){
        List<Classes> classes = mapper.selectList(null);
        for (Classes aClass : classes) {
            System.out.println(aClass);
        }
    }
}
