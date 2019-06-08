package com.project.domain;

import java.sql.Date;
import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProductVO {
    private static Logger log = LoggerFactory.getLogger(ProductVO.class);
    

 /* `product_no`        INT             NULL        AUTO_INCREMENT COMMENT '제품번호', 
    `product_category`  VARCHAR(45)     NOT NULL    COMMENT '제품카테고리', 
    `product_name`      VARCHAR(45)     NOT NULL    COMMENT '제품이름', 
    `product_price`     INT             NOT NULL    COMMENT '제품단가', 
    `product_quantity`  INT             NOT NULL    COMMENT '제품수량', 
    `file_fullname`     VARCHAR(255)    NOT NULL    COMMENT '제품이미지', 
    `product_detail`    VARCHAR(500)    NULL        COMMENT '제품상세', 
    `product_option1`   VARCHAR(100)    NOT NULL    COMMENT '제품옵션1', 
    `product_option2`   VARCHAR(100)    NOT NULL    COMMENT '제품옵션2', 
    `product_option3`   VARCHAR(100)    NULL        COMMENT '제품옵션3', */
    
    private int product_no;
    private String product_category;
    private String product_name;
    private int product_price;
    private int product_quantity;
    private String product_detail;
    private String product_option1;
    private String product_option2;
    private String product_option3;
    private int reviewcnt;
    private String[] files;
    private String file_fullname;
    private Date file_regdate;
    private Date product_regdate;
    
    
    
    public Date getProduct_regdate() {
        return product_regdate;
    }
    public void setProduct_regdate(Date product_regdate) {
        this.product_regdate = product_regdate;
    }
    public int getProduct_no() {
        return product_no;
    }
    public void setProduct_no(int product_no) {
        this.product_no = product_no;
    }
    public String getProduct_category() {
        return product_category;
    }
    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }
    public String getProduct_name() {
        return product_name;
    }
    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
    public int getProduct_price() {
        return product_price;
    }
    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }
    public int getProduct_quantity() {
        return product_quantity;
    }
    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }
    public String getProduct_detail() {
        return product_detail;
    }
    public void setProduct_detail(String product_detail) {
        this.product_detail = product_detail;
    }
    public String getProduct_option1() {
        return product_option1;
    }
    public void setProduct_option1(String product_option1) {
        this.product_option1 = product_option1;
    }
    public String getProduct_option2() {
        return product_option2;
    }
    public void setProduct_option2(String product_option2) {
        this.product_option2 = product_option2;
    }
    public String getProduct_option3() {
        return product_option3;
    }
    public void setProduct_option3(String product_option3) {
        this.product_option3 = product_option3;
    }
    public int getReviewcnt() {
        return reviewcnt;
    }
    public void setReviewcnt(int reviewcnt) {
        this.reviewcnt = reviewcnt;
    }
    public String[] getFiles() {
        return files;
    }
    public void setFiles(String[] files) {
        this.files = files;
    }
    public String getFile_fullname() {
        return file_fullname;
    }
    public void setFile_fullname(String file_fullname) {
        this.file_fullname = file_fullname;
    }
    public Date getFile_regdate() {
        return file_regdate;
    }
    public void setFile_regdate(Date file_regdate) {
        this.file_regdate = file_regdate;
    }
    @Override
    public String toString() {
        return "ProductVO [product_no=" + product_no + ", product_category=" + product_category + ", product_name="
                + product_name + ", product_price=" + product_price + ", product_quantity=" + product_quantity
                + ", product_detail=" + product_detail + ", product_option1=" + product_option1 + ", product_option2="
                + product_option2 + ", product_option3=" + product_option3 + ", reviewcnt=" + reviewcnt + ", files="
                + Arrays.toString(files) + ", file_fullname=" + file_fullname + ", file_regdate=" + file_regdate
                + ", product_regdate=" + product_regdate + "]";
    }
    
    
}
