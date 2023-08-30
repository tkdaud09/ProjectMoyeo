<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>${userinfo.name}의상세 정보</title>
<style type="text/css">
.userinfodetaillist {
   height: 700px;
}

body {
   font-family: Arial, sans-serif;
}

h1 {
   text-align: center;
   margin-bottom: 40px;
}

table {
   margin: auto;
   width: 60%;
   border-collapse: collapse;
   border: 1px solid #ccc;
   box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

th {
   background-color: #f2f2f2;
   padding: 15px;
   text-align: left;
   width: 40%;
   font-weight: bold;
}

td {
   padding: 15px;
   text-align: left;
   width: 60%;
}

a {
   display: block;
   text-align: center;
   margin-top: 20px;
}

.button-container {
   text-align: center;
}

a.return-link {
   display: inline-block;
   text-align: center;
   margin: 20px auto;
   padding: 10px 20px;
   border-radius: 4px;
   background-color: #007bff;
   color: white;
   text-decoration: none;
}

a.return-link:hover {
   background-color: #0056b3;
}

.modal {
   display: none;
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.6);
}

.modal-content {
   position: relative;
   margin: 15% auto;
   padding: 20px;
   width: 80%;
   max-width: 500px;
   background-color: #fff;
}
</style>
</head>
<body>
   <hr>
   <div class="userinfodetaillist">
      <h1>${userinfo.name}의상세 정보</h1>
      <table>
         <tr>
            <th>아이디</th>
            <td>${userinfo.id}</td>
         </tr>
         <tr>
            <th>이름</th>
            <td>${userinfo.name}</td>
         </tr>
         <tr>
            <th>성별</th>
            <td>${userinfo.gender}</td>
         </tr>
         <tr>
            <th>이메일</th>
            <td>${userinfo.email}</td>
         </tr>
         <tr>
            <th>생년월일</th>
            <td>${userinfo.birth.substring(0, 10)}</td>
         </tr>
         <tr>
            <th>주소</th>
            <td>${userinfo.address}</td>
         </tr>
         <tr>
            <th>휴대폰 번호</th>
            <td>${userinfo.phone}</td>
         </tr>
         <tr>
            <th>마지막 로그인</th>
            <td>${userinfo.logdate}</td>
         </tr>
         <tr>
            <th>권한</th>
            <td>${userinfo.status}</td>
         </tr>
      </table>
      <div class="button-container">
        <a href="${pageContext.request.contextPath}/admin/userlist" class="return-link">회원 목록으로 돌아가기</a>
    </div>
</html>