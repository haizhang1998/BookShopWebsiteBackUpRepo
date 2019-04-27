import com.bookShop.mapper.GoodsMapper;
import com.bookShop.service.GoodService;
import com.haizhang.entity.GoodsInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import javax.annotation.Resource;
import org.apache.log4j.*;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 测试货物相关的service接口
 */
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional()
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")
public class TestGoodService {

    @Resource
    GoodService goodService;

//
//
//    public GoodsInfo (GoodsInfo goodsInfo);


    //获取所有货物信息，HashMap，键值对===  货物编号====货物信息
    @Test
    public void TestGetAllGoods(){
        HashMap<Integer,GoodsInfo> res=goodService.getAllGoods();
        for(Map.Entry<Integer,GoodsInfo>r:res.entrySet())
            System.out.println(r.getValue());
    }

    //根据goodsName或goodsId获取唯一的货物
    @Test
    public void TestqueryGoodsByGoodsInfo(){
        GoodsInfo goodsInfo=new GoodsInfo();
        goodsInfo.setGoodsId(93);
        GoodsInfo res=goodService.queryGoodsByGoodsInfo(goodsInfo);
        System.out.println(res);
    }

    //得到所有新上架的商品
    @Test
    public void TestgetAllNewGood(){
         List<GoodsInfo> goodsInfos=goodService.getAllNewGood();
         for(GoodsInfo r:goodsInfos)
             System.out.println(r);
    }

    //实现商品名、商品类型、上传时间、地址的模糊查询
    @Test
    public void  TestqueryGoodsInVague(){
        GoodsInfo goodsInfo=new GoodsInfo();

        List<GoodsInfo> goodsInfos=goodService.queryGoodsInVague(goodsInfo);
        for(GoodsInfo r:goodsInfos)
            System.out.println(r);
    }

    //得到商铺所有商品
    @Test
    public void TestqueryShopGoods(){
        List<GoodsInfo> goodsInfos=goodService.queryShopGoods(1);
        for(GoodsInfo r:goodsInfos)
            System.out.println(r);
    }

}
