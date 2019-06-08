package com.project.domain;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReviewVO {
    private static Logger log = LoggerFactory.getLogger(ReviewVO.class);

    /*
    `review_no`       INT             NOT NULL    AUTO_INCREMENT COMMENT '리뷰번호', 
    `product_no`      INT             NOT NULL    COMMENT '제품번호', 
    `review_title`    VARCHAR(100)    NOT NULL    COMMENT '리뷰제목', 
    `review_writer`   VARCHAR(45)     NOT NULL    COMMENT '리뷰작성자', 
    `review_regdate`  DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '리뷰작성일', 
    `review_update`   DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '리뷰수정일', 
    `review_grade`    TINYINT         NOT NULL    COMMENT '리뷰평점', */
    
    
    private int review_no;
    private int product_no;
    private String review_title;
    private String review_writer;
    private String review_content;
    private Date review_regdate;
    private Date review_update;
    private int review_grade;
    
    
    public int getReview_no() {
        return review_no;
    }
    public void setReview_no(int review_no) {
        this.review_no = review_no;
    }
    public int getProduct_no() {
        return product_no;
    }
    public void setProduct_no(int product_no) {
        this.product_no = product_no;
    }
    public String getReview_title() {
        return review_title;
    }
    public void setReview_title(String review_title) {
        this.review_title = review_title;
    }
    public String getReview_writer() {
        return review_writer;
    }
    public void setReview_writer(String review_writer) {
        this.review_writer = review_writer;
    }
    public String getReview_content() {
        return review_content;
    }
    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }
    public Date getReview_regdate() {
        return review_regdate;
    }
    public void setReview_regdate(Date review_regdate) {
        this.review_regdate = review_regdate;
    }
    public Date getReview_update() {
        return review_update;
    }
    public void setReview_update(Date review_update) {
        this.review_update = review_update;
    }
    public int getReview_grade() {
        return review_grade;
    }
    public void setReview_grade(int review_grade) {
        this.review_grade = review_grade;
    }
    @Override
    public String toString() {
        return "ReviewVO [review_no=" + review_no + ", product_no=" + product_no + ", review_title=" + review_title
                + ", review_writer=" + review_writer + ", review_content=" + review_content + ", review_regdate="
                + review_regdate + ", review_update=" + review_update + ", review_grade=" + review_grade + "]";
    }
    
    
   
    
}
