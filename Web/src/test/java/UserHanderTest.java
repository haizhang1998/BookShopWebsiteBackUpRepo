import com.bookShop.controller.UserHandler;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;


public class UserHanderTest extends BaseTest{
        @Test
        public  void testUserHandler ()throws  Exception{
            String res=commonMockMethod("/user/login?username=268521029@qq.com&password=123456");
            System.out.println(res);

        }
        @Test
        public void regist()throws Exception{
            String res=commonMockMethod("/user/regist");
            System.out.println(res);
        }

    }

