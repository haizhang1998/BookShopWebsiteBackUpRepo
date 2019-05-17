import com.bookShop.service.FreezerecordService;
import com.bookShop.service.impl.FreezerecordServiceImpl;
import com.haizhang.entity.Freezerecord;
import com.haizhang.entity.UserInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * 测试时间：2019/5/6
 * 测试人员: 罗海章
 */

@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")
public class TestFreezerecordService {
    @Resource
    FreezerecordServiceImpl freezerecordService;

    //获取所有冻结的列表数
    @Test
    public void queryFreezeCount(){
        System.out.println(freezerecordService.queryFreezeCount());
    }
//    获取指定的冻结记录
    @Test
    public void queryIndentifyFreezeRecord(){
        Freezerecord freezerecord=new Freezerecord();
        UserInfo userInfo=new UserInfo();
        userInfo.setId(19);
        List<Freezerecord> freezerecords=freezerecordService.queryIndentifyFreezeRecord(freezerecord);
         for(Freezerecord f:freezerecords){
             System.out.println(f);
         }
    }
//    //获取冻结记录 分页 limit表示一页多少个
//    public List<Freezerecord> queryRecordByPage(int limit,int offset);
//    //插入一条冻结记录
    @Test
    public void  insertFreezeRecord(){
        Freezerecord freezerecord=new Freezerecord();
        freezerecord.setDate(new Date());
        freezerecord.setEndDate(new Date(2019,5,8));
        UserInfo userInfo=new UserInfo();
        userInfo.setId(19);
        freezerecord.setUserInfo(userInfo);
        freezerecord.setReason("reason 1");
        freezerecordService.insertFreezeRecord(freezerecord);
    }
//    //删除一条或多条冻结记录
    @Test
    public void deleteFreezeRecord(){
        List<Integer> ids=new ArrayList<>();
        ids.add(19);
        System.out.println(freezerecordService.deleteFreezeRecord(ids));
    }

    @Test
    public void queryByPage(){
        List<Freezerecord> freezerecords=freezerecordService.queryRecordByPage(7,0);
        for(Freezerecord freezerecord:freezerecords){
            System.out.println(freezerecord);
        }
    }
}
