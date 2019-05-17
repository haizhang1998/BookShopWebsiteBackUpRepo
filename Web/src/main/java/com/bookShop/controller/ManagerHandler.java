package com.bookShop.controller;

import com.bookShop.exception.FreezeRecordExistException;
import com.bookShop.service.*;
import com.bookShop.utils.CommonUtil;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.haizhang.entity.Feedback;
import com.haizhang.entity.Freezerecord;
import com.haizhang.entity.RequestRecordShop;
import com.haizhang.entity.UserInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 管理员的控制器
 */
@Controller
@RequestMapping("/sys")
public class ManagerHandler {
    @Resource
    UserService userServiceImpl;
    @Resource
    FreezerecordService freezerecordServiceImpl;
    @Resource
    RequestShopRecordService requestShopRecordServiceImpl;
    @Resource
    FeedBackService feedBackServiceImpl;
    @Resource
    GoodService goodService;

    //通用工具类
    CommonUtil commonUtil = CommonUtil.getInstance();

    public ManagerHandler(UserService userService,FreezerecordService freezerecordService){
        this.userServiceImpl=userService;
        this.freezerecordServiceImpl=freezerecordService;
    }

    public ManagerHandler() {
    }
    //    /**
//     * 获取管理员界面
//     * @return

    @RequestMapping(value = "/form",method = RequestMethod.GET)
    public String getManagerForm(){
        return "managerPage";
    }

    /**
     * 查询所有的用户
     * @return
     */
    @RequestMapping(value = "/queryAllUser" ,produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String,Object> queryAllUser(int limit,int offset) throws Exception {

            int count=userServiceImpl.countUserNum();
            List<UserInfo> userInfos=null;
            if(count<=offset){
                int index=offset;
                while (index>=count){
                    index-=limit;
                }
                userInfos=userServiceImpl.queryUserByPage(limit,index+1);
            }else {
                userInfos = userServiceImpl.queryUserByPage(limit + offset, offset + 1);
            }
        return commonUtil.packageDataIntoMap(count,userInfos);

    }

    /**
     * 删除指定用户
     */
    @RequestMapping(value = "/deleteUser",produces ="application/json;charset=utf-8",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject deleteUser(int id) throws Exception {
            System.err.println("deleteUser"+id);
            String res=userServiceImpl.deleteUser(id);
            String data = "{\"msg\":\""+res+"\"}";
            System.err.println("deleteUser"+res);
            JSONObject json = JSONObject.fromObject(data);
            return json;
    }

    /**
     * 修改用户信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/editUser",produces ="application/json;charset=utf-8",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editUser(UserInfo userInfo) throws Exception {
        System.err.println("editUser"+userInfo.getId());
        String res=userServiceImpl.reviseUserInfo(userInfo.getId(), userInfo);
        String data = "{\"msg\":\""+res+"\"}";
        JSONObject json = JSONObject.fromObject(data);
        return json;
    }


    /**
     * 冻结用户
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/freezeUser",produces ="application/json;charset=utf-8",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject freezeUser(int userId, @Valid Freezerecord freezerecord, BindingResult bindingResult) throws FreezeRecordExistException {
        String data="";
        //添加冻结记录
        freezerecord.setDate(new Date());
        UserInfo userInfo=new UserInfo();
        userInfo.setId(userId);
        freezerecord.setUserInfo(userInfo);
        if(bindingResult.hasErrors()){
            data="{\"msg\":\"更新失败！请检查信息是否完全！\"}";
            return JSONObject.fromObject(data);
        }
        if(!commonUtil.checkDateValid(freezerecord.getDate(),freezerecord.getEndDate())){
            data = "{\"msg\":\"更新失败！终止日期需要在今天的日期之后！\"}";
            return JSONObject.fromObject(data);
        }
        freezerecordServiceImpl.insertFreezeRecord(freezerecord);
        //改变用户的状态
        String res=userServiceImpl.freezeUser(userId);
        data = "{\"msg\":\""+res+"\"}";
        return JSONObject.fromObject(data);
    }

    /**
     * 查询所有的请求
     * @return
     */
    @RequestMapping(value = "/queryAllRequest",produces ="application/json;charset=utf-8")
    @ResponseBody
    public String queryAllRequest(Model model){
        List<RequestRecordShop> requestRecordShops=requestShopRecordServiceImpl.queryAllRequestshoprecord();
        return JSONArray.fromObject(requestRecordShops).toString();
    }


    /**
     * 接受或者拒绝申请请求，并接受反馈原因
     */
    @RequestMapping(value = "/operateShopRequest",produces ="application/json;charset=utf-8")
    @ResponseBody
    public JSONObject operateShopRequest(Feedback feedback,RequestRecordShop requestRecordShop) throws Exception {

        //添加审批后的反馈信息及状态
        feedback.setCheckDate(new Date());
        System.err.println(feedback);
        int insertCount=feedBackServiceImpl.insertFeedBack(feedback);
        //如果是批准状态，修改用户的merchantFlag
        if(feedback.getState()==1)userServiceImpl.reigstMerchant(feedback.getUserId());

        //获取传递的审批过后的列表。
        List<Integer>requestIds=new ArrayList<>();
        requestIds.add(requestRecordShop.getRequestId());
        int delCount=requestShopRecordServiceImpl.deleteRequsetshoprecord(requestIds);

        return (insertCount>0&&delCount>0)?JSONObject.fromObject("{\"msg\":\"操作成功!\"}")
                :JSONObject.fromObject("{\"msg\":\"操作失败!\"}");

    }


    @RequestMapping("/delShopRequest")
    @ResponseBody
    public JSONObject operateShopRequest(Integer requestId) throws Exception {
        System.err.println(requestId);
        List<Integer> requestIds=new ArrayList<>();
        requestIds.add(requestId);
        int delCount=requestShopRecordServiceImpl.deleteRequsetshoprecord(requestIds);
        return delCount>0?JSONObject.fromObject("{\"msg\":\"删除成功!\"}")
                :JSONObject.fromObject("{\"msg\":\"删除失败!\"}");


    }

        /**
         * 分页查询冻结记录
         * @return
         */
    @RequestMapping(value = "/queryFreezeRecordByPage",produces ="application/json;charset=utf-8")
    @ResponseBody
    public Map<String,Object> queryRecordByPage(int limit,int offset){

        //获取冻结记录条数
        int count=freezerecordServiceImpl.queryFreezeCount();
        List<Freezerecord> freezerecords=null;
        //检查总记录数是否低于当前的offset，如果是就循环相减
        if(count<=offset){
            int index=offset;
            while (index>=count){
                index-=limit;
            }
           freezerecords=freezerecordServiceImpl.queryRecordByPage(limit,index+1);
        }else {
           freezerecords=freezerecordServiceImpl.queryRecordByPage(limit,offset+1);
        }
        System.err.println(freezerecords);
        return commonUtil.packageFreezeDataIntoMap(count,freezerecords);
    }





    //解冻用户
    @RequestMapping(value = "/unFreezeUser",produces ="application/json;charset=utf-8")
    @ResponseBody
    public String unFreezeUser(int userId) throws Exception {
            userServiceImpl.unfreezeUser(userId);
            List<Integer> userIds=new ArrayList<>();
            userIds.add(userId);
        return freezerecordServiceImpl.deleteFreezeRecord(userIds)>0?
                "{\"msg\":\"解冻成功！\"}":"{\"msg\":\"解冻失败！请查看用户是否已被解冻！\"}";
    }






}
