<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

<style>
    .popup {
        position:absolute;
    }
    
    .front{
        z-index: 10;
        opacity: 1;
        border: 1px;
        margin: auto;
    }
    
    .show {
        position:relative;
        max-width: 640px;
        max-height: 480px;
        overflow: auto;
        
    }
    
</style>

<br><br><br>
<form role="form" method="post">
    <input type="hidden" name="product_no" value="${pvo.product_no}">
    <input type="hidden" name="product_category"
        value="${pvo.product_category}"> <input type="hidden"
        name="page" value="${scri.page }"> <input type="hidden"
        name="perPageNum" value="${scri.perPageNum}"> <input
        type="hidden" name="searchType" value="${scri.searchType}">
    <input type="hidden" name="keyword" value="${scri.keyword}">
    <div class="cart_info">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="back popup" style="display: none;"></div>
                    <div class="front popup" style="display: none;">
                        <img id="popup_img">
                    </div>
                    <h3>[${pvo.product_category}]
                        ${pvo.product_name}</h3>
                    <br>
                    <!-- Column Titles -->
                    <div class="cart_info_columns clearfix">
                        <div class="cart_info_col cart_info_col_product">Product
                            Detail</div>
                        <div class="cart_info_col cart_info_col_price">Price</div>
                        <div
                            class="cart_info_col cart_info_col_quantity">Quantity</div>
                        <div class="cart_info_col cart_info_col_total">Cart</div>
                    </div>
                </div>
            </div>
            <div class="row cart_items_row">
                <div class="col">

                    <!-- Cart Item -->
                    <div
                        class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
                        <div style="margin-right: 10px; color: #1b1b1b;">${pvo.product_no}</div>
                        <div class="cart_item_image">
                            <div class="uploadList"></div>
                        </div>

                        <!-- Name -->

                        <div
                            class="cart_item_product d-flex flex-row align-items-center justify-content-start"
                            style="width: 45%">

                            <div class="cart_item_name_container"
                                style="padding-left: 0px;">
                                <div class="cart_item_name">
                                    <a href="#">${pvo.product_name}</a>
                                </div>
                                <div class="cart_item_edit">
                                    <a href="#">${pvo.product_option1}</a>
                                </div>
                                <div class="cart_item_edit">
                                    <a href="#">${pvo.product_option2}</a>
                                </div>
                                <div class="cart_item_edit">
                                    <a href="#">${pvo.product_option3}</a>
                                </div>
                            </div>
                        </div>
                        <!-- Price -->

                        <div class="cart_item_price">
                            &#8361;
                            <fmt:formatNumber pattern="###,###,###"
                                value="${pvo.product_price}" />
                        </div>
                        <!-- Quantity -->
                        <div class="cart_item_quantity">
                            <div class="product_quantity_container">
                                <div class="product_quantity clearfix">
                                    <span>Qty</span> <input
                                        type="number" type="text"
                                        value="1" style="width: 40px"
                                        min="1" id="cartStock"
                                        max="${pvo.product_quantity}">
                                </div>
                            </div>
                        </div>
                        <!-- Total -->
                        <div class="cart_item_total">
                            <div class="addToCart">
                                <button type="button"
                                    class="addCart_btn">Add to
                                    cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="box-footer"
                style="position:relative; background: white; width: 100%;">
                <p style="height:1px;"></p>
                <button type="button" class="btn btn-secondary" style="float:right;"
                     id="goListBtn">GO
                    LIST</button>
                <c:if test="${uvo.user_grade==0}">
                    <button type="submit" class="btn btn-secondary" style="float:right; margin-right: 5px;"
                        id="removeBtn">Remove</button>
                    <button type="submit" class="btn btn-secondary" style="float:right; margin-right: 5px;"
                        id="modifyBtn">Modify</button>              
                </c:if>             
                <br>
                <p style="height:50px;"></p>
            </div>
        </div>
    </div>
    <div class="cart_info" style="position:absolute; width:100%;">&nbsp;</div>
</form>

