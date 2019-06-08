<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

    <!-- Products -->

<div class="products">
    <div class="container">
        <div class="row">
            <div class="col">

                <!-- Product Sorting -->
                <div
                    class="sorting_bar d-flex flex-md-row flex-column align-items-md-center justify-content-md-start">
                    <div class="results">
                        Showing <span>${pmk.totalCount}</span> results
                    </div>
                    <div class="sorting_container ml-md-auto">
                        <div class="sorting">
                            <select id="selectNum">
                                <option value="12"
                                    <c:out value="${scri.perPageNum=='12'?'selected':'' }"/>>per
                                    12</option>
                                <option value="24"
                                    <c:out value="${scri.perPageNum=='24'?'selected':'' }"/>>per
                                    24</option>
                                <option value="36"
                                    <c:out value="${scri.perPageNum=='36'?'selected':'' }"/>>per
                                    36</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="product_grid">
                    <c:forEach items="${list}" var="pvo">
                        <div class="product">
                            <a
                                href="../product/read${pmk.makeSearch(pmk.cri.page) }&product_no=${pvo.product_no}">
                                <div class="product_image">
                                    <c:if
                                        test="${pvo.file_fullname ne null}">
                                        <img
                                            src="../displayFile?fileName=${pvo.file_fullname}"
                                            alt="">
                                    </c:if>
                                </div>
                                <div class="product_content">
                                    <div class="product_title">${pvo.product_name}</div>
                                    <div class="product_title">${pvo.product_category}</div>
                                    <div class="product_price">
                                        &#8361;
                                        <fmt:formatNumber
                                            pattern="###,###,###"
                                            value="${pvo.product_price}" />
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <br>
                <div class="pagination">
                    <ul>
                        <c:if test="${pmk.prev}">
                            <li><a
                                href="catelist${pmk.makeSearch(pmk.startPage-1) }&product_category=${product_category}">&laquo;</a></li>
                        </c:if>
                        <c:forEach begin="${pmk.startPage }"
                            end="${pmk.endPage }" var="idx">
                            <li
                                <c:out value="${pmk.cri.page==idx ? 'class=active' : '' }"/>>
                                <a
                                href="catelist${pmk.makeSearch(idx)}&product_category=${product_category}">${idx}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pmk.next && pmk.endPage>0 }">
                            <li><a
                                href="catelist${pmk.makeSearch(pmk.endPage+1) }&product_category=${product_category}">&raquo;</a></li>
                        </c:if>
                    </ul>
                </div>
                <div>
                    <div class="form-group">
                        <select style="display: none;"
                            class="form-control" name="searchType">
                            <option value="searchType" id="searchType1"
                                selected="selected">searchType</option>
                        </select>
                    </div>
                    <div class="input-group input-group-sm"
                        style="width: 85%">
                        <input type="text" class="form-control"
                            name="keyword" id="keywordInput"
                            value="${scri.keyword}"> <span
                            class="input-group-btn">
                            <button class="btn btn-secondary"
                                type="button" id="searchBtn">Go!</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>

<script>
var result='${msg}';
console.log("msg : " + result);
if (result=='success') {
    alert("게시물이 성공적으로 등록되었습니다.");
}else if(result=='remove_success'){
    alert("게시물이 성공적으로 삭제되었습니다.");
}
</script>

<script>
$(document).ready(function() {
    
    $("#searchBtn").on("click",function(event){
        uri="catelist"
               +'${pmk.makeQuery(1)}'
               +"&searchType="
               +$("#searchType1").val()
               +"&keyword="
               +encodeURIComponent($('#keywordInput').val())
               +"&product_category=${product_category}";
        console.log("uri : " + uri);
        self.location=uri;      
    });
});

$("#selectNum").change(function(){
    uri="catelist?"
          +"perPageNum="
          +$("#selectNum").val()
          +"&searchType="
          +$("#searchType1").val()
          +"&keyword="
          +encodeURIComponent($('#keywordInput').val())
          +"&product_category=${product_category}";
    console.log("uri : " + uri);
    self.location=uri;   
});
</script>

<%@ include file="../include/footer.jsp"%>