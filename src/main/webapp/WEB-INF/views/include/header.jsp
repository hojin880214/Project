<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>ComNaWa</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Sublime project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../resources/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="../resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/responsive.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/bootstrap4/bootstrap.min.css">
<link href="../resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="../resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/categories.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/categories_responsive.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/cart.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/cart_responsive.css">
</head>
<style>

.form-control selected:after{
    color:#1B1B1B;
}

a { 
    text-decoration:none;
    color:#6C6A74;
}

h3{
    color:#1B1B1B;
}

.pagination {
  display: inline-block;
}

.pagination li {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.myinput{
   width: 100%;
   height: 52px;
   background: #f2f4f8;
   border: none;
   outline: none;
   padding-left: 15px;
}
.myinputtext{
   width: 100%;
   background: #f2f4f8;
   border: none;
   outline: none;
   padding-left: 15px;
}
</style>


 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script src="../resources/styles/bootstrap4/popper.js"></script>
<script src="../resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="../resources/plugins/greensock/TweenMax.min.js"></script>
<script src="../resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="../resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="../resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="../resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="../resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="../resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="../resources/plugins/easing/easing.js"></script>
<script src="../resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="../resources/js/custom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="../resources/js/upload.js"></script>
<body>

<div class="super_container">

    <!-- Header -->

        <header class="header">
            <div class="header_container">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div
                                class="header_content d-flex flex-row align-items-center justify-content-start">
                                <div class="logo">
                                    <a href="../">ComNaWa</a>
                                </div>
                                <nav class="main_nav">
                                    <ul style="width:150%">
                                        <li class="hassubs active"
                                            style="float:left;"><a
                                            href="#">Categories</a>
                                            <ul>
                                                <li><a
                                                    href="../product/catelist?product_category=all">ALL</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=cpu">CPU</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=ram">RAM</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=mb">MainBoard</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=vga">VGA</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=power">Power</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=ssd">SSD</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=case">Case</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=keyboard">Keyboard</a></li>
                                                <li><a
                                                    href="../product/catelist?product_category=mouse">Mouse</a></li>
                                            </ul></li>

                                        <li><a href="#">&emsp;</a></li>
                                        <li><a href="#">&emsp;</a></li>
                                        <li><a href="#">&emsp;</a></li>

                                        <c:if
                                            test="${uvo.user_grade==0}">
                                            <li><a
                                                href="../product/register">상품등록</a></li>
                                        </c:if>

                                        <c:choose>
                                            <c:when
                                                test="${uvo.user_id!=null and uvo.user_grade==1}">
                                                <li><a
                                                    href="../order/orderList">${uvo.user_name}
                                                        님</a></li>
                                                <li><a
                                                    href="../user/logout">LogOut</a></li>
                                            </c:when>
                                            <c:when
                                                test="${uvo.user_id!=null and uvo.user_grade==0}">
                                                <li><a
                                                    href="../order/orderListAll">Administrator
                                                        Mode</a></li>
                                                <li><a
                                                    href="../user/logout">LogOut</a></li>
                                            </c:when>
                                        </c:choose>

                                        <c:if
                                            test="${uvo.user_id==null}">
                                            <li style="float: right;"><a
                                                href="../user/login">Login</a></li>
                                        </c:if>
                                    </ul>
                                </nav>
                                <div class="header_extra ml-auto">
                                    <div class="shopping_cart">
                                        <a href="../cart/cartList"> <svg
                                                version="1.1"
                                                xmlns="http://www.w3.org/2000/svg"
                                                xmlns:xlink="http://www.w3.org/1999/xlink"
                                                x="0px" y="0px"
                                                viewBox="0 0 489 489"
                                                style="enable-background: new 0 0 489 489;"
                                                xml:space="preserve">
                                            <g>
                                                <path
                                                    d="M440.1,422.7l-28-315.3c-0.6-7-6.5-12.3-13.4-12.3h-57.6C340.3,42.5,297.3,0,244.5,0s-95.8,42.5-96.6,95.1H90.3
                                                    c-7,0-12.8,5.3-13.4,12.3l-28,315.3c0,0.4-0.1,0.8-0.1,1.2c0,35.9,32.9,65.1,73.4,65.1h244.6c40.5,0,73.4-29.2,73.4-65.1
                                                    C440.2,423.5,440.2,423.1,440.1,422.7z M244.5,27c37.9,0,68.8,30.4,69.6,68.1H174.9C175.7,57.4,206.6,27,244.5,27z M366.8,462
                                                    H122.2c-25.4,0-46-16.8-46.4-37.5l26.8-302.3h45.2v41c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h139.3v41
                                                    c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h45.2l26.9,302.3C412.8,445.2,392.1,462,366.8,462z" />
                                            </g>
                                        </svg>
                                            <div>Cart</div>
                                        </a>
                                    </div>
                                    <div class="hamburger">
                                        <i class="fa fa-bars"
                                            aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="header_social">
                <ul>
                </ul>
            </div>
        </header>
        <!-- Menu -->
        <div class="menu menu_mm trans_300">
        <div class="menu_container menu_mm">
            <div class="page_menu_content">     
                
                <ul class="page_menu_nav menu_mm">
                    <li class="page_menu_item menu_mm">
                        <a href="../">Home<i class="fa fa-angle-down"></i></a>  
                    </li>
                    <li class="page_menu_item has-children menu_mm">
                        <a href="#">Categories<i class="fa fa-angle-down"></i></a>
                        <ul class="page_menu_selection menu_mm">
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=all">ALL<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=cpu">CPU<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=ram">RAM<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=mb">MainBoard<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=vga">VGA<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=power">POWER<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=ssd">SSD<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=case">Case<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=keyboard">Keyboard<i class="fa fa-angle-down"></i></a></li>
                            <li class="page_menu_item menu_mm"><a href="../product/catelist?product_category=mouse">Mouse<i class="fa fa-angle-down"></i></a></li>
                        </ul>
                    </li>
                    <c:if test="${uvo.user_grade==0}">
                    <li class="page_menu_item menu_mm"><a href="../product/register">상품등록</a></li>
                    </c:if>
                    <c:choose>
                    <c:when test="${uvo.user_id!=null and uvo.user_grade==1}">
                    <li class="page_menu_item menu_mm"><a href="../order/orderList">${uvo.user_name} 님</a></li>
                    <li class="page_menu_item menu_mm"><a href="../user/logout">LogOut</a></li>
                    </c:when>
                    <c:when test="${uvo.user_id!=null and uvo.user_grade==0}">
                    <li class="page_menu_item menu_mm"><a href="../order/orderListAll">Administrator Mode</a></li>
                    <li class="page_menu_item menu_mm"><a href="../user/logout">LogOut</a></li>
                    </c:when>
                    </c:choose>
                    <c:if test="${uvo.user_id==null}">
                    <li class="page_menu_item menu_mm"><a href="../user/login">Login</a></li>
                    </c:if>
                </ul>
            </div>
        </div>

        <!-- <div class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></div> -->

        <!-- <div class="menu_social">
             <ul>
                <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
            </ul>
        </div> -->
    </div>
    
    
