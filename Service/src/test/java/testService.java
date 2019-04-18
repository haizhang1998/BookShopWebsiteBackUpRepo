import com.bookShop.service.UserService;
import com.haizhang.entity.UserInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;
import org.apache.log4j.*;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-aop.xml")
public class testService {
    private static final Logger logger=Logger.getLogger(testService.class);
    @Resource
    UserService userServiceImpl;
    @Test
    public void testRegistUserInfo()throws Exception{
        UserInfo u=userServiceImpl.loginUser("2368521029@qq.com","123456");
        System.out.println(u);

    }

}
