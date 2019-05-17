import com.bookShop.service.FeedBackService;
import com.haizhang.entity.Feedback;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 测试时间：2019/5/6
 * 测试人员: 罗海章
 */

@RunWith(SpringJUnit4ClassRunner.class)

@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")
public class TestFeedBackService {

    @Resource
    FeedBackService feedBackService;
    //获取开店请求的反馈信息
    @Test
    public void queryShopFeedBackInfo(){
       Feedback feedback=feedBackService.queryShopFeedBackInfo(123);
        System.out.println(feedback);
    }

    //删除反馈记录
    @Test
    public void deleteFeedBack(){
        Feedback feedback = new Feedback();
        feedback.setUserId(5);
        System.out.println(feedBackService.deleteFeedBack(feedback));
    }

    //插入feedBack记录
    @Test
    public void insertFeedBack(){
        Feedback feedback =  new Feedback();
        feedback.setUserId(18);
        feedback.setCheckDate(new Date());
        feedback.setId(1);
        feedback.setRequestId(123124);
        feedback.setReason("ads");
        feedback.setState(1);
        System.out.println(feedBackService.insertFeedBack(feedback));
     }

}
