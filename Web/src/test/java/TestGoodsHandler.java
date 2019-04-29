import com.bookShop.controller.GoodsHandler;
import com.bookShop.service.GoodService;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.view.InternalResourceView;

import javax.annotation.Resource;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

public class TestGoodsHandler extends BaseTest{
   @Resource
   GoodService goodServiceImpl;

   //获取
   @Test
   public void getHomePage()throws Exception{
      GoodsHandler goodsHandler=new GoodsHandler(goodServiceImpl);
      //设置视图，mock框架就不用解析控制器中的视图名了。
      MockMvc mockMvc=standaloneSetup(goodsHandler).setSingleView(new InternalResourceView("/jsp/homePage.jsp")).build();
      String res=commonMockMethod("/goods/homepage");
      System.out.println(res);
   }




}
