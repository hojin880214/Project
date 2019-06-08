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
                    <div class="newsletter_title">Product registration</div>
                    
                    <div class="newsletter_form_container">
                        <form role="form" method="post" autocomplete="off" id="registForm">
                            <select name="product_category" class="myinput">
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
                            <input type="text" name="product_name" placeholder="Product name"
                                required="required" class="myinput">
                            <p></p>
                            <input type="number" name="product_price" required="required"
                                placeholder="Product price" class="myinput">
                            <p></p>
                            <input type="number" name="product_quantity" placeholder="Product quantity"
                                required="required" class="myinput">
                            <p></p>
                            <textarea rows="5" name="product_detail" placeholder="Product detail"
                                required="required" class="myinputtext"></textarea>
                            <p></p>
                            <input type="text" name="product_option1" placeholder="Product option1"
                                class="myinput">
                            <p></p>
                            <input type="text" name="product_option2" placeholder="Product option2"
                                class="myinput">
                            <p></p>
                            <input type="text" name="product_option3" placeholder="Product option2"
                               class="myinput">
                            <p></p><br>
                            <div class="fileDropZone"><br><br><br><h3>File Drop Here</h3></div><br>
                            <ul class="uploadList"></ul>
                            <button type="submit"
                                class="newsletter_button trans_200">Register</button>
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
</script>
<%@ include file="../include/footer.jsp"%>