<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<br><br><br><br><br><br><br><br>

    <div class="newsletter">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="newsletter_border"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="newsletter_content text-center">
                        <div class="newsletter_title">Sign In to ComNaWa</div>
                        <div class="newsletter_text"><p>To use the ComNaWa, sign up as a member&ensp;<a href="../user/signup">Sign up</a></p></div>
                        <div class="newsletter_form_container">
                            <form action="../user/loginPost" method="post">
                                <br><p>User ID</p>
                                <input type="text" required="required" name="user_id" class="myinput">
                                       
                                       <p></p>
                                <br><p>Password</p><p></p>
                                <input type="password" required="required" name="user_pw" class="myinput">
                                <button type="submit" class="newsletter_button trans_200">Sign In</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="../include/footer.jsp"%>