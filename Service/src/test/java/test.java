import com.bookShop.mapper.UserMapper;
import com.haizhang.entity.UserInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-aop.xml")
public class test {
    @Resource
    UserMapper userMapper;


    @Test
    public void tests(){
         List<UserInfo>userInfos= userMapper.queryAllUserInfo();
         for(UserInfo u:userInfos){
             System.out.println(u);
         }
    }

    @Test
    public void test2(){
         UserInfo user=userMapper.loginUser("0002","12356");
         System.out.println(user);
    }


}
