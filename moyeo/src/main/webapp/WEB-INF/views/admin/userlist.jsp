<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>전체 회원 목록</title>
<style>
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

a {
   text-decoration: none;
   color: #333;
}

a:hover {
   text-decoration: underline;
}
</style>
</head>
<body>
<hr>
<h1><strong>전체 회원 목록</strong></h1>
<table>
    <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>성별</th>
        <th>이메일</th>
        <th>생년월일</th>
        <th>주소</th>
        <th>휴대폰 번호</th>
        <th>마지막 로그인</th>
        <th>권한</th>
    </tr>
    <c:forEach items="${userinfoList}" var="userinfo">
    <tr>
        <td class="id"><a href="${pageContext.request.contextPath}/admin/userinfo?id=${userinfo.id}">${userinfo.id}</a></td>
        <td class="name">${userinfo.name}</td>
        <td>${userinfo.gender}</td>
        <td class="email">${userinfo.email}</td>
        <td class="birth">${userinfo.birth.substring(0, 10)}</td>
        <td class="address">${userinfo.address}</td>
        <td class="phone">${userinfo.phone}</td>
        <td>${userinfo.logdate}</td>
        <td>${userinfo.status}</td>
    </tr>
</c:forEach>
</table>
<hr>
</body>
</html>