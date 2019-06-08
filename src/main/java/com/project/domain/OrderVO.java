package com.project.domain;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OrderVO {
    private static Logger log = LoggerFactory.getLogger(OrderVO.class);
    /*
     * `oder_no` INT NOT NULL AUTO_INCREMENT COMMENT '주문번호', `user_id` VARCHAR(45)
     * NOT NULL COMMENT '회원아이디', `product_no` INT NOT NULL COMMENT '제품번호',
     * `order_name` VARCHAR(45) NOT NULL COMMENT '주문수령인', `oder_date` DATETIME NOT
     * NULL DEFAULT CURRENT_TIMESTAMP COMMENT '주문날짜', `oder_address` VARCHAR(100)
     * NOT NULL COMMENT '주문주소', `oder_price` INT NOT NULL COMMENT '주문가격',
     * `order_quantity` INT NOT NULL COMMENT '주문수량',
     */

    private int order_no;
    private String user_id;
    private String order_name;
   
    private Date order_date;
    private String order_address;
    private int order_price;
    private int order_quantity;
    private int order_phone;

    
    
    
    public int getOrder_phone() {
        return order_phone;
    }

    public void setOrder_phone(int order_phone) {
        this.order_phone = order_phone;
    }

    public int getOrder_no() {
        return order_no;
    }

    public void setOrder_no(int order_no) {
        this.order_no = order_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getOrder_name() {
        return order_name;
    }

    public void setOrder_name(String order_name) {
        this.order_name = order_name;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getOrder_address() {
        return order_address;
    }

    public void setOrder_address(String order_address) {
        this.order_address = order_address;
    }

    public int getOrder_price() {
        return order_price;
    }

    public void setOrder_price(int order_price) {
        this.order_price = order_price;
    }

    public int getOrder_quantity() {
        return order_quantity;
    }

    public void setOrder_quantity(int order_quantity) {
        this.order_quantity = order_quantity;
    }

 

}
