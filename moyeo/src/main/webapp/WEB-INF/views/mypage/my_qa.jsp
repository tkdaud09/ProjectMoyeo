<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="utf-8">
  
<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style> 
    .my{
        max-width: 1200px;
        padding: 1%;
        margin:0 auto;
    }
    
    .my h1{
        font-size: 3.5em;
        font-weight: 100;
        margin-top: 10%;
    }
    
    .my h1:nth-child(1){
    	text-align: center;
    	margin-top: 5%;
    }
    
    .my h4{
        font-size: 1.5em;
        font-weight: 400;
    }
    
    .quick_menu{
        width: 100%;
        height: 190px;
        margin-top: 5%;
    }
    
    .quick_menu ul{
        margin: 0;
        padding: 0;
        list-style: none;
        margin-top: 3%;
    }
    
    .quick_menu ul li input{
        width: 130px;
        height: 60px;
        background: #fff;
        float: left;
        margin-right: 1.2%;
        border: 1.2px solid #a1a1a1;
        font-size: 1.2em;
        border-radius: 5px;
    }

    .my #mypage{
        width: 100%;
        height: 600px;
        position: relative;
    }
    
    .my #mypage p{
        position: absolute;
        right: 0;
        top: 0;
        font-size: 1.2em;
        font-weight: 100;
    }
    
    .my #mypage a{
    	color: #000;
    }
    
    .my #mypage div{
        width: 100%;
        height: 500px;
        border: 1.2px solid #a1a1a1;
        border-radius: 10px;
        margin-top: 2%;
    }
    
    .heart {
    	display: flex;
    	padding-left: 10px;
    }
    
    .heart li {
    	width: 250px;
    	margin-right: 35px;
    }
    
    .heart li img {
    	width: 250px;
    	height: 280px;
    	border-radius: 10px;
    	margin: 15px;
    }
    
    .heart li span {
    	display: block;
    	font-size: 20px;
    	margin: -5px 20px;
    }
    
    .qa_list {
    max-height: 400px; /* 섹션의 최대 높이를 지정 */
    overflow-y: scroll; /* 세로 스크롤 바를 표시 */
	}

</style>
</head>     

<body id="body" class="up-scroll">  


<div class="my">
	<h1>마이페이지</h1>

	<h1><u>${userinfo.name}</u>님, 안녕하세요!</h1>

    <section class="quick_menu">
        <h4>서비스 바로가기</h4>
        <ul>
            <li>
                <input type="button" value="회원정보변경"
                    onclick="location.href='${pageContext.request.contextPath}/user/pwCheck';">
            </li>
            <li>
                <input type="button" value="비밀번호변경"
                    onclick="location.href='${pageContext.request.contextPath}/user/modifypw';">
            </li>
            <li>
                <input type="button" value="후기"
                    onclick="location.href='${pageContext.request.contextPath}/user/myReview';">
            </li>
            <li>
                <input type="button" value="1:1 문의 내역"
                     onclick="location.href='${pageContext.request.contextPath}/user/myQa';">
            </li>

            <li>
                <input type="button" value="탈퇴하기"
                    onclick="location.href='${pageContext.request.contextPath}/user/removePwCheck';">
            </li>
        </ul>
    </section>
    
    <section id="mypage">
	    <h4>문의 내역</h4>
	    <p><a href="#">더보기 &nbsp;→</a></p>
	    <div class="qa_list border_list">
	   		<table>
					    <colgroup>
					        <col width="10%">
					        <col width="15%">
					        <col width="35%">
					        <col width="20%">
					        <col width="20%">
					    </colgroup>
					    <tr>
					        <td class="t1">번호</td>
					        <td class="t1">문의유형</td>
					        <td class="t1">제목</td>
					        <td class="t1">작성일</td>
					        <td class="t1">답변상태</td>
					    </tr>
					    <c:forEach var="qa" items="${qaList}">
					        <tr>
					            <td class="t2">${qa.qaIdx}</td>
					            <td class="t2">${qa.qaOption}</td>
					            <td class="t2">
					                <a href="${pageContext.request.contextPath}/qa/detail/${qa.qaIdx}">
					                    ${qa.qaTitle}
					                </a>
					            </td>
					            <td class="t2">${qa.qaRegdate}</td>
					            <td class="t2">
								    <c:choose>
								        <c:when test="${qa.qaReplyStatus == 1}">
								        <span style="color: blue;">답변완료</span>
								        </c:when>
								        <c:otherwise>
								            답변대기
								        </c:otherwise>
								    </c:choose>	
								</td>
					        </tr>
					    </c:forEach>
					</table>
					
					
		</div>
	</section>
</div>

	
	
	<script>
		function removeMember() {
			if (window.confirm("탈퇴하시겠습니까?")) {
				location.href = "/user/remove";//수정필요
			}
		}
	</script>
	

</body>
</html>