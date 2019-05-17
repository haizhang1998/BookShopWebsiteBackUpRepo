import com.bookShop.controller.ManagerHandler;
import com.bookShop.service.FreezerecordService;
import com.bookShop.service.UserService;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.view.InternalResourceView;

import javax.annotation.Resource;

import java.util.Date;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

public class ManagerHandlerTest extends BaseTest {
    @Resource
    UserService userServiceImpl;
    @Resource
    FreezerecordService freezerecordServiceImpl;

    //测试冻结
    @Test
    public void testFreezeUser() throws Exception {
        ManagerHandler managerHandler=new ManagerHandler(userServiceImpl,freezerecordServiceImpl);
        //设置视图，mock框架就不用解析控制器中的视图名了。
        MockMvc mockMvc=standaloneSetup(managerHandler).setSingleView(new InternalResourceView("/jsp/managerPage.jsp")).build();
        //1.view的name=spittles    2.model存在属性名为spittleList
        mockMvc.perform(post("/sys/freezeUser")
                .param("id","23")
                .param("userInfo.id","23")
                .param("endDate","2019-5-9")
                .param("reason","no reason")
        ).andReturn().getResponse();
    }

}
