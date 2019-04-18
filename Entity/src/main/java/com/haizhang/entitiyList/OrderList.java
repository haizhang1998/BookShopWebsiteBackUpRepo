package com.haizhang.entitiyList;

import com.haizhang.entity.OrderItem;
import java.util.List;

/**
 * 卖家的订单信息
 *
 * @author 海章
 * @create 2018-12-16 21:00
 */
public class OrderList {
        private List<OrderItem> waitPayList;     //待付款列表
        private List<OrderItem> payList;         //已付款列表
        private List<OrderItem> backList;        //退货列表
        private List<OrderItem> sendList;        //已发货
        private int waitPayListNumber;
        private int backListNumber;
        private int payListNumber;
        private int sendListNumber;

        public int getWaitPayListNumber() {
                return waitPayListNumber;
        }

        public void setWaitPayListNumber(int waitPayListNumber) {
                this.waitPayListNumber = waitPayListNumber;
        }

        public int getBackListNumber() {
                return backListNumber;
        }

        public void setBackListNumber(int backListNumber) {
                this.backListNumber = backListNumber;
        }

        public int getPayListNumber() {
                return payListNumber;
        }

        public void setPayListNumber(int payListNumber) {
                this.payListNumber = payListNumber;
        }

        public int getSendListNumber() {
                return sendListNumber;
        }

        public void setSendListNumber(int sendListNumber) {
                this.sendListNumber = sendListNumber;
        }

        public List<OrderItem> getSendList() {
                return sendList;
        }

        public void setSendList(List<OrderItem> sendList) {
                this.sendList = sendList;
        }

        public List<OrderItem> getWaitPayList() {
                return waitPayList;
        }

        public void setWaitPayList(List<OrderItem> waitPayList) {
                this.waitPayList = waitPayList;
        }

        public List<OrderItem> getPayList() {
                return payList;
        }

        public void setPayList(List<OrderItem> payList) {
                this.payList = payList;
        }

        public List<OrderItem> getBackList() {
                return backList;
        }

        public void setBackList(List<OrderItem> backList) {
                this.backList = backList;
        }
}
