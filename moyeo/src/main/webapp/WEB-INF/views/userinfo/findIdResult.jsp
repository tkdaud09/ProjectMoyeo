<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 찾기 결과</title>
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
        .result-container {
            max-width: 300px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .result-message {
            margin-bottom: 10px;
        }
        /* 로그인 버튼 스타일 */
        .login-button {
            display: block;
            text-align: center;
            margin-top: 20px;
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>아이디 찾기 결과</h1>
    <div class="result-container">
        <c:if test="${not empty foundId}">
            <p class="result-message">사용자의 아이디는  <strong>${foundId}</strong>  입니다.</p>
        </c:if>
        <c:if test="${notFound}">
            <p class="result-message">일치하는 사용자를 찾을 수 없습니다.</p>
        </c:if>

		<div class="button-container">
			<div class="button">
        		<!-- 다시 로그인하는 버튼 -->
        		<a href="${pageContext.request.contextPath}/user/login" class="login-button">로그인하러 가기</a>
			</div>
			<div class="button">
			    <!-- 비밀번호 찾기 버튼 -->
        		<a href="${pageContext.request.contextPath}/user/findPw" class="login-button">비밀번호 찾기</a>
			</div>
		</div>
	</div>
    <hr>
</body>
</html>