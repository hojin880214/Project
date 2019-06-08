<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="include/header.jsp"%>
  <br><br><br><br><br><br><br><br>


<div class='text-center'>
    <ul>
        <li><h3>상태코드 : ${pageContext.errorData.statusCode}</h3></li>
        <br>
    
        <li><h4>요청 실패 URI : ${pageContext.errorData.requestURI}</h4></li>
        <br>    

        <li>예외유형 : ${pageContext.errorData.throwable}</li>
        <br>
    </ul>
    <br> <a href="">${exception.getMessage() }</a><br>
</div>
<p></p>
<br>
<div class='lockscreen-footer text-center'>
    <ul>
        <c:forEach items="${exception.getStackTrace() }" var="stack">
            <li>${stack.toString() }</li>
        </c:forEach>
    </ul>
</div>

<%@ include file="include/footer.jsp"%>