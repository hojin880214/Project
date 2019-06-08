package com.project.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CartVO {
    private static Logger log = LoggerFactory.getLogger(CartVO.class);
    

    private int cart_no;
    private String user_id;
    private int product_no;
    private int product_quantity;
    private String product_name;
    private String product_price;
    
    
    
    
    public String getProduct_price() {
        return product_price;
    }
    public void setProduct_price(String product_price) {
        this.product_price = product_price;
    }
    public String getProduct_name() {
        return product_name;
    }
    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
    public int getCart_no() {
        return cart_no;
    }
    public void setCart_no(int cart_no) {
        this.cart_no = cart_no;
    }
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public int getProduct_no() {
        return product_no;
    }
    public void setProduct_no(int product_no) {
        this.product_no = product_no;
    }
    public int getProduct_quantity() {
        return product_quantity;
    }
    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }
    @Override
    public String toString() {
        return "CartVO [cart_no=" + cart_no + ", user_id=" + user_id + ", product_no=" + product_no
                + ", product_quantity=" + product_quantity + "]";
    }
    
    
}
