<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>이벤트 목록</title>
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

        /* 버튼 스타일 */
        .add-button, .edit-button, .delete-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-bottom: 10px;
    text-decoration: none; /* 버튼 텍스트에 밑줄 제거 */
    transition: background-color 0.3s, color 0.3s; /* hover 시 색상 변경 트랜지션 설정 */
}

.add-button:hover, .edit-button:hover, .delete-button:hover {
    background-color: #45a049; /* hover 시 배경색 변경 */
    color: orange; /* hover 시 글자 색상 변경 */
}

       
    </style>
</head>
<body>
<hr>
<h1><strong>이벤트 목록</strong></h1>
<!-- 이벤트 등록 버튼 -->
<a href="${pageContext.request.contextPath}/admin/eventForm" class="add-button">이벤트 등록</a>
<table>
    <tr>
        <th>이벤트 번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>등록일</th>
        <th>시작 날짜</th>
        <th>종료 날짜</th>
        <th>상태</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach items="${eventList}" var="event">
        <tr>
            <td class="eventIdx">${event.eventIdx}</td>
            <td class="eventTitle">${event.eventTitle}</td>
            <td class="eventContent">${event.eventContent}</td>
            <td class="eventRegdate">${event.eventRegdate}</td>
            <td class="eventStartdate">${event.eventStartdate}</td>
            <td class="eventEnddate">${event.eventEnddate}</td>
            <td>${event.eventStatus == 0 ? '활성화' : '비활성화'}</td>
            <td><a href="${pageContext.request.contextPath}/admin/edit/${event.eventIdx}" class="edit-button">수정</a></td>
            <td> <!-- 삭제 버튼 추가 -->    
                <form action="${pageContext.request.contextPath}/event/delete/${event.eventIdx}" method="POST">
                    <input type="hidden" name="_method" value="POST"> <!-- POST 요청으로 설정 -->
                    <input class="delete-button"  type="submit" value="삭제">
                </form>
            </td>
            
        </tr>
    </c:forEach>
</table>

<hr>
</body>
</html>