<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html>
<head>
<title>전체 패키지 목록</title>
<style type="text/css">
body {
   font-family: Arial, sans-serif;
}

h1 {
   text-align: center;
}

table {
   width: 100%;
   border-collapse: collapse;
   margin-top: 20px;
   border: 1px solid #ddd;
}

th, td {
   padding: 10px;
   text-align: left;
   white-space: normal; /* 줄바꿈이 일어나도록 설정 */
}

th {
   background-color: #f2f2f2;
}

tr:nth-child(even) {
   background-color: #f2f2f2;
}

tr:hover {
   background-color: #ddd;
}

/* 패키지 등록 버튼 스타일 */
.add-button {
   display: inline-block;
   padding: 10px 20px;
   background-color: #4CAF50;
   color: white;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

.add-button:hover {
   background-color: #45a049;
}
</style>
</head>
<body>
<hr>
<h1><strong>전체 패키지 목록</strong></h1>
<!-- 패키지 등록 버튼 -->
<a href="${pageContext.request.contextPath}/admin/packageForm" class="add-button">패키지 등록</a>
<table>
    <tr>
        <th>패키지 번호</th>
        <th>종류</th>
        <th>제목</th>
        <th>시작일</th>
        <th>종료일</th>
        <th>등록일</th>
        <th>인원수</th>
        <th>성인 가격</th>
        <th>소인 가격</th>
        <th>찜</th>
        <th>상태</th>
    </tr>
    <c:forEach items="${packList}" var="pack">
        <tr>
            <td class="packIdx">${pack.packIdx}</td>
            <td class="packKind">${pack.packKind}</td>
            <td class="packTitle">${pack.packTitle}</td>
            <td class="packStartDate">${pack.packStartDate}</td>
            <td class="packEndDate">${pack.packEndDate}</td>
            <td class="packRegDate">${pack.packRegDate}</td>
            <td class="packPeople">${pack.packPeople}</td>
            <td class="packChildPrice">${pack.packChildPrice}</td>
            <td class="packAdultPrice">${pack.packAdultPrice}</td>
            <td class="packHeart">${pack.packHeart}</td>
            <td>${pack.packStatus == 0 ? '활성화' : '비활성화(결제불가)'}</td>
        </tr>
    </c:forEach>
</table>
<hr>
</body>
</html>