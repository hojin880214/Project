<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

<br><br><br><br><br><br><br>
<style>
.fileDropZone {
    width: 100%;
    height: 150px;
    border: 1px dotted black;
    background-color: #f2f4f8;
    margin: auto;
    padding-left: 15px;
    border: none;
    outline: none;
}
</style>


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
                    <div class="newsletter_title">Product Modify</div>
                    
                    <div class="newsletter_form_container">
                        <form role="form" method="post" id="registForm" action="../product/modify">
                        <input type="hidden" name="product_no" value="${pvo.product_no}">
                        <input type="hidden" name="page" value="${scri.page}">
                        <input type="hidden" name="perPageNum" value="${scri.perPageNum}">
                        <input type="hidden" name="searchType" value="${scri.searchType}">
                        <input type="hidden" name="keyword" value="${scri.keyword}">
                            <select name="product_category" class="myinput">
                                <option value="${pvo.product_category}">${pvo.product_category}</option>
                                <option value="cpu">cpu</option>
                                <option value="ram">ram</option>
                                <option value="mb">mb</option>
                                <option value="vga">vga</option>
                                <option value="power">power</option>
                                <option value="ssd">ssd</option>
                                <option value="case">case</option>
                                <option value="keyboard">keyboard</option>
                                <option value="mouse">mouse</option>
                            </select><p></p>
                            <input type="text" name="product_no"
                                required="required" class="myinput" readonly="readonly" value="${pvo.product_no}">
                            <p></p>
                            <input type="text" name="product_name" value="${pvo.product_name}"
                                required="required" class="myinput">
                            <p></p>
                            <input type="number" name="product_price" required="required" value="${pvo.product_price}"
                               class="myinput">
                            <p></p>
                            <input type="number" name="product_quantity" value="${pvo.product_quantity}"
                                required="required" class="myinput">
                            <p></p>
                            <textarea rows="5" name="product_detail" 
                                required="required" class="myinputtext">${pvo.product_detail}</textarea>
                            <p></p>
                            <input type="text" name="product_option1" value="${pvo.product_option1}"
                                class="myinput">
                            <p></p>
                            <input type="text" name="product_option2" value="${pvo.product_option2}"
                               class="myinput">
                            <p></p>
                            <input type="text" name="product_option3" value="${pvo.product_option3}"
                                class="myinput">
                            <p></p><br>
                            <div class="fileDropZone"><br><br><br><h3>File Drop Here</h3></div><br>
                            <ul class="uploadList"></ul>
                            <button type="submit" class="newsletter_button trans_200">Complete</button>
                            <button type="button" class="newsletter_button trans_200" id="btn-primary">Go List</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 


<script id="template" type="text/x-handlebars-template">
<li>
    <span class="mailbox-attachment-icon has-img">
    <img src="{{imgSrc}}" alt="Attachment"></span>
    <div class="mailbox-attachment-info">
    <a href="{{getLink}}" class="mailbox-attachment-name">
    {{fileName}}</a>
    <a href="{{fullName}}" class="delbtn">
<button class="fa fa-fw fa-remove"></button></a>
    </div>
</li>
</script>
<script>
var template = Handlebars.compile($("#template").html());
$(".fileDropZone").on("dragenter dragover", function(e) {
    e.preventDefault();
});

$(".fileDropZone").on("drop", function(e) {
    e.preventDefault();
    var files = e.originalEvent.dataTransfer.files;
    var file = files[0];
    var formData = new FormData();
    formData.append("file", file);

    $.ajax({
        url : "../uploadAjax",
        data : formData,
        dataType : "text",
        contentType : false,
        processData : false,
        type : "POST",
        success : function(data) {
            var fileInfo = getFileInfo(data);
            var htmlSrc = template(fileInfo);
            $(".uploadList").append(htmlSrc);
        }
    });
});

$(".uploadList").on("click",".delbtn", function(e) {
    e.preventDefault();
    var myThis=$(this);
    $.ajax({
        url:"../deleteFile",
        type:"POST",
        data:{fileName:$(this).attr("href")},
        dataType:"text",
        success: function(result) {
            if(result=="delete_success"){
                myThis.closest("li").remove();
            }
        }
    });
});

$("#registForm").submit(function(e) {
    e.preventDefault();
    var myThis=$(this);
    console.log("myThis : " + myThis);
    var str="";
    $(".uploadList .delbtn").each(function(index) {
        str+="<input type='hidden' name='files["+index
            +"]' value='"+$(this).attr("href")+"'>";
    });
    myThis.append(str);
    console.log("myThis : " + myThis);
    myThis.get(0).submit();
});


$(document).ready(function() {
    var formObj=$("form[role='form']");
       
    $("#btn-primary").on("click",function(){
        self.location='../product/catelist?page=${scri.page}'
                +'&perPageNum=${scri.perPageNum}'
                +'&searchType=${scri.searchType}'
                +'&keyword=${scri.keyword}'
                +'&product_category=${pvo.product_category}';
    });
    
    
    var product_no=${pvo.product_no};    
    var template=Handlebars.compile($("#template").html());
    $.getJSON("../product/getFiles/"+product_no, function(list) {
        $(list).each(function() {
            var fileInfo=getFileInfo(this);
            var srcHtml=template(fileInfo);
            $(".uploadList").append(srcHtml);
        });
    });
    
});
</script>
<%@ include file="../include/footer.jsp"%>