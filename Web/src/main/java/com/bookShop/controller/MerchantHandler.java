package com.bookShop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/merchant")
public class MerchantHandler {

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
    public String enterMerchantShop(@PathVariable int merchantId){
        System.out.println(merchantId);
        return "chatting";
    }


}
