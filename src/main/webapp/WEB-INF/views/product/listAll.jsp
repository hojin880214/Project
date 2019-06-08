<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Search Board List
                    <a href="/product/register" class="btn btn-success">Register</a>
                    </h3>
                </div>
                <div class="box-body">   
                <div><a href="/product/catelist${pmk.makeSearch(pmk.cri.page) }&product_category=cpu">cpu</a></div>                 
                  <div class="form-group">
                      <label>Search</label>
                      <select class="form-control" name="searchType">
                        
                        <option value="all" selected="selected"<c:out value="${scri.searchType=='c'?'selected':'' }"/>>Content</option>
                        
                      </select>
                  </div>
                  <div class="input-group input-group-sm">
                    <input type="text" class="form-control" name="keyword"
                     id="keywordInput" value="${scri.keyword }">
                    <span class="input-group-btn">
                      <button class="btn btn-info btn-flat" type="button" id="searchBtn">Go!</button>
                    </span>
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table class="table table-bordered">
                        <tr>
                            <th>product_no</th>
                            <th>product_name</th>
                            <th>product_category</th>
                            <th>product_price</th>
                            <th>product_quantity</th>
                            <th>product_detail</th>
                            <th>product_option1</th>
                            <th>product_option2</th>
                            <th>product_option3</th>
                        </tr>
                        <c:forEach items="${list}" var="pvo">
                        <tr>
                            <td>${pvo.product_no}</td>
                            <td>
                            <a href="/product/read${pmk.makeSearch(pmk.cri.page) }&product_no=${pvo.product_no}">
                            ${pvo.product_name}</a><%-- <b> [${bvo.replycnt }]</b></td> --%>
                            <td>${pvo.product_category}</td>
                            <td>${pvo.product_price}</td>
                            <td>${pvo.product_quantity}</td>
                            <td>${pvo.product_detail}</td>
                            <td>${pvo.product_option1}</td>
                            <td>${pvo.product_option2}</td>
                            <td>${pvo.product_option3}</td>
                        </tr>
                        </c:forEach>                        
                    </table>
                </div>
                <!-- /.box-body -->
                <div >
                    <ul>
                        <c:if test="${pmk.prev}">
                        <li><a href="list${pmk.makeSearch(pmk.startPage-1) }">이전</a></li>
                        </c:if>
                        <c:forEach begin="${pmk.startPage }" end="${pmk.endPage }" var="idx">
                        <li <c:out value="${pmk.cri.page==idx ? 'class=active' : '' }"/>>
                        <a href="list${pmk.makeSearch(idx) }">${idx}</a></li>
                        </c:forEach>
                        <c:if test="${pmk.next && pmk.endPage>0 }">                        
                        <li><a href="list${pmk.makeSearch(pmk.endPage+1) }">다음</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!-- /.box -->
        </div>
    </div>
</section>
<script>
var result='${msg}';
console.log("msg : " + result);
if (result=='success') {
    alert("게시물이 성공적으로 등록되었습니다.");
}else if(result=='remove_success'){
    alert("게시물이 성공적으로 삭제되었습니다.");
}else if(result=='modify_success'){
    alert("게시물이 성공적으로 수정되었습니다.");
}
</script>
<script>
$(document).ready(function() {
	$("#searchBtn").on("click",function(event){
        uri="listAll"
               +'${pmk.makeQuery(1)}'
               +"&searchType="
               +$("select option:selected").val()
               +"&keyword="
               +encodeURIComponent($('#keywordInput').val());
        console.log("uri : " + uri);
        self.location=uri;      
    });     
});
</script>

</body>
</html>