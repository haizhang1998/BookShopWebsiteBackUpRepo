import com.bookShop.service.EnshrineService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@Transactional()
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")

public class TestEnshrineService {

    @Resource
    EnshrineService enshrineService;
    @Test
    //修改收藏商品的Valid状态 （下架货物时直接为1，不许传参数，状态不可逆）
    public void updateValidStatus(){
           enshrineService.updateValidStatus(7);
    }

    /**
     *修改商品的降价状态
     * @return
     */
    @Test
    public void  updatePriceFlagStatus(){
        System.out.println(enshrineService.updatePriceFlagStatus(1,-1,7));
    }


}
