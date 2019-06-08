<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<br><br><br><br>
<!-- Cart Info -->

    <div class="cart_info">
        <div class="container">
            <div class="row">
                <div class="col">
                <h3>Order List</h3><br>
                    <!-- Column Titles -->
                    <div class="cart_info_columns clearfix">
                        <div class="cart_info_col cart_info_col_product">Order Information</div>
                        <div class="cart_info_col cart_info_col_price">Price</div>
                        <div class="cart_info_col cart_info_col_quantity">Quantity</div>
                        <div class="cart_info_col cart_info_col_total">Order Date</div>
                    </div>
                </div>
            </div>
            <div class="row cart_items_row">
                <div class="col">
                    <c:forEach items="${orderList}" var="orderList">
                    <!-- Cart Item -->
                    <div class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
                        <!-- Name -->
                        <div>${orderList.order_no}</div>
                        <div class="cart_item_product d-flex flex-row align-items-center justify-content-start">
                            
                            <div class="cart_item_name_container">
                                <div class="cart_item_name"><a href="#">${orderList.user_id}</a></div>
                                <div class="cart_item_edit"><a href="#">${orderList.order_name}</a></div>
                                <div class="cart_item_edit"><a href="#">${orderList.order_phone}</a></div>
                                <div class="cart_item_edit"><a href="#">${orderList.order_address}</a></div>
                            </div>
                        </div>
                        <!-- Price -->
                        <div class="cart_item_price">&#8361; <fmt:formatNumber pattern="###,###,###" value="${orderList.order_price}" /></div>
                        <!-- Quantity -->
                        <div class="cart_item_quantity">
                            <div class="product_quantity_container">
                                <div class="product_quantity clearfix">
                                    <span>Qty</span>
                                    <input id="quantity_input" type="text" value="1">
                                    
                                </div>
                            </div>
                        </div>
                        <!-- Total -->
                        <div class="cart_item_total">${orderList.order_date}</div>
                    </div>
                     </c:forEach>   
                </div>
            </div>
        </div>
    </div>
       
<%@ include file="../include/footer.jsp"%>