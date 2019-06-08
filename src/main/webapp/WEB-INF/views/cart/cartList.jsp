<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

<br><br>
<!-- Cart Info -->

    <div class="cart_info">
        <div class="container">
            <div class="row">
                <div class="col">
                    <!-- Column Titles -->
                    <div class="cart_info_columns clearfix">
                        <div class="cart_info_col cart_info_col_product">Product</div>
                        <div class="cart_info_col cart_info_col_price">Price</div>
                        <div class="cart_info_col cart_info_col_quantity">Quantity</div>
                        <div class="cart_info_col cart_info_col_total">Total</div>
                    </div>
                </div>
            </div>
            <div class="row cart_items_row">
                <div class="col">
                <c:set var="sum" value="0" />
                <c:set var="quantity" value="0" />
                    <c:forEach items="${cartList}" var="cartList">
                    <!-- Cart Item -->
                    <div class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
                        
                        <!-- Name -->
                        <div class="checkBox">
                            <input type="checkbox" name="chBox"
                                class="chBox"
                                data-cart_no="${cartList.cart_no}" />
                        </div>
                        <div class="cart_item_product d-flex flex-row align-items-center justify-content-start">
                            
                            <div class="cart_item_name_container">
                            
                                <div class="cart_item_name"><a href="../product/read?product_no=${cartList.product_no}">${cartList.product_name}</a></div>
                                <div class="cart_item_edit"><a href="#">Delete this product</a></div>
                            </div>
                        </div>
                        <!-- Price -->
                        <div class="cart_item_price">&#8361; <fmt:formatNumber pattern="###,###,###" value="${cartList.product_price}" /></div>
                        <!-- Quantity -->
                        <div class="cart_item_quantity">
                            <div class="product_quantity_container">
                                <div class="product_quantity clearfix">
                                    <span>Qty</span>
                                    <input id="quantity_input" type="text" pattern="[0-99]*" value="${cartList.product_quantity}">
                                    <div class="quantity_buttons">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Total -->
                        <div class="cart_item_total">&#8361; <fmt:formatNumber pattern="###,###,###" value="${cartList.product_price * cartList.product_quantity}" /></div>
                    </div>
                    <c:set var="sum" value="${sum + (cartList.product_price * cartList.product_quantity)}" />
                    <c:set var="quantity" value="${quantity+(cartList.product_quantity)}" />
                    </c:forEach>
                </div>
            </div>
            <div class="allCheck">
            <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck" style="color:#1B1B1B;">&emsp;All Check</label> 
        </div>
            <div class="row row_cart_buttons">
                <div class="col">
                    <div class="cart_buttons d-flex flex-lg-row flex-column align-items-start justify-content-start">
                        <div class="button continue_shopping_button"><a href="../product/catelist?product_category=all">Continue shopping</a></div>
                        <div class="cart_buttons_right ml-lg-auto">
                            <div class="button clear_cart_button" id="selectDelete_btn"><a href="#">Delete</a></div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <form action="../order/order" id="coupon_form" class="coupon_form" role="form" method="post" autocomplete="off">
            <div class="row row_extra">
                <div class="col-lg-4">
                    
                    <!-- Delivery -->
                    
                    <div class="delivery">
                        <div class="section_title">Shipping information</div>
                        <div class="section_subtitle">Enter your information</div>
                        <div class="delivery_options">
                            <div class="coupon_form_container">
                                <input type="text" class="coupon_input" required="required" name="order_name" placeholder="Shipping name">
                                <input type="text" class="coupon_input" required="required" name="order_phone" placeholder="Phone">
                                <input type="text" class="coupon_input" required="required" name="order_address" placeholder="Shipping address">
                                <input type="hidden" class="coupon_input" name="order_price" value="${sum}">
                                <input type="hidden" class="coupon_input" name="order_quantity" value="${quantity}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-2">
                    <div class="cart_total">
                        <div class="section_title">Cart total</div>
                        <div class="section_subtitle">Final info</div>
                        <div class="cart_total_container">
                            <ul>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="cart_total_title">Subtotal</div>
                                    <div class="cart_total_value ml-auto">&#8361; <fmt:formatNumber pattern="###,###,###" value="${sum}" /></div>
                                </li>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="cart_total_title">Shipping</div>
                                    <c:choose>
                                    <c:when test="${sum>=30000}">
                                    <div class="cart_total_value ml-auto">Free</div>
                                    </c:when>
                                    <c:when test="${sum==0}">
                                    <div class="cart_total_value ml-auto">&#8361; 0</div>
                                    </c:when>
                                    <c:otherwise>
                                     <div class="cart_total_value ml-auto">&#8361; <fmt:formatNumber pattern="###,###,###" value="30000" /></div>
                                    </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="cart_total_title">Total</div>
                                    <c:choose>
                                    <c:when test="${sum>=30000}">
                                    <div class="cart_total_value ml-auto">&#8361; <fmt:formatNumber pattern="###,###,###" value="${sum}" /></div>
                                    </c:when>
                                    <c:when test="${sum==0}">
                                    <div class="cart_total_value ml-auto">&#8361; 0</div>
                                    </c:when>
                                    <c:otherwise>
                                    <div class="cart_total_value ml-auto">&#8361; <fmt:formatNumber pattern="###,###,###" value="${sum+30000}" /></div>
                                    </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                        </div>
                        <div class="button checkout_button"><a href="#"><button type="submit" style="background-color:white; border: none; font-weight: 600;">Proceed to checkout</button></a></div>
                    </div>
                </div>
              </div>
           </form>
        </div>      
    </div>


<script>

    $(".orderOpne_bnt").click(function() {
        $(".orderInfo").slideDown();
        $(".orderOpne_bnt").slideUp();
    });
    
    $(".cancel_btn").click(function() {
        $(".orderInfo").slideUp();
        $(".orderOpne_bnt").slideDown();
    });
    
	$("#allCheck").click(function() {
		var chk = $("#allCheck").prop("checked");
		if (chk) {
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}
	});

	$(".chBox").click(function() {
		$("#allCheck").prop("checked", false);
	});
	
	
	$("#selectDelete_btn").click(function(){
		var confirm_val=confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val){
			var checkArr=new Array();
			$("input[class='chBox']:checked").each(function(){
				checkArr.push($(this).attr("data-cart_no"));
				
				$.ajax({
			        url : "../cart/deleteCart",
			        type : "post",
			        data : {
			            chbox:checkArr
			        },
			        success : function(result) {
			            if (result == 1) {
			                location.href = "../cart/cartList";
			            } else {
			                alert("삭제 실패");
			            }
			        }
			    });
			});
		}
		
	});
	
	
	$(".cart_item_edit").click(function() {
        var confirm_val = confirm("정말 삭제하시겠습니까?");

        if (confirm_val) {
            var checkArr = new Array();

            checkArr.push($(this).attr("data-cart_no"));

            $.ajax({
                url : "../cart/deleteCart",
                type : "post",
                data : {
                    chbox : checkArr
                },
                success : function(result) {
                    if (result == 1) {
                        location.href = "../cart/cartList";
                    } else {
                        alert("삭제 실패");
                    }
                }
            });
        }
    }); 

</script>

<%@ include file="../include/footer.jsp"%>