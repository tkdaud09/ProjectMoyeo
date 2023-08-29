<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 찾기 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 50px;
        }
        .message {
            text-align: center;
            margin-top: 20px;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button {
            display: inline-block;
            margin: 0 10px;
        }
        .button a {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>비밀번호 찾기 결과</h1>
    <div class="message">
        <c:if test="${foundPw != null}">
            <p class="success">새로운 비밀번호가 생성되었습니다.</p>
            <p class="success">이메일로 전송된 임시 비밀번호를 확인하세요.</p>
            <p class="success">로그인 후 비밀번호를 변경해주세요.</p>
            <!-- <p class="success">임시 비밀번호: ${foundPw}</p>  -->
        </c:if>
        <c:if test="${notFound}">
            <p class="error">아이디에 등록된 회원 정보가 없습니다.</p>
        </c:if>
    </div>
    <div class="button-container">
        <div class="button">
            <a href="${pageContext.request.contextPath}/user/findPw">비밀번호 찾기</a>
        </div>
        <div class="button">
            <a href="${pageContext.request.contextPath}/user/login">로그인 페이지</a>
        </div>
    </div>
    <hr>
</body> 
</html>
