import com.bookShop.mapper.SaledGoodsMapper;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.SaledInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 测试出售书籍相关方法
 */
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional()
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")
public class TestSaledGoodsService {

    @Resource
    SaledGoodsMapper saledGoodsMapper;

    @Test
    //获取所有出售货物的信息。  编号===出售货物具体信息
    public void getAllSaledInfo(){
        HashMap<Integer, SaledInfo> map=saledGoodsMapper.getAllSaledInfo();
        for(Map.Entry<Integer,SaledInfo>mapentry:map.entrySet()){
            System.out.println(mapentry);
        }
    }


    @Test
    //得到指定的出售货物
    public void getSaledNumberById(){

        SaledInfo saledInfo=saledGoodsMapper.getSaledNumberById(2);
        System.out.println(saledInfo);

    }

    @Test
    //得到热销销量前14的商品
    public void getHotGoods(){
        List<SaledInfo> saledInfos=saledGoodsMapper.getHotGoods();
        for(SaledInfo saledInfo:saledInfos)
            System.out.println(saledInfo);
    }



}
