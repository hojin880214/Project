<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<br><br>

<!-- Icon Boxes -->

<div class="icon_boxes">
    <div class="container">
        <h3 style="text-align: center;">New Product!</h3>
        <div class="row icon_box_row">

            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">CPU</div>
                    <c:forEach items="${list0}" var="cpu">
                        <div class="icon_box_text">
                            <a href="../product/read?product_no=${cpu.product_no}"><p>[${cpu.product_category}]
                                    ${cpu.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">MainBoard</div>
                    <c:forEach items="${list1}" var="mb">
                        <div class="icon_box_text"><a href="../product/read?product_no=${mb.product_no}">
                            <p>[${mb.product_category}]
                                ${mb.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>


            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">RAM</div>
                    <c:forEach items="${list2}" var="ram">
                        <div class="icon_box_text"><a href="../product/read?product_no=${ram.product_no}">
                            <p>[${ram.product_category}]
                                ${ram.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">VGA</div>
                    <c:forEach items="${list3}" var="vga">
                        <div class="icon_box_text"><a href="../product/read?product_no=${vga.product_no}">
                            <p>[${vga.product_category}]
                                ${vga.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">Power</div>
                    <c:forEach items="${list4}" var="power">
                        <div class="icon_box_text"><a href="../product/read?product_no=${power.product_no}">
                            <p>[${power.product_category}]
                                ${power.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">SSD</div>
                    <c:forEach items="${list5}" var="ssd">
                        <div class="icon_box_text"><a href="../product/read?product_no=${ssd.product_no}">
                            <p>[${ssd.product_category}]
                                ${ssd.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">Case</div>
                    <c:forEach items="${list6}" var="ca">
                        <div class="icon_box_text"><a href="../product/read?product_no=${ca.product_no}">
                            <p>[${ca.product_category}]
                                ${ca.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            
            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">Keyboard</div>
                    <c:forEach items="${list7}" var="keyboard">
                        <div class="icon_box_text"><a href="../product/read?product_no=${keyboard.product_no}">
                            <p>[${keyboard.product_category}]
                                ${keyboard.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Icon Box -->
            <div class="col-lg-4 icon_box_col">
                <div class="icon_box">

                    <div class="icon_box_title">Mouse</div>
                    <c:forEach items="${list8}" var="mouse">
                        <div class="icon_box_text"><a href="../product/read?product_no=${mouse.product_no}">
                            <p>[${mouse.product_category}]
                                ${mouse.product_name}</p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
var result='${msg}';
console.log("msg : " + result);
if (result=='signup_success') {
    alert("회원가입을 축하드립니다.");
}
</script>


<%@ include file="../include/footer.jsp"%>