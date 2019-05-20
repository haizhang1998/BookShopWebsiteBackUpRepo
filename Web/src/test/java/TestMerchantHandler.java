
import com.bookShop.controller.GoodsHandler;
import com.bookShop.controller.ManagerHandler;
import com.bookShop.controller.MerchantHandler;
import com.bookShop.service.FreezerecordService;
import com.bookShop.service.GoodService;
import com.bookShop.service.UserService;
import com.haizhang.entity.GoodsInfo;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.InternalResourceView;

import javax.annotation.Resource;
import javax.validation.Valid;

import java.io.IOException;
import java.util.Date;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

public class TestMerchantHandler extends BaseTest {
    @Resource
    GoodService goodServiceImpl;


    @Test
    public void downGoods() throws Exception {
        MerchantHandler merchantHandler=new MerchantHandler(goodServiceImpl);
        //设置视图，mock框架就不用解析控制器中的视图名了。
        MockMvc mockMvc=standaloneSetup(merchantHandler).build();
        String res=commonMockMethod("/merchant/downGoods?goodsId=111&possesserId=1");
        System.out.println(res);
    }


    @Test
    public void upGoods() throws Exception{
        MerchantHandler merchantHandler=new MerchantHandler(goodServiceImpl);
        mockMvc.perform(((post("/merchant/upGoods").
                param("goodsName", "haizhang")
                .param("detail", "asdwqqqijoiwqeiq")
                .param("possesserId", "1")).param("addr","备件发哦i就放松i啊")

                .param("price", "1")
                .param("type", "科学技术")
                .param("imgDir", "/images/科学技术/1.jpg")
                .param("remainNumber","1"))
        );

    }


}
