<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<br><br><br><br><br><br><br>

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
                    <div class="newsletter_title">Please enter
                        your information</div>
                    <div class="newsletter_text">
                        <p>
                            Already have an account?&ensp;<a
                                href="/user/login">Sign in</a>
                        </p>
                    </div>
                    <div class="newsletter_form_container">
                        <form role="form" method="post"
                            autocomplete="off">
                            <input type="text" id="user_id"
                                name="user_id" placeholder="User ID"
                                required="required" class="myinput">
                            <p id="invalid"></p>
                            <input type="password" id="user_pw"
                                name="user_pw" required="required"
                                placeholder="Password" class="myinput">
                            <p></p>
                            <input type="text" id="user_name"
                                name="user_name" placeholder="Name"
                                required="required" class="myinput">
                            <p></p>
                            <input type="email" id="user_email"
                                name="user_email" placeholder="Email"
                                required="required" class="myinput">
                            <p></p>
                            <input type="text" id="user_phone"
                                name="user_phone"
                                placeholder="Phone number without -"
                                required="required" class="myinput">
                            <p></p>
                            <input type="text" id="user_adress"
                                name="user_adress" placeholder="address"
                                required="required" class="myinput">
                            <p></p>
                            <button type="submit"
                                class="newsletter_button trans_200">Sign
                                Up</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$("#user_id").blur(function(){
	var data=$("#user_id").val();
	$.ajax({
        type        : "POST",
        url         : "../user/checkid",
        data        :  JSON.stringify({user_id:data}), 
        contentType : "application/json",
        success     : function(result) {
                        if (result == '0') {
                            $("#invalid").html("Available id").css("color", "green");
                        } else {
                            $("#invalid").html("This is the ID already used").css({
                                "color" : "red"
                            });
                            $('#user_id').focus();
                        }
        }
    });
});
</script>          






<%@ include file="../include/footer.jsp"%>