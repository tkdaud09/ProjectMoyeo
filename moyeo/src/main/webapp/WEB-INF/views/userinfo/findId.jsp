<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 찾기</title>
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

form {
	max-width: 300px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="email"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
}

#emailError {
	color: red;
	margin-top: -10px;
}
    </style>
</head>
<body>
    <h1>아이디 찾기</h1>
    <form id="findIdForm" action="findId" method="post">
        <label for="email">가입 시 입력했던 이메일을 입력해 주세요.</label>
        <input type="email" id="email" name="email"><br>
        <span id="emailError"></span>
        <input type="submit" value="아이디 찾기">
        <sec:csrfInput/>
    </form>
    <hr>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var form = document.getElementById('findIdForm');
        var emailInput = document.getElementById('email');
        var emailError = document.getElementById('emailError');

        form.addEventListener('submit', function(event) {
            var email = emailInput.value.trim();

            if (!isValidEmail(email)) {
                event.preventDefault();
                emailError.textContent = "유효한 이메일 주소를 입력하세요.";
            } else {
                emailError.textContent = "";
            }
        });

        function isValidEmail(email) {
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            return emailPattern.test(email);
        }
    });
</script>
</html>