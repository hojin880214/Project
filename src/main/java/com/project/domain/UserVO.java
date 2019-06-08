package com.project.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserVO {
    private static Logger log = LoggerFactory.getLogger(UserVO.class);
    
    /*`user_id`      VARCHAR(45)    NOT NULL    COMMENT '회원아이디', 
    `user_name`    VARCHAR(45)    NOT NULL    COMMENT '회원이름', 
    `user_email`   VARCHAR(45)    NOT NULL    COMMENT '회원이메일', 
    `user_pw`      VARCHAR(30)    NOT NULL    COMMENT '회원비밀번호', 
    `user_phone`   INT            NOT NULL    COMMENT '회원핸드폰번호', 
    `user_adress`  VARCHAR(45)    NOT NULL    COMMENT '회원주소', 
    `user_grade`   INT            NOT NULL    COMMENT '회원등급', 
    PRIMARY KEY (user_id)*/
    
    
    private String user_id;
    private String user_name;
    private String user_email;
    private String user_pw;
    private int user_phone;
    private String user_adress;
    private int user_grade;
    
    
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getUser_name() {
        return user_name;
    }
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    public String getUser_email() {
        return user_email;
    }
    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }
    public String getUser_pw() {
        return user_pw;
    }
    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }
    public int getUser_phone() {
        return user_phone;
    }
    public void setUser_phone(int user_phone) {
        this.user_phone = user_phone;
    }
    public String getUser_adress() {
        return user_adress;
    }
    public void setUser_adress(String user_adress) {
        this.user_adress = user_adress;
    }
    public int getUser_grade() {
        return user_grade;
    }
    public void setUser_grade(int user_grade) {
        this.user_grade = user_grade;
    }
    @Override
    public String toString() {
        return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email + ", user_pw="
                + user_pw + ", user_phone=" + user_phone + ", user_adress=" + user_adress + ", user_grade=" + user_grade
                + "]";
    }
    
    
}
