package com.bookShop.utils;

import com.haizhang.entity.UserInfo;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class CommonUtil {
    //单例设计模式
    private static CommonUtil commonUtil =null;
    private CommonUtil(){
    }
    public static CommonUtil getInstance(){
        if(commonUtil ==null){
            synchronized (CommonUtil.class){
                if(commonUtil ==null){
                    synchronized (CommonUtil.class){
                         commonUtil =new CommonUtil();
                    }
                }
            }
        }
        return commonUtil;
    }

    public UserInfo resolveUserUpImage(UserInfo userInfo, MultipartFile profilePicture) throws IOException {

        synchronized (CommonUtil.class){
            int id=userInfo.getId();
            userInfo.setId(id);
            //获取个人头像，并生成头像名，然后存储到指定目录

            String newFilename="";
            if(profilePicture!=null){
                String originalName=profilePicture.getOriginalFilename();
                if(originalName!=null && originalName.trim().length()>0){
                    String path="F:\\uploads\\";
                    String pathInProject="F:\\BookShopWebsite\\Web\\src\\main\\webapp\\images\\userLogo\\";
                    newFilename= UUID.randomUUID()+originalName.substring(originalName.lastIndexOf("."));
                    profilePicture.transferTo(new File(path+newFilename));
                    profilePicture.transferTo(new File(pathInProject+newFilename));
                }
            }

            //更新数据库
            if(newFilename!=null && newFilename.trim().length()>0){
                userInfo.setImageLogo("/images/userLogo/"+newFilename);
            }
        }
        return userInfo;
    }


    //封装数据进map
    public Map<String,Object> packageDataIntoMap(int rowCount, List<UserInfo>userInfos){
        Map<String,Object> map=new HashMap<>();
        map.put("data",userInfos);
        map.put("total",rowCount);

        return map;
    }
}
