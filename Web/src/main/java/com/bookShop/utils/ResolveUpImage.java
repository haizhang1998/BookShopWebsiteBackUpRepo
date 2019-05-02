package com.bookShop.utils;

import com.haizhang.entity.UserInfo;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class ResolveUpImage {
    //单例设计模式
    private static  ResolveUpImage resolveUpImage=null;
    private ResolveUpImage(){
    }
    public static ResolveUpImage getInstance(){
        if(resolveUpImage==null){
            synchronized (ResolveUpImage.class){
                if(resolveUpImage==null){
                    synchronized (ResolveUpImage.class){
                         resolveUpImage=new ResolveUpImage();
                    }
                }
            }
        }
        return resolveUpImage;
    }

    public UserInfo resolveUserUpImage(UserInfo userInfo, MultipartFile profilePicture) throws IOException {

        synchronized (ResolveUpImage.class){
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
}
