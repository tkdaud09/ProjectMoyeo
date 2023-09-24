<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 완료</title>
</head>
<body>
    <div>
        <h1>결제 완료</h1>
        <c:set var="response" value="${requestScope.response}" />
        <c:choose>
            <c:when test="${'success' eq response}">
                <p>결제가 성공적으로 완료되었습니다.</p>
                <p>UserinfoId: ${param.UserinfoId}</p>
                <p>PackIdx: ${param.PackIdx}</p>
            </c:when>
            <c:when test="${'forgery' eq response}">
                <p>결제 검증에 실패하였습니다. 결제 내역이 위변조되었을 가능성이 있습니다.</p>
            </c:when>
            <c:otherwise>
                <p>알 수 없는 오류가 발생하였습니다.</p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