<div class="cart_info">
    <div class="container">
        <div class="row">
            <div class="col">
                <!-- Column Titles -->
                <div class="cart_info_columns clearfix">
                    <div class="cart_info_col cart_info_col_product">Review
                        [${pvo.reviewcnt}]</div>
                    <div class="cart_info_col cart_info_col_price">Writer</div>
                    <div class="cart_info_col cart_info_col_quantity">Grade</div>
                    <div class="cart_info_col cart_info_col_total">Regdate</div>
                </div>
            </div>
        </div>
        <div class="row cart_items_row">
            <div class="col">
                <c:forEach items="${rlist}" var="rvo">
                    <!-- Cart Item -->
                    <div
                        class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
                        <!-- Name -->
                        <div
                            class="cart_item_product d-flex flex-row align-items-center justify-content-start">
                            <div class="cart_item_name_container">
                                <div class="cart_item_name">
                                    <a href="#">${rvo.review_title}</a>
                                </div>
                                <div class="cart_item_edit">
                                    <a href="#">${rvo.review_content}</a>
                                </div>
                            </div>
                        </div>
                        <!-- Price -->
                        <div class="cart_item_price">${rvo.review_writer}</div>
                        <!-- Quantity -->
                        <div class="cart_item_quantity">
                            <div class="product_quantity_container">
                                <div class="product_quantity clearfix"
                                    style="padding-left: 40px;">
                                    <input id="quantity_input"
                                        type="text" pattern="[0-9]*"
                                        value="${rvo.review_grade} of 5"
                                        style="width: 80%;">

                                </div>
                            </div>
                        </div>
                        <!-- Total -->
                        <div class="cart_item_total">${rvo.review_regdate}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <c:if test="${uvo.user_id!=null}">
            <div>
                <span class="review">
                    <p id="replycnt" style="margin-top:15px;">Review register</p>
                </span>
            </div>
            
            <label>Title&emsp;</label>
            <input type="text" id="rtitle" name="review_title">
            &emsp;
            <label>Writer&emsp;</label>
            <input type="text" id="rwriter" name="review_writer"
                value=" ${uvo.user_id}" readonly="readonly">
            &emsp;
            <label>Content&emsp;</label>
            <input type="text" id="rcontent" name="review_content">
            &emsp;
            <label>Grade&emsp;</label>
            <input type="text" id="rgrade" name="review_grade"
                placeholder=" 1 to 5">
            &emsp;
            <button id="replySubmit">Submit</button>
        </c:if>
    </div>
</div>

<br><br>
    

<script id="templateFile" type="text/x-handlebars-template">

    <span class="mailbox-attachment-icon has-img"><br>
    <img src="{{imgSrc}}" alt="Attachment"></span>
    <a href="{{getLink}}" class="mailbox-attachment-name">
    <div class="mailbox-attachment-info">
    Click to enlarge</a>    
    </div>

</script>
<script>
	var result = '${msg}';
	console.log("msg : " + result);
	if (result == 'modify_success') {
		alert("게시물이 성공적으로 수정되었습니다.");
	}
</script>
<script>
var product_no=${pvo.product_no};
var page=${scri.page};
var perPageNum=${scri.perPageNum};
var searchType='searchType';

var replyPage=1;

$("#replySubmit").on("click", function() {
    var rtitle = $("#rtitle").val();
    var rwriter = $("#rwriter").val();
    var rcontent = $("#rcontent").val();
    var rgrade = $("#rgrade").val();
    $.ajax({
        url : "../reviews/",
        type : "post",
        headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-override" : "POST"
        },
        dataType : "text",
        data : JSON.stringify({
            product_no : product_no,
            review_title : rtitle,
            review_writer : rwriter,
            review_content : rcontent,
            review_grade : rgrade
        }),
        success : function(result) {
            if (result == "success") {
                alert("Review register success");
                console.log(">>> check 1 >>>");
                console.log(">>> check 2 >>>");
                window.location.reload();
                $("#rtitle").val("");
                $("#rwriter").val("");
                $("#rcontent").val("");
                $("#rgrade").val("");

            }
        }
    });
});
	$(document).ready(function() {
		
		var templateFile=Handlebars.compile($("#templateFile").html());
        $.getJSON("../product/getFiles/"+product_no, function(list) {
            $(list).each(function() {
                var fileInfo=getFileInfo(this);
                var srcHtml=templateFile(fileInfo);
                $(".uploadList").append(srcHtml);
            });
        }); 
       
        $(".uploadList").on("click", ".mailbox-attachment-info a", 
                function(e) {
                    var fileLink=$(this).attr("href");
                    if(checkImageType(fileLink)){
                        e.preventDefault();
                        var imgTag=$("#popup_img");
                        imgTag.attr("src",fileLink);
                        
                        $(".popup").show("slow");
                        imgTag.addClass("show");
                    }
                });
        $("#popup_img").on("click", function() {
            $(".popup").hide("slow");
        });	
	
	$(".addCart_btn").click(function() {
			
			var cartStock = $("#cartStock").val();

			$.ajax({
				url : "../cart/addCart",
				type : "POST",
				data : JSON.stringify({
					product_no:product_no,
	                product_quantity:cartStock
                }),
				dataType : "text",
				headers:{
		            "Content-Type":"application/json",
		            "X-HTTP-Method-override":"POST"}, 
				success : function(result) {
					if (result == 1) {
						alert("Cart add success");
						$(".numBox").val("1");
					} else {
						alert("Members only. Sign in plz")
						$(".numBox").val("1");
					}
				},
				error : function() {
					alert("Cart add fail");
					
				}
			});
		});

		var formObj = $("form[role='form']");
		$("#goListBtn").on("click", function() {
			formObj.attr("action", "../product/catelist");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#modifyBtn").on("click", function() {
			formObj.attr("action", "../product/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#removeBtn").on("click", function() {
			formObj.attr("action", "../product/remove");
			formObj.submit();
		});

		

	});
	
</script>
<%@ include file="../include/footer.jsp"%>