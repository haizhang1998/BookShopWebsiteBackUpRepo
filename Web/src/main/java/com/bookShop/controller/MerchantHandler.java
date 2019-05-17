package com.bookShop.controller;

import com.alibaba.druid.sql.visitor.functions.Bin;
import com.bookShop.mapper.GoodsMapper;
import com.bookShop.service.GoodService;
import com.bookShop.service.MerchantService;
import com.bookShop.utils.CommonUtil;
import com.haizhang.ValidateGroup.UpdatePriceGroup;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.MerchantShop;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/merchant")
public class MerchantHandler {
    @Resource
    GoodService goodService;
    @Resource
    MerchantService merchantService;

    /**
     * 与卖家联系
     * @param merchantId
     * @return
     */
    @RequestMapping("/chat/{merchantId}")
    public String chatWithMerchant(@PathVariable int merchantId){
        System.out.println(merchantId);
        return "chatting";
    }

    /**
     * 进入商家店铺
     * @param merchantId
     * @return
     */
    @RequestMapping("/shop/{merchantId}")
    public String enterMerchantShop(@PathVariable int merchantId, Model model){
        //获取用户店铺的信息
        model.addAttribute("merchantShop",merchantService.getShopInfoByMerchantId(merchantId));
        return "MerchantShop";
    }

    /**
     * 获取店铺所有货物
     * @param merchantId
     * @return
     */
    @RequestMapping(value = "/queryAllGoods",produces ="application/json;charset=utf-8")
    @ResponseBody
    public List<GoodsInfo> queryAllGoodsInShop(int merchantId){
        //接受json数据
        List<GoodsInfo> goodsInfos= goodService.queryShopGoods(merchantId);
        System.out.println(goodsInfos);
        return goodsInfos;
    }

    /**
     * 更新价格
     * @param goodsInfo
     * @return
     */
    @RequestMapping(value = "/updateGoodsPrice",produces ="application/json;charset=utf-8")
    @ResponseBody
    public String queryAllGoodsInShop(@Validated(UpdatePriceGroup.class) GoodsInfo goodsInfo, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return  "{\"msg\":\"somthing error\"}";
        }
        boolean flag=goodService.updateGoodsPrice(goodsInfo.getGoodsId(),goodsInfo.getPrice());
        return "{\"msg\":\""+flag+"\"}";
    }


    /**
     * 跟新店铺信息
     * @param shopLogo
     * @param merchantShop
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/updateShopInfo",produces ="application/json;charset=utf-8")
    @ResponseBody
    public String updateShopInfo(MultipartFile shopLogo, @Valid MerchantShop merchantShop, BindingResult bindingResult) throws IOException {

        System.err.println(merchantShop);
        if(bindingResult.hasErrors()){
              System.out.println(bindingResult.getFieldError());
              return "{\"msg\":\"somthing error\"}";
          }
          //如果图片不为空，保存图片
          System.err.println(shopLogo==null);
          MerchantShop merchantShop1=null;
          if(!shopLogo.isEmpty()){
               merchantShop1=CommonUtil.getInstance().updateShopImage(merchantShop,shopLogo);
          }
          boolean flag=merchantService.updateShopInfo(merchantShop1);
          return "{\"msg\":\""+flag+"\"}";
    }

    /**
     * 上架货物
     */
    @RequestMapping(value ="/upGoods",produces ="application/json;charset=utf-8")
    @ResponseBody
    public String upGoods(MultipartFile imgDir, @Valid GoodsInfo goodsInfo, BindingResult bindingResult) throws IOException {
        if(bindingResult.hasErrors()){
            return "{\"msg\":\"somthing error\"}";
        }
        GoodsInfo goodsInfo1=CommonUtil.getInstance().upGoodsImage(goodsInfo,imgDir);
        boolean flag=goodService.upGoods(goodsInfo1);
        return  "{\"msg\":\""+flag+"\"}";
    }

}
