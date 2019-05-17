import com.bookShop.mapper.RequestShopRecordMapper;
import com.bookShop.service.RequestShopRecordService;
import com.haizhang.entity.RequestRecordShop;
import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 测试时间：2019/5/6
 * 测试人员: 罗海章
 */

@RunWith(SpringJUnit4ClassRunner.class)
//@Transactional()
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")
public class TestRequestShopRecordService {
    @Resource
    RequestShopRecordService requestShopRecordService;

    //获取所有的开店请求
    @Test
    public void queryAllRequestshoprecord(){
         List<RequestRecordShop> requestRecordShops= requestShopRecordService.queryAllRequestshoprecord();
         for(RequestRecordShop requestRecordShop:requestRecordShops){
             System.out.println(requestRecordShop);
         }

    }

    //获取指定的开店请求by id
    @Test
    public void queryRequsetshoprecordById(){
       RequestRecordShop requestRecordShop=requestShopRecordService.queryRequsetshoprecordById(1);
        System.out.println(requestRecordShop);
    }
    //删除开店请求
    @Test
    public void deleteRequsetshoprecord(){
        List<Integer> ids=new ArrayList<>();
        ids.add(123);
        ids.add(123123);
        System.out.println(requestShopRecordService.deleteRequsetshoprecord(ids));

    }

    //插入开店请求
    @Test
    public void insertRequsetshoprecord(){
       RequestRecordShop requestRecordShop=new RequestRecordShop();
       requestRecordShop.setDetail("开店卖肉");
       requestRecordShop.setShopName("kk书店");
       requestRecordShop.setShopLogo("/images/imag1.jpg");
       requestRecordShop.setUserId(5);
       requestShopRecordService.insertRequsetshoprecord(requestRecordShop);
    }

    //获取用户开店记录
    @Test
    public void queryUserRecord(){
        RequestRecordShop requestRecordShop=requestShopRecordService.queryUserRecord(5);
        System.out.println(requestRecordShop);
    }


}
