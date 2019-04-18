package com.haizhang.entity;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * javabean 存放用户初始信息
 *
 * @author 海章
 * @create 2018-11-05 0:17
 */
public class UserInfo implements Serializable {
    @NotNull(message = "{username.empty}")
    private String username;    //用户账号名
    @Size(min = 6,max = 20,message = "{password.size}")
    private String password;
    @Pattern(regexp ="\\d{11}",message = "手机格式不正确")
    private String phone;
    private String addr;        //用户的收货地址
    private int id;             //用户的id编号，用于数据库的查找
    private String name;        //用户的真实姓名
    private String nikeName;    //用户昵称
    private int merchantFlag=1; //1代表不是卖家 0是卖家
    private int freezeFlag=0;   //0代表没有冻结，1代表账号已冻结
    private String imageLogo;     //用户头像

    public int getFreezeFlag() {
        return freezeFlag;
    }

    public void setFreezeFlag(int freezeFlag) {
        this.freezeFlag = freezeFlag;
    }

    public String getImageLogo() {
        return imageLogo;
    }

    public void setImageLogo(String imageLogo) {
        this.imageLogo = imageLogo;
    }

    public int getMerchantFlag() {
        return merchantFlag;
    }

    public void setMerchantFlag(int merchantFlag) {
        this.merchantFlag = merchantFlag;
    }

    public String getNikeName() {
        return nikeName;
    }

    public void setNikeName(String nikeName) {
        this.nikeName = nikeName;
    }

    public UserInfo(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                ", id=" + id +
                ", name='" + name + '\'' +
                ", nikeName='" + nikeName + '\'' +
                ", merchantFlag=" + merchantFlag +
                ", freezeFlag=" + freezeFlag +
                ", imageLogo='" + imageLogo + '\'' +
                '}';
    }
}
