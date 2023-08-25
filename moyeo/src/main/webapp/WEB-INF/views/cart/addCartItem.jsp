<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 추가</title>
</head>
<body>
    <h1>상품 추가</h1>
    
    <form action="<c:url value='/cart/insert'/>" method="post">
        <label for="packIdx">상품 선택:</label>
        <select id="packIdx" name="packIdx">
            <c:forEach items="${availablePackages}" var="package">
                <option value="${package.packIdx}">${package.packName}</option>
            </c:forEach>
        </select><br>
        
        <!-- 추가한 부분: packIdx를 전달하기 위한 input 필드 -->
         <input type="hidden" name="packIdx" value="<c:out value='${package.packIdx}'/>">
        
        <input type="submit" value="추가">
    </form>
    
    <a href="<c:url value='/cart/list'/>">장바구니 목록으로 돌아가기</a>
</body>
</html>
